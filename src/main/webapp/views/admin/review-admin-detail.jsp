<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- ------------------------- -->
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
	padding: 20px;
}

/* 상품등록 부분 */
/* 메인 리스트 부분 */
.admin-page-main-item-text {
	margin-top: 30px;
	margin-left: 20px;
}

.admin-page-main-item-btn {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	height: 40px;
	margin-left: 20px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 99999; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

/* Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 40px;
	font-weight: bold;
	text-align: end;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* Modal Title */
.modal-content h3 {
	margin-top: 0;
	text-align: center;
}

/* Review Text */
.modal-content p {
	font-size: 16px;
	line-height: 1.5;
	white-space: pre-wrap; /* Preserves formatting */
	word-wrap: break-word;
}

#btn-3 {
	width: 100px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
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
				<img src="../../assets/image/logo.png" alt="logo" width="100%">
			</div>
			<div class="admin-page-head-gongback"></div>
		</div>
		<div class="admin-page-main">
			<div class="admin-page-main-menu">
				<div class="amdin-page-side-btn1">
					<button id="btn-2" class="btn" onclick="location.href='#'">상품
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">배너
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">리뷰
						관리</button>
					<br>
					<button id="btn-2" class="btn" onclick="location.href='#'">카테고리
						관리</button>
				</div>
				<div class="amdin-page-side-btn2">
					<button id="btn-2" class="btn" onclick="location.href='#'">회원
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
				<div class="admin-page-main-item-text">
					<h1>리뷰</h1>
				</div>
				<!-- 상품상세페이지 복사해올 예정 -->
				<div class="admin-page-product"></div>
				<div class="admin-page-main-item-list">
					<table class="table">
						<tbody>
							<!-- case1. 조회된 게시글이 없을 경우 -->
							<!--
                <tr>
                  <td colspan="6" style="text-align: center;">존재하는 리뷰가 없습니다.</td>
                </tr>
                -->

							<!-- case2. 조회된 게시글이 있을 경우 -->
							<tr>
								<td style="width: 150px;">별점</td>
								<td style="width: 400px; cursor: pointer;"
									class="review-content">너무 신선해요</td>
								<td style="width: 70px;">회원아이디</td>
								<td style="width: 150px;">2024-01-12(작성일)</td>
								<td style="width: 100px;">
									<button id="btn-3">
										<h5>삭제</h5>
									</button>
								</td>
							</tr>
							<tr>
								<td style="width: 150px;">별점</td>
								<td style="width: 400px; cursor: pointer;"
									class="review-content">너무 재밌어요</td>
								<td style="width: 70px;">회원아이디</td>
								<td style="width: 150px;">2024-01-12(작성일)</td>
								<td style="width: 100px;">
									<button id="btn-3">
										<h5>삭제</h5>
									</button>
								</td>
							</tr>
							<tr>
								<td style="width: 150px;">별점</td>
								<td style="width: 400px; cursor: pointer;"
									class="review-content">너무 지루해요</td>
								<td style="width: 70px;">회원아이디</td>
								<td style="width: 150px;">2024-01-12(작성일)</td>
								<td style="width: 100px;">
									<button id="btn-3">
										<h5>삭제</h5>
									</button>
								</td>
							</tr>
							<tr>
								<td style="width: 150px;">별점</td>
								<td style="width: 400px; cursor: pointer;"
									class="review-content">너무 무서워요</td>
								<td style="width: 70px;">회원아이디</td>
								<td style="width: 150px;">2024-01-12(작성일)</td>
								<td style="width: 100px;">
									<button id="btn-3">
										<h5>삭제</h5>
									</button>
								</td>
							</tr>
							<tr>
								<td style="width: 150px;">별점</td>
								<td style="width: 400px; cursor: pointer;"
									class="review-content">너무 신선해요</td>
								<td style="width: 70px;">회원아이디</td>
								<td style="width: 150px;">2024-01-12(작성일)</td>
								<td style="width: 100px;">
									<button id="btn-3">
										<h5>삭제</h5>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 리뷰상세보기 Modal -->
					<div id="reviewModal" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<h3>리뷰 내용</h3>
							<p id="fullReviewContent">리뷰 내용이 여기에 표시</p>
						</div>
					</div>
					<!-- 리뷰상세보기 스크립트 -->
					<script>
            // 모달을 가져옴
            var modal = document.getElementById("reviewModal");
          
            // 모달을 닫는 <span> 요소를 가져옴
            var span = document.getElementsByClassName("close")[0];
          
            // 모든 리뷰 내용 요소를 가져옴
            var reviewContentElements = document.querySelectorAll('.review-content');
          
            // 각 리뷰 내용에 클릭 이벤트 추가
            reviewContentElements.forEach(function (element) {
              element.addEventListener('click', function () {
                // 클릭한 리뷰 내용을 가져와 모달의 본문에 넣음
                var reviewContent = this.textContent;
                document.getElementById("fullReviewContent").textContent = reviewContent;
          
                // 모달을 보여줌
                modal.style.display = "block";
              });
            });
          
            // 사용자가 <span> (X)를 클릭하면 모달을 닫음
            span.onclick = function () {
              modal.style.display = "none";
            };
          
            // 사용자가 모달 바깥을 클릭하면 모달을 닫음
            window.onclick = function (event) {
              if (event.target == modal) {
                modal.style.display = "none";
              }
            };
          </script>
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