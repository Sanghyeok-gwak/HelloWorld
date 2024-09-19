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
<!-- 추 후 추가 버튼 클릭시 알럿 추가하기  -->
<!-- 1. 3가지 이상 일 경우 "3개이상 추가 하셨습니다. 삭제 후 다시요청해주세요." -->
<!-- 2. 성공적으로 추가되었습니다. -->
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
	#banner-sub-2-1, #banner-top2 {
	display: none;
	/* 기본적으로 모든 배너 리스트 숨기기 */
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
				<div class="admin-page-main-item-list">
					<h3>활성화 배너</h3>
					<hr>
					<div class="banner-list mb-3">
						<!-- 상단 옵션  -->
						<select name="banner-name" id="bannerSelect" class="form-control">
							<option value="banner-top">상단배너</option>
							<option value="banner-sub-1">서브배너1</option>
							<option value="banner-sub-2">서브배너2</option>
							<option value="banner-sub-3">서브배너3</option>
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
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>3</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>2</td>
									<td>이벤트</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>1</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
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
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>3</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>2</td>
									<td>이벤트</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="deleteCheck"></td>
									<td>1</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
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
								<tr>
									<td></td>
									<td>3</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td></td>
									<td>2</td>
									<td>이벤트</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td></td>
									<td>1</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 서브배너3 -->
					<div id="banner-sub-3" class="banner">
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
								<tr>
									<td></td>
									<td>3</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td></td>
									<td>2</td>
									<td>이벤트</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td></td>
									<td>1</td>
									<td>상품</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
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
					<h3>리스트</h3>
					<hr>
					<div class="banner-list2 mb-3">
						<!-- 하단 옵션 -->
						<select name="banner-name" id="bannerSelect2" class="form-control">
							<option value="banner-top2">이벤트</option>
							<option value="banner-sub-2-1">여행상품</option>
						</select>
					</div>
					<div class="btn-add">
						<button id="btn-1">추가</button>
					</div>
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
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>5</td>
									<td>남미</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>4</td>
									<td>동남아</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>3</td>
									<td>유럽</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>2</td>
									<td>중국</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>1</td>
									<td>미국</td>
									<td>이미지URL</td>
									<td>상품명</td>
								</tr>
							</tbody>
						</table>
						<ul class="pagination d-flex justify-content-center text-dark"
							style="margin-top: 80px;">
							<li class="page-item disabled"><a class="page-link" href="">
									<</a></li>
							<li class="page-item active"><a class="page-link" href="">1</a></li>
							<li class="page-item"><a class="page-link" href="">2</a></li>
							<li class="page-item"><a class="page-link" href="">3</a></li>
							<li class="page-item"><a class="page-link" href="">4</a></li>
							<li class="page-item"><a class="page-link" href="">5</a></li>
							<li class="page-item"><a class="page-link" href="">></a></li>
						</ul>
					</div>
					<!-- 이벤트 리스트 -->
					<div id="banner-sub-2-1" class="banner2">
						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th width="100px"></th>
									<th width="100px">번호</th>
									<th width="300px">이벤트 기간</th>
									<th width="400px">제목</th>
									<th width="400px">이미지 URL</th>
									<th width="100px">상태</th>
									<th width="100px">남은일수</th>
									<th width="100px">조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>5</td>
									<td>2020-04-01 - 2020-04-30</td>
									<td>이벤트명</td>
									<td>이미지 URL</td>
									<td>상태</td>
									<td>일수</td>
									<td>조회</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>4</td>
									<td>2020-04-01 - 2020-04-30</td>
									<td>이벤트명</td>
									<td>이미지 URL</td>
									<td>상태</td>
									<td>일수</td>
									<td>조회</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>3</td>
									<td>2020-04-01 - 2020-04-30</td>
									<td>이벤트명</td>
									<td>이미지 URL</td>
									<td>상태</td>
									<td>일수</td>
									<td>조회</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>2</td>
									<td>2020-04-01 - 2020-04-30</td>
									<td>이벤트명</td>
									<td>이미지 URL</td>
									<td>상태</td>
									<td>일수</td>
									<td>조회</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="addCheck"></td>
									<td>1</td>
									<td>2020-04-01 - 2020-04-30</td>
									<td>이벤트명</td>
									<td>이미지 URL</td>
									<td>상태</td>
									<td>일수</td>
									<td>조회</td>
								</tr>

							</tbody>
						</table>
						<!-- 페이지네이션 -->
						<ul class="pagination d-flex justify-content-center text-dark"
							style="margin-top: 80px;">
							<li class="page-item disabled"><a class="page-link" href="">
									<</a></li>
							<li class="page-item active"><a class="page-link" href="">1</a></li>
							<li class="page-item"><a class="page-link" href="">2</a></li>
							<li class="page-item"><a class="page-link" href="">3</a></li>
							<li class="page-item"><a class="page-link" href="">4</a></li>
							<li class="page-item"><a class="page-link" href="">5</a></li>
							<li class="page-item"><a class="page-link" href="">></a></li>
						</ul>
					</div>
					<script>
            // 옵션 선택시 영역바꾸는 스크립트 -하단
            document.getElementById('bannerSelect2').addEventListener('change', function () {
              const selectedValue = this.value;

              // 모든 배너 리스트를 숨기기
              document.querySelectorAll('.banner2').forEach(container => {
                container.style.display = 'none';
              });

              // 선택된 배너 리스트만 표시하기
              const selectedBanner = document.getElementById(selectedValue);
              if (selectedBanner) {
                selectedBanner.style.display = 'block';
              }
            });

            // 페이지 로드 시 기본적으로 첫 번째 리스트를 보여주기
            document.getElementById('bannerSelect2').dispatchEvent(new Event('change'));
          </script>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>