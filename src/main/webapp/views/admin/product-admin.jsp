<%@page import="com.gd.hw.common.model.vo.PageInfo"%>
<%@page import="com.gd.hw.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String contextPath = request.getContextPath();
	List<Product> list = (List<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	
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
	margin-top: 50px;
	margin-left: 20px;
	margin-right: 30px;
}

.admin-page-main-item-list table {
	text-align: center;
}
.dropdown-category-select{
	width: 200px;
  height: 30px;
  border-radius: 5px;
  border: 1px solid lightgrey;
}
.dropdown-category{
	text-align: end;
  margin-bottom: 20px;
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
.admin-page-main-menu{
	border-right: 0px!important;
}

.admin-page-main-item{
	border-left: 1px solid lightgray;
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
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.bn'">
						배너 관리
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
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.bk'">
					블랙리스트 관리
					</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>/list.or'">
					결제 관리</button>
				</div>
			
				<div class="amdin-page-side-btn4">
					<button id="btn-2" class="btn" onclick="location.href='<%=contextPath%>'">메인
						홈</button>
				</div>
			</div>
			<div class="admin-page-main-item">
				<div class="admin-page-main-item-text">
					<h1>상품관리</h1>
				</div>
				<div class="admin-page-main-item-btn">
					<div class="admin-page-main-item-search">

					</div>
					
					
					<div class="admin-page-main-item-btns">
						<button id="btn-3" onclick="location.href='<%=contextPath%>/views/admin/product-admin-add.jsp'">
							<h5>추가</h5>
						</button>
						<button id="btn-3" onclick="fnDeleteSelected()">
							<h5>삭제</h5>
						</button>
					</div>
				</div>
				<div class="admin-page-main-item-list">
					<div class="dropdown-category">
						<select class="dropdown-category-select">
							
						</select>
						<script>
						window.onload=function (){
							$.ajax({
								url:'<%= contextPath%>/list.mcc',
								success: function(res){
									let optionEl = '<option>전체</option>'
									for(let i =0; i<res.length; i++){
										optionEl +='<option value="' + res[i].categoryName + '">'
															 +res[i].categoryName
															 +'</option>'
														
									}
									$('.dropdown-category-select').html(optionEl);
								}
							})
							
						}
						$('.dropdown-category-select').change(function() {
						    const selectedCategory = $(this).val();
						    loadProducts(selectedCategory, 1); // 처음 페이지 로드
						});

						function loadProducts(category, page) {
						    $.ajax({
						        url: '<%= contextPath %>/filterByCategory.pro',
						        type: 'GET',
						        data: { category: category, page: page },
						        success: function(data) {
						            const tbody = $('#product-table tbody');
						            tbody.empty(); // 기존 내용 삭제
						            if (data.list.length === 0) {
						                  tbody.append('<tr style="border-bottom: 1px solid lightgrey;"><td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td></tr>');
						            }else{
						            // 새로운 데이터로 테이블 업데이트
							            data.list.forEach(function(product) {
							                const row = '<tr style="border-bottom: 1px solid lightgrey;">' +
							                    '<td><input type="checkbox" class="product-checkBox" name="list-checkBox" value="'+product.productId+'"></td>' +
							                    '<td>' + product.productId + '</td>' +
							                    '<td>' + product.categoryName + '</td>' +
							                    '<td>' + product.productName + '</td>' +
							                    '<td>' + product.startDate + '</td>' +
							                    '<td>' + product.endDate + '</td>' +
							                    '<td><button id="btn-3" onclick="location.href=\'/world/modify.pro?no=' + product.productId + '\'">수정</button></td>' +
							                    '</tr>';
							                tbody.append(row);
							            });
						            }

						            // 페이지네이션 업데이트
						            updatePagination(data.pi);
						        },
						       
						    });
						}
		
						function updatePagination(pi) {
						    const pagination = $('#pagination-product');
						    pagination.empty(); // 기존 페이지네이션 삭제

						    const previousDisabled = pi.currentPage === 1 ? 'disabled' : '';
						    pagination.append(
						        '<li class="page-item ' + previousDisabled + '">' +
						        '<a class="page-link" href="#" data-page="' + (pi.currentPage - 1) + '"> < </a>' +
						        '</li>'
						    );

						    for (let p = pi.startPage; p <= pi.endPage; p++) {
						        const active = p === pi.currentPage ? 'active' : '';
						        pagination.append(
						            '<li class="page-item ' + active + '">' +
						            '<a class="page-link" href="#" data-page="' + p + '">' + p + '</a>' +
						            '</li>'
						        );
						    }

						    const nextDisabled = pi.currentPage === pi.maxPage ? 'disabled' : '';
						    pagination.append(
						        '<li class="page-item ' + nextDisabled + '">' +
						        '<a class="page-link" href="#" data-page="' + (pi.currentPage + 1) + '"> > </a>' +
						        '</li>'
						    );

						    // 페이지 클릭 이벤트 핸들러
						    pagination.find('.page-link').click(function(e) {
						        e.preventDefault();
						        const page = $(this).data('page');
						        loadProducts($('.dropdown-category-select').val(), page); // 선택된 카테고리와 페이지를 전달
						    });
						}

						</script>
						
						
					</div>
					<table id="product-table" class="table">
						<thead>
							<tr>
								<th width="100px"></th>
								<th width="100px">번호</th>
								<th width="150px">카테고리</th>
								<th width="600px">상품명</th>
								<th>시작일</th>
								<th>종료일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<!-- case1. 조회된 게시글이 없을 경우 -->
							
							<% if(list.isEmpty()){%>
                <tr>
                  <td colspan="7" style="text-align: center;">존재하는 게시글이 없습니다.</td>
                </tr>
							<%}else{ %>	
								<!-- case2. 조회된 게시글이 있을 경우 -->
								<%int count =1; %>
									<%for(int i=0; i<list.size(); i++){ %>
										<tr style="border-bottom: 1px solid lightgray;">
											<td>
												<input type="checkbox" class="product-checkBox" name="list-checkBox" value="<%=list.get(i).getProductId() %>">
											</td>
											<td><%=list.get(i).getProductId()%></td>
											<td><%=list.get(i).getCategoryName() %></td>
											<td><%=list.get(i).getProductName() %></td>
											<td><%=list.get(i).getStartDate()%></td>
											<td><%=list.get(i).getEndDate()%></td>
											<td>
												<button id="btn-3" onclick="location.href='<%=contextPath%>/modify.pro?no=<%= list.get(i).getProductId() %>'">
													<h5>수정</h5>
												</button>
											</td>
										</tr>
									<%} %>
							<%} %>
							
						</tbody>
					</table>
					<script>
					function fnDeleteSelected() {
					    const checkboxes = document.querySelectorAll('.product-checkBox:checked'); // 체크된 체크박스 선택
					    const checkedValues = [];
					    checkboxes.forEach(checkbox => {
					        checkedValues.push(checkbox.value); // 체크된 체크박스의 value를 배열에 추가
					    });

					    if (checkedValues.length === 0) {
					        alert('삭제할 상품을 선택해주세요.'); // 체크된 상품이 없으면 알림
					        return;
					    }

					    const confirmation = confirm('선택한 상품을 삭제하시겠습니까?'); // 삭제 확인 다이얼로그
					    if (confirmation) {

					        $.ajax({
			            		
					        	url:'<%= contextPath%>/deleteProduct.pro',
			            		traditional: true, 
			            		data: { checkedValues: checkedValues }, // 선택한 카테고리 이름 전달
			            		success: function(result) {
			                        if (result>0) {
			                            alert('상품이 삭제되었습니다.'); // 삭제 성공 시 알림
			                            location.reload(); // 페이지 새로 고침
			                        } else {
			                            alert('삭제에 실패했습니다.'); // 삭제 실패 시 알림
			                        }
			                    },
			                    
			            		
			            	});
					    }
					}

					
					</script>
					<ul id="pagination-product" class="pagination d-flex justify-content-center text-dark" style="margin-top: 80px;">
						<li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
	          		<a class="page-link" href="<%=contextPath%>/list.pro?page=<%=pi.getCurrentPage()-1%>"> < </a>
	          	</li>
							<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
		          	<li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
		          		<a class="page-link" href="<%= contextPath %>/list.pro?page=<%=p%>"><%= p %></a>
		          	</li>
	          	<% } %>
	          	 
							<li class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
	          		<a class="page-link" href="<%=contextPath%>/list.pro?page=<%=pi.getCurrentPage()+1%>"> > </a>
	         	 	</li>
						</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>