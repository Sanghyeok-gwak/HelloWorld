<%@ page import="com.gd.hw.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.admin-page-head {
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid lightgray;
}

.admin-page-head-logo, .admin-page-main-menu {
	border-right: 1px solid lightgray;
	width: 15%;
	height: 100%;
}

.admin-page-head-gongback, .admin-page-main-item {
	width: 85%;
	height: 100%;
}

.admin-page-main {
	height: 100%;
	display: flex;
}

.amdin-page-side-btn1 button, .amdin-page-side-btn2 button,
	.amdin-page-side-btn3 button, .amdin-page-side-btn4 button {
	width: 100%;
	height: 45px;
	margin-top: 10px;
	border-radius: 10px;
	cursor: pointer;
}

.amdin-page-side-btn1, .amdin-page-side-btn2, .amdin-page-side-btn3,
	.amdin-page-side-btn4 {
	padding: 20px
}

/* 공통 스타일 */
/* font */
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
#btn-1 {
	background-color: #007AFF;
	color: white;
}

#btn-2 {
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

</style>
</head>
<body>
	<div class="admin-page">
		<div class="admin-page-head">
			<div class="admin-page-head-logo">
				<img src="<%=contextPath%>/assets/image/logo.png" alt="logo"
					width="100%">
			</div>
			<div class="admin-page-head-gongback"></div>
		</div>
		<div class="admin-page-main">
			<div class="admin-page-main-menu">
				<div class="amdin-page-side-btn1">
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.pro'">
						상품 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.bn'">
						배너 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.cg'">
						카테고리 관리
					</button>
				</div>
				<div class="amdin-page-side-btn2">
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.us'">
					회원 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.bk'">
					블랙리스트 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.or'">
					결제 관리</button>
				</div>
			
				<div class="amdin-page-side-btn4">
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>'">메인
						홈</button>
				</div>
			</div>
			<div class="admin-page-main-item w-75 m-auto">
				<!-- 여기부터 -->

				<div class="pb-3 ">
					<h1>회원관리</h1>
				</div>
				<div class="pb-5 text-center">
					<h3>회원 수정</h3>
				</div>

				<div id="add-member-form" class="w-50 m-0 m-auto">
					<form action="<%= contextPath %>/updateAd.us" method="post" class="was-validated">
						<div class="form-group row mb-0">
							<label for="userid" class="col-sm-2 p-2">아이디</label>
							<div class="col-sm-10">
								<input type="text" id="userid" name="userid"  class="form-control" disabled value="<%= user.getUserId()%>">
								<input type="hidden" id="userNo" name="userNo"  class="form-control"  value="<%= user.getUserNo()%>">
							</div>
						</div>
						<div class="form-group row mb-0">
							<label for="userpwd" class="col-sm-2  p-2">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" id="userpwd" name="userpwd" class="form-control" required value="<%= user.getUserPwd()%>">
								<div class="invalid-feedback"><h5>비밀번호를 작성해주세요</h5></div>
							</div>
						</div>
						<div class="form-group row mb-0">
							<label for="name" class="col-sm-2  p-2">이름</label>
							<div class="col-sm-10">
								<input type="text" id="name" name="name" class="form-control" required value="<%= user.getUserName()%>">
								<div class="invalid-feedback"><h5>이름을 작성해주세요</h5></div>
							</div>
						</div>

						<div class="form-group row mb-0">
							<label for="email" class="col-sm-2  p-2">이메일</label>
							<div class="col-sm-10">
								<input type="email" id="email" name="email" class="form-control" required value="<%= user.getEmail()%>">
								<div class="invalid-feedback"><h5>이메일을 작성해주세요</h5></div>
							</div>
						</div>
						<div class="form-group row mb-0">
							<label for="phone" class="col-sm-2 p-2">전화번호</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" maxlength="13" id="phone" name="phone" 
								required placeholder="-를 포함하여 입력해주세요" value="<%= user.getPhone()%>">
								<div class="invalid-feedback"><h5>전화번호를 작성해주세요</h5></div>
							</div>
						</div>
						<div id="buttons" align="center" class="pt-4">
							<button type="submit" class="btn btn-primary btn-sm w-25">수정하기</button>
							<button type="button" class="btn btn-danger btn-sm w-25"
							onclick="location.href='<%=contextPath%>/list.us'">목록으로</button>
						</div>
					</form>
				</div>

				<!-- 여기까지 -->
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#phone").blur(function() {

	            var phoneNumber = $("#phone").val();
	            if(phoneNumber) {
	                var regex = /^(01[0-9]{1}-?[0-9]{4}-?[0-9]{4}|01[0-9]{8})$/;

	                if (regex.test(phoneNumber)) {
	                } else {
	                    alert("잘못된 형식의 전화번호 입니다.");
	                    $("#phone").val("");
	                }
	            }
	        });
		})
	</script>

	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</body>
</html>