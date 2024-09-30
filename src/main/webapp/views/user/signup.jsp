<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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

#check-id-btn:hover {
	background-color: #0062cc;
	color: white;
	transition: background-color 0.3s ease;
}

.signup-main-title {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 30px;
}

label {
	font-weight: bold;
}

.hiding-btn2 {
	background-color: transparent;
	border: 0px;
}

.signup-button {
	text-align: center;
	margin-top: 50px;
}

.signup-button2 {
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
	margin: auto;
}

#check-id-btn {
	background: #007AFF;
	color: white;
	border: 1px solid #007AFF;
	height: 100%;
}

/* 가입하기 버튼 활성화 상태 */
#signupBtn {
    background: #007AFF;
    color: white;
    border-radius: 5px;
    width: 50%;
    height: 50px;
    margin-bottom: 50px;
    cursor: pointer;
    border: 1px solid #007AFF;

}


/* 가입하기 버튼 비활성화 상태 */
#signupBtn:disabled {
    background-color: #cccccc; /* 비활성화 상태에서 회색 배경 */
    color: #666666; /* 비활성화 상태에서 회색 글자 */
    cursor: not-allowed; /* 비활성화 상태에서 마우스 커서를 '금지' 모양으로 변경 */
        border: 1px solid #cccccc;
}

/* 가입하기 버튼 활성화 상태에서 hover */
#signupBtn:hover:enabled {
    background-color: rgb(50, 173, 255); /* 활성화 상태에서 hover 시 파란색 */
    color: white;
    transition: background-color 0.3s ease;


</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section class="signup-main-box">
		<h1 class="signup-main-title">회원정보입력</h1>
		<hr>
		<form action="<%=contextPath%>/signup.me" method="post" id="form-btn"
			class="was-validated">
			<!--아이디-->
			<div class="form-group" id="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="userId">아이디</label>
						</div>
						<div style="width: 90%;">
							<input style="border: 0px;" type="text" class="form-control"
								placeholder="아이디를 입력하세요" name="userId" id="userId" required>
						</div>
						<div class="check-availability">
							<button type="button" id="check-id-btn"
								class="check-availability-button">
								<h5>중복확인</h5>
							</button>
						</div>
					</div>
					<!-- 중복확인 메시지를 표시할 요소 -->
					<div id="idCheckMsg" style="margin-top: 10px;"></div>
				</div>
			</div>

			<!-- 중복확인 Ajax 스크립트 -->
			<script>
                let isIdChecked = false;
                $(document).ready(function() {
                    $("#check-id-btn").on("click", function() {
                        var userId = $("#userId").val().trim();

                        if (userId === '') {
                            $("#idCheckMsg").text("아이디를 입력하세요.")
                                .css("color", "red")
                                .css("font-weight", "bold");
                            return;
                        }

                        // Ajax를 통해 서버에 중복 확인 요청
                        $.ajax({
                            url: "${pageContext.request.contextPath}/idCheck.me",
                            type: "POST",
                            data: {userId: userId},
                            success: function(response) {
                                if(response == "fail") {
                                    $("#idCheckMsg").text("이미 사용 중인 아이디입니다.")
                                        .css("color", "red")
                                        .css("font-weight", "bold");
                                    $("#userId").val("");
                                    isIdChecked = false;
                                } else {
                                    $("#idCheckMsg").text("사용 가능한 아이디입니다.")
                                        .css("color", "green")
                                        .css("font-weight", "bold");
                                    isIdChecked = true;
                                }
                                checkAllConditions(); // 중복확인 후 상태 갱신
                            },
                            error: function() {
                                $("#idCheckMsg").text("중복 확인 요청에 실패했습니다.")
                                    .css("color", "red")
                                    .css("font-weight", "bold");
                                isIdChecked = false;
                            }
                        });
                    });
                });
            </script>

			<!--비밀번호-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="userPwd">비밀번호</label>
						</div>
						<input type='hidden' id='hiddenPwd' name='hiddenPwd' value='no'>
						<div style="width: 90%;">
							<input style="border: 0px;" type="password" class="form-control"
								placeholder="비밀번호를 입력하세요" name="userPwd" id="userPwd" required>
						</div>
						<div>
							<button id="toggle-password" type="button" class="hiding-btn2">
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
							<label for="userConfirmPwd">비밀번호확인</label>
						</div>
						<div style="width: 85%;">
							<input style="border: 0px;" type="password" class="form-control"
								placeholder="비밀번호를 확인해주세요" name="userConfirmPwd"
								id="userConfirmPwd" required>
						</div>
						<div>
							<button id="toggle-confirm-password" type="button"
								class="hiding-btn2">
								<i class="fa-regular fa-eye" style="cursor: pointer;"></i>
							</button>
						</div>
					</div>
					<div id="pwdCheckMsg" style="margin-top: 10px;"></div>
				</div>
			</div>

			<!-- 비밀번호 보이기/숨기기 스크립트 -->
			<script>
                $(document).ready(function(){
                    // 비밀번호 보이기/숨기기
                    $('#toggle-password').on('click', function(){
                        const pwdInput = $('#userPwd');
                        const type = pwdInput.attr('type') === 'password' ? 'text' : 'password';
                        pwdInput.attr('type', type);
                        $(this).find('i').toggleClass('fa-eye fa-eye-slash');
                    });

                    $('#toggle-confirm-password').on('click', function(){
                        const confirmPwdInput = $('#userConfirmPwd');
                        const type = confirmPwdInput.attr('type') === 'password' ? 'text' : 'password';
                        confirmPwdInput.attr('type', type);
                        $(this).find('i').toggleClass('fa-eye fa-eye-slash');
                    });

                    $('#userConfirmPwd').on('input', function() {
                        const userPwd = $('#userPwd').val();
                        const userConfirmPwd = $(this).val();

                        if (userConfirmPwd.trim() !== '') {
                            if (userPwd === userConfirmPwd) {
                                $("#pwdCheckMsg").text("비밀번호가 일치합니다.")
                                    .css("color", "green")
                                    .css("font-weight", "bold");
                            } else {
                                $("#pwdCheckMsg").text("비밀번호가 일치하지 않습니다.")
                                    .css("color", "red")
                                    .css("font-weight", "bold");
                            }
                        } else {
                            $("#pwdCheckMsg").text(""); // 비어있으면 초기화
                        }
                        checkAllConditions(); // 비밀번호 일치 여부 확인 후 상태 갱신
                    });
                });
            </script>

			<!--이름-->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="name">이름</label>
						</div>
						<div style="width: 90%;">
							<input style="border: 0px;" type="text" class="form-control"
								name="userName" id="name" placeholder="이름을 입력하세요" required>
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
							<label for="phone">휴대폰번호</label>
						</div>
						<div style="width: 85%;">
							<input style="border: 0px;" type="text" class="form-control"
								name="phone" id="phone" maxlength="13" placeholder="-를 포함하여 입력해주세요" required>
						</div>
					</div>
				</div>				
			</div>
				<script>
				$(document).ready(function() {
				    $("#phone").blur(function() {
				        var phoneNumber = $("#phone").val();
				        console.log(phoneNumber);
				        if (phoneNumber) {
				            // 전화번호 형식에 대한 정규 표현식
				            var regex = /^01[0-9]{1}-[0-9]{4}-[0-9]{4}$/;
				
				            // 정규 표현식이 전화번호 형식에 맞는지 확인
				            if (regex.test(phoneNumber)) {
				                // 유효한 형식일 경우 추가 동작이 필요하면 여기에 작성
				            } else {
				                alert("잘못된 형식의 전화번호 입니다.");
				                $("#phone").val(""); // 잘못된 형식이면 입력 필드를 비웁니다.
				            }
				        }
				    });
				});
				</script>


			<!-- 이메일 -->
			<div class="form-group">
				<div>
					<div
						style="display: flex; padding: 10px; border-bottom: 1px solid black;">
						<div style="padding: .375rem .100rem; width: 10%;">
							<label for="email">이메일</label>
						</div>
						<div style="width: 85%;">
							<input style="border: 0px;" type="text" class="form-control"
								placeholder="이메일 아이디를 입력하세요" name="email" id="email" required>
						</div>
						<div class="email-domain"
							style="padding: .375rem .100rem; width: 15%;" id="email-domain">
							<select class="form-select" title="이메일 도메인 주소 선택"
								onchange="setEmailDomain(this.value);return false;">
								<option value="custom">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
							</select>
							<!-- 이메일 도메인 선택시 자동으로 -->
							<script>
                                function setEmailDomain(domain) {
                                    const emailInput = document.getElementById('email');
                                    let currentValue = emailInput.value.split('@')[0];

                                    if (domain === 'custom') {
                                        emailInput.value = currentValue;
                                        emailInput.focus();
                                    } else {
                                        emailInput.value = currentValue + '@' + domain;
                                    }
                                }
                            </script>
						</div>
						<div class="check-availability">
							<!-- Button to Open the Modal -->
							<button type="button" class="btn btn-primary" id="sendCodeButton"
								data-toggle="modal" data-target="#myModal">인증번호 발송</button>
						</div>
					</div>
				</div>
			</div>

			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">인증번호를 입력하세요</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<input type="text" id="verificationCode" class="form-control"
								placeholder="인증번호 입력" required> <small id="errorMessage"
								style="color: red; display: none;">인증번호가 일치하지 않습니다.</small>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								id="verifyCodeButton">인증번호 확인</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</div>

			<!-- 이메일 인증 스크립트 -->
			<script>
                let isEmailVerified = false;

                $(document).ready(function() {
                    $('#sendCodeButton').on('click', function() {
                        const email = $('#email').val();
                        if (!email) {
                            alert('이메일을 입력하세요.');
                            return;
                        }

                        $.ajax({
                            url: '<%=contextPath%>/smtp.do',
                            type: 'POST',
                            data: { email: email },
                            success: function(response) {
                                if (response === 'send') {
                                    alert('인증번호가 발송되었습니다. 이메일을 확인해주세요.');
                                } else {
                                    alert('인증번호 발송에 실패했습니다. 다시 시도해주세요.');
                                }
                            },
                            error: function() {
                                alert('인증번호 발송 요청 중 오류가 발생했습니다.');
                            }
                        });
                    });

                    $('#verifyCodeButton').on('click', function() {
                        const userCode = $('#verificationCode').val();

                        if (!userCode) {
                            alert('인증번호를 입력하세요.');
                            return;
                        }

                        $.ajax({
                            url: '<%=contextPath%>/verifyCode.do',
                            type: 'POST',
                            data: { verificationCode: userCode },
                            success: function(response) {
                                if (response === 'success') {
                                    alert('인증번호가 확인되었습니다.');
                                    $('#myModal').modal('hide');
                                    $('.modal-backdrop').remove();
                                    isEmailVerified = true;
                                    checkAllConditions(); // 이메일 인증 후 상태 갱신
                                } else {
                                    alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
                                }
                            },
                            error: function() {
                                alert('인증번호 확인 중 오류가 발생했습니다.');
                            }
                        });
                    });
                });
            </script>

			<div class="terms-Agree">
				<div class="textBox1">
					<input type="checkbox" id="selectAll"> <label
						for="selectAll"><b>약관 전체 동의</b></label>
				</div>

				<div class="textBox2">
					<h5>
						<b>필수 동의 항목</b>
					</h5>
					<input type="checkbox" id="terms1" class="terms"> <label
						for="terms1">[필수] 이용약관</label><br> <input type="checkbox"
						id="terms2" class="terms"> <label for="terms2">[필수]
						전자금융거래 이용약관</label><br> <input type="checkbox" id="terms3"
						class="terms"> <label for="terms3">[필수] 개인정보 수집동의서</label>
				</div>

				<div class="textBox3">
					<h5>
						<b>선택 동의 항목</b>
					</h5>
					<input type="checkbox" id="terms4" class="terms"> <label
						for="terms4">[선택] 개인정보 수집동의서</label><br> <input
						type="checkbox" id="terms5" class="terms"> <label
						for="terms5">[선택] 위치기반서비스 이용약관</label>
				</div>
				<script>
				    document.addEventListener('DOMContentLoaded', function () {
				        const selectAll = document.getElementById('selectAll');
				        const termsCheckboxes = document.querySelectorAll('.terms');

				        selectAll.addEventListener('change', function () {
				            termsCheckboxes.forEach(checkbox => {
				                checkbox.checked = selectAll.checked;
				            });
				        });

				        termsCheckboxes.forEach(checkbox => {
				            checkbox.addEventListener('change', function () {
				                const allChecked = Array.from(termsCheckboxes).every(term => term.checked);
				                selectAll.checked = allChecked;
				            });
				        });
				    });
				</script>
			</div>

			<div class="signup-button">
				<!-- 가입하기 버튼 -->
				<button type="submit" class="signup-button2" id="signupBtn" disabled>가입하기</button>

			</div>

			<script>
                function checkAllConditions() {
                    const userId = document.getElementById('userId').value.trim();
                    const userPwd = document.getElementById('userPwd').value.trim();
                    const userConfirmPwd = document.getElementById('userConfirmPwd').value.trim();
                    const email = document.getElementById('email').value.trim();
                    const terms1 = document.getElementById('terms1').checked;
                    const terms2 = document.getElementById('terms2').checked;
                    const terms3 = document.getElementById('terms3').checked;

                    const isAllRequiredTermsChecked = terms1 && terms2 && terms3;
                    const isAllFieldsFilled = userId && userPwd && userConfirmPwd && email;
                    const isPasswordMatch = userPwd === userConfirmPwd;

                    if (isAllRequiredTermsChecked && isAllFieldsFilled && isPasswordMatch && isIdChecked && isEmailVerified) {
                        document.getElementById('signupBtn').disabled = false;
                    } else {
                        document.getElementById('signupBtn').disabled = true;
                    }

                    if (!isPasswordMatch) {
                        $("#pwdCheckMsg").text("비밀번호가 일치하지 않습니다.")
                            .css("color", "red")
                            .css("font-weight", "bold");
                    }
                }

                function validateTerms() {
                    const terms1 = document.getElementById('terms1').checked;
                    const terms2 = document.getElementById('terms2').checked;
                    const terms3 = document.getElementById('terms3').checked;

                    if (!terms1 || !terms2 || !terms3) {
                        alert("필수 약관에 모두 동의해야 합니다.");
                        return false;
                    }
                    return true;
                }

                document.addEventListener('DOMContentLoaded', function () {
                    const fields = ['userId', 'userPwd', 'userConfirmPwd', 'email'];
                    const checkboxes = ['terms1', 'terms2', 'terms3'];

                    fields.forEach(fieldId => {
                        document.getElementById(fieldId).addEventListener('input', checkAllConditions);
                    });

                    checkboxes.forEach(checkboxId => {
                        document.getElementById(checkboxId).addEventListener('change', checkAllConditions);
                    });

                    document.getElementById('selectAll').addEventListener('change', function () {
                        const isChecked = this.checked;
                        document.querySelectorAll('.terms').forEach(checkbox => {
                            checkbox.checked = isChecked;
                        });
                        checkAllConditions();
                    });

                    document.getElementById('form-btn').addEventListener('submit', function (e) {
                        if (!validateTerms()) {
                            e.preventDefault();
                        }
                    });
                });
            </script>
		</form>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
