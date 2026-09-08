package com.numberbaseball.number_baseball.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;


@Service 
public class NumberGeneratorService {
    public String generate(int digitCount) {
        List<Integer> numbers = new ArrayList<>();
        for (int i = 0; i <= 9; i++) {
            numbers.add(i);
        }

        Collections.shuffle(numbers);

        StringBuilder answer = new StringBuilder();
        for (int i = 0; i < digitCount; i++) {
            answer.append(numbers.get(i));
        }

        return answer.toString();
    }
}
