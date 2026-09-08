package com.numberbaseball.number_baseball.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.numberbaseball.number_baseball.domain.Attempt;
import com.numberbaseball.number_baseball.domain.Difficulty;
import com.numberbaseball.number_baseball.domain.Game;
import com.numberbaseball.number_baseball.domain.GameStatus;
import com.numberbaseball.number_baseball.domain.ValidationResult;
import com.numberbaseball.number_baseball.service.InputValidationService;
import com.numberbaseball.number_baseball.service.JudgeService;
import com.numberbaseball.number_baseball.service.NumberGeneratorService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller 
@RequiredArgsConstructor 
public class GameController {

    private final NumberGeneratorService numberGeneratorService;
    private final InputValidationService inputValidationService;
    private final JudgeService judgeService;

    @GetMapping("/start")
    public String startPage() {
        return "start";
    }

    @PostMapping("/start")
    public String startGame(
            @RequestParam int digitCount,
            @RequestParam(defaultValue = "NORMAL") Difficulty difficulty,
            @RequestParam(defaultValue = "false") boolean unlimited,
            HttpSession session) {

        String answer = numberGeneratorService.generate(digitCount);
        Game game = new Game(answer, digitCount, 10, unlimited, difficulty);

        session.setAttribute("game", game);

        return "redirect:/game";
    }

    @GetMapping("/game")
    public String gamePage(HttpSession session, Model model) {
        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            return "redirect:/start";
        }

        model.addAttribute("game", game);
        return "game";
    }

    @PostMapping("/game")
    public String submitGuess(
            @RequestParam String input,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            return "redirect:/start";
        }

        ValidationResult validationResult =
                inputValidationService.validate(input, game.getDigitCount());

        if (!validationResult.isValid()) {
            redirectAttributes.addFlashAttribute("errorMessage", validationResult.getErrorMessage());
            return "redirect:/game";
        }

        Attempt attempt = judgeService.judge(game.getAnswer(), input);
        game.addAttempt(attempt);

        if (attempt.getStrike() == game.getDigitCount()) {
            game.setStatus(GameStatus.WON);
            return "redirect:/result";
        }

        if (!game.isUnlimited() && game.getAttemptCount() >= game.getAttemptLimit()) {
            game.setStatus(GameStatus.LOST);
            return "redirect:/result";
        }

        return "redirect:/game";
    }

    @GetMapping("/result")
    public String resultPage(HttpSession session, Model model) {
        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            return "redirect:/start";
        }

        model.addAttribute("game", game);
        return "result";
    }
}
