<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- 하트 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom Styles -->
<style>

/* product-main */
.product-card {
	border: 1px solid #ddd;
	border-radius: 10px;
	display: flex;
	overflow: hidden;
	position: relative;
	/* Add this */
	width: 900px;
	height: 230px;
}

.product-card img {
	width: 40%;
	height: auto;
	object-fit: cover;
}

.product-card .card-body {
	padding: 15px;
	width: 60%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.product-card .btn {
	width: auto;
	font-size: 14px;
	padding: 5px 10px;
	margin-top: 10px;
	align-self: flex-end;
}

.filter-section {
	border: 1px solid #ddd;
	/* 회색 선 추가 */
	border-radius: 5px;
	/* 둥글게 하기 (옵션) */
	padding: 20px;
	/* 안쪽 여백 */
	height: 550px;
}

.pagination .page-link {
	font-size: 20px;
	/* 버튼의 텍스트 크기 */
}

.pagination .page-item.active .page-link {
	background-color: #007AFF;
	/* 활성화된 버튼 배경색 */
	/* border-color: #007AFF; 활성화된 버튼 테두리 색상 */
	color: white;
	/* 활성화된 버튼의 텍스트 색상 */
}

.pagination .page-link:hover {
	background-color: #007AFF;
	/* 버튼 호버 시 배경색 */
	color: white;
	/* 버튼 호버 시 텍스트 색상 */
}

.product-font {
	text-decoration: none !important;
	color: black;
}

.product-font :hover {
	color: #007AFF;
}

/* Heart Icon Styles */
.heart-icon {
	position: absolute;
	top: 10px;
	/* Adjust as needed */
	right: 10px;
	/* Adjust as needed */
	color: red;
	font-size: 24px;
	cursor: pointer;
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

<!-- 찜하기(하트) 활성화 하는 부분 -->
<script>
	$(document).ready(function() {
		$('.heart-icon').click(function() {
			$(this).toggleClass('fas far');
		});
	});
</script>

</head>

<body>

	<%@ include file="/views/common/header.jsp"%>

	<section>
		<!-- Filter and Product List Start -->
		<br>
		<div class="row">
			<!-- Filter Section -->
			<aside class="col-md-3 filter-section">
				<h3>결과 내 검색</h3>
				<!-- Search Filter -->
				<div class="mb-3">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="지역을 검색해 보세요.">
						<div class="input-group-append">
							<span class="input-group-text"><i class="fas fa-search"></i></span>
						</div>
					</div>
				</div>

				<!-- Travel Status Filter -->
				<br>
				<br>
				<h3>여행 상태</h3>
				<div class="mb-3">
					<button class="btn btn-primary">예약 가능</button>
					<button class="btn btn-primary">출발 확정</button>
				</div>

				<!-- Travel Period Filter -->
				<br>
				<br>
				<h3>여행 기간</h3>
				<div class="mb-3">
					<button class="btn btn-primary">전체</button>
					<button class="btn btn-primary">2박 3일</button>
					<button class="btn btn-primary">3박 4일</button>
				</div>
			</aside>

			<!-- Product List Section -->
			<div class="col-md-9">
				<div class="row">
					<!-- Product Card 1 -->
					<div class="col-12 mb-3">
						<div class="product-card">
							<img src="<%=contextPath%>/assets/image/london.png"> 
							<i class="far fa-heart heart-icon"></i>
							<!-- Heart Icon -->
							<div class="card-body">
								<br> <a href="#" class="product-font">
									<h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성,
										프라하 필스너 양조장 레스토랑</h3>
								</a>
								<p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
								<a href="#" class="btn btn-primary" style="width: 140px;">예약</a>
							</div>
						</div>
					</div>

					<!-- Product Card 2 -->
					<div class="col-12 mb-3">
						<div class="product-card">
							<img src="<%=contextPath%>/assets/image/london2.png"> <i
								class="far fa-heart heart-icon"></i>
							<!-- Heart Icon -->
							<div class="card-body">
								<br> <a href="" class="product-font">
									<h3 class="card-title">스페인,2대야경,3대자유시간,5성급 1박
										포함,최적의동선,런던,베키오,센느강</h3>
								</a>
								<p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
								<a href="#" class="btn btn-primary" style="width: 140px;">예약</a>
							</div>
						</div>
					</div>

					<!-- Product Card 3 -->
					<div class="col-12 mb-3">
						<div class="product-card">
							<img src="<%=contextPath%>/assets/image/spain.png"
								alt="Product Image"> <i class="far fa-heart heart-icon"></i>
							<!-- Heart Icon -->
							<div class="card-body">
								<br> <a href="" class="product-font">
									<h3 class="card-title">서유럽3국,프랑스/스위스/이탈리아,아시아나항공,베르사유궁전,클래식</h3>
								</a>
								<p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
								<a href="#" class="btn btn-primary" style="width: 140px;">예약</a>
							</div>
						</div>
					</div>

					<!-- Product Card 4 -->
					<div class="col-12 mb-3">
						<div class="product-card">
							<img src="<%=contextPath%>/assets/image/paris1.png"
								alt="Product Image"> <i class="far fa-heart heart-icon"></i>
							<!-- Heart Icon -->
							<div class="card-body">
								<br> <a href="" class="product-font">
									<h3 class="card-title">크리스마스마켓 방문로맨틱 동유럽 4국유럽2대야경5대특식대도시
										자유시간4성2박UP</h3>
								</a>
								<p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
								<a href="#" class="btn btn-primary" style="width: 140px;">예약</a>
							</div>
						</div>
					</div>

					<!-- Product Card 5 -->
					<div class="col-12 mb-3">
						<div class="product-card">
							<img src="<%=contextPath%>/assets/image/paris2.png"
								alt="Product Image"> <i class="far fa-heart heart-icon"></i>
							<!-- Heart Icon -->
							<div class="card-body">
								<br> <a href="" class="product-font">
									<h3 class="card-title">유럽3국,프랑스/스위스/이탈리아,아시아나항공,베르사유궁전,클래식,로마,콜로세움</h3>
								</a>
								<p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
								<a href="#" class="btn btn-primary" style="width: 140px;">예약</a>
							</div>
						</div>
					</div>


					<!-- Pagination -->
					<div class="d-flex justify-content-center"
						aria-label="Page navigation" style="margin: auto;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous" style="color: gray;"> <span
									aria-hidden="true">Previous</span>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">Next</span>
							</a></li>
						</ul>
					</div>


				</div>

				<!-- Filter and Product List End -->

			</div>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</html>