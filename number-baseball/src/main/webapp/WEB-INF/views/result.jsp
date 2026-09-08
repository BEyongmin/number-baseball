<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 결과</title>
</head>
<body>

    <c:choose>
        <c:when test="${game.status == 'WON'}">
            <h1>게임 성공!</h1>
            <p>정답: ${game.answer}</p>
            <p>${game.attemptCount}번 만에 성공했습니다.</p>
        </c:when>
        <c:otherwise>
            <h1>게임 종료</h1>
            <p>정답: ${game.answer}</p>
            <p>${game.attemptLimit}번의 기회를 모두 사용했습니다.</p>
        </c:otherwise>
    </c:choose>

    <form action="/start" method="get">
        <button type="submit">새 게임</button>
    </form>

</body>
</html>