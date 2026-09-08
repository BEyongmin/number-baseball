package com.numberbaseball.number_baseball.domain;

import java.util.ArrayList;
import java.util.List;

public class Game {

    private final String answer;         // N자리 정답 (예: "467")
    private final int digitCount;        // 3 / 4 / 5
    private final int attemptLimit;      // 10 (무제한이면 의미 없음)
    private final boolean unlimited;     // 횟수 제한 없음 여부
    private final Difficulty difficulty;

    private int attemptCount = 0;
    private GameStatus status = GameStatus.PLAYING;
    private final List<Attempt> history = new ArrayList<>();

    public Game(String answer, int digitCount, int attemptLimit,
                boolean unlimited, Difficulty difficulty) {
        this.answer = answer;
        this.digitCount = digitCount;
        this.attemptLimit = attemptLimit;
        this.unlimited = unlimited;
        this.difficulty = difficulty;
    }

    public void addAttempt(Attempt attempt) {
        this.history.add(attempt);
        this.attemptCount++;
    }

    // Getter들
    public String getAnswer() { return answer; }
    public int getDigitCount() { return digitCount; }
    public int getAttemptLimit() { return attemptLimit; }
    public boolean isUnlimited() { return unlimited; }
    public Difficulty getDifficulty() { return difficulty; }
    public int getAttemptCount() { return attemptCount; }
    public GameStatus getStatus() { return status; }
    public void setStatus(GameStatus status) { this.status = status; }
    public List<Attempt> getHistory() { return history; }
}
