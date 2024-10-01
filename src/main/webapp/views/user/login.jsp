<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    String alertMsg = (String) request.getAttribute("alertMsg");
    
    // 쿠키에서 저장된 아이디를 불러오기
    String savedUserId = "";
    javax.servlet.http.Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (javax.servlet.http.Cookie cookie : cookies) {
            if ("savedUserId".equals(cookie.getName())) {
                savedUserId = cookie.getValue();
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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

.helloworld-login {
	max-width: 500px;
	width: 500px;
	border: 1px solid rgb(216, 216, 216);
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.helloworld-login-logo {
	margin: 30px;
	text-align: center;
}

section {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.form-check-label {
	color: #b2b2b2;
}

.AuthModule {
	text-align: center;
	color: grey;
}

.AuthModule a {
	text-decoration: none;
}

.form-text {
	text-align: center;
	margin-bottom: 30px;
}

label {
	display: inline-block;
	margin: auto;
}

.alert {
	margin-top: 10px;
} /* 메시지 위쪽 여백 */
#btn-1 {
	border: none;
	background-color: #007AFF;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
	cursor: pointer;
	transition: background-color 0.3s;
}

#btn-1:hover {
	background-color: rgb(50, 173, 255) !important;
	color: white !important;
}
</style>
</head>
<body>
	<section>
		<div class="login-main">
			<div class="helloworld-login-logo">
				<a href="<%=contextPath %>"> <img
					src="<%=contextPath %>/assets/image/logo.png" alt="로고이미지">
				</a>
			</div>
			<div class="helloworld-login">
				<div class="form-text">
					<h3>
						<b>로그인</b>
					</h3>
				</div>
				<form action="<%=contextPath %>/login.me" method="post"
					class="was-validated">
					<label for="id">아이디</label> <input type="text" class="form-control"
						placeholder="아이디를 입력하세요." name="userId" id="id"
						value="<%= savedUserId %>"
						style="width: 100%; height: 45px; border-radius: 5px; border: 1px solid rgb(181, 181, 181);"
						required> <label for="pwd">비밀번호</label> <input
						type="password" class="form-control" placeholder="비밀번호를 입력하세요."
						name="userPwd" id="pwd"
						style="width: 100%; height: 45px; border-radius: 5px; border: 1px solid rgb(181, 181, 181);"
						required>

					<!-- 오류 메시지 출력 공간 -->
					<div class="alert alert-danger" id="error-message"
						style="display: <%=(alertMsg != null) ? "block" : "none"%>;">
						<%= alertMsg != null ? alertMsg : "" %>
					</div>

					<label class="form-check-label"> <input name="rememberMe"
						type="checkbox" id="rememberMe"
						<%= savedUserId.isEmpty() ? "" : "checked" %>> 아이디 저장
					</label>
					<button type="submit" id="btn-1" class="login-btn">로그인</button>
					<div class="AuthModule">
						<a href="<%=contextPath %>/views/user/signupStart.jsp">회원가입</a>&nbsp;
						|&nbsp; <a href="<%=contextPath %>/views/user/FindAccount.jsp">아이디찾기 / 비밀번호찾기</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="/views/common/footer.jsp"%>

	<script>
// 쿠키 저장 및 삭제
document.getElementById('btn-1').addEventListener('click', function() {
    const rememberMe = document.getElementById('rememberMe').checked;
    const userId = document.getElementById('id').value;

    if (rememberMe) {
        // 쿠키에 아이디 저장 (유효기간 7일)
        document.cookie = "savedUserId=" + userId + "; path=/; max-age=" + (7 * 24 * 60 * 60);
    } else {
        // 쿠키 삭제
        document.cookie = "savedUserId=; path=/; max-age=0";
    }
});


function fnLoginCheck(){
	
	console.log($('#id').val());
	console.log($('#pwd').val());
	
}



</script>
</body>
</html>
