<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Floritz 단체 예약</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/main.css" />
<link href="/static/css/styles.css" rel="stylesheet" />
<style>

.col-md-3 {
	margin-bottom: 30px;
}
.btn-secondary {
    width: 100%;  /* 버튼 가로 크기를 100%로 설정 */
}
.card-img-top {
   height: 10rem;  /* 이미지 높이 조절 */
   object-fit: cover;  /* 이미지 비율 유지 */ 
}

.card-title {
    white-space: nowrap;  /* 텍스트를 한 줄로 제한 */
    overflow: hidden;  /* 텍스트가 박스를 벗어나면 숨김 */
    text-overflow: ellipsis;  /* 텍스트가 박스를 벗어나면 '...'로 표시 */
}
.card-text {
    margin-bottom: 0;  /* 아래쪽 마진 제거 */
}

/* .card-body {
   padding: 1rem;  카드 내부 패딩 조절
}

.card-title {
   font-size: 1rem;  제목 텍스트 크기 조절
}

.card-text {
   font-size: 0.8rem;  본문 텍스트 크기 조절 */
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body >
  <jsp:include page="/WEB-INF/resources/header.jsp" />
  <div id="main">
    <table class="table">
  <tbody>
      <div class="container">
      <br>
      <h6>내 주변 추천  <span class="badge bg-danger">Best</span></h6>
      <br>

      <hr>
      <br>
      <div class="row">
	    <c:forEach var="board" items="${ brdList }">
	    <div class="col-md-3">
		    <div class="card p-3 p-3" style="width: 100%;">
		    <img src="static/companyimg/head.png" alt="회사 로고">
		    <%-- <img src="<c:url value='${board.companyimg}'/>" alt="Company Image"> --%>
			  <div class="card-body">
			    <h5 class="card-title"><a href="/View?bno=${ board.companyname }" style="text-decoration: none;color: black;font-weight: bold;">${ board.companyname }</a></h5>
			    <p class="card-text">${ board.companyaddress }</p>
			    <p class="card-text">${ board.repnumber }</p>
			    <p class="card-text">${ board.dayoff }</p>
			    <a href="/View?companyname=${ board.companyname }" class="btn btn-secondary">예약하기</a>
		  	  </div>
			</div>
		</div>
	    </c:forEach>
      </div>
      </div> 
  </tbody>
</table>

    
  </div>
  
  <script>
    const btnWriteEl = document.querySelector('#btnWrite');
    btnWriteEl.addEventListener('click', function() {
    	location.href = '/WriteForm'
    });
  
  </script>
 
</body>
</html>

