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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- ------------------------- -->
<style>
	    h1{
      font-size: 30px;
      margin-top: 5px;
      margin-bottom: 5px;
    }
    h3{
      font-size: 24px;
      margin-top: 5px;
      margin-bottom: 5px;
    }
    h5{
      font-size: 15px;
      margin-top: 5px;
      margin-bottom: 5px;
    }
    /* button */

	
    #btn-1 {
      background-color: #007AFF;
      color: white;
      border: solid #007AFF;
      border-radius: 5px;
      width: 100%;
      height: 50px;
      margin-top: 20px;
      margin-bottom: 20px;
    }
    .helloworld-login {
      max-width: 500px;
      width: 500px;
      border: 1px solid rgb(216, 216, 216);
      border-radius: 10px;
      padding: 30px;
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

</style>
</head>
<body>
  <section>
    <div class="login-main">
      <div class="helloworld-login-logo">
        <img src="<%=contextPath %>/assets/image/logo.png" alt="로고이미지">
      </div>
      <div class="helloworld-login">
        <div class="form-text">
          <h3><b>로그인</b></h3>
        </div>
        <form action="<%=contextPath %>/login.me" method="post" class="was-validated">
          <label for="id">아이디</label>
          <input type="text" class="form-control" placeholder="아이디를 입력하세요." name="userId" id="id"
            style="width: 100%; height: 45px; border-radius: 5px; border: 1px solid rgb(181, 181, 181);" required invalid-feedback>
          <label for="pwd">비밀번호</label>
          <input type="password" class="form-control" placeholder="비밀번호를 입력하세요." name="userPwd" id="pwd"
            style="width: 100%; height: 45px; border-radius: 5px; border: 1px solid rgb(181, 181, 181);" required invalid-feedback><br>
          <label class="form-check-label">
            <input name="rememberMe" type="checkbox"> 아이디 저장
          </label>
          <button type="submit" id="btn-1" class="btn btn-primary" >로그인</button>
          <div class="AuthModule">
            <a href="#">회원가입</a>&nbsp; |&nbsp; <a href="#">아이디찾기</a>&nbsp; |&nbsp; <a href="#">비밀번호찾기</a>
          </div>
        </form>
      </div>
    </div>
  </section>
	 <%@ include file="/views/common/footer.jsp" %>
</body>
</html>