<%@ page import="java.util.List"%>
<%@page import="com.gd.hw.common.model.vo.PageInfo"%>
<%@ page import="com.gd.hw.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
List<User> list = (List<User>) request.getAttribute("list");
String msg = (String) session.getAttribute("msg");
PageInfo pi = (PageInfo) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%
if (msg != null) {
%>
<script>
	alert('<%=msg%>');
</script>
<%
session.removeAttribute("msg");
}
%>
<style>
.admin-page-head {
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid lightgray;
}

.admin-page-head-logo, .admin-page-main-menu {
	border-right: 1px solid lightgray;
	width: 15%;
	height: 100%;
}

.admin-page-head-gongback, .admin-page-main-item {
	width: 85%;
	height: 100%;
}

.admin-page-main {
	height: 100%;
	display: flex;
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
				<img src="<%=contextPath%>/assets/image/logo.png" alt="logo"
					width="100%">
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
			<div class="admin-page-main-item w-75 m-auto">
				<!-- 여기부터 -->
				<div class="pb-5 ">
					<h1>회원관리</h1>
				</div>
				<div id="search-bar">
					<form class="navbar-form pull-left">
						<div class="input-group mb-3 w-50">
							<h3 class="pr-3">회원 ID</h3>
							<input type="text" class="form-control" name="keyword">
							<div class="input-group-append">
								<button class="btn btn-primary" id="serchBtn">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div id="buttons" class="d-flex justify-content-end pr-2 pb-2">
					<button class="btn btn-primary btn-sm" style="width: 100px"
						id="addBtn">추가</button>
					<button class="btn btn-danger btn-sm"
						style="width: 100px; display: none;" id="delBtn">탈퇴</button>
				</div>
				<div id="table-contain">
					<table class="table table-bordered" id="userTable">
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>가입일</th>
								<th>수정일</th>
								<th>상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 경우-->
							<%
							if (list != null && list.isEmpty()) {
							%>
							<tr>
								<td colspan="11" style="text-align: center;">불러올 회원 정보가
									없습니다.</td>
							</tr>
							<%
							} else if (list != null) {
							%>
							<!-- 데이터가 있을 경우 -->

							<%
							for (User u : list) {
							%>
							<tr>
								<%
								if (u.getStatus().equals("R")) {
								%>
								<th><input type="checkbox" disabled></th>
								<%
								} else {
								%>
								<th><input type="checkbox" value=<%=u.getUserNo()%>
									class="chk"></th>
								<%
								}
								%>
								<td><%=u.getUserNo()%></td>
								<td><%=u.getUserId()%></td>
								<td><%=u.getUserPwd()%></td>
								<td><%=u.getUserName()%></td>
								<td><%=u.getEmail()%></td>
								<td><%=u.getPhone()%></td>
								<td><%=u.getEnrollDate()%></td>
								<td><%=u.getModifyDate()%></td>
								<%
								if (u.getStatus().equals("R")) {
								%>
								<td style="color: red;">탈퇴</td>
								<td><button class="btn btn-primary btn-sm w-100" disabled>수정</button></td>
								<%
								} else if (u.getStatus().equals("B")) {
								%>
								<td style="color: blue;">블랙리스트</td>
								<td><a
									href="<%=contextPath%>/modiAd.us?no=<%=u.getUserNo()%>"
									class="btn btn-primary btn-sm w-100">수정</a></td>
								<%
								} else {
								%>
								<td>일반</td>
								<td><a
									href="<%=contextPath%>/modiAd.us?no=<%=u.getUserNo()%>"
									class="btn btn-primary btn-sm w-100">수정</a></td>
								<%
								}
								%>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
				<div id="paging-bar">
					<ul id="pagination-user-admin"
						class="pagination d-flex justify-content-center text-dark"
						style="margin-top: 80px;">
						<li
							class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
							<a class="page-link"
							href="<%=contextPath%>/list.us?page=<%=pi.getCurrentPage() - 1%>">
								< </a>
						</li>
						<%
						for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {
						%>
						<li
							class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
							<a class="page-link" href="<%=contextPath%>/list.us?page=<%=p%>"><%=p%></a>
						</li>
						<%
						}
						%>

						<li
							class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
							<a class="page-link"
							href="<%=contextPath%>/list.us?page=<%=pi.getCurrentPage() + 1%>">
								> </a>
						</li>
					</ul>
				</div>
				<!-- 여기까지 -->
			</div>
		</div>
	</div>
	<script>
	
	$('#serchBtn').click(function() {
	    const keyword = $('#keyword').val();
	    console.log(keyword);
	    
	});

	$(document).ready(function () {
		$(':checkbox').click(function (evt) {
			if($(':checkbox:checked').length >= 1){
		        $('#delBtn').css('display', '');
		    }else{
		    	 $('#delBtn').css('display', 'none');
		    }
	      })
	      
	   $('#delBtn').click(function(evt){
		   const count = $(':checkbox:checked').length;
			if(confirm( count+'명의 회원을 탈퇴처리 하시겠습니까?')){
				let arr = [];
				$(":checkbox:checked").each(function(){
					arr.push($(this).val());
				});		
				$.ajax({
					url:'<%=contextPath%>/deleteUser.us',
					method: 'POST',
					data:{delUser:JSON.stringify(arr)},
					success: function(res){
						alert(res+"명의 회원이 성공적으로 탈퇴 처리되었습니다.");
						location.reload(); 
					},
					error: function(){
						alert("탈퇴처리에 실패하였습니다.");
					}
				})
			}
	   })
	  
	  document.getElementById("addBtn").addEventListener("click", () => {
      	location.href = "<%=contextPath%>/add.us";
      })
	})
	
	</script>

	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</body>
</html>