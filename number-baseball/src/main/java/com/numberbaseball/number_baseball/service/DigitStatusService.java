package com.numberbaseball.number_baseball.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.numberbaseball.number_baseball.domain.Attempt;
import com.numberbaseball.number_baseball.domain.DigitStatus;
import com.numberbaseball.number_baseball.domain.Game;

@Service 
public class DigitStatusService {

    public Map<Integer, DigitStatus> computeStatuses(Game game) {

        Map<Integer, DigitStatus> statusMap = new HashMap<>();
        for (int i = 0; i <= 9; i++) {
            statusMap.put(i, DigitStatus.UNCONFIRMED);
        }

        String answer = game.getAnswer();

        for (Attempt attempt : game.getHistory()) {
            String input = attempt.getInput();

            for (int i = 0; i < input.length(); i++) {
                char inputChar = input.charAt(i);
                int digit = Character.getNumericValue(inputChar);

                DigitStatus newStatus;
                if (answer.charAt(i) == inputChar) {
                    newStatus = DigitStatus.STRIKE;
                } else if (answer.indexOf(inputChar) != -1) {
                    newStatus = DigitStatus.BALL;
                } else {
                    newStatus = DigitStatus.OUT;
                }

                DigitStatus current = statusMap.get(digit);
                if (isHigherPriority(newStatus, current)) {
                    statusMap.put(digit, newStatus);
                }
            }
        }

        return statusMap;
    }

    private boolean isHigherPriority(DigitStatus candidate, DigitStatus current) {
        return priority(candidate) > priority(current);
    }

    private int priority(DigitStatus status) {
        return switch (status) {
            case STRIKE -> 3;
            case BALL -> 2;
            case OUT -> 1;
            case UNCONFIRMED -> 0;
        };
    }
}
