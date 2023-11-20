<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>약관 동의</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>약관 동의</h2>
        <form action="/Join" method="post">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="allAgree">
                <label class="form-check-label" for="allAgree">모두 동의합니다.</label>
            </div>
            <hr>
            <div class="form-check">
                <input class="form-check-input subAgree" type="checkbox" value="agree" id="terms" name="terms">
                <label class="form-check-label" for="terms">이용약관 동의(필수)</label>
            </div>
            <div class="form-check">
                <input class="form-check-input subAgree" type="checkbox" value="agree" id="privacy" name="privacy">
                <label class="form-check-label" for="privacy">개인정보 수집 및 이용에 대한 안내(필수)</label>
            </div>
            <div class="form-check">
                <input class="form-check-input subAgree" type="checkbox" value="agree" id="location" name="location">
                <label class="form-check-label" for="location">위치정보 이용약관 동의(선택)</label>
            </div>
            <div class="form-check">
                <input class="form-check-input subAgree" type="checkbox" value="agree" id="promotion" name="promotion">
                <label class="form-check-label" for="promotion">이벤트 등 프로모션 알림 메일 수신(선택)</label>
            </div>
            <button type="submit" class="btn btn-primary">동의</button>
        </form>
    </div>
    <script>
        $('#allAgree').change(function() {
            $('.subAgree').prop('checked', this.checked);
        });
    </script>
</body>
</html>
