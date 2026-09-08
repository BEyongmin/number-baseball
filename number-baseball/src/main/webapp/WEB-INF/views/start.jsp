<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>숫자야구 게임 - 시작</title>
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
            <form action="/start" method="post">

                <div class="option-group">
                    <p class="option-label">자리 수</p>
                    <div class="chip-row">
                        <input class="chip-input" type="radio" id="d3" name="digitCount" value="3" checked><label class="chip" for="d3">3자리</label>
                        <input class="chip-input" type="radio" id="d4" name="digitCount" value="4"><label class="chip" for="d4">4자리</label>
                        <input class="chip-input" type="radio" id="d5" name="digitCount" value="5"><label class="chip" for="d5">5자리</label>
                    </div>
                </div>

                <div class="option-group">
                    <p class="option-label">난이도</p>
                    <div class="chip-row">
                        <input class="chip-input" type="radio" id="diffNormal" name="difficulty" value="NORMAL" checked><label class="chip" for="diffNormal">일반</label>
                        <input class="chip-input" type="radio" id="diffBeginner" name="difficulty" value="BEGINNER"><label class="chip" for="diffBeginner">초보</label>
                    </div>
                </div>

                <div class="option-group">
                    <p class="option-label">횟수 제한</p>
                    <div class="chip-row">
                        <input class="chip-input" type="radio" id="limitOn" name="unlimited" value="false" checked><label class="chip" for="limitOn">10회 제한</label>
                        <input class="chip-input" type="radio" id="limitOff" name="unlimited" value="true"><label class="chip" for="limitOff">제한 없음</label>
                    </div>
                </div>

                <button type="submit" class="btn-primary">게임 시작</button>

            </form>
        </div>
    </div>
</body>
</html>