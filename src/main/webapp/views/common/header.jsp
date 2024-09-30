<%@page import="com.gd.hw.user.model.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
   User loginUser = (User)session.getAttribute("loginUser");
   String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<% if(alertMsg != null) { %>
<script>
   alert('<%=alertMsg %>');
</script>
<% session.removeAttribute("alertMsg"); } %>

<script>
    window.onload = function () {
        $.ajax({
            url: '<%= contextPath%>/list.mcc', // 카테고리 리스트를 가져오는 URL
            success: function(res) {
                let liEl = '';
                for (let i = 0; i < res.length; i++) {
                    // 카테고리 클릭 시 해당 카테고리 이름을 productlist 서블릿으로 전달
                    liEl += '<li id="world-navbav-nav" class="nav-item">'
                          + '<a class="nav-link" href="' + '<%=contextPath %>/productList.pr?categoryName=' + res[i].categoryName + '">'
                          + '<h3>' + res[i].categoryName + '</h3>'
                          + '</a></li>';
                }
                $('#world-navbar-nav').html(liEl);
            }
        });
    }
    
</script>
<style>
header {
	height: 150px;
}

header a {
	color: black;
}

.nav-link {
	color: black;
	width: 200px;
	font-size: 20px;
	text-align: center;
	transition: background-color 1s;
	border-radius: 10px;
}

.nav-link:hover {
	color: white;
	background-color: #007AFF;
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
				<a href="<%= contextPath %>"><img src="<%=contextPath %>/assets/image/logo.png" alt="Logo"></a>
			</div>
			<div class="col-6"></div>
			<div class="col-3 d-flex justify-content-center align-items-center">
				<% if(loginUser == null) { %>
				<div>
					<ul id="head-info">
						<li class="nav-item"><a href="<%=contextPath %>/views/user/login.jsp"><h5>로그인</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath %>/views/user/signupStart.jsp"><h5>회원가입</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath %>/list.no"><h5>공지사항</h5></a></li>
					</ul>
				</div>
				<% } else if(loginUser.getRoll().equals("U")) { %>
				<div>
					<ul id="head-info">
						<li class="nav-item"><a href="#"><h5><%= loginUser.getUserName() %>님</h5></a></li>
						<li class="nav-item" id="history"><a href="<%= contextPath %>/myinfom.us?no=<%= loginUser.getUserNo() %>"><h5>마이페이지</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath %>/list.no"><h5>공지사항</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath%>/logout.me"><h5>로그아웃</h5></a></li>
					</ul>
				</div>
				<% } else if(loginUser.getRoll().equals("A") || loginUser.getRoll().equals("M")) { %>
				<div>
					<ul id="head-info">
						<li class="nav-item"><h5><a href="#"><%= loginUser.getUserName() %>님</a></h5></li>
						<li class="nav-item"><a href="<%=contextPath%>/list.pro"><h5>관리자페이지</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath %>/list.no"><h5>공지사항</h5></a></li>
						<li class="nav-item"><a href="<%=contextPath%>/logout.me"><h5>로그아웃</h5></a></li>
					</ul>
				</div>
				<% } %>
			</div>
		</header>
		<div id="head-nav">
			<nav class="navbar m-3 navbar-expand-sm d-flex justify-content-center">
				<ul id="world-navbar-nav" class="navbar-nav"></ul>
			</nav>
			<hr>
		</div>
		<!-- Header, Nav end -->
