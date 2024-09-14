<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   /* footer */
    footer{
      height: 200px;
      border-top: 1px solid lightgray;
    }
    footer a{color:black}
    .footer-info{
      list-style: "-  ";
      padding-left:30px;
    }
    .footer-copyright{text-align:center}
    .footer-top{
      display: flex;
      margin-top: 30px;
     
    }
    .footer-top {
      display: flex;
      justify-content: space-evenly;
    }
    #footer-box{
      margin-top: 200px!important;
    }


    #footer-box{
      margin-top:0px!important;
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
            <img src="./assets/image/logo.png" alt="logo" width="100%">
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


   <!-- Footer start -->
 
    <footer id="footer-box" class="m-3">
      <div class="footer-top">
        <ul class="footer-info1">
        <b style="font-size: 20px;"><h3>늘상빈나고(준)</h3></b>
        <li><h5>대표자 : 강보람상조</h5></li>
        <li><h5>전화 : 02-818-7950</h5></li>
        <li><h5>본관 : (08505) 서울특별시 금천구 가산디지털2로 95</h5></li>
        <li><h5>사업자등록번호 : 727-19-81327</h5></li>
        <li><h5>관광사업자등록번호 : 제 2024-31395023호</h5></li>
      </ul>
      <ul class="footer-info2">
        <b style="font-size: 20px;"><h3>고객센터</h3></b>
        <li><h5>패키지여행 상담 : 02-7777-7777</h5></li>
        <li><h5>본사 : 02-818-7950</h5></li>
        <br>
        <li><h5>대표메일 : brlove@naver.com</h5></li>
        <li><h5>판매제휴 : brlove@naver.com</h5></li>
      </ul>
    </div>
    <div class="footer-copyright">
        Copyright ⓒ GooDee Academy. All rights reserved.
      </div>
    </footer>
  
  <!-- Footer end -->
</body>
</html>