<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 80vh; /* 화면 높이의 80%를 채우도록 설정 */
	text-align: center;
}

h1 {
	font-size: 2em;
	margin-bottom: 30px;
}

.tab-menu {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.tab-menu div {
	margin: 0 10px;
	cursor: pointer;
}

.tab-menu div.active {
	font-weight: bold;
	border-bottom: 2px solid black;
}

.form-container {
	display: none;
}

.form-container.active {
	display: block;
}

input[type="text"], input[type="email"] {
	width: 300px;
	padding: 10px;
	margin-bottom: 10px;
}

#btn-1 {
	border: 1px solid #007AFF;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
}

#btn-1:hover {
	background-color: #0056b3;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
			<form action="">
	<div class="container">
		<div class="tab-menu">
			<div id="tab-id" class="active">아이디 찾기</div>
			<div id="tab-password">비밀번호 찾기</div>
		</div>

		<div id="id-form" class="form-container active">
			<p>입력하신 이름과 이메일 주소가 회원 정보와 일치한 경우 아이디 찾기에 필요한 인증번호가 발송돼요.</p>
			<input type="text" placeholder="이름" required><br>
			<input type="email" placeholder="이메일주소" required><br>
			<button id="btn-1" class="">인증번호 발송</button>
		</div>

		<div id="password-form" class="form-container">
			<p>입력하신 이름과 이메일 주소가 회원 정보와 일치한 경우 비밀번호 찾기에 필요한 인증번호가 발송돼요.</p>
			<input type="text" placeholder="이름" required><br>
			<input type="email" placeholder="이메일주소" required><br>
			<button id="btn-1">인증번호 발송</button>
		</div>
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
    </script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
