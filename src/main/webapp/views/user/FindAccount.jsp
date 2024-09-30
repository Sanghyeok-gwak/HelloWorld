<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style>
/* 기존 스타일 유지 */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	text-align: center;
	background-color: #fff;
	padding: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	max-width: 400px; 
	width: 100%;
	margin: auto;
	box-sizing: border-box;
}

h1 {
	font-size: 2.5em;
	color: #333;
	margin-bottom: 30px;
}

.tab-menu {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
	width: 100%;
	max-width: 400px;
	border-bottom: 1px solid #ccc;
}

.tab-menu div {
	flex: 1;
	padding: 10px 0;
	cursor: pointer;
	color: #333;
	text-align: center;
	transition: color 0.3s, border-bottom 0.3s;
	border-bottom: 2px solid transparent;
}

.tab-menu div.active h5 {
	font-weight: bold; 
}

.tab-menu div:hover {
	color: #555;
}

.form-container {
	display: none;
}

.form-container.active {
	display: block;
}

input[type="text"], input[type="email"] {
	width: 100%;
	max-width: 300px;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

#btn-1 {
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
	color: white;
	font-size: 1.1em;
	width: 100%;
	max-width: 300px;
	transition: background-color 0.3s;
}
#btn-2 {
	border: none !important;
	border-radius: 5px !important;
	cursor: pointer !important;
	padding: 10px 20px !important;
	background-color: #007AFF!important;
	color: white !important;
	font-size: 1.1em !important;
	width: 100% !important;
	max-width: 300px !important;
	transition: background-color 0.3s !important;
}




#form-btn #btn-1:hover {
    background-color: rgb(50, 173, 255);
    color: white;
}

#form-btn #btn-2:hover {
    background-color: rgb(50, 173, 255) !important;
    color: white !important;
}



p {
	font-size: 1em;
	color: #555;
	line-height: 1.5em;
	margin-bottom: 20px;
	max-width: 400px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container">
		<form action="<%=contextPath%>/smtp.do" id="form-btn">
			<h1>아이디/비밀번호 찾기</h1>
			<div class="tab-menu">
				<div id="tab-id" class="active"><h5>아이디 찾기</h5></div>
				<div id="tab-password"><h5>비밀번호 찾기</h5></div>
			</div>

			<div id="id-form" class="form-container active">
				<p>입력하신 이름과 이메일 주소가 회원 정보와 일치할 경우 이메일로 아이디가 발송됩니다.</p>
				<input type="text" name="name" placeholder="이름" required><br>
				<input type="email" name="email" placeholder="이메일 주소" required><br>
				<button type="button" id="btn-1" >아이디 발송</button>
			</div>

			<div id="password-form" class="form-container">
				<p>입력하신 아이디가 회원 정보와 일치할 경우 비밀번호가 발송됩니다.</p>
				<input type="text" name="username" placeholder="아이디" required><br>
				<input type="email" name="email" placeholder="이메일 주소" required><br>
				<button type="button" id="btn-2"  style="background: #007AFF; color:white; cursor: pointer;">비밀번호 발송</button>
			</div>
		</form>
	<script>
        // 각 탭을 클릭했을 때 폼을 변경하는 스크립트
        const idTab = document.getElementById('tab-id');
        const passwordTab = document.getElementById('tab-password');
        const idForm = document.getElementById('id-form');
        const passwordForm = document.getElementById('password-form');
    
        idTab.addEventListener('click', function() {
          idTab.classList.add('active');
          passwordTab.classList.remove('active');
          idForm.classList.add('active');
          passwordForm.classList.remove('active');
        });
    
        passwordTab.addEventListener('click', function() {
          passwordTab.classList.add('active');
          idTab.classList.remove('active');
          passwordForm.classList.add('active');
          idForm.classList.remove('active');
        });

        // 아이디 찾기 버튼 클릭 시
        document.getElementById('btn-1').addEventListener('click', function() {
            var name = document.querySelector('input[name="name"]').value;
            var email = document.querySelector('input[name="email"]').value;

            if (!name || !email) {
                alert('이름과 이메일을 입력하세요.');
                return;
            }

            $.ajax({
                url: '<%=contextPath%>/smtp.do',
                type: 'POST',
                data: { action: 'findId', nameOrId: name, email: email },
                success: function(response) {
                    if (response === 'send') {
                        alert('아이디가 이메일로 발송되었습니다.');
                    } else {
                        alert('이름과 이메일이 일치하지 않습니다.');
                    }
                },
                error: function() {
                    alert('오류가 발생했습니다.');
                }
            });
        });

        // 비밀번호 찾기 버튼 클릭 시
        document.getElementById('btn-2').addEventListener('click', function() {
            var username = document.querySelector('input[placeholder="아이디"]').value;
            var email = document.querySelector('input[name="email"]').value;

            if (!username || !email) {
                alert('아이디와 이메일을 입력하세요.');
                return;
            }

            $.ajax({
                url: '<%=contextPath%>/smtp.do',
                type: 'POST',
                data: { action: 'findPassword', nameOrId: username, email: email },
                success: function(response) {
                    if (response === 'send') {
                        alert('비밀번호가 이메일로 발송되었습니다.');
                    } else {
                        alert('아이디와 이메일이 일치하지 않습니다.');
                    }
                },
                error: function() {
                    alert('오류가 발생했습니다.');
                }
            });
        });
    </script>
	</div>


	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
