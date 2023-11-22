<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- join.css 파일 연결 -->
<link rel="stylesheet" href="static/css/join.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">

	function sendNumber() {
		$("#mail_number").css("display", "block");
		$.ajax({
			url : "/mail",
			type : "post",
			dataType : "json",
			data : {
				"mail" : $("#mail").val()
			},
			success : function(data) {
				alert("인증번호 발송");
				$("#Confirm").attr("value", data);
			}
		});
	}

	function confirmNumber() {
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if (number1 == number2) {
			alert("인증되었습니다.");
		} else {
			alert("번호가 다릅니다.");
		}
	}
	
</script>

<body class="gradient-custom">
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<div class="card-body p-5 text-center">
						<div class="mb-md-4 mt-md-3 pb-5">
							<h2 class="fw-bold mb-2 text-uppercase">회원가입</h2>
							<p class="text-white-50 mb-5">아래의 정보를 입력해주세요</p>

							<!-- 개인 / 사업자 가입 구분 -->
							<div class="mb-3">
								<button type="button" class="btn btn-primary"
									onclick="showPersonalForm()">개인</button>
								<button type="button" class="btn btn-secondary"
									onclick="showBusinessForm()">사업자</button>
							</div>

							<form id="joinForm" action="/userInsert" method="post">
								<div class="form-outline form-white mb-4">
									<input type="text" id="id" class="form-control form-control-lg"
										name="id" placeholder="아이디" required /> <label
										class="form-label" for="userid">아이디</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="password" id="password"
										class="form-control form-control-lg" name="password"
										placeholder="*****" required /> <label class="form-label"
										for="password">비밀번호</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="password" id="passwordConfirm"
										class="form-control form-control-lg" placeholder="*****"
										name="passwordConfirm" required /> <label class="form-label"
										for="passwordConfirm">비밀번호 확인</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="text" id="name"
										class="form-control form-control-lg" placeholder="성명"
										name="name" required /> <label class="form-label" for="name">성명</label>
								</div>

								<div class="form-outline form-white mb-4" id="mail_input"
									name="mail_input">
									<input type="text" name="mail" id="mail" placeholder="이메일 입력"
										class="form-control form-control-lg">
									<button type="button" id="sendBtn" name="sendBtn"
										onclick="sendNumber()">인증번호</button>
								</div>
								<div class="form-outline form-white mb-4" id="mail_number"
									name="mail_number" style="display: none">
									<input type="text" name="number" id="number"
										placeholder="인증번호 입력" class="form-control form-control-lg">
									<button type="button" name="confirmBtn" id="confirmBtn"
										onclick="confirmNumber()">이메일 인증</button>
								</div>
								
								<br> <input type="text" id="Confirm" name="Confirm"
									style="display: none" value="">

								<div class="form-outline form-white mb-4">
									<input type="text" id="phone"
										class="form-control form-control-lg"
										placeholder="010-1234-5678" name="phone" required /> <label
										class="form-label" for="phone">연락처</label>
								</div>
								<button type="submit" class="btn btn-outline-light btn-lg px-5">가입하기</button>
							</form>

							<!-- 사업자 회원가입 폼 -->
							<form id="businessForm" action="/businessInsert" method="post"
								style="display: none;">
								<div class="form-outline form-white mb-4">
									<input type="text" id="businessName"
										class="form-control form-control-lg" placeholder="상호명"
										name="businessName" required /> <label class="form-label"
										for="businessName">상호명</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="text" id="businessId"
										class="form-control form-control-lg" placeholder="아이디"
										name="businessId" required /> <label class="form-label"
										for="businessId">아이디</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="password" id="businessPassword"
										class="form-control form-control-lg" placeholder="*****"
										name="businessPassword" required /> <label class="form-label"
										for="businessPassword">비밀번호</label>
								</div>

								<div class="form-outline form-white mb-4">
									<input type="password" id="passwordConfirm1"
										class="form-control form-control-lg" placeholder="*****"
										name="passwordConfirm1" required /> <label class="form-label"
										for="passwordConfirm1">비밀번호 확인</label>
								</div>

								<div class="form-outline form-white mb-4">
									<input type="text" id="businessNumber"
										class="form-control form-control-lg" placeholder="사업자번호"
										name="businessNumber" required /> <label class="form-label"
										for="businessNumber">사업자번호</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="file" id="businessRegistration"
										class="form-control form-control-lg"
										name="businessRegistration" required /> <label
										class="form-label" for="businessRegistration">사업자등록증
										첨부</label>
								</div>
								<!-- ... (기타 필요한 사업자 회원가입 폼 내용을 추가) ... -->
								<button type="submit" class="btn btn-outline-light btn-lg px-2">가입하기</button>
							</form>
						</div>

						<script>
							function showPersonalForm() {
								document.getElementById('joinForm').style.display = 'block';
								document.getElementById('businessForm').style.display = 'none';
							}

							function showBusinessForm() {
								document.getElementById('joinForm').style.display = 'none';
								document.getElementById('businessForm').style.display = 'block';
							}

							// 개인 비밀번호 일치확인
							document
									.getElementById('passwordConfirm')
									.addEventListener(
											'input',
											function() {
												var password = document
														.getElementById('password').value;
												var passwordConfirm = this.value;
												var errorDiv = this.nextElementSibling;

												if (password !== passwordConfirm) {
													errorDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
													errorDiv.style.color = 'red'; // 텍스트 색상을 빨간색으로 변경
												} else {
													errorDiv.innerHTML = '비밀번호가 일치합니다.';
													errorDiv.style.color = ''; // 초기 텍스트 색상으로 복원
												}
											});

							// 사업자 비밀번호 일치확인
							document
									.getElementById('passwordConfirm1')
									.addEventListener(
											'input',
											function() {
												var password = document
														.getElementById('password').value;
												var passwordConfirm1 = this.value;
												var errorDiv = this.nextElementSibling;

												if (password !== passwordConfirm1) {
													errorDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
													errorDiv.style.color = 'red'; // 텍스트 색상을 빨간색으로 변경
												} else {
													errorDiv.innerHTML = '비밀번호가 일치합니다.';
													errorDiv.style.color = ''; // 초기 텍스트 색상으로 복원
												}
											});
						</script>

						<!-- Google Login -->
						<a href="/oauth2/authorization/google"> <img
							src="https://developers.google.com/identity/images/btn_google_signin_dark_normal_web.png">
						</a>

						<!-- Naver Login -->
						<a href="/oauth2/authorization/naver"> <img
							src="https://static.nid.naver.com/oauth/small_g_in.PNG">
						</a>

						<!-- Kakao Login -->
						<a href="/oauth2/authorization/kakao"> <img
							src="https://developers.kakao.com/img/about/logos/kakao_accounts/kakao_account_login_btn_medium.png">
						</a> <br> <br> <a href="/">돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
