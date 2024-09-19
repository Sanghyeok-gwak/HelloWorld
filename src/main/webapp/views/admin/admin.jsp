<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	.admin-page-head{
      display: flex;
      flex-direction: column;
      border-bottom: 1px solid lightgray;
    }
    .admin-page-head-logo,.admin-page-main-menu{
      border-right: 1px solid lightgray;
      width: 15%;
      height: 100%;
    }
    .admin-page-head-gongback,.admin-page-main-item{
      width: 85%;
      height: 100%;
    }
    .admin-page-main{
      height: 100%;
      
    }
    #btn-1{
      background-color: #007AFF;
      color: white;

    }
    .amdin-page-side-btn1 button ,.amdin-page-side-btn2 button ,.amdin-page-side-btn3 button ,.amdin-page-side-btn4 button{
      width: 100%;
      height: 45px;
      margin-top: 10px;
      border-radius:10px ;
    }
    .amdin-page-side-btn1,.amdin-page-side-btn2,.amdin-page-side-btn3,.amdin-page-side-btn4{
      padding: 20px
    }

     /* 공통 스타일 */
    /* font */
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
    #btn-1{
      background-color: #007AFF;
      color: white;
    }
    #btn-2{
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
            <img src="../../assets/image/logo.png" alt="logo" width="100%">
          </div>
          <div class="admin-page-head-gongback">
            
          </div>
        </div>
        <div class="admin-page-main">
          <div class="admin-page-main-menu">
            <div class="amdin-page-side-btn1">
              <button id="btn-2" class="btn">상품 관리</button><br>
              <button id="btn-2" class="btn">배너 관리</button><br>
              <button id="btn-2" class="btn">리뷰 관리</button><br>
              <button id="btn-2" class="btn">카테고리 관리</button>
            </div>
            <div class="amdin-page-side-btn2">
              <button id="btn-2" class="btn">회원 관리</button><br>
              <button id="btn-2" class="btn">블랙리스트 관리</button><br>
              <button id="btn-2" class="btn">이벤트 관리</button><br>
              <button id="btn-2" class="btn">결제 관리</button>
            </div>
            <div class="amdin-page-side-btn3">
              <button id="btn-2" class="btn">FAQ</button><br>
              <button id="btn-2" class="btn">문의/신고</button>
            </div>
            <div class="amdin-page-side-btn4">
              <button id="btn-2" class="btn">메인 홈</button>
            </div>
          </div>
          <div class="admin-page-main-item">
            <!-- 여기 안에 채우시면됩니다 ! -->
          </div>
        </div>
    </div>
		<%@ include file="/views/common/footer.jsp" %>
</body>
</html>