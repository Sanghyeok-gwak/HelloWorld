<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gd.hw.product.model.vo.Product"%>
<%@ page import="java.text.NumberFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
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

/* product-detail style */
.main-img {
	width: 100%;
	height: 550px;
	position: relative;
}

.product-img {
	height: 100%;
	width: 1050px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

.Rating {
	color: gold;
}

.heart-icon {
	top: 5px;
	right: 5px;
	color: red;
	font-size: 29px;
	cursor: pointer;
}

.share-icon {
	top: 5px;
	right: 5px;
	color: black;
	font-size: 29px;
	cursor: pointer;
}

.minus {
	cursor: pointer;
}

.plus {
	cursor: pointer;
}

/* 탭 버튼 스타일 */
.tabBtn {
    appearance: none; /* 기본 버튼 스타일 제거 */
    border: none; /* 테두리 제거 */
    background: transparent; /* 배경 투명 */
    user-select: none; /* 텍스트 선택 방지 */
    cursor: pointer; /* 마우스 커서 포인터로 변경 */
    padding: 20px 40px; /* 패딩을 늘려 버튼 영역 확대 */
    border-radius: 10px; /* 둥근 모서리 적용 */
    color: black; /* 텍스트 색상 검정 */
    font-size: 20px; /* 텍스트 크기 조절 */
    transition: background-color 1s;
    /* transition: background-color 0.3s ease, color 0.3s ease; 배경, 텍스트 색상 변화 시 애니메이션 적용 */
    display: block; /* 버튼이 전체 영역을 차지하도록 설정 */
    width: 100%; /* 버튼이 부모 요소의 전체 너비를 차지 */
    text-align: center; /* 텍스트를 중앙 정렬 */
}

.tabList {
    display: flex;
    justify-content: space-around;
    list-style: none;
    font-size: 22px;
    border-bottom: 1px solid lightgray;
    margin-left: 42px;
    margin-top: 20px;
}

.tabList li {
    flex: 1;
}

.tabBtn:hover {
    color: white; /* 호버 시 텍스트 색상 변경 */
    background-color: #007AFF; /* 호버 시 배경색 변경 */
    border-color: #007AFF; /* 호버 시 테두리 색상 변경 */
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 추가 */
}

/* 활성화 상태 */
.tabBtn.active {
    color: white; /* 활성화 상태 텍스트 색상 */
    background-color: #007AFF; /* 활성화 상태 배경색 */
}

.tabContent {
    margin-top: 30px;
    font-size: 20px;
    color: gray;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}

.rating-container {
	margin-bottom: 20px;
}

.Rating .fa {
	font-size: 30px;
	color: gold;
	cursor: pointer;
	transition: color 0.2s;
}

.Rating .fa.selected {
	color: #FFD700;
}
.animation-container {
      position: relative;
      display: flex;
      width: 100%;
      height: 130px;
      background-color: white;
      overflow: hidden;
      margin-left: 15px;
      margin-bottom: 30px;
    }

    .plane-icon {
      position: absolute;
      font-size: 50px;
      color: #007bff;
      top: 50%;
      left: -50px;
      transform: ;
      animation: fly-plane 5s linear infinite;
    }

    @keyframes fly-plane {
      0% {
        left: -50px;
      }
      100% {
        left: 100%;
      }
    }	
    
    ul.tabList {
    padding-left: 0px;
}
</style>

</head>

<body>
	<%@ include file="/views/common/header.jsp"%>
	<jsp:include page="productFavoritesfunction.jsp" />
	<!-- 찜하기 기능 인클루드 -->
	<section>
		<%
		Product product = (Product) request.getAttribute("product");
		if (product == null) {
			out.println("<p>상품 정보를 불러오지 못했습니다.</p>");
		} else {
		%>

		<div class="main-img">
			<img class="product-img" src="<%=product.getProductImg()%>"
				alt="Product Image">
		</div>
		<br>

		<div class="row"
			style="display: flex; justify-content: space-between; margin: 20px; margin-left: 45px;">
			<div class="col-md-6 left-div">
				<div class="col-md-12">
					<button class="btn btn-primary">예약 가능</button>
				</div>
				<br>

				<div class="col-md-12">
					<h3><%=product.getProductName()%></h3>
				</div>
			

				<br>

				<%
				NumberFormat numberFormat = NumberFormat.getInstance();
				String formattedAdultPrice = numberFormat.format(product.getaPrice());
				String formattedInfantPrice = numberFormat.format(product.getcPrice());
				%>

				<!-- 상품 상세 페이지에서 가격 부분 -->
					<div class="col-md-12 d flex justify-content-end align-items-center">
					<i class="fas fa-share-alt share-icon" style="margin-right: 20px;"></i>

					<i id="heart-icon-<%=product.getProductId()%>"
						class="far fa-heart heart-icon" style="margin-right: 90px;"
						
						onclick="toggleFavorite(<%=product.getProductId()%>, this)"></i>
						
					</div>
					<br>
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;성인 1명</h5>
				<div class="col-md-12 d-flex justify-content-end align-items-center">
					<h1 style="flex-grow: 1;"><%=formattedAdultPrice%>원~ </h1>

						
						
				</div>
						<div class="animation-container">
   					 <!-- 비행기 아이콘 -->
   					 <i class="bi bi-airplane-fill plane-icon">Hello, World~</i>
				</div>

			</div>

			<div class="col-md-6 right-div">
				<div class="p-3"
					style="border: lightgray solid 1px; border-radius: 15px; width: 430px; margin-left: 70px;">
					<h3>인원선택(필수)</h3>
					<br>

					<!-- 성인과 유아 가격 부분 -->
					<div
						style="display: flex; justify-content: space-between; align-items: center;">
						<div>
							<h3>성인(만 12세 이상)</h3>
							<h3><%=formattedAdultPrice%>원
							</h3>
						</div>

						<div style="float: right; display: flex; align-items: center;">
							<i class="fas fa-minus minus" onclick="changeCount('adult', -1)"></i>
							<h3>
								&nbsp; <span id="adultCount">0</span> &nbsp;
							</h3>
							<i class="fas fa-plus plus" onclick="changeCount('adult', 1)"></i>
						</div>
					</div>

					<br>

						<div
						style="display: flex; justify-content: space-between; align-items: center;">
						<div>
							<h3>유아 (만2세 미만)</h3>
							<h3><%=formattedInfantPrice%>원
							</h3>
						</div>

						<div style="float: right; display: flex; align-items: center;">
							<i class="fas fa-minus minus" onclick="changeCount('infant', -1)"></i>
							<h3>
								&nbsp; <span id="infantCount">0</span> &nbsp;
							</h3>
							<i class="fas fa-plus plus" onclick="changeCount('infant', 1)"></i>
						</div>
					</div>

					<br>

					<h5 style="color: lightgray;">유류할증료 및 제세공과금 포함</h5>
				</div>

				<br>

				<div>
					<h3 style="display: flex; justify-content: center;">
						총 상품 금액 &nbsp;&nbsp;&nbsp; <span id="totalAmount">0원</span>
					</h3>
				</div>

				<br> <a id="reservationLink" class="btn btn-primary"
					style="width: 83%; margin-left: 60px;"
					href="orderPage.us?productId=<%=product.getProductId()%>&aNum=0&cNum=0">예약</a>
				<br> <br>

			</div>
		</div>

		<!-- 상품 소개, 일정표, 상세 정보 탭 -->
		<div class="tabs">
			<ul class="tabList">
				<li><button class="tabBtn"
						onclick="showContent('product-info')">상품 소개</button></li>
				<li><button class="tabBtn" onclick="showContent('itinerary')">일정표</button></li>
				<li><button class="tabBtn" onclick="showContent('details')">상세 정보</button></li>
			</ul>
		</div>

		<div id="product-info" class="tabContent" style="display: block;">
			<%=product.getInfoEditor() %>
		</div>

		<div id="itinerary" class="tabContent" style="display: none;">
			<%=product.getScheduleEditor() %>
		</div>

		<div id="details" class="tabContent" style="display: none;">
			<%=product.getDetailEditor() %>
		</div>

		<%
		}
		%>
	</section>

	<!--  리뷰 모달 부분
	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reviewModalLabel">리뷰 작성 및 보기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        평점 선택
	        <div class="rating-container">
	          <div id="Rating">
	            <span class="fa fa-star" data-value="1"></span>
	            <span class="fa fa-star" data-value="2"></span>
	            <span class="fa fa-star" data-value="3"></span>
	            <span class="fa fa-star" data-value="4"></span>
	            <span class="fa fa-star" data-value="5"></span>
	          </div>
	        </div>
	        리뷰 작성
	        <div class="review-form">
	          <textarea id="reviewText" rows="4" placeholder="리뷰를 작성하세요."></textarea>
	          <button onclick="submitReview()">등록</button>
	        </div>
	        리뷰 목록
	        <div id="userReviews">
	          <h3>이전 리뷰</h3>
	          <ul id="reviewList"></ul>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div> -->

	<script>
	
    // 인원 선택 및 가격 계산
    const adultPrice = <%=product.getaPrice()%>; // A_PRICE 값으로 변경
    const infantPrice = <%=product.getcPrice()%>; // C_PRICE 값으로 변경

    function changeCount(type, delta) {
        const adultCountElement = document.getElementById('adultCount');
        const infantCountElement = document.getElementById('infantCount');

        let adultCount = parseInt(adultCountElement.textContent);
        let infantCount = parseInt(infantCountElement.textContent);

        if (type === 'adult') {
            adultCount = Math.max(0, adultCount + delta);
            adultCountElement.textContent = adultCount;
        } else if (type === 'infant') {
            infantCount = Math.max(0, infantCount + delta);
            infantCountElement.textContent = infantCount;
        }

        updateTotalAmount(adultCount, infantCount);
    }

    function updateTotalAmount(adultCount, infantCount) {
        const totalAmount = (adultCount * adultPrice) + (infantCount * infantPrice);
        document.getElementById('totalAmount').textContent = totalAmount.toLocaleString() + "원";
    }

    function showContent(contentId) {
        const contents = document.querySelectorAll('.tabContent');
        contents.forEach(content => content.style.display = 'none');
        document.getElementById(contentId).style.display = 'block';
    }
    
    
   /*  리뷰 등록 부분
 // 별점 및 리뷰 관련 스크립트
    let selectedRating = 0;
    let reviews = [];

    // 별점 클릭 이벤트
    document.querySelectorAll('#Rating .fa').forEach(star => {
      star.addEventListener('click', function () {
        const value = this.dataset.value;
        selectedRating = parseInt(value);
        resetRating();

        for (let i = 0; i < selectedRating; i++) {
          document.querySelectorAll('#Rating .fa')[i].classList.add('selected');
        }
      });
    });

    // 별점 초기화 함수
    function resetRating() {
      document.querySelectorAll('#Rating .fa').forEach(star => {
        star.classList.remove('selected');
      });
    }

    // 리뷰 제출 함수
    function submitReview() {
      const reviewText = document.getElementById('reviewText').value;
      if (reviewText && selectedRating > 0) {
        const review = { text: reviewText, rating: selectedRating };
        reviews.push(review);
        displayReviews();
        document.getElementById('reviewText').value = ''; // 입력 초기화
        resetRating(); // 별점 초기화
        selectedRating = 0;
      } else {
        alert("리뷰와 평점을 모두 입력해주세요.");
      }
    }

    // 리뷰 목록 표시 함수
    function displayReviews() {
      const reviewList = document.getElementById('reviewList');
      reviewList.innerHTML = ''; // 기존 리뷰 초기화

      reviews.forEach(review => {
        const li = document.createElement('li');
        li.textContent = `평점: ${review.rating}, 내용: ${review.text}`;
        reviewList.appendChild(li);
      });
    }
 */

    
 // URL 복사하기
    $(document).ready(function () {
        $('.share-icon').click(function () {
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('URL이 복사되었습니다.');
            });
        });
    });

    </script>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>
