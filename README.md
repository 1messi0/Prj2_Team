# Prj2_Team
2차 프로젝트 (팀)

## 231122_Gmail 인증코드 받기 수정본

<필수항목>
1. 구글 2단계 비밀번호
   구글 계정관리 > 보안 > 2단계 인증 > 최하단 앱 비밀번호 설정

<코드목록>

email.jsp

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

<body>
              <div class="form-outline form-white mb-4" id="mail_input"
									name="mail_input">
									<input type="text" name="mail" id="mail" placeholder="이메일 입력"
										class="form-control form-control-lg">
									<button type="button" id="sendBtn" name="sendBtn"
										onclick="sendNumber()">인증번호 발송</button>
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
</body>




   
   
