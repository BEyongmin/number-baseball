<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 진행 중</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/game.css">
</head>
<body>
    <div class="card">
        <div class="stadium-header">
            <h1>Number Baseball</h1>
            <p>정답을 추리하는 숫자 야구</p>
        </div>
        <div class="stitch"></div>

        <div class="content">

            <c:choose>
                <c:when test="${game.unlimited}">
                    <p class="game-status">시도 ${game.attemptCount}회 · 제한 없음</p>
                </c:when>
                <c:otherwise>
                    <p class="game-status">시도 ${game.attemptCount} / ${game.attemptLimit}</p>
                </c:otherwise>
            </c:choose>

            <c:if test="${not empty errorMessage}">
                <p class="error-message">⚠ ${errorMessage}</p>
            </c:if>

            <form action="/game" method="post" class="guess-form-wrapper">
                <div class="guess-form">
                    <input class="guess-input" type="text" name="input" maxlength="${game.digitCount}"
                           placeholder="${game.digitCount}자리 숫자" id="guessInput" autocomplete="off">
                    <button type="submit" class="btn-confirm" id="submitBtn">확인</button>
                </div>
                <p class="inline-warning" id="inlineWarning"></p>
            </form>

            <c:if test="${game.difficulty == 'BEGINNER'}">
                <div class="digit-header">
                    <p class="digit-label">숫자 상태</p>
                    <div class="digit-legend">
                        <span class="legend-item"><span class="legend-dot legend-dot--strike"></span>스트라이크</span>
                        <span class="legend-item"><span class="legend-dot legend-dot--ball"></span>볼</span>
                        <span class="legend-item"><span class="legend-dot legend-dot--out"></span>아웃</span>
                    </div>
                </div>
                <div class="digit-row">
                    <c:forEach begin="0" end="9" var="digit">
                        <c:set var="status" value="${digitStatuses[digit]}" />
                        <c:choose>
                            <c:when test="${status == 'STRIKE'}">
                                <span class="digit digit--strike">${digit}</span>
                            </c:when>
                            <c:when test="${status == 'BALL'}">
                                <span class="digit digit--ball">${digit}</span>
                            </c:when>
                            <c:when test="${status == 'OUT'}">
                                <span class="digit digit--out">${digit}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="digit">${digit}</span>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>

            <div class="scoreboard">
                <p class="scoreboard-label">기록</p>
                <table>
                    <c:forEach var="attempt" items="${game.history}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${attempt.input}</td>
                            <td style="text-align: right;">S${attempt.strike} B${attempt.ball} O${attempt.out}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <form action="/game/reset" method="post" class="reset-form">
    <button type="submit" class="btn-secondary">새 게임</button>
</form>
        </div>
    </div>

    <script>
        var input = document.getElementById('guessInput');
        var warning = document.getElementById('inlineWarning');

        input.focus();

        input.addEventListener('input', function () {
            var value = input.value;
            var seen = {};
            var cleaned = '';

            for (var i = 0; i < value.length; i++) {
                var ch = value.charAt(i);
                if (seen[ch]) {
                    continue;
                }
                seen[ch] = true;
                cleaned += ch;
            }

            if (cleaned !== value) {
                input.value = cleaned;
                warning.textContent = '이미 입력한 숫자예요. 다른 숫자를 입력해주세요.';
            } else {
                warning.textContent = '';
            }
        });
    </script>
</body>
</html>