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
<body class="gradient-custom">
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<div class="card-body p-5 text-center">
						<div class="mb-md-5 mt-md-4 pb-5">
							<h2 class="fw-bold mb-2 text-uppercase">회원가입</h2>
							<p class="text-white-50 mb-5">아래의 정보를 입력해주세요</p>
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
								<div class="form-outline form-white mb-4">
									<input type="email" id="email"
										class="form-control form-control-lg" placeholder="이메일을 입력하세요"
										name="email" required /> <label class="form-label"
										for="email">이메일</label>
								</div>
								<div class="form-outline form-white mb-4">
									<input type="text" id="phone"
										class="form-control form-control-lg"
										placeholder="010-1234-5678" name="phone" required /> <label
										class="form-label" for="phone">연락처</label>
								</div>
								<input type="submit" class="btn btn-outline-light btn-lg px-5"
									value="가입하기">
							</form>
							<script>
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
							</a> 
							<br>
							<br>
							<a href="/">돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
