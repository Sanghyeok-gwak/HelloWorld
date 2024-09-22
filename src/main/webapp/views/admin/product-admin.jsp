<%@page import="com.gd.hw.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String contextPath = request.getContextPath();
	List<Product> list = (List<Product>)request.getAttribute("list");
	
	
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
<style>
.admin-page-head {
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid lightgray;
}

.admin-page-head-logo, .admin-page-main-menu {
	width: 15%;
	height: 100%;
}

.admin-page-head-logo {
	border-right: 1px solid lightgray;
}

.admin-page-head-gongback, .admin-page-main-item {
	width: 85%;
	height: 100%;
}

.admin-page-main {
	height: 100%;
}

.amdin-page-side-btn1 button, .amdin-page-side-btn2 button,
	.amdin-page-side-btn3 button, .amdin-page-side-btn4 button {
	width: 100%;
	height: 45px;
	margin-top: 10px;
	border-radius: 10px;
	cursor: pointer;
}

.amdin-page-side-btn1, .amdin-page-side-btn2, .amdin-page-side-btn3,
	.amdin-page-side-btn4 {
	padding: 20px
}

.admin-page-main {
	display: flex;
}

.admin-page-main-item {
	border-left: 1px solid lightgray;
}

/* 메인 리스트 부분 */
.admin-page-main-item-text {
	margin-top: 30px;
	margin-left: 20px;
}

.admin-page-main-item-btns {
	height: 40px;
	margin-right: 30px;
}

.admin-page-main-item-btns button, .search-container-btn button {
	height: 100%;
	cursor: pointer;
}

.admin-page-main-item-btn {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	height: 40px;
	margin-left: 20px;
}

#btn-3 {
	width: 100px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

.admin-page-main-item-search {
	display: flex;
}

.search-container {
	position: relative;
	width: 100%;
}

.search-container input[type="text"] {
	border-radius: 20px;
	padding-right: 2.5rem;
	/* X 버튼 여유 공간 */
	border: 1px solid lightgray;
	padding-left: 10px;
	height: 100%;
	width: 300px;
}

.search-container .clear-button {
	position: absolute;
	top: 50%;
	right: 0.5rem;
	transform: translateY(-50%);
	cursor: pointer;
	color: #000000;
}

.admin-page-main-item-list {
	margin-top: 100px;
	margin-left: 20px;
	margin-right: 30px;
}

.admin-page-main-item-list table {
	text-align: center;
}

/* 공통 스타일 */
/* font */
h1 {
	font-size: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
}

h3 {
	font-size: 24px;
	margin-top: 5px;
	margin-bottom: 5px;
}

h5 {
	font-size: 15px;
	margin-top: 5px;
	margin-bottom: 5px;
}
/* button */
#btn-1 {
	background-color: #007AFF;
	color: white;
}

#btn-2 {
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
				<img src="<%= contextPath %>/assets/image/logo.png" alt="logo" width="100%">
			</div>
			<div class="admin-page-head-gongback"></div>
		</div>
		<div class="admin-page-main">
			<div class="admin-page-main-menu">
				<div class="amdin-page-side-btn1">
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.pro'">
						상품 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">
						배너 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">
						리뷰 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.cg'">
						카테고리 관리
					</button>
				</div>
				<div class="amdin-page-side-btn2">
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.us'">
					회원 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">
					블랙리스트 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">
					이벤트 관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">
					결제 관리</button>
				</div>
				<div class="amdin-page-side-btn3">
					<button id="btn-2" class="btn" onclick="location.href='#'">FAQ</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">문의/신고</button>
				</div>
				<div class="amdin-page-side-btn4">
					<button id="btn-2" class="btn" onclick="location.href='#'">메인
						홈</button>
				</div>
			</div>
			<div class="admin-page-main-item">
				<div class="admin-page-main-item-text">
					<h1>상품관리</h1>
				</div>
				<div class="admin-page-main-item-btn">
					<div class="admin-page-main-item-search">

						<div class="search-container">
							<input type="text" class="form-control" id="searchInput"
								placeholder="제목을 입력하세요."> <span class="clear-button"
								id="clearButton"> <i class="fas fa-times"></i>
							</span>
						</div>

						<div class="search-container-btn">
							
							<button id="btn-3">
								<h5>조회</h5>
							</button>
						</div>

					</div>
					<!-- 검색어 초기화 스크립트 -->
					<script>
            document.getElementById('clearButton').addEventListener('click', function () {
              const searchInput = document.getElementById('searchInput');
              searchInput.value = ''; // 검색어를 지움
              searchInput.focus(); // 포커스를 다시 검색바로 이동
            });
          </script>
					<div class="admin-page-main-item-btns">
						<button id="btn-3">
							<h5>추가</h5>
						</button>
						<button id="btn-3">
							<h5>삭제</h5>
						</button>
					</div>
				</div>
				<div class="admin-page-main-item-list">
					<table class="table">
						<thead>
							<tr>
								<th width="100px"></th>
								<th width="100px">번호</th>
								<th width="150px">카테고리</th>
								<th width="400px">상품명</th>
								<th>시작일</th>
								<th>종료일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<!-- case1. 조회된 게시글이 없을 경우 -->
							<!--
                <tr>
                  <td colspan="6" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                </tr>
                -->

							<!-- case2. 조회된 게시글이 있을 경우 -->
							<%int count =1; %>
							<%for(int i=0; i<list.size(); i++){ %>
								<tr>
									<td>
										<input type="checkbox" name="list-checkBox" id="">
									</td>
									<td><%=count++ %></td>
									<td><%=list.get(i).getCategoryName() %></td>
									<td><%=list.get(i).getProductName() %></td>
									<td><%=list.get(i).getStartDate()%></td>
									<td><%=list.get(i).getEndDate()%></td>
									<td>
										<button id="btn-3">
											<h5>수정</h5>
										</button></td>

								</tr>
							<%} %>
							
							
						</tbody>
					</table>

					<ul class="pagination d-flex justify-content-center text-dark"
						style="margin-top: 80px;">
						<li class="page-item disabled"><a class="page-link" href="">
								< </a></li>
						<li class="page-item active"><a class="page-link" href="">1</a></li>
						<li class="page-item"><a class="page-link" href="">2</a></li>
						<li class="page-item"><a class="page-link" href="">3</a></li>
						<li class="page-item"><a class="page-link" href="">4</a></li>
						<li class="page-item"><a class="page-link" href="">5</a></li>
						<li class="page-item"><a class="page-link" href="">></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>