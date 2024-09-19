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
<!-- SummerNote -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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

/* 상품등록 부분 */
.summernote-editor1, .summernote-editor2, .summernote-editor3,
	.admin-page-main-item-top, .category {
	padding-left: 50px;
	padding-right: 50px;
}

.admin-page-main-item-top {
	display: flex;
}

#btn-1 {
	width: 150px;
	border-radius: 5px;
	border: 1px solid #007AFF;
	margin-left: 5px;
}

#btn-3 {
	width: 150px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

#btn-4 {
	margin-right: 5px;
	width: 150px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

.admin-page-main-btn {
	display: flex;
	justify-content: center;
	margin-bottom: 50px;
}

.file {
	padding-left: 50px;
	padding-right: 50px;
}

.title-name, .title-price {
	display: flex;
	padding-left: 50px;
	padding-right: 50px;
}

.title-name-1, .title-price-1 {
	width: 50%;
}

.title-name-2, .title-price-2 {
	width: 50%;
}

.admin-page-main-item input {
	width: 500px;
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
}

.summernote-editor3 {
	margin-bottom: 50px;
}

.summernote-editor2 {
	margin-top: 50px;
	margin-bottom: 50px;
}

.summernote-editor1 {
	margin-top: 50px;
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
				<h3 style="margin: 50px;">상품등록</h3>
				<div class="admin-page-product">
					<form action="">
						<div class="category">
							<span style="font-size: 15px;">카테고리</span><br>
							<button id="btn-3">1차 카테고리</button>
							<button id="btn-3">2차 카테고리</button>
							<hr color="lightgray">
						</div>
						<div class="title-name">
							<div class="title-name-1">
								<span style="font-size: 15px;">상품명</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
							<div class="title-name-2">
								<span style="font-size: 15px;">항공</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
						</div>

						<div class="file">
							<span style="font-size: 15px;">기본이미지</span><br> <input
								type="text" name="" id="">
							<hr color="lightgray">
						</div>

						<div class="title-name">
							<div class="title-name-1">
								<span style="font-size: 15px;">여행 시작</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
							<div class="title-name-2">
								<span style="font-size: 15px;">여행 끝</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
						</div>

						<div class="title-price">
							<div class="title-price-1">
								<span style="font-size: 15px;">성인 가격</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
							<div class="title-price-2">
								<span style="font-size: 15px;">소아 가격</span><br> <input
									type="text" name="" id="">
								<hr color="lightgray">
							</div>
						</div>
				</div>





				<div class="summernote-editor1">
					<h3>상품소개</h3>
					<hr color="lightgray">
					<textarea id="summernote1" name="editordata"></textarea>
				</div>
				<div class="summernote-editor2">
					<h3>일정표</h3>
					<hr color="lightgray">
					<textarea id="summernote2" name="editordata"></textarea>
				</div>
				<div class="summernote-editor3">
					<h3>상세정보</h3>
					<hr color="lightgray">
					<textarea id="summernote3" name="editordata"></textarea>
				</div>
				</form>
				<div class="admin-page-main-btn">
					<button id="btn-4" type="submit">
						<h5>등록</h5>
					</button>
					<button id="btn-1">
						<h5>취소</h5>
					</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
<script>
  $('#summernote1').summernote({
    minHeight: 200,						// 최소 높이
    maxHeight: 200,						// 최대 높이
    focus: false,							// 에디터 로딩후 포커스를 맞출지 여부
    lang: "ko-KR",							// 한글 설정
    placeholder: '내용을 작성하여 주십시요',	//placeholder 설정
    tabsize: 2,
    height: 200,              // 에디터 높이
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['codeview', 'help']]
    ]
  });
  $('#summernote2').summernote({
    minHeight: 200,						// 최소 높이
    maxHeight: 200,						// 최대 높이
    focus: false,							// 에디터 로딩후 포커스를 맞출지 여부
    lang: "ko-KR",							// 한글 설정
    placeholder: '내용을 작성하여 주십시요',	//placeholder 설정
    tabsize: 2,
    height: 200,              // 에디터 높이
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['codeview', 'help']]
    ]
  });
  $('#summernote3').summernote({
    minHeight: 200,						// 최소 높이
    maxHeight: 200,						// 최대 높이
    focus: false,							// 에디터 로딩후 포커스를 맞출지 여부
    lang: "ko-KR",							// 한글 설정
    placeholder: '내용을 작성하여 주십시요',	//placeholder 설정
    tabsize: 2,
    height: 200,              // 에디터 높이
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['codeview', 'help']]
    ]
  });
</script>
</html>