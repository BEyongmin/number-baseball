<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 시작</title>
</head>
<body>
    <h1>숫자야구 게임</h1>

    <form action="/start" method="post">

        <p>자리 수</p>
        <label><input type="radio" name="digitCount" value="3" checked> 3자리</label>
        <label><input type="radio" name="digitCount" value="4"> 4자리</label>
        <label><input type="radio" name="digitCount" value="5"> 5자리</label>

        <p>난이도</p>
        <label><input type="radio" name="difficulty" value="NORMAL" checked> 일반</label>
        <label><input type="radio" name="difficulty" value="BEGINNER"> 초보</label>

        <p>횟수 제한</p>
        <label><input type="radio" name="unlimited" value="false" checked> 10회 제한</label>
        <label><input type="radio" name="unlimited" value="true"> 제한 없음</label>

        <p><button type="submit">게임 시작</button></p>

    </form>
</body>
</html>