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
	/* 또는 원하는 너비로 설정 */
	height: 550px;
	/* 고정 높이 */
	position: relative;
	/* 절대 위치 지정 요소를 위한 기준 */
}

.product-img {
	height: 100%;
	/* 높이를 div에 맞춤 */
	width: 1050px;
	/* 비율을 유지하며 너비 조정 */
	position: absolute;
	/* 절대 위치 지정 */
	left: 50%;
	/* 가운데 정렬 */
	transform: translateX(-50%);
	/* 중앙으로 이동 */
}

.Rating {
	color: gold;
}

/* Heart Icon Styles */
.heart-icon {
	position: absolute;
	top: 10px;
	right: 5px;
	color: red;
	font-size: 24px;
	cursor: pointer;
}

.share-icon {
	position: absolute;
	top: 10px;
	right: 5px;
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
	/* 버튼 내부 여백 조정 */
	border-radius: 5px;
	/* 모서리 곡률 */
	color: black;
	/* 기본 글자 색상 */
	transition: background-color 0.3s, color 0.3s, border-color 0.3s;
	/* 애니메이션 효과 */
}

.tabList {
	display: flex;
	justify-content: flex-start;
	/* 공간을 균등하게 분배 */
	list-style: none;
	font-size: 22px;
	border-bottom: 1px solid lightgray;
	/* 회색 밑줄 추가 */
	width: fit-content;
	margin-left: 42px;
	/* 왼쪽 여백 */
}

.tabList li {
	margin: 0 85px;
	/* 버튼 사이 간격 조정 */
}

/* hover 효과 */
.tabBtn:hover {
	color: white;
	/* hover 시 글자 색상 변경 */
	background-color: #007AFF;
	/* hover 시 배경 색상 변경 */
	border-color: #007AFF;
	/* hover 시 테두리 색상 변경 */
}

.tabContent {
	margin-top: 30px;
	/* 콘텐츠와 버튼 사이 여백 */
	font-size: 20px;
	/* 기본 글자 크기 */
	color: gray;
	/* 기본 글자 색상 */
	max-width: 900px;
	/* 원하는 최대 너비 설정 */
	margin-left: auto;
	/* 자동 여백으로 중앙 정렬 */
	margin-right: auto;
	/* 자동 여백으로 중앙 정렬 */
	text-align: center;
	/* 텍스트 중앙 정렬 */
}

.rating-container {
	margin-bottom: 20px;
	/* 평점과 리뷰 입력 간 간격 */
}

.Rating .fa {
	font-size: 30px;
	/* 별 크기 */
	color: gray;
	/* 기본 별 색상 */
	cursor: pointer;
	/* 마우스 커서 변경 */
	transition: color 0.2s;
	/* 부드러운 색상 전환 */
}

.Rating .fa.selected {
	color: #FFD700;
	/* 선택된 별 색상 */
}

.review-form {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

textarea {
	width: 100%;
	padding: 10px;
	/* 텍스트 상자 안쪽 여백 */
	border-radius: 5px;
	/* 모서리 둥글게 */
	border: 1px solid lightgray;
	/* 테두리 */
	resize: none;
	/* 크기 조정 비활성화 */
}

button {
	margin-top: 10px;
	padding: 10px;
	/* 버튼 안쪽 여백 */
	border: none;
	/* 테두리 제거 */
	border-radius: 5px;
	/* 모서리 둥글게 */
	background-color: #007AFF;
	/* 버튼 배경 색상 */
	color: white;
	/* 버튼 글자 색상 */
	cursor: pointer;
	/* 마우스 커서 변경 */
	transition: background-color 0.3s;
	/* 부드러운 배경색 전환 */
}

button:hover {
	background-color: #0056b3;
	/* hover 시 배경 색상 */
}

#userReviews {
	margin-top: 20px;
	/* 사용자 리뷰와 간격 */
}

#userReviews h3 {
	margin-bottom: 10px;
	/* 제목 아래 여백 */
}

#reviewList {
	list-style: none;
	/* 기본 리스트 스타일 제거 */
	padding: 0;
	/* 패딩 제거 */
}

#reviewList li {
	margin-bottom: 10px;
	/* 각 리뷰 사이 간격 */
	padding: 10px;
	/* 리뷰 항목 안쪽 여백 */
	border: 1px solid lightgray;
	/* 테두리 */
	border-radius: 5px;
	/* 모서리 둥글게 */
	background-color: #f9f9f9;
	/* 배경 색상 */
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
	/* 활성화된 색상 */
}

.rating {
	color: gold;
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
			<!-- 하트 및 공유 아이콘을 이미지 위에 배치 -->
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

				<div class="col-md-12 Rating">
					<span class="fa fa-star"></span> <span class="fa fa-star"
						data-value="2"></span> <span class="fa fa-star" data-value="3"></span>
					<span class="fa fa-star" data-value="4"></span> <span
						class="fa fa-star" data-value="5"></span> <a href="#"
						style="color: black;"> (4.9) 리뷰 (4) 추후에 함수식 나오면 적용 </a>
				</div>

				<br>

				<%
				// 성인과 유아 가격을 3자리마다 쉼표로 포맷
				NumberFormat numberFormat = NumberFormat.getInstance();
				String formattedAdultPrice = numberFormat.format(product.getaPrice());
				String formattedInfantPrice = numberFormat.format(product.getcPrice());
				%>



				<!-- 상품 상세 페이지에서 가격 부분 -->
				<div class="col-md-12 d-flex justify-content-end align-items-center">
					<h1 style="flex-grow: 1;"><%=formattedAdultPrice%>원~
					</h1>

					<i class="fas fa-share-alt share-icon" style="margin-right: 250px;"></i>

					<i id="heart-icon-<%=product.getProductId()%>"
						class="far fa-heart heart-icon" style="margin-right: 200px;"
						onclick="toggleFavorite(<%=product.getProductId()%>, this)"></i>
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
					href="orderPage.us?productId=<%=product.getProductId()%>">예약</a> <br>
				<br>

			</div>
		</div>


		<!-- 상품 소개, 일정표, 상세 정보, 리뷰 탭 -->
		<div class="tabs">
			<ul class="tabList">
				<li><button class="tabBtn"
						onclick="showContent('product-info')">상품 소개</button></li>
				<li><button class="tabBtn" onclick="showContent('itinerary')">일정표</button></li>
				<li><button class="tabBtn" onclick="showContent('details')">상세
						정보</button></li>
				<li><button class="tabBtn" onclick="showContent('reviews')">리뷰</button></li>
			</ul>
		</div>

		<div id="content">
			<div id="product-info" class="tabContent" style="display: block;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="상품 소개 이미지">
			</div>

			<div id="itinerary" class="tabContent" style="display: none;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="일정표 이미지">
			</div>

			<div id="details" class="tabContent" style="display: none;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="상세 정보 이미지">
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

			<%
			}
			%>
		
	</section>

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
        
     // 인원수를 URL로 넘겨주기 위한 예약 링크 업데이트
        updateReservationLink(adultCount, infantCount);
    }

    // 성인,유아 가격 더해서 결과값 조회
    function updateTotalAmount(adultCount, infantCount) {
        const totalAmount = (adultCount * adultPrice) + (infantCount * infantPrice);
        document.getElementById('totalAmount').textContent = totalAmount.toLocaleString() + "원";
    }
    
    function updateReservationLink(adultCount, infantCount) {
        const reservationLink = document.getElementById('reservationLink');
        const productId = <%=product.getProductId()%>;  // 현재 상품의 ID
        reservationLink.href = `orderPage.us?productId=${productId}&aNum=${adultCount}&cNum=${infantCount}`;
    }
    
    
    // 하단 상세정보등 탭 클릭시 변하는
    function showContent(contentId) {
        const contents = document.querySelectorAll('.tabContent');
        contents.forEach(content => content.style.display = 'none');
        document.getElementById(contentId).style.display = 'block';
    }

    // URL 복사하기
    $(document).ready(function () {
        $('.share-icon').click(function () {
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('URL이 복사되었습니다.');
            });
        });
    });
    
    
    
 // 리뷰 관리 목록
    let reviews = [];

    // 리뷰 제출 및 서버로 전송
    function submitReview() {
      const reviewText = document.getElementById('reviewText').value;
      const rating = document.querySelector('.Rating .fa.fa-star.selected');

      if (reviewText && rating) {
        const review = {
          text: reviewText,
          rating: rating.dataset.value
        };
        
        // AJAX 요청으로 서버에 리뷰 전송
        $.ajax({
          type: 'POST',
          url: '<%=contextPath%>/insert.re', // 서버 측 URL 변경 필요
          data: {
        	  review: {reviewNo},
            userNo: {userNo},
            con,
            rating: review.rating
          },
          success: function(response) {
            // 성공적으로 서버에 전송된 경우, 화면에 리뷰 표시
            reviews.push(review);
            displayReviews();
            document.getElementById('reviewText').value = ''; // 텍스트 상자 초기화
            resetRating(); // 별 초기화
          },
          error: function() {
            alert("리뷰 제출에 실패했습니다. 다시 시도해주세요.");
          }
        });
      } else {
        alert("리뷰와 평점을 모두 입력해주세요.");
      }
    }

    // 리뷰 목록을 화면에 표시
    function displayReviews() {
      const reviewList = document.getElementById('reviewList');
      reviewList.innerHTML = ''; // 이전 리뷰 초기화

      reviews.forEach(review => {
        const li = document.createElement('li');
        li.textContent = `평점: ${review.rating}, 내용: ${review.text}`;
        reviewList.appendChild(li);
      });
    }

    // 평점 초기화
    function resetRating() {
      const stars = document.querySelectorAll('.Rating .fa');
      stars.forEach(star => {
        star.classList.remove('selected');
      });
    }

    // 평점 클릭 시 처리
    document.querySelectorAll('.Rating .fa').forEach(star => {
      star.addEventListener('click', function () {
        const value = this.dataset.value;
        resetRating(); // 이전 선택 초기화

        for (let i = 0; i < value; i++) {
          star.parentNode.children[i].classList.add('selected'); // 선택된 별 표시
        }
      });
    });

    
    
	</script>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>
