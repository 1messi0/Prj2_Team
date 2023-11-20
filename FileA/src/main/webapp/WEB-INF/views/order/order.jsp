<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Floritz 예약하기</title>
<link rel="stylesheet" href="static/css/main.css" />
<style>
.payment-button {
    border: none;
    background-color: transparent;
}
.payment-button img {
    width: 100px;
}

</style>
   <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("impid"); 
        
        function requestPay() {
            IMP.request_pay({
            	pg : 'tosspay',
                pay_method: "card",
                merchant_uid: "ORD20180131-0000011",   // 주문번호
                name: "노르웨이 회전 의자",
                amount: 100,                         // 숫자 타입
                buyer_email: "gildong@gmail.com",
                buyer_name: "홍길동",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    $.ajax({
                        type: 'POST',
                        url: '/verify/' + rsp.imp_uid
                    }).done(function(data) {
                        if (rsp.paid_amount === data.response.amount) {
                            alert("결제 성공");
                        } else {
                            alert("결제 실패");
                        }
                    });
                } else {
                    alert("결제에 실패하였습니다. 오류 메시지: " + rsp.error_msg);
                }
            });
        }
    </script>

	<script>
		function formatTime(input) {
		    var time = input.value;
		    if (time.length === 4) {
		        var formatted = time.slice(0, 2) + ":" + time.slice(2);
		        input.value = formatted;
		    }
		}
		
		function isNumber(event) {
		    var keyCode = event.keyCode;
		    if (keyCode < 48 || keyCode > 57) {
		        return false;
		    }
		    return true;
		}
	</script>
<script>
function validateName(input) {
    var name = input.value;
    var regex = /[ㄱ-ㅎㅏ-ㅣ]/;
    
    if (regex.test(name)) {
        alert("성함을 확인해주세요.");
        input.value = "";
        input.focus();
    }
}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/resources/header.jsp" />
	
	<form>
	    <div class="mb-3">
		  <label for="date" class="form-label"><b style="color:red">*</b>예약날짜</label>
		  <input type="date" class="form-control" id="date" name="date">
		</div>
		<div class="mb-3">
		    <label for="time" class="form-label"><b style="color:red">*</b>예약 시간</label>
		    <input type="text" class="form-control" id="time" name="time" oninput="formatTime(this)" placeholder="00:00"  maxlength="4" >
		</div>
		<div class="mb-3">
		    <label for="text" class="form-label"><b style="color:red">*</b>예약자명</label>
		    <input type="text" class="form-control" id="name" name="name" onblur="validateName(this)" placeholder="성함을 적어주세요." >
		</div>
	</form>

<!-- 토스페이 -->
결제하기
<button class="payment-button" onclick="requestPay()">
<img src="static/img/logo-toss-pay-blue.png" alt="결제하기">
</button>



	
</body>
</html>
