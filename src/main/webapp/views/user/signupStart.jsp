<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
%>
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
h1 {
	font-size: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
}

h3 {
	font-size: 24px;
	margin-top: 5px;
	margin-bottom: 5px;
}

h5 {
	font-size: 15px;
	margin-top: 5px;
	margin-bottom: 5px;
}
/* button */
#btn-2 {
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

.helloworld-login-logo {
	text-align: center;
	margin-top: 100px;
	margin-bottom: 50px;
}

.signup-text {
	text-align: center;
}

.helloworld-signup {
	margin-top: 20px;
	text-align: center; /* 버튼을 중앙에 배치 */
}

/* 추가적인 스타일링 */
.form-check-label {
	display: inline-flex;
	align-items: center;
}

.form-check-input {
	margin-right: 10px;
}

.signup-mian {
	max-width: 1200px;
	margin: auto;
}

#btn-1 {
	background-color: #007AFF;
	color: white;
	border: none;
	border-radius: 5px;
	width: 300px;
	height: 50px;
	cursor: pointer;
}
#btn-1:hover {
	background-color: rgb(50, 173, 255) !important;
	color: white !important;
}

.helloworld-signup {
	margin-top: 50px;
	margin-bottom: 150px;
}
section {
	display: flex;
	justify-content: center;  /* 가로 방향 가운데 정렬 */
	align-items: center;      /* 세로 방향 가운데 정렬 */
	min-height: 100vh;        /* 화면 높이의 100% 설정 */
	padding-top: 0;           /* 기존 padding-top 제거 */
}

</style>
</head>
<body>
	<section>
		<div class="signup-mian">
			<div class="helloworld-login-logo">
				<a href="<%=contextPath %>"><img src="<%=contextPath %>/assets/image/logo.png"  alt="로고이미지"></a>
			</div>
			<div class="signup-text">
				<h1>HELLO WORLD 회원가입</h1>
				<h3>지금 회원가입 하신 후 HELLO WORLD에서 다양한 서비스를 경험해 보세요!</h3>
			</div>
			<div class="helloworld-signup">
				<button id="btn-1" class="btn" onclick="location.href='<%=contextPath %>/views/user/signup.jsp'">
					<h3>회원가입</h3>
				</button>
			</div>
		</div>
	</section>

</body>
</html>