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

    <c:if test="${game.difficulty == 'BEGINNER'}">
        <p>숫자 상태 (초보 모드)</p>
        <div>
            <c:forEach begin="0" end="9" var="digit">
                <c:set var="status" value="${digitStatuses[digit]}" />
                <c:choose>
                    <c:when test="${status == 'STRIKE'}">
                        <span style="display:inline-block; width:30px; padding:5px; margin:2px; text-align:center; background-color:red; color:white;">${digit}</span>
                    </c:when>
                    <c:when test="${status == 'BALL'}">
                        <span style="display:inline-block; width:30px; padding:5px; margin:2px; text-align:center; background-color:yellow;">${digit}</span>
                    </c:when>
                    <c:when test="${status == 'OUT'}">
                        <span style="display:inline-block; width:30px; padding:5px; margin:2px; text-align:center; background-color:lightgray;">${digit}</span>
                    </c:when>
                    <c:otherwise>
                        <span style="display:inline-block; width:30px; padding:5px; margin:2px; text-align:center; background-color:white; border:1px solid black;">${digit}</span>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:if>

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