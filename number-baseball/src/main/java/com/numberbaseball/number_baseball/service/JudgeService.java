package com.numberbaseball.number_baseball.service;

import org.springframework.stereotype.Service;

import com.numberbaseball.number_baseball.domain.Attempt;

@Service 
public class JudgeService {

    public Attempt judge(String answer, String input) {

        int strike = 0;
        int ball = 0;

        for (int i = 0; i < input.length(); i++) {
            char inputChar = input.charAt(i);

            if (answer.charAt(i) == inputChar) {
                strike++;
            } else if (answer.indexOf(inputChar) != -1) {
                ball++;
            }
        }

        int out = input.length() - strike - ball;

        return new Attempt(input, strike, ball, out);
    }
}
