<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    
    <style>
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

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

        .hiding-btn2 {
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
            margin: auto;
        }

        #check-id-btn {
            background: #007AFF;
            color: white;
            border: 1px solid #007AFF;
        }

        #signupBtn {
            background: #007AFF;
            color: white;
        }
.signup-button2:disabled {
    background-color: #cccccc; /* 비활성화된 버튼의 색상 */
    color: #666666; /* 비활성화된 버튼 텍스트 색상 */
    cursor: not-allowed; /* 비활성화 상태일 때 커서 변경 */
}

        
    </style>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>
    <section class="signup-main-box">
        <h1 class="signup-main-title">회원정보입력</h1>
        <hr>
        <form action="<%=contextPath%>/signup.me" method="post" id="form-btn">
            <!--아이디-->
            <div class="form-group" id="form-group">
                <div>
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 10%;">
                            <label for="userId">아이디</label>
                        </div>
                        <div style="width: 90%;">
                            <input style="border: 0px;" type="text" class="form-control" placeholder="아이디를 입력하세요" name="userId" id="userId">
                        </div>
                        <div class="check-availability">
                            <button type="button" id="check-id-btn" class="check-availability-button" style="height: 100%;">
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
                $(document).ready(function() {
                    // 중복확인 버튼 클릭 시 검사
                    $("#check-id-btn").on("click", function() {
                        var userId = $("#userId").val();

                        // 아이디가 입력되지 않았을 때 처리
                        if(userId.trim() === '') {
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
                                } else {
                                    $("#idCheckMsg").text("사용 가능한 아이디입니다.")
                                        .css("color", "green")
                                        .css("font-weight", "bold");
                                }
                            },
                            error: function() {
                                $("#idCheckMsg").text("중복 확인 요청에 실패했습니다.")
                                    .css("color", "red")
                                    .css("font-weight", "bold");
                            }
                        });
                    });
                });
            </script>

            <!--비밀번호-->
            <div class="form-group">
                <div>
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 10%;">
                            <label for="text">비밀번호</label>
                        </div>
                        <input type='hidden' id='hiddenPwd' name='hiddenPwd' value='no'>
                        <div style="width: 90%;">
                            <input style="border: 0px;" type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPwd" id="userPwd">
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
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 15%;">
                            <label for="text">비밀번호확인</label>
                        </div>
                        <div style="width: 85%;">
                            <input style="border: 0px;" type="password" class="form-control" placeholder="비밀번호를 확인해주세요" name="userConfirmPwd" id="userConfirmPwd">
                        </div>
                        <div>
                            <button id="toggle-confirm-password" type="button" class="hiding-btn2">
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

                    // 비밀번호 일치 확인 Ajax
                    $('#userConfirmPwd').on('input', function() {
                        const userPwd = $('#userPwd').val();
                        const userConfirmPwd = $(this).val();

                        if (userConfirmPwd.trim() !== '') {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/pwdCheck.me",
                                type: "POST",
                                data: {
                                    userPwd: userPwd,
                                    userConfirmPwd: userConfirmPwd
                                },
                                success: function(response) {
                                    if (response == "fail") {
                                        $("#pwdCheckMsg").text("비밀번호가 일치하지 않습니다.")
                                            .css("color", "red")
                                            .css("font-weight", "bold");
                                        $('#hiddenPwd').val('no');
                                    } else {
                                        $("#pwdCheckMsg").text("비밀번호가 일치합니다.")
                                            .css("color", "green")
                                            .css("font-weight", "bold");
                                        $('#hiddenPwd').val('yes');
                                    }
                                },
                                error: function() {
                                    $("#pwdCheckMsg").text("비밀번호 확인 요청에 실패했습니다.")
                                        .css("color", "red")
                                        .css("font-weight", "bold");
                                }
                            });
                        } else {
                            $("#pwdCheckMsg").text(""); // 비어있으면 초기화
                        }
                    });
                });
            </script>

            <!--이름-->
            <div class="form-group">
                <div>
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 10%;">
                            <label for="text">이름</label>
                        </div>
                        <div style="width: 90%;">
                            <input style="border: 0px;" type="text" class="form-control" name="userName" id="name">
                        </div>
                    </div>
                </div>
            </div>

            <!--휴대폰 번호-->
            <div class="form-group">
                <div>
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 15%;">
                            <label for="text">휴대폰번호</label>
                        </div>
                        <div style="width: 85%;">
                            <input style="border: 0px;" type="text" class="form-control" name="phone" id="phone" required>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <div>
                    <div style="display: flex; padding: 10px; border-bottom: 1px solid black;">
                        <div style="padding: .375rem .100rem; width: 10%;">
                            <label for="text">이메일</label>
                        </div>
                        <div style="width: 85%;">
                            <input style="border: 0px;" type="text" class="form-control" placeholder="이메일 아이디를 입력하세요" name="email" id="email">
                        </div>
                        <div class="email-domain" style="padding: .375rem .100rem; width: 15%;" id="email-domain">
                            <select class="form-select" title="이메일 도메인 주소 선택" onchange="setEmailDomain(this.value);return false;">
                                <option value="custom">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                            <!-- 이메일 도메인 선택시 자동으로  -->
                            <script>
							    function setEmailDomain(domain) {
							        const emailInput = document.getElementById('email'); // 이메일 입력 필드
							        let currentValue = emailInput.value.split('@')[0]; // '@'를 기준으로 이메일의 아이디 부분만 추출
							
							        if (domain === 'custom') {
							            emailInput.value = currentValue; // "직접입력" 선택 시 도메인 없이 아이디 부분만 남김
							            emailInput.focus(); // 직접 입력 가능하도록 포커스 줌
							        } else {
							            emailInput.value = currentValue + '@' + domain; // 선택된 도메인으로 이메일 주소 완성
							        }
							    }
							</script>
                            
                        </div>
                        <div class="check-availability">
                            <!-- Button to Open the Modal -->
                            <button type="button" class="btn btn-primary" id="sendCodeButton" data-toggle="modal" data-target="#myModal">인증번호 발송</button>

                            <!-- 인증번호 발송 스크립트 -->
                            <script>
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
                                });
                            </script>
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
                                            <input type="text" id="verificationCode" class="form-control" placeholder="인증번호 입력">
                                            <small id="errorMessage" style="color: red; display: none;">인증번호가 일치하지 않습니다.</small>
                                        </div>

                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" id="verifyCodeButton">인증번호 확인</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 이메일 인증 여부 저장하는 변수 -->
                <script>
                    $(document).ready(function() {
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
                                        $('#signupBtn').prop('disabled', false);
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
            </div>

            <div class="terms-Agree">
                <div class="textBox1">
                    <input type="checkbox" id="selectAll">
                    <label for="selectAll"><b>약관 전체 동의</b></label>
                </div>

                <div class="textBox2">
                    <h5><b>필수 동의 항목</b></h5>
                    <input type="checkbox" id="terms1" class="terms">
                    <label for="terms1">[필수] 이용약관</label><br>
                    <input type="checkbox" id="terms2" class="terms">
                    <label for="terms2">[필수] 전자금융거래 이용약관</label><br>
                    <input type="checkbox" id="terms3" class="terms">
                    <label for="terms3">[필수] 개인정보 수집동의서</label>
                </div>

                <div class="textBox3">
                    <h5><b>선택 동의 항목</b></h5>
                    <input type="checkbox" id="terms4" class="terms">
                    <label for="terms4">[선택] 개인정보 수집동의서</label><br>
                    <input type="checkbox" id="terms5" class="terms">
                    <label for="terms5">[선택] 위치기반서비스 이용약관</label>
                </div>
				<script>
    document.addEventListener('DOMContentLoaded', function () {
        const selectAll = document.getElementById('selectAll');
        const termsCheckboxes = document.querySelectorAll('.terms');

        // 전체 동의 체크박스 클릭 시 모든 체크박스를 선택/해제
        selectAll.addEventListener('change', function () {
            termsCheckboxes.forEach(checkbox => {
                checkbox.checked = selectAll.checked;
            });
        });

        // 개별 체크박스 클릭 시 전체 동의 체크박스 상태 업데이트
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
                <button type="submit" class="signup-button2" id="signupBtn" onclick="fnsignup()">가입하기</button>
            </div>
            
<script>
    let isEmailVerified = false;  // 이메일 인증 상태를 나타내는 변수

    // 모든 입력 필드와 체크박스가 올바르게 입력되었는지 확인하는 함수
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

        // 모든 필수 조건(약관 체크, 모든 필드 입력, 이메일 인증)이 만족되면 버튼 활성화
        if (isAllRequiredTermsChecked && isAllFieldsFilled && isEmailVerified) {
            document.getElementById('signupBtn').disabled = false;
        } else {
            document.getElementById('signupBtn').disabled = true;
        }
    }

    // 이메일 인증 확인 함수
    function verifyEmail() {
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
                    isEmailVerified = true; // 이메일 인증 성공
                    $('#myModal').modal('hide');
                    $('.modal-backdrop').remove();
                    checkAllConditions(); // 조건을 다시 확인하여 버튼 활성화 여부 결정
                } else {
                    alert('인증번호가 일치하지 않습니다. 다시 입력해주세요.');
                }
            },
            error: function() {
                alert('인증번호 확인 중 오류가 발생했습니다.');
            }
        });
    }

    // 가입 버튼을 눌렀을 때 필수 동의 확인 및 이메일 인증 여부 확인
    function validateTerms() {
        const terms1 = document.getElementById('terms1').checked;
        const terms2 = document.getElementById('terms2').checked;
        const terms3 = document.getElementById('terms3').checked;

        if (!terms1 || !terms2 || !terms3) {
            alert("필수 약관에 모두 동의해야 합니다.");
            return false;  // 폼이 제출되지 않도록 방지
        }

        if (!isEmailVerified) {
            alert("이메일 인증을 해주세요.");
            return false;  // 이메일 인증이 안되었으면 폼이 제출되지 않도록 방지
        }

        return true;  // 모든 조건이 만족되면 폼 제출 허용
    }

    // 각 입력 필드와 체크박스의 변화를 감지
    document.addEventListener('DOMContentLoaded', function () {
        const fields = ['userId', 'userPwd', 'userConfirmPwd', 'email'];
        const checkboxes = ['terms1', 'terms2', 'terms3'];

        // 페이지 로드 시 가입 버튼을 비활성화 상태로 설정
        document.getElementById('signupBtn').disabled = true;

        // 입력 필드에 변화가 있을 때마다 조건 검사
        fields.forEach(fieldId => {
            document.getElementById(fieldId).addEventListener('input', checkAllConditions);
        });

        // 필수 약관 동의 체크박스에 변화가 있을 때마다 조건 검사
        checkboxes.forEach(checkboxId => {
            document.getElementById(checkboxId).addEventListener('change', checkAllConditions);
        });

        // 전체 동의 체크박스 동작
        document.getElementById('selectAll').addEventListener('change', function () {
            const isChecked = this.checked;
            document.querySelectorAll('.terms').forEach(checkbox => {
                checkbox.checked = isChecked;
            });
            checkAllConditions();
        });

        // 개별 약관 체크박스가 변경되면 전체 동의 체크박스 상태 변경
        document.querySelectorAll('.terms').forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = Array.from(document.querySelectorAll('.terms')).every(term => term.checked);
                document.getElementById('selectAll').checked = allChecked;
                checkAllConditions();
            });
        });

        // 폼이 제출될 때 validateTerms 함수를 호출하여 필수 약관 체크 및 이메일 인증 여부 확인
        document.getElementById('form-btn').addEventListener('submit', function (e) {
            if (!validateTerms()) {
                e.preventDefault();  // 필수 약관에 동의하지 않거나 이메일 인증이 안된 경우 폼 제출을 방지
            }
        });

        // 이메일 인증 확인 버튼 클릭 시 verifyEmail 함수 호출
        document.getElementById('verifyCodeButton').addEventListener('click', verifyEmail);
    });
</script>


            
            
        </form>

    </section>
    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
