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
        header{height: 150px}
        header a{color:black;}
        .nav-link{
          color:black;
          width: 200px; 
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
        .helloworld-main{
          max-width: 1200px;
          margin: auto;
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
	<body>
	<!-- Header, Nav start -->
      <div class="helloworld-main">
        <header class="row m-3">
          <div class="col-3 d-flex justify-content-center align-items-center">
            <a href=""><img src="./assets/image/logo.png"></a>
          </div>
          <div class="col-6"></div>
          <div class="col-3 d-flex justify-content-center align-items-center">
      
          
            <!-- case1. 로그인전 -->
            <div>
            <ul id="head-info">
              <li class="nav-item"><a href=""><h5>로그인</h5></a></li>
              <li class="nav-item"><a href=""><h5>회원가입</h5></a></li>
              <li class="nav-item"><a href=""><h5>고객센터</h5></a></li>
            </ul>
            </div>
            
      
          </div>
        </header>
        <div id="head-nav">
        <nav class="navbar m-3 navbar-expand-sm d-flex justify-content-center">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#"><h3>미국</h3></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><h3>유럽</h3></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><h3>남미</h3></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><h3>일본</h3></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><h3>동남아</h3></a>
            </li>
          </ul>
        </nav>
        <hr>
        </div>
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
        


      <!-- Header, Nav end -->
	
</body>
</html>