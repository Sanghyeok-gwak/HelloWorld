<%@page import="com.gd.hw.banner.model.vo.Banner"%>
<%@page import="com.gd.hw.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.gd.hw.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String contextPath = request.getContextPath();
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
		List<Product> productList = (List<Product>)map.get("product");
		List<Banner> bannerList = (List<Banner>)map.get("banner");
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
.btn-add {
	text-align: end;
	margin-bottom: 10px;
}

#btn-1 {
	width: 70px;
	border-radius: 5px;
	border: 1px solid #007AFF;
	margin-left: 5px;
}

.admin-page-head {
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid lightgray;
}

.admin-page-head-logo {
	border-right: 1px solid lightgray;
	width: 15%;
	height: 100%;
}

.admin-page-main-menu {
	width: 15%;
	height: 100%;
}

.admin-page-main-item {
	border-left: 1px solid lightgray;
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

.admin-page-main-item-list, .banner-item-list {
	padding: 50px;
}

#banner-top, #banner-sub-1, #banner-sub-2, #banner-sub-3,
	#banner-sub-2-1  {
	display: none;
	/* 기본적으로 모든 배너 리스트 숨기기 */
}
.top-box1{
	display: flex;
	
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
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.pro'">상품
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.bn">배너
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">리뷰
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.cg'">카테고리
						관리</button>
				</div>
				<div class="amdin-page-side-btn2">
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.us'">회원
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">블랙리스트
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">이벤트
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">결제
						관리</button>
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
				<div class="admin-page-main-item-list">
					<h3>활성화 배너</h3>
					<hr>
					<div class="banner-list mb-3">
						<!-- 상단 옵션  -->
						<select name="banner-name" id="bannerSelect" class="form-control">
							<option value="banner-top">상단배너</option>
							<option value="banner-sub-1">서브배너1</option>
							<option value="banner-sub-2">서브배너2</option>
						</select>
					</div>
					<div class="btn-add">
						<button id="btn-1">삭제</button>
					</div>
					<!-- 상단배너 -->
					<div id="banner-top" class="banner">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th width="100px"></th>
									<th width="100px">번호</th>
									<th width="150px">분류</th>
									<th width="400px">이미지</th>
									<th width="400px">상품명</th>
								</tr>
							</thead>
							<tbody>
								<% if(bannerList.isEmpty()){%>
								                <tr>
								                  <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
								                </tr>
								<%}else{ %>	
								<!-- case2. 조회된 게시글이 있을 경우 -->
								<%int count =1; %>
									<%for(int i=0; i<bannerList.size(); i++){ %>
										<tr style="border-bottom: 1px solid lightgray;">
											<td>
												<input type="checkbox" class="banner-checkBox" name="list-checkBox" value="<%=bannerList.get(i).getBannerNo() %>">
											</td>
											<td><%=bannerList.get(i).getBannerNo() %></td>
											<td><%=bannerList.get(i).getImg() %></td>
											<td><%=bannerList.get(i).getTietle() %></td>
											<td><%=bannerList.get(i).getContent()%></td>
											<td><%=bannerList.get(i).getStatus()%></td>
											<td>
												<button id="btn-3" onclick="location.href='<%=contextPath%>/modify.pro?no=<%= bannerList.get(i).getBannerNo() %>'">
													<h5>수정</h5>
												</button>
											</td>
										</tr>
									<%} %>
							<%} %>
							</tbody>
						</table>
					</div>
					<!-- 서브배너1 -->
					<div id="banner-sub-1" class="banner">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th width="100px"></th>
									<th width="100px">번호</th>
									<th width="150px">분류</th>
									<th width="400px">이미지</th>
									<th width="400px">상품명</th>
								</tr>
							</thead>
							<tbody>
								<% if(bannerList.isEmpty()){%>
								                <tr>
								                  <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
								                </tr>
								<%}else{ %>	
								<!-- case2. 조회된 게시글이 있을 경우 -->
								<%int count =1; %>
									<%for(int i=0; i<bannerList.size(); i++){ %>
										<tr style="border-bottom: 1px solid lightgray;">
											<td>
												<input type="checkbox" class="banner-checkBox" name="list-checkBox" value="<%=bannerList.get(i).getBannerNo() %>">
											</td>
											<td><%=bannerList.get(i).getBannerNo() %></td>
											<td><%=bannerList.get(i).getImg() %></td>
											<td><%=bannerList.get(i).getTietle() %></td>
											<td><%=bannerList.get(i).getContent()%></td>
											<td><%=bannerList.get(i).getStatus()%></td>
											<td>
												<button id="btn-3" onclick="location.href='<%=contextPath%>/modify.pro?no=<%= bannerList.get(i).getBannerNo() %>'">
													<h5>수정</h5>
												</button>
											</td>
										</tr>
									<%} %>
							<%} %>
							</tbody>
						</table>
					</div>
					<!-- 서브배너2 -->
					<div id="banner-sub-2" class="banner">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th width="100px"></th>
									<th width="100px">번호</th>
									<th width="150px">분류</th>
									<th width="400px">이미지</th>
									<th width="400px">상품명</th>
								</tr>
							</thead>
							<tbody>
								<% if(bannerList.isEmpty()){%>
								                <tr>
								                  <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
								                </tr>
								<%}else{ %>	
								<!-- case2. 조회된 게시글이 있을 경우 -->
								<%int count =1; %>
									<%for(int i=0; i<bannerList.size(); i++){ %>
										<tr style="border-bottom: 1px solid lightgray;">
											<td>
												<input type="checkbox" class="banner-checkBox" name="list-checkBox" value="<%=bannerList.get(i).getBannerNo() %>">
											</td>
											<td><%=bannerList.get(i).getBannerNo() %></td>
											<td><%=bannerList.get(i).getImg() %></td>
											<td><%=bannerList.get(i).getTietle() %></td>
											<td><%=bannerList.get(i).getContent()%></td>
											<td><%=bannerList.get(i).getStatus()%></td>
											<td>
												<button id="btn-3" onclick="location.href='<%=contextPath%>/modify.pro?no=<%= bannerList.get(i).getBannerNo() %>'">
													<h5>수정</h5>
												</button>
											</td>
										</tr>
									<%} %>
							<%} %>
							</tbody>
						</table>
					</div>
					
				</div>
				<hr>
				<script>
          // 옵션 선택시 영역바꾸는 스크립트 -상단
          document.getElementById('bannerSelect').addEventListener('change', function () {
            const selectedValue = this.value;

            // 모든 배너 리스트를 숨기기
            document.querySelectorAll('.banner').forEach(container => {
              container.style.display = 'none';
            });

            // 선택된 배너 리스트만 표시하기
            const selectedBanner = document.getElementById(selectedValue);
            if (selectedBanner) {
              selectedBanner.style.display = 'block';
            }
          });

          // 페이지 로드 시 기본적으로 첫 번째 리스트를 보여주기
          document.getElementById('bannerSelect').dispatchEvent(new Event('change'));
        </script>


				<div class="banner-item-list">
					<div class="top-box1" style="justify-content: space-between;">
						<div class="top-text">
							<h3>리스트</h3>
						</div>
						<div class="btn-add" style="margin-top:5px;margin-bottom:5px;">
							<button id="btn-1" ><h5>추가</h5></button>
						</div>
					</div>
							<hr style=" margin-bottom:50px;">
					<!-- 상품 리스트 -->
					<div id="banner-top2" class="banner2">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th width="100px"></th>
									<th width="100px">번호</th>
									<th width="150px">카테고리</th>
									<th width="400px">이미지</th>
									<th width="400px">상품명</th>
								</tr>
							</thead>
							<tbody>
								<!-- case1. 조회된 게시글이 없을 경우 -->
							
								<% if(productList.isEmpty()){%>
								                <tr>
								                  <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
								                </tr>
								<%}else{ %>	
								<!-- case2. 조회된 게시글이 있을 경우 -->
								<%int count =1; %>
									<%for(int i=0; i<productList.size(); i++){ %>
										<tr style="border-bottom: 1px solid lightgray;">
											<td>
												<input type="checkbox" class="product-checkBox" name="list-checkBox" value="<%=productList.get(i).getProductId() %>">
											</td>
											<td><%=productList.get(i).getProductId()%></td>
											<td><%=productList.get(i).getCategoryName() %></td>
											<td><%=productList.get(i).getProductName() %></td>
											<td><%=productList.get(i).getStartDate()%></td>
											<td><%=productList.get(i).getEndDate()%></td>
											<td>
												
											</td>
										</tr>
									<%} %>
							<%} %>
							
						</tbody>
							</tbody>
						</table>
						<ul id="pagination-product"
							class="pagination d-flex justify-content-center text-dark"
							style="margin-top: 80px;">
							<li
								class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
								<a class="page-link"
								href="<%=contextPath%>/list.pro?page=<%=pi.getCurrentPage() - 1%>">
									< </a>
							</li>
							<%
							for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {
							%>
							<li
								class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
								<a class="page-link"
								href="<%=contextPath%>/list.bn?page=<%=p%>"><%=p%></a>
							</li>
							<%
							}
							%>

							<li
								class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
								<a class="page-link"
								href="<%=contextPath%>/list.pro?page=<%=pi.getCurrentPage() + 1%>">
									> </a>
							</li>
						</ul>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>