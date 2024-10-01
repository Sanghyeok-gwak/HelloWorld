<%@ page import="com.gd.hw.order.model.vo.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String merchantUid = (String)request.getAttribute("merchantUid"); 
  Person p = (Person)request.getAttribute("p");
   
%>

	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지</title>

	<!-- Bootstrap 사용을 위한 CDN -->
	<link rel="stylesheet"
	   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script
	   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
	   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
	   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
	   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
	   src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- css파일 -->
  <link rel="stylesheet" href="/world/assets/css/payment.css">
  <!-- js파일 -->
  <script src="/world/assets/js/payment.js"></script>

  <link rel="stylesheet" href="/World/views/common/header.js">

</head>
<style>
 @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');
 
</style>

<body>

<%@ include file="/views/common/header.jsp" %>

<section>

       <div class="container mt-5">
        <div class="text-center">
            <h2>예약이 완료되었습니다!</h2>
            <br>
            
      </div>

        <div class="card mt-4">
            
            <div class="card-body">
                  
                <table class="table">
                   
                      <tbody>
                        <tr>
                            <th>예약번호</th>
                            <!-- 예약번호 -->
                            <td><%=merchantUid%></td>  
                        </tr>
                        <tr>
                            <th>상태</th>
                            <td class="text-primary">예약 완료</td>
                        </tr>
                        <tr>
                            <th>취소조건</th>
                            <td>
                                <p>30일 이전 취소하는 경우 무료 취소 가능</p>
                                <p>7일 이전 취소하는 경우 50% 환불</p>
                                <p class="text-danger">24시간 이전에는 취소 불가능합니다.</p>
                            </td>
                        </tr>
                        <tr>
                            <th>예약자 정보</th>
                            <td>
                                <p>이름: <%=p.getEngName() %></p>
                                <p>전화번호: <%=p.getPhone() %></p>
                                <p>생년월일: <%=p.getBirthday() %></p>
                            </td>
                        </tr>
                    </tbody>
                </table>

   	   <div class="text-center mt-4">
            <a href="<%=contextPath%>" id="mainPageBtn" class="btn btn-primary">메인 화면으로 돌아가기
              <!-- 페이지 넘기는걸로  -->
            </a>
        </div>
    </div>
 </section>
<%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>