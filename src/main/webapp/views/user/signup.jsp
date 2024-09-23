<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->
<style>
@import
	url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css')
	;

.signup-main-box {
	max-width: 800px;
	margin: auto;
}

.check-availability-button {
	border: 1px solid #007AFF;
	border-radius: 5px;
	width: 80px;
}

.signup-main-title {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 30px;
}

label {
	font-weight: bold;
}

#hiding-btn {
	background-color: transparent;
	border: 0px;
}

.signup-button {
	text-align: center;
	margin-top: 50px;
}

.signup-button2 {
	border: 1px solid #007AFF;
	border-radius: 5px;
	width: 50%;
	height: 50px;
	margin-bottom: 50px;
}

.textBox1 {
	margin-bottom: 5px;
}

.textBox2 {
	margin-bottom: 5px;
}

#selectAll {
	margin-top: 30px;
}

.terms-Agree {
	display: flex;
	flex-direction: column;
	width:;
	margin: auto;
}


</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section class="signup-main-box">
		<h1 class="signup-main-title">회원정보입력</h1>
		<hr>
		<form action="#">
			<!--아이디-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="text">아이디</label>
						</div>
						<div style="width: 90%;">
							<input style="border: 0px;" type="text" class="form-control"
								placeholder="아이디를 입력하세요" id="userId">
						</div>
						<div class="check-availability">
							<button type="button" id="btn-1"
								class="check-availability-button" style="height:100%;">
								<h5>중복확인</h5>
							</button>
						</div>
					</div>
				</div>

			</div>
			<!--비밀번호-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="text">비밀번호</label>
						</div>
						<div style="width: 90%;">
							<input style="border: 0px;" type="password" class="form-control"
								placeholder="비밀번호를 입력하세요" id="userPwd">
						</div>
						<div>
							<button id="hiding-btn" type="button" class="hiding-btn2">
								<i class="fa-regular fa-eye" style="cursor: pointer;"></i>
							</button>
						</div>
					</div>
				</div>

			</div>
			<!--비밀번호 확인-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 15%;">
							<label for="text">비밀번호확인</label>
						</div>
						<div style="width: 85%;">
							<input style="border: 0px;" type="password" class="form-control"
								placeholder="비밀번호를 확인해주세요" id="userConfirmPwd">
						</div>
						<div>
							<button id="hiding-btn" type="button" class="hiding-btn2">
								<i class="fa-regular fa-eye" style="cursor: pointer;"></i>
							</button>
						</div>
					</div>
				</div>

			</div>
			<!--이름-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="text">이름</label>
						</div>
						<div style="width: 90%;">
							<input style="border: 0px;" type="text" class="form-control"
								id="userName">
						</div>
					</div>
				</div>

			</div>
			<!--휴대폰 번호-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 15%;">
							<label for="text">휴대폰번호</label>
						</div>
						<div style="width: 85%;">
							<input style="border: 0px;" type="text" class="form-control"
								id="phone">
						</div>
					</div>
				</div>

			</div>
			<!--이메일-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="text">이메일</label>
						</div>
						<div style="width: 45%;">
							<input style="border: 0px;" type="email" class="form-control"
								placeholder="hello123@world.com" id="email">
						</div>
						@
						<div style="width: 45%;">
							<input style="border: 0px;" type="email" class="form-control"
								id="email-dimain">
						</div>
						<div class="email-domain"
							style="padding: .375rem .100rem; width: 15%;" id="email-">
							<select class="form-select" title="이메일 도메인 주소 선택"
								onclick="setEmailDomain(this.value);return false;">
								<option value="custom">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
							</select>
						</div>
											<div class="check-availability">
							<button type="button" id="btn-1"
								class="check-availability-button">
								<h5>인증번호전송</h5>
							</button>
						</div>
					</div>
				</div>
				<script>
                    function setEmailDomain(domain) {
                        const emailDomainInput = document.getElementById('email-dimain');
                
                        if (domain === 'custom') {
                            emailDomainInput.value = ''; // "직접입력" 선택 시 입력값 초기화
                            emailDomainInput.readOnly = false; // 입력 필드 활성화
                        } else {
                            emailDomainInput.value = domain; // 선택된 도메인을 입력
                            emailDomainInput.readOnly = true; // 입력 필드 비활성화 (선택한 도메인만 표시)
                        }
                    }
                </script>

			</div>

			<div class="terms-Agree">
<div class="textBox1">
    <input type="checkbox" id="selectAll">
    <label for="selectAll"><b>약관 전체 동의</b></label>
</div>

<div class="textBox2">
    <h5><b>필수 동의 항목</b></h5>
    <input type="checkbox" id="terms1" class="terms">
    <label for="terms1">[필수] 이용약관</label> <br>

    <input type="checkbox" id="terms2" class="terms">
    <label for="terms2">[필수] 전자금융거래 이용약관</label> <br>

    <input type="checkbox" id="terms3" class="terms">
    <label for="terms3">[필수] 개인정보 수집동의서</label>
</div>

<div class="textBox3">
    <h5><b>선택 동의 항목</b></h5>
    <input type="checkbox" id="terms4" class="terms">
    <label for="terms4">[선택] 개인정보 수집동의서</label> <br>

    <input type="checkbox" id="terms5" class="terms">
    <label for="terms5">[선택] 위치기반서비스 이용약관</label>
</div>

			<script>
                // '약관 전체 동의' 체크박스를 클릭했을 때 실행될 코드
                document.getElementById('selectAll').addEventListener('change', function() {
                    const checkboxes = document.querySelectorAll('.terms');
                    checkboxes.forEach((checkbox) => {
                        checkbox.checked = this.checked;
                    });
                });
            </script>
			<div class="signup-button">
				<button type="submit" id="btn-1" class="signup-button2"
					onclick="location.href='#'">가입하기</button>
			</div>
		</form>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>