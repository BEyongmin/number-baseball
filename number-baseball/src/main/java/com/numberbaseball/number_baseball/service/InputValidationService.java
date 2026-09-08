package com.numberbaseball.number_baseball.service;

import java.util.HashSet;
import java.util.Set;

import com.numberbaseball.number_baseball.domain.ValidationResult;

public class InputValidationService {

    public ValidationResult validate(String input, int digitCount) {

        if (input == null || input.isBlank()) {
            return ValidationResult.fail("숫자를 입력해주세요.");
        }

        if (input.length() != digitCount) {
            return ValidationResult.fail(digitCount + "자리 숫자를 입력해주세요.");
        }

        if (!input.chars().allMatch(Character::isDigit)) {
            return ValidationResult.fail("숫자만 입력해주세요.");
        }

        Set<Character> uniqueChars = new HashSet<>();
        for (char c : input.toCharArray()) {
            uniqueChars.add(c);
        }
        if (uniqueChars.size() != digitCount) {
            return ValidationResult.fail("중복되지 않는 숫자를 입력해주세요.");
        }

        return ValidationResult.ok();
    }
}
