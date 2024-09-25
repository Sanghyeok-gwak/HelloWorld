<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지</title>
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
                            <td>20240920-537BDTQ12</td>  
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
                                <p>이름: 박한나</p>
                                <!-- 이름 -->
                                <p>전화번호: 010-1234-1234</p>
                                <!-- 전화번호 들어오게하기 -->
                                <p>이메일: gimgil@naver.com</p>
                                <!-- 이메일값 들어오게 하기 -->
                            </td>
                        </tr>
                    </tbody>
                </table>

   	   <div class="text-center mt-4">
            <button id="mainPageBtn" class="btn btn-primary">메인 화면으로 돌아가기
              <!-- 페이지 넘기는걸로  -->
            </button>
        </div>
    </div>
 </section>
<%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>