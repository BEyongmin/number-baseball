<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 진행 중</title>
</head>
<body>
    <h1>숫자야구 게임</h1>

    <c:choose>
        <c:when test="${game.unlimited}">
            <p>시도 횟수: ${game.attemptCount}회 (제한 없음)</p>
        </c:when>
        <c:otherwise>
            <p>시도 횟수: ${game.attemptCount} / ${game.attemptLimit}</p>
        </c:otherwise>
    </c:choose>

    <c:if test="${not empty errorMessage}">
        <p style="color: red;">⚠ ${errorMessage}</p>
    </c:if>

    <form action="/game" method="post">
        <input type="text" name="input" maxlength="${game.digitCount}"
               placeholder="${game.digitCount}자리 숫자 입력">
        <button type="submit">확인</button>
    </form>

    <hr>

    <table border="1">
        <tr>
            <th>시도</th>
            <th>입력</th>
            <th>Strike</th>
            <th>Ball</th>
            <th>Out</th>
        </tr>
        <c:forEach var="attempt" items="${game.history}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${attempt.input}</td>
                <td>${attempt.strike}</td>
                <td>${attempt.ball}</td>
                <td>${attempt.out}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>