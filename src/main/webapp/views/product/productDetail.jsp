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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- 별점링크-->
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

/* Heart Icon Styles */
.heart-icon {
	position: absolute;
	top : 8px;
	right: 300px;
	color: red;
	font-size: 24px;
	cursor: pointer;
}

.share-icon {
	position: absolute;
	top : 8px;
	right: 260px;
	color: black;
	font-size: 24px;
	cursor: pointer;
}

.minus {
	cursor: pointer;
}

.plus {
	cursor: pointer;
}

.tabBtn {
	appearance: none;
	border: none;
	background: transparent;
	user-select: none;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 5px;
	color: black;
	transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

.tabList {
	display: flex;
	justify-content: flex-start;
	list-style: none;
	font-size: 22px;
	border-bottom: 1px solid lightgray;
	width: fit-content;
	margin-left: 42px;
}

.tabList li {
	margin: 0 85px;
}

/* hover 효과 */
.tabBtn:hover {
	color: white;
	background-color: #007AFF;
	border-color: #007AFF;
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
	color: gray;
	cursor: pointer;
	transition: color 0.2s;
}

.Rating .fa.selected {
	color: #FFD700;
}

.review-form {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

textarea {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid lightgray;
	resize: none;
}

button {
	margin-top: 10px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #007AFF;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #0056b3;
}

#userReviews {
	margin-top: 20px;
}

#userReviews h3 {
	margin-bottom: 10px;
	/* 제목 아래 여백 */
}

#reviewList {
	list-style: none;
	padding: 0;
}

#reviewList li {
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 5px;
	background-color: #f9f9f9; . rating span { font-size : 25px;
	color: lightgray;
	cursor: pointer;
}

.rating span {
	font-size: 25px;
	color: lightgray;
	/* 비활성화된 색상 */
	cursor: pointer;
	/* 포인터 변경 */
}

.rating span:hover {
	color: gold;
}

.rating span.active {
	color: gold;
}

.rating {
	color: gold;
}
</style>

</head>

<%@ include file="/views/common/header.jsp"%>

<section>
	<div class="main-img">
		<img class="product-img"
			src="<%=contextPath%>/assets/image/london.png">
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
				<h3>[가을특가] 스페인, 2대야경, 3대자유시간, 5성급 1박 포함, 최적의동선, 런던, 베키오, 센느강</h3>
			</div>

			<br>
			<div class="col-md-12 Rating">
				<span class="fa fa-star"></span> 
				<span class="fa fa-star"data-value="2"></span>
			  <span class="fa fa-star" data-value="3"></span>
				<span class="fa fa-star" data-value="4"></span> 
				<span class="fa fa-star" data-value="5"></span> 
				<a href="" style="color: black;"> (4.9) 리뷰 (4) </a>
			</div>

			<br>

			<div class="col-12">
				<h1>28282821원~
				<i class="fas fa-share-alt share-icon"></i>
				 <i class="far fa-heart heart-icon"></i>
				</h1>
			</div>
		</div>

		<div class="col-md-6 right-div">
			<div class="p-3"
				style="border: lightgray solid 1px; border-radius: 15px; width: 430px; margin-left: 70px;">
				<h3>인원선택(필수)</h3>
				<br>

				<div
					style="display: flex; justify-content: space-between; align-items: center;">
					<div>
						<h3>성인(만 12세 이상)</h3>
						<h3>2,800,000원</h3>
					</div>
					<div style="float: right; display: flex; align-items: center;">
						<i class="fas fa-minus minus" onclick="changeCount('adult', -1)"></i>
						<h3 style="display: inline-block; margin: 0;">
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
						<h3>1,800,000원</h3>
					</div>
					<div style="float: right; display: flex; align-items: center;">
						<i class="fas fa-minus minus" onclick="changeCount('infant', -1)"></i>
						<h3 style="display: inline-block; margin: 0;">
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
			<br>
			<button class="btn btn-primary"
				style="width: 83%; margin-left: 60px;">예약하기</button>
			<br> <br>
		</div>


		<div style=>
			<!-- 상품소개 ,일정표, 상세정보 , 리뷰 페이지-->

			<div class="tabs">
				<ul class="tabList">
					<li>
						<button class="tabBtn" onclick="showContent('product-info')">상품소개</button>
					</li>
					<li>
						<button class="tabBtn" onclick="showContent('itinerary')">일정표</button>
					</li>
					<li>
						<button class="tabBtn" onclick="showContent('details')">상세정보</button>
					</li>
					<li>
						<button class="tabBtn" onclick="showContent('reviews')">리뷰</button>
					</li>
				</ul>
			</div>

			<div id="content">
				<div id="product-info" class="tabContent" style="display: block;">
					<img src="<%=contextPath%>/assets/image/상품소개.png">
				</div>
				<div id="itinerary" class="tabContent" style="display: none;">
					<img src="<%=contextPath%>/assets/image/일정표.png">
				</div>
				<div id="details" class="tabContent" style="display: none;">
					<img src="<%=contextPath%>/assets/image/상세정보.png">
				</div>
				<div id="reviews" class="tabContent" style="display: none;">

					<h2>리뷰</h2>

					<!-- 평점 선택 -->
					<div class="rating-container">
						<div class="col-md-12 Rating">
							<span class="fa fa-star" data-value="1"></span> <span
								class="fa fa-star" data-value="2"></span> <span
								class="fa fa-star" data-value="3"></span> <span
								class="fa fa-star" data-value="4"></span> <span
								class="fa fa-star" data-value="5"></span> <a href="#"
								style="color: black;"></a>
						</div>
					</div>

					<!-- 리뷰 작성 텍스트 상자 -->
					<div class="review-form">
						<textarea id="reviewText" rows="4" placeholder="리뷰를 작성하세요."></textarea>
						<button onclick="submitReview()">등록</button>
					</div>

					<!-- 이전 리뷰 표시 -->
					<div id="userReviews">
						<h3>이전 리뷰가 나올곳</h3>
						<ul id="reviewList">
							<!-- 여기에 이전 리뷰가 추가됩니다 -->
						</ul>
					</div>
				</div>


			</div>

		</div>




	</div>

	<script>

  // 인원선택 및 가격변경
const adultPrice = 2800000; // 성인 1명의 가격
const infantPrice = 1800000; // 유아 1명의 가격

function changeCount(type, delta) {
  const adultCountElement = document.getElementById('adultCount');
  const infantCountElement = document.getElementById('infantCount');
  
  let adultCount = parseInt(adultCountElement.textContent);
  let infantCount = parseInt(infantCountElement.textContent);
  
  if (type === 'adult') {
    adultCount = Math.max(0, adultCount + delta); // 최소 0으로 제한
    adultCountElement.textContent = adultCount;
  } else if (type === 'infant') {
    infantCount = Math.max(0, infantCount + delta); // 최소 0으로 제한
    infantCountElement.textContent = infantCount;
  }
  
  updateTotalAmount(adultCount, infantCount);
}

function updateTotalAmount(adultCount, infantCount) {
  const totalAmount = (adultCount * adultPrice) + (infantCount * infantPrice);
  const totalAmountElement = document.getElementById('totalAmount');
  totalAmountElement.textContent = totalAmount.toLocaleString() + "원"; // 천 단위 구분기호 추가
}

function showContent(contentId) {
  // 모든 콘텐츠 숨기기
  const contents = document.querySelectorAll('.tabContent');
  contents.forEach(content => {
    content.style.display = 'none';
  });
  
  // 선택된 콘텐츠만 보이기
  const selectedContent = document.getElementById(contentId);
  if (selectedContent) {
    selectedContent.style.display = 'block';
  }
}

// 리뷰 관리 목록
let reviews = [];

function submitReview() {
  const reviewText = document.getElementById('reviewText').value;
  const rating = document.querySelector('.Rating .fa.fa-star.selected');
  
  if (reviewText && rating) {
    const review = {
      text: reviewText,
      rating: rating.dataset.value
    };
    
    reviews.push(review);
    displayReviews();
    document.getElementById('reviewText').value = ''; // 텍스트 상자 초기화
    resetRating(); // 별 초기화
  } else {
    alert("리뷰와 평점을 모두 입력해주세요.");
  }
}

function displayReviews() {
  const reviewList = document.getElementById('reviewList');
  reviewList.innerHTML = ''; // 이전 리뷰 초기화
  
  reviews.forEach(review => {
    const li = document.createElement('li');
    li.textContent = `평점: ${review.rating}, 내용: ${review.text}`;
    reviewList.appendChild(li);
  });
}

// 리뷰 평점 
function resetRating() {
  const stars = document.querySelectorAll('.Rating .fa');
  stars.forEach(star => {
    star.classList.remove('selected');
  });
}

document.querySelectorAll('.Rating .fa').forEach(star => {
  star.addEventListener('click', function () {
    const value = this.dataset.value;
    
    resetRating(); // 이전 선택 초기화
    for (let i = 0; i < value; i++) {
      star.parentNode.children[i].classList.add('selected'); // 선택된 별 표시
    }
  });
});

// 찜하기(하트) 활성화 하는 부분
$(document).ready(function () {
  $('.heart-icon').click(function () {
    $(this).toggleClass('fas far');
  });
});


</script>

</section>
<%@ include file="/views/common/footer.jsp"%>


</body>

</html>