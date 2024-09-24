<%@page import="com.gd.hw.user.model.vo.User"%>
<%@page import="com.gd.hw.category.model.vo.Region"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
  User loginUser = (User)session.getAttribute("loginUser");
  String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->
<!-- 
<li id="world-navbav-nav" class="nav-item">
<a class="nav-link" href="#">
<h3>미국</h3>
</a>
</li>
    
   -->
<% if(alertMsg != null ) { %>
<script>
   alert('<%=alertMsg %>');
</script>
<% session.removeAttribute("alertMsg"); } %>

<script>
      window.onload=function (){
         $.ajax({
            url:'<%= contextPath%>/list.mcc',
            success: function(res){
               //world-navbar-nav
               let liEl ='';
               for(let i =0; i<res.length; i++){
                  liEl += '<li id="world-navbav-nav" class="nav-item">'
                              +'<a class="nav-link" href="#">'
                              +'<h3>'+res[i].categoryName+'</h3>'
                              +'</a></li>';
               }
               $('#world-navbar-nav').html(liEl);
            }
         })
         
      }
   </script>

<style>
header {
	height: 150px
}

header a {
	color: black;
}

.nav-link {
	color: black;
	width: 200px;
	font-size: 20px;
	text-align: center;
	transition-property: background-color;
	transition-duration: 1s;
	border-radius: 10px;
}

.nav-link:hover {
	color: white;
	background-color: #007AFF;
	border-radius: 10px;
}

#head-info {
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

.helloworld-main {
	max-width: 1200px;
	margin: auto;
}

/* 공통 스타일 */
/* font */
h1 {
	font-size: 30px;
}

h3 {
	font-size: 24px;
}

h5 {
	font-size: 15px;
}
/* button */
#btn-1 {
	background-color: #007AFF;
	color: white;
}

#btn-2 {
	background-color: #e8eaeb;
	color: black;
}
</style>
<body>
	<!-- Header, Nav start -->


	<div class="helloworld-main">
		<header class="row m-3">
			<div class="col-3 d-flex justify-content-center align-items-center">
				<a href=""><img src="<%=contextPath %>/assets/image/logo.png"></a>
			</div>
			<div class="col-6"></div>
			<div class="col-3 d-flex justify-content-center align-items-center">

				<!-- case1. 로그인전 -->
				<% if(loginUser == null){ %>

				<div>
					<ul id="head-info">
						<li class="nav-item"><a
							href="<%=contextPath %>/views/user/login.jsp"><h5>로그인</h5></a></li>
						<li class="nav-item"><a
							href="<%=contextPath %>/views/user/signupStart.jsp""><h5>회원가입</h5></a></li>
						<li class="nav-item"><a href=""><h5>고객센터</h5></a></li>
					</ul>
				</div>
				<!-- case2. 사용자로그인후 -->
				<% }else if(loginUser.getRoll().equals("U")){  %>
				<div>
					<ul id="head-info">
						<li class="nav-item"><a href=""><h5>홍길동님</h5></a></li>
						<li class="nav-item"><a href=""><h5>마이페이지</h5></a></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							href="#" id="navbardrop" data-toggle="dropdown">
								<h5>고객센터</h5>
						</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#"><h5>이벤트</h5></a> <a
									class="dropdown-item" href="#"><h5>문의/신고</h5></a> <a
									class="dropdown-item" href="#"><h5>고객센터</h5></a>
							</div></li>
						<li class="nav-item"><a href=""><h5>로그아웃</h5></a></li>
					</ul>
				</div>

				<!-- cas	e3. 관리자로그인후 -->
				<% }else if(loginUser.getRoll().equals("A") || (loginUser.getRoll().equals("M"))){  %>
				<div>
					<ul id="head-info">
						<li class="nav-item"><h5>
								<a href=""><h5>관리자님</h5></a></li>
						<li class="nav-item"><a href=""><h5>관리자페이지</h5></a></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							href="#" id="navbardrop" data-toggle="dropdown">
								<h5>고객센터</h5>
						</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#"><h5>이벤트</h5></a> <a
									class="dropdown-item" href="#"><h5>문의/신고</h5></a> <a
									class="dropdown-item" href="#"><h5>고객센터</h5></a>
							</div></li>
						<li class="nav-item"><a href=""><h5>로그아웃</h5></a></li>
					</ul>
				</div>

				<% } %>

			</div>
		</header>
		<div id="head-nav">
			<script>
           
            </script>
			<nav
				class="navbar m-3 navbar-expand-sm d-flex justify-content-center">
				<ul id="world-navbar-nav" class="navbar-nav">

				</ul>
			</nav>
			<hr>
		</div>




		<!-- Header, Nav end -->