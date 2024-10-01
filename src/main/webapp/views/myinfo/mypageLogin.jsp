<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
int result = (Integer) request.getAttribute("re");

%>
<title>Insert title here</title>
</head>
<style>

  .correction {
    margin-bottom: 40px;

  }

  i.fa-lock {
    margin-top: 30px;
    margin-bottom: 30px;
    font-weight: 900;
    font-size: 60px;
  }

  #main-body {
    text-align: center;
    margin: 20px;
  }

  .btn-primary {
    margin-top: 20px;
  }

  .button-group {
    margin-top: 20px;
    text-align: center;
  }

  #btn-1,
  #btn-2 {
    display: inline-block;
    width: 120px;
    margin: 0 10px;
  }

  .form-container {
    display: inline-block;
    text-align: left;
    margin: 0 auto;
  }

  .correction {
    margin: 0 auto;

  }
 .correction
  th,
  td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }

  #main-body {
    margin-top: 100px;
  }

  #user-id {
    background-color: gainsboro;
    height: 50px;
    width: 300px;
    border-radius: 5px;
  }

  #uesr-pwd {
    border-radius: 5px;
    height: 50px;
    width: 300px;
  }
  input {
    border: 1px solid lightgray;
  }
 
</style>

<body>
<%@ include file="/views/common/header.jsp" %>

	    <div id="main-body">
      <div>
        <h1 id="correction">회원정보 수정</h1>
  
        <i class="fa-solid fa-lock fa-8x"></i>
        <h3>정보를 안전하게 보호하기위해</h3>
        <span style="color: red; font-size: 24px;">비밀번호를 다시 한번 확인</span><span style="font-size: 24px;">합니다</span>
        <h5>비밀번호가 타인에게 노출되지 않도록 주의해주세요</h5>
      </div>
      <br><br>
      
      
      <!-- form  -->
      <form action="<%= contextPath%>/myinfolo.us" class="was-validated"  method="post"> 
     <!--  <div class="was-validated"> -->
        <!-- ID , PWD , table-->
        <table class="correction">
          <tr>
            <th><h3>ID</h3></th>
            <td>
              <input type="text" class="form-control" value="<%= loginUser.getUserId() %>" readonly id="userId" name="userId" disabled>
 							 <input type="hidden" value="<%= loginUser.getUserId() %>" name="userId" id="userId">       
            </td>
          </tr>
          <tr>
            <th><h3>Password</h3></th>
            <td>
              <input type="password" class="form-control" id="userPwd" required placeholder="비밀번호를 입력"  name="userPwd">
            </td>
          </tr>
        </table>
        <!-- button -->
        <div class="button-group">
          <button id="btn-1" class="btn"  type="submit">확인</button>
          <button id="btn-2" class="btn" onclick="history.back();">취소</button>
       		
        </div>
      </form>
    <script>
 
    
    </script>
    </div>
    
    
    
        <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>