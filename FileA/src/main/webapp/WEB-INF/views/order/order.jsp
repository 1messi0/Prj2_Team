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

.count-and-fee{
    display: flex;
    align-items: center;
    flex-direction: column;
}

.count-and-fee button, .fee-and-reservation button {
    border: thin;
    background: #ddd;
    cursor: pointer;
}


.fee-and-reservation input {
    border: none;
    border-radius: 0.25rem;
    padding: 0.375rem 0.75rem;
    text-align: right;
    font-weight: bold;
    color: red;
}

.count-and-fee label, .fee-and-reservation label {
    width: 100%;
    margin-bottom: 0.5rem;
}

#reservation-fee {
   width: 471px;
   font-size: 23px;
}

.count-and-fee input {
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    width: 180px;
    text-align: center;
}

#count {
   width: 410px;
    border: none; /* 모든 테두리를 제거 */
    border-top: 1px solid #ced4da; /* 위쪽 테두리를 추가 */
    border-bottom: 1px solid #ced4da; /* 아래쪽 테두리를 추가 */
   margin-left: 0; /* 왼쪽 여백을 제거 */
    margin-right: 0; /* 오른쪽 여백을 제거 */
}

.count-and-fee button {
    height: 38px;
    border-top: 1px solid #ced4da; /* 위쪽 테두리를 추가 */
    border-bottom: 1px solid #ced4da; /* 아래쪽 테두리를 추가 */
    justify-content: space-between; 
    width: 30px;
}

#count-and-fee-left{
   border-top-left-radius: 0.25rem;
   border-bottom-left-radius: 0.25rem;
}
#count-and-fee-ri{
   border-top-right-radius: 0.25rem;
   border-bottom-right-radius: 0.25rem;
}

.container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.left, .flow {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    text-align: left;
    flex: 1 0 480px;
    box-sizing: border-box;
}

.flow {
    align-items: flex-start;
}

.payment-button {
    border: none;
    background-color: transparent;
    margin: 10px;
}

.payment-button img {
    width: 100px;
}

.payment-button + .payment-button {
    margin-left: 0;
}

.button-container {
    display: flex;
    justify-content: center;
    gap: 20px;
}

input[type="text"], input[type="date"] {
    width: 200%;
    max-width: 500px;
}

input[type="date"] {
        width: 278%;
    max-width: 470px;
    box-sizing: border-box !important;
}

@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
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
       var feeInput = document.getElementById('reservation-fee');
       var nameInput = document.getElementById('name');
       var telInput = document.getElementById('fone');
       var dateInput = document.getElementById('date');
        var amount = parseInt(feeInput.value.replace(/,/g, ''));
        
        IMP.request_pay({
           pg : 'tosspay',
            pay_method: "card",
            merchant_uid: "ORD20180131-0000011",   // 주문번호
            name: "업체명",
            amount: amount,                        
            buyer_name: nameInput.value, 
            buyer_tel: telInput.value, 
            buyer_date: dateInput.value
        }, function (rsp) { // callback
            if (rsp.success) {
                $.ajax({
                    type: 'POST',
                    url: '/verify/' + rsp.imp_uid
                }).done(function(data) {
                   if (amount === data.response.amount) {
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
<script>
function increaseCountAndFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    var currentFee = Number(feeInput.value.replace(/,/g, ''));
    countInput.value = currentCount + 1;
    feeInput.value = (currentFee + 10000).toLocaleString('en-US');
}

function decreaseCountAndFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    var currentFee = Number(feeInput.value.replace(/,/g, ''));
    if (currentCount > 0) {
        countInput.value = currentCount - 1;
        feeInput.value = (currentFee - 10000).toLocaleString('en-US');
    }
}

function adjustFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    feeInput.value = (currentCount * 10000).toLocaleString('en-US');
}
</script>
<script>
function formatPhoneNumber(input) {
    var number = input.value.replace(/[^0-9]/g, '');
    var phone = '';
    
    if (number.length < 4) {
        phone = number;
    } else if (number.length < 7) {
        phone += number.substr(0, 3);
        phone += '-';
        phone += number.substr(3);
    } else {
        phone += number.substr(0, 3);
        phone += '-';
        phone += number.substr(3, 4);
        phone += '-';
        phone += number.substr(7);
    }
    return phone;
}

function handleInput(event) {
    var input = event.target;
    var formatted = formatPhoneNumber(input);
    if (formatted !== input.value) {
        event.preventDefault();
        input.value = formatted;
    }
    if (input.value.length > 13) {
        input.value = input.value.slice(0, 13);
    }
}
</script>

</head>
<body>

   <jsp:include page="/WEB-INF/resources/header.jsp" />
   <div class="container">
      <form class="left">
          <div class="mb-3">
           <label for="date" class="form-label"> 예약 업체</label>
           <input type="text" class="form-control" id="company" name="company" value="업체명" readonly style="font-weight: bold;">
         </div>
          <div class="mb-3">
           <label for="date" class="form-label"><b style="color:red">*</b>예약 날짜</label>
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
         <div class="mb-3">
             <label for="text" class="form-label"><b style="color:red">*</b>연락처</label>
             <input type="text" class="form-control" id="fone" name="fone" onkeyup="handleInput(event);" placeholder="연락처를 적어주세요." >
         </div>
         <div class="count-and-fee">
             <label for="count"><b style="color:red">*</b>인원 수</label>
             <div style="display: flex;">
                 <button type="button" id="count-and-fee-left" onclick="decreaseCountAndFee()">-</button>
                 <input id="count" type="number" value="0" onkeypress="return isNumberKey(event)" onchange="adjustFee()">
                 <button type="button" id="count-and-fee-ri" onclick="increaseCountAndFee()">+</button>
             </div>
         </div>

      </form>
   
      <!-- 2열 -->
      <div class="flow">
         <p>결제하기</p>
         <div class="button-container">
            <button class="payment-button" onclick="requestPay()">
            <img src="static/img/logo-toss-pay-blue.png" alt="결제하기">
            </button>
            
            <button class="payment-button" onclick="">
            <img src="static/img/payment_icon_yellow_small.png" alt="결제하기">
            </button>
         </div>
      </div>
         <div class="fee-and-reservation" style="margin-top:50px;">
             <label for="reservation-fee">예약금</label>
             <input id="reservation-fee" type="text" value="0" readonly>
         </div>
   </div>


   
</body>
</html>
