<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        header{height: 150px}
        header a{color:black;}
        .nav-link{
          color:black;
          width: 250px; 
          font-size: 20px; 
          text-align: center;
          transition-property: background-color;
          transition-duration: 1s;
          border-radius: 10px;
        }
        .nav-link:hover{
          color: white;
          background-color: #007AFF;
          border-radius: 10px;
          
        }

        #head-info{
          display: flex;
        }
        #head-info li {
          width: 90px;
          list-style: none;
          text-align: center;
          
        }
        #head-info li a {
          text-decoration: none;
        }
        #head-info li a:hover {
          text-decoration: none;
          color: #007AFF;
        }
        
      </style>
      <!-- Bootstrap 사용을 위한 CDN -->
		  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		  <!-- ------------------------- -->
      
</head>
<body>
	  <!-- Header, Nav start -->
      
      <header class="row m-3">
        <div class="col-3 d-flex justify-content-center align-items-center">
          <a href=""><img src="./assets/img/logo.png"></a>
        </div>
        <div class="col-6"></div>
        <div class="col-3 d-flex justify-content-center align-items-center">
  
        
          <!-- case1. 로그인전 -->
          <div>
          <ul id="head-info">
            <li class="nav-item"><a href="">로그인</a></li>
            <li class="nav-item"><a href="">회원가입</a></li>
            <li class="nav-item"><a href="">고객센터</a></li>
          </ul>
          </div>
          
  
        </div>
      </header>
      <nav class="navbar m-3 navbar-expand-sm d-flex justify-content-center">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">미국</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">유럽</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">남미</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">일본</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">동남아</a>
          </li>
        </ul>
      </nav>
      <hr>
      <!-- case2. 사용자로그인후 -->
      <!--
          <div>
          <ul id="head-info">
            <li class="nav-item"><a href="">홍길동님</a></li>
            <li class="nav-item"><a href="">마이페이지</a></li>
            <li class="nav-item dropdown">
              <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                고객센터
              </a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">이벤트</a>
                <a class="dropdown-item" href="#">문의/신고</a>
                <a class="dropdown-item" href="#">고객센터</a>
              </div>
            </li>
            <li class="nav-item"><a href="">로그아웃</a></li>
          </ul>
          </div>
          
        -->
    
          <!-- case2. 관리자로그인후 -->
           <!--
          <div>
          <ul id="head-info">
            <li class="nav-item"><a href="">관리자님</a></li>
            <li class="nav-item"><a href="">관리자페이지</a></li>
            <li class="nav-item dropdown">
              <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                고객센터
              </a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">이벤트</a>
                <a class="dropdown-item" href="#">문의/신고</a>
                <a class="dropdown-item" href="#">고객센터</a>
              </div>
            </li>
            <li class="nav-item"><a href="">로그아웃</a></li>
          </ul>
          </div>
            
  -->
        


  <!--   Header, Nav end -->
	
</body>
</html>