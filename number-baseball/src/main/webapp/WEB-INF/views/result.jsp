<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 결과</title>
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

        <div class="result-content">

            <c:if test="${not empty staleGameMessage}">
                <p class="stale-notice">${staleGameMessage}</p>
            </c:if>

            <c:choose>
                <c:when test="${game.status == 'WON'}">
                    <span class="result-badge result-badge--won">WIN</span>
                    <h2 class="result-title">게임 성공!</h2>
                    <p class="result-stat">${game.attemptCount}번 만에 성공했습니다.</p>
                </c:when>
                <c:otherwise>
                    <span class="result-badge result-badge--lost">GAME OVER</span>
                    <h2 class="result-title">게임 종료</h2>
                    <p class="result-stat">${game.attemptLimit}번의 기회를 모두 사용했습니다.</p>
                </c:otherwise>
            </c:choose>

            <div class="result-answer-box">
                <p class="result-answer-label">정답</p>
                <p class="result-answer-digits">${game.answer}</p>
            </div>

            <form action="/start" method="get">
                <button type="submit" class="btn-primary">새 게임</button>
            </form>

        </div>
    </div>
</body>
</html>