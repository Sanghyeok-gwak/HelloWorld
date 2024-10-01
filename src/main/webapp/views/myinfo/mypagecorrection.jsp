<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<style>
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');


        .side {
            width: 200px;
            /* border-right: 1px solid #ddd; */
            padding: 20px;
        }

        .content-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .edit {
            flex-grow: 1;
            padding-left: 20px;
        }
        .edit-button {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 30px;
        }

        .correction input {

            width: 400px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid lightgray;
            border-radius: 5px;
        }

        .correction label {
            display: inline-block;
            margin-bottom: 5px;
        }

        .buttons button {
            padding: 10px 20px;
        }

        .id-box {
            border: 1px solid grey;
            padding: 10px;
            margin-bottom: 20px;
            
        }

        .correction {
            display: flex;
            align-content: center;
            justify-content: center;
            width: 100%;
            border-collapse: collapse;
            margin-top: 50px;
        }

       .correction th,
        td {
            padding: 8px;
            /* border: 1px solid #ddd; */
        }

        .correction th {
            text-align: left;
        }

        .card-body {
            padding: 20px;
        }
        .modal-footer{
            width: 100%;
        }

        .modal-content{
            width: 611px;
        }
        #userid{
            background-color: lightgray;
        }
        #btn-3 {
            background-color: #e8eaeb;
        		color: black;
        }
				#pwd-btn{
    			background-color: #007AFF;
    			color: white;
    			
				}

</style>
<body>

<%@ include file="/views/common/header.jsp" %>

	 <div class="content-container">
            <div class="side">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><%= loginUser.getUserName() %>님<br>WELCOME</h5>
                        <p class="card-text">
                        <h5><a href="<%= contextPath %>/myinfo.us" style="color: gray; text-decoration-line: none;">내정보 관리<i
                                    class="fa-solid fa-play"></i></a></h5>


                    </div>
                </div>
            </div>
            <div class="edit">
                <div class="edit-button">
                    <h3>회원정보 수정</h3>
                    <button id="btn-2" class="btn" data-toggle="modal" data-target="#myModal-2">탈퇴</button>
                </div>
                <hr>
              	<form action="<%= contextPath%>/myinfoch.us" method="post">
                <table class="correction">
                    <tr>
                        <th><h5>아이디</h5></th>
                        <td><input type="text" value="<%= loginUser.getUserId() %>" readonly id="userid" name="userId" >
                                        
                        <input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo" id="userNo">        
                    </td>
                    </tr>
                    <tr>
                        <th><h5>이름</h5></th>
                        <td><input type="text" id="name" value="<%= loginUser.getUserName() %>" name="userName"></td>
                    </tr>
                    <tr>
                        <th><h5>이메일</h5></th>
                        <td><input type="email" id="email" value="<%= loginUser.getEmail() %>" name="email"></td>
                    </tr>
                    <tr>
                        <th><h5>전화번호</h5></th>
                        <td><input type="tel" id="phone" value="<%= loginUser.getPhone() %>" name="phone"></td>
                    </tr>
                </table>
                <div class="buttons">
                    <button type="button" id="btn-2" class="btn" onclick="history.back();">취소</button>
                    <button type="button" id="btn-1" class="btn" data-toggle="modal" data-target="#myModal-1">비밀번호변경</button>
                    <button type="submit" id="btn-3" class="btn" >확인</button>
                </div>
                </form>
            </div>
        </div>
    </div>
        <script>
        <%-- 버튼 스크립트 --%>
      <%--  document.getElementById("btn-3").addEventListener("click",()=>{
        location.href="<%=contextPath%>/myinfoCh.us"}) --%>
        <%-- 버튼 스크립트 끝 --%>
        <%-- 전화번호 형식 스크립트 --%>
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

<!-- The Modal -->
  <div class="modal" id="myModal-1">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 변경</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body" >
          <form action="<%= contextPath %>/myinfopwd.us" method="post" id="form-btn">
          	<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
            <table align="center">
              <tr>
                <th><h5> 현재 비밀번호</h5></th>
                <td><input type="password" class="form-control" name="userPwd" required></td>
              </tr>
              <tr>
                <th><h5> 변경할 비밀번호</h5></th>
                <td><input type="password" id="newPwd" class="form-control" name="updatePwd" required></td>
              </tr>
              <tr>
                <th><h5> 변경할 비밀번호 재입력</h5></th>
                <td><input type="password" id="confirmPwd" class="form-control" required></td>
              </tr>
              <tr>
                <td colspan="2" style="text-align:center; padding-top: 10px;">
                  <button type="button" class="btn" id="pwd-btn" onclick="fnPwd()" >비밀번호 변경</button>
                </td>
              </tr>
            </table>
          </form>
        </div>
  
      </div>
    </div>
  </div>
<script>
function fnPwd() {
    const password = document.getElementById('newPwd').value;
    const confirmPassword = document.getElementById('confirmPwd').value;

    // 빈 문자열 체크
    if (password.trim() === '' || confirmPassword.trim() === '') {
        alert('비밀번호와 비밀번호 확인을 입력해 주세요.');
        $('#newPwd').focus(); // 포커스 
        return; 
    }

    // 비밀번호 일치 체크
    if (password !== confirmPassword) {
        alert('변경 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
        $('#confirmPwd').focus(); //포커스
    } else {
        alert('비밀번호 변경이 완료되었습니다.');
        $('#form-btn').submit(); 
    }
}
</script>

  <div class="container">
    <!-- Button to Open the Modal -->

    
  
    <!-- The Modal -->
    <div class="modal" id="myModal-2">
      <div class="modal-dialog">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title">회원 정보 탈퇴</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          
          <!-- Modal body -->
          <div class="modal-body">
            <h5 style="text-align: center;">정말 탈퇴 하시겠습니까 ? </h5>
          </div>
          
          <!-- Modal footer -->
          <div class="modal-footer" style="justify-content: center;">
            <button type="button" class="btn btn-danger" data-dismiss="modal" id="btn-4">확인</button>
            <button type="button" id="btn-1"class="btn" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    
  </div>
  <script>
  document.getElementById("btn-4").addEventListener("click",()=>{
      location.href="<%=contextPath%>/myinfode.us"})
  </script>
      <%@ include file="/views/common/footer.jsp" %>
  
</body>
</html>