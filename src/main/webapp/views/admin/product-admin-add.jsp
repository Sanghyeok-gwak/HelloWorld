<%@page import="java.util.List"%>
<%@page import="com.gd.hw.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String contextPath = request.getContextPath();
	
	
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

<!-- jQuery 로드 (slim 버전이 아닌 일반 버전 사용) -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->

<!-- SummerNote -->
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
#category,#subCategory{
	width: 150px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
	height: 30px;
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

.title-name, .title-price,.file {
	display: flex;
	padding-left: 50px;
	padding-right: 50px;
}

.title-name-1, .title-price-1,.file-1 {
	width: 50%;
}

.title-name-2, .title-price-2,.file-2 {
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
			<div class="admin-page-main-item">
				<h3 style="margin: 50px;">상품등록</h3>
					<form action="<%=contextPath%>/productAdd.pro" method="post" class="was-validated">
				<div class="admin-page-product">
						<div class="category">
							<span style="font-size: 15px;">카테고리</span><br>
							<select id ="category">
								
							</select>
							<select id ="subCategory">
								
							</select>
							<input type="hidden"  id="categoryValue" name ="categoryValue">
							<input type="hidden" id="subCategoryValue" name ="subCategoryValue">
							<script>
							window.onload=function (){
								$.ajax({
									url:'<%= contextPath%>/list.mcc',
									success: function(res){
										let optionEl = ''
										for(let i =0; i<res.length; i++){
											optionEl +='<option value="' + res[i].categoryEngName + '" data-id="'+ res[i].categoryId +'">'
																 +res[i].categoryName
																
																 +'</option>'
															
										}
										$('#category').html(optionEl);
									}
								})
								// 카테고리 선택 시 서브 카테고리 불러오기
						        $('#category').change(function() {
						            const selectedCategory = $(this).val(); // 선택된 카테고리
						            const selectedCategoryId = $('#category option:selected').data('id');
						            $('#categoryValue').val(selectedCategoryId);
						            
						            $.ajax({
						            		url:'<%= contextPath%>/subList.pro',
						                data: { categoryName: selectedCategory }, // 선택한 카테고리 이름 전달
						                success: function(subRes) {
						                    let subOptionEl = '';
						                    for (let j = 0; j < subRes.length; j++) {
						                    	 subOptionEl += '<option value="' + subRes[j].regionEngName + '" data-id="'+ subRes[j].regionId +'">' 
					                             + subRes[j].regionName 
					                             + '</option>';
						                    }
						                    $('#subCategory').html(subOptionEl); // 서브 카테고리 업데이트
						                }
						            });
						         // 서브 카테고리 선택 시 값을 hidden input에 저장
						            $('#subCategory').change(function() {
						                const selectedSubCategoryId = $('#subCategory option:selected').data('id'); // data-id에서 값을 가져옴
						                $('#subCategoryValue').val(selectedSubCategoryId); // 선택된 서브 카테고리 값을 hidden input에 저장
						                console.log(selectedSubCategoryId);
						            });
						        });
							}
							</script>
							
							<hr color="lightgray">
						</div>
						<div class="title-name">
							<div class="title-name-1">
								<span style="font-size: 15px;">상품명</span><br> 
								<input type="text" name="productName" id="productName" required>
								<hr color="lightgray">
							</div>
							<div class="title-name-2">
								<span style="font-size: 15px;">항공</span><br> 
								<input type="text" name="flight" id="flight" required>
								<hr color="lightgray">
							</div>
						</div>

						<div class="file">
							<div class="file-1">
								<span style="font-size: 15px;">기본이미지</span><br> 
								<input type="text" name="productImg" id="productImg" required>
								<hr color="lightgray">
							</div>
							<div class="file-1">
								<span style="font-size: 15px;">수량</span><br> 
								<input type="number" name="amount" id="amount" required>
								<hr color="lightgray">
							</div>
						</div>

						<div class="title-name">
							<div class="title-name-1">
								<span style="font-size: 15px;">여행 시작</span><br> 
								<input type="text" name="startDate" id="startDate" placeholder="YYMMDD" required>
								<hr color="lightgray">
							</div>
							<div class="title-name-2">
								<span style="font-size: 15px;">여행 끝</span><br> 
								<input type="text" name="endDate" id="endDate" placeholder="YYMMDD" required>
								<hr color="lightgray">
							</div>
						</div>

						<div class="title-price">
							<div class="title-price-1">
								<span style="font-size: 15px;">성인 가격</span><br> 
								<input type="number" name="aPrice" id="aPrice" required>
								<hr color="lightgray">
							</div>
							<div class="title-price-2">
								<span style="font-size: 15px;">소아 가격</span><br> 
								<input type="number" name="cPrice" id="cPrice" required>
								<hr color="lightgray">
							</div>
						</div>
				</div>





				<div class="summernote-editor1">
					<h3>상품소개</h3>
					<hr color="lightgray">
					<textarea id="summernote1" name="summernote1" required></textarea>
				</div>
				<div class="summernote-editor2">
					<h3>일정표</h3>
					<hr color="lightgray">
					<textarea id="summernote2" name="summernote2" required></textarea>
				</div>
				<div class="summernote-editor3">
					<h3>상세정보</h3>
					<hr color="lightgray">
					<textarea id="summernote3" name="summernote3" required></textarea>
				</div>
				<div class="admin-page-main-btn">
					<button id="btn-4" type="submit">
						<h5>등록</h5>
					</button>
					<button id="btn-1" onclick="location.href='<%= contextPath%>/list.pro'">
						<h5>취소</h5>
					</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
<script>
$('#summernote1').summernote({
    minHeight: 200,     // 최소 높이
    maxHeight: 200,     // 최대 높이
    focus: false,       // 에디터 로딩 후 포커스를 맞출지 여부
    lang: "ko-KR",      // 한글 설정
    callbacks: {
        onImageUpload: function(images) {
            // 비동기 방식을 이용한 이미지 업로드
            for(let i = 0; i < images.length; i++) {
                let formData = new FormData();
                formData.append('image', images[i]);

                $.ajax({
                	
                    url: '<%= contextPath%>/imageUpload.pro',  
                    type: "post",
                    data: formData,
                    contentType: false,
                    processData: false,
                    async: false,
                    success: function(src) {
                        // 서버에서 반환된 이미지 경로를 summernote 에디터에 삽입
                        $('#summernote1').summernote('insertImage', src);
                        console.log(src);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Image upload failed:', textStatus, errorThrown);
                    }
                });
            }
        }
    },
    placeholder: '내용을 작성하여 주십시요',   // placeholder 설정
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
    callbacks: {
        onImageUpload: function(images) {
            // 비동기 방식을 이용한 이미지 업로드
            for(let i = 0; i < images.length; i++) {
                let formData = new FormData();
                formData.append('image', images[i]);

                $.ajax({
                	
                    url: '<%= contextPath%>/imageUpload.pro',  
                    type: "post",
                    data: formData,
                    contentType: false,
                    processData: false,
                    async: false,
                    success: function(src) {
                        // 서버에서 반환된 이미지 경로를 summernote 에디터에 삽입
                        $('#summernote2').summernote('insertImage', src);
                        console.log(src);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Image upload failed:', textStatus, errorThrown);
                    }
                });
            }
        }
    },
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
    callbacks: {
        onImageUpload: function(images) {
            // 비동기 방식을 이용한 이미지 업로드
            for(let i = 0; i < images.length; i++) {
                let formData = new FormData();
                formData.append('image', images[i]);

                $.ajax({
                	
                    url: '<%= contextPath%>/imageUpload.pro',  
                    type: "post",
                    data: formData,
                    contentType: false,
                    processData: false,
                    async: false,
                    success: function(src) {
                        // 서버에서 반환된 이미지 경로를 summernote 에디터에 삽입
                        $('#summernote3').summernote('insertImage', src);
                        console.log(src);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Image upload failed:', textStatus, errorThrown);
                    }
                });
            }
        }
    },
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