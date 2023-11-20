<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Floritz 업체 등록</title>
<link rel="stylesheet" href="/css/main.css" />
   <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp45706873"); 
        
        function requestPay() {
            IMP.request_pay({
            	pg : 'tosspay',
                pay_method: "card",
                merchant_uid: "ORD20180131-0000011",   // 주문번호
                name: "노르웨이 회전 의자",
                amount: 64900,                         // 숫자 타입
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

</head>
<body>
	<jsp:include page="/WEB-INF/resources/header.jsp" />
<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

<!-- 
    <h1>Write</h1>
    <form action="/Write" method="post">
        <input type="hidden" name="companyname" value="${boardDTO.companyname}" />

        <label for="announcement">Announcement:</label>
        <input type="text" id="announcement" name="announcement" value="${boardDTO.announcement}" /><br>

        <label for="repnumber">Rep Number:</label>
        <input type="text" id="repnumber" name="repnumber" value="${boardDTO.repnumber}" /><br>

        <label for="dayoff">Day Off:</label>
        <input type="text" id="dayoff" name="dayoff" value="${boardDTO.dayoff}" /><br>

        <label for="breaktime">Break Time:</label>
        <input type="text" id="breaktime" name="breaktime" value="${boardDTO.breaktime}" /><br>

        <input type="submit" value="Submit" />
    </form>
 -->
	
</body>
</html>


<!-- 
단일파일 업로드 
<form action="upload_ok" method="post" enctype="multipart/form-data">
	<input type="file" name="file"/><br/>
	<input type="submit" value="업로드"/><br/>
</form>
다중파일 업로드 
<form action="upload_ok2" method="post" enctype="multipart/form-data">
	<input type="file" name="file" multiple="multiple"/><br/>
	<input type="submit" value="업로드"/><br/>
</form>
 -->