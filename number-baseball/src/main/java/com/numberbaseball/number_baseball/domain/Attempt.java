package com.numberbaseball.number_baseball.domain;

public class Attempt {

    private final String input;   // 사용자가 입력한 숫자 (예: "467")
    private final int strike;
    private final int ball;
    private final int out;

    public Attempt(String input, int strike, int ball, int out) {
        this.input = input;
        this.strike = strike;
        this.ball = ball;
        this.out = out;
    }

    public String getInput() {
        return input;
    }

    public int getStrike() {
        return strike;
    }

    public int getBall() {
        return ball;
    }

    public int getOut() {
        return out;
    }
}
