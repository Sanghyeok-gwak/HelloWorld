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
	background-color: #f9f9f9;
	color: black;
}

.rating span {
	font-size: 25px;
	color: lightgray;
	cursor: pointer;
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

				<div class="col-md-12 Rating">
					<span class="fa fa-star"></span> <span class="fa fa-star"
						data-value="2"></span> <span class="fa fa-star" data-value="3"></span>
					<span class="fa fa-star" data-value="4"></span> <span
						class="fa fa-star" data-value="5"></span> <a href="#"
						style="color: black;"> (4.9) 리뷰 (4) 추후에 함수식 나오면 적용 </a>
				</div>

				<br>

				<%
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
		
		<div id="product-info" class="tabContent" style="display: block;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="상품 소개 이미지">
			</div>

			<div id="itinerary" class="tabContent" style="display: none;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="일정표 이미지">
			</div>

			<div id="details" class="tabContent" style="display: none;">
				<img src="<%=contextPath%>/assets/image/test.png" alt="상세 정보 이미지">
			</div>
		

		<!-- 리뷰 탭 -->
		<div id="reviews" class="tabContent" style="display: none;">
			<h2>리뷰</h2>
	
			<!-- 평점 선택 -->
			<div class="rating-container">
				<div class="col-md-12 Rating">
					<span class="fa fa-star" data-value="1"></span>
					<span class="fa fa-star" data-value="2"></span>
					<span class="fa fa-star" data-value="3"></span>
					<span class="fa fa-star" data-value="4"></span>
					<span class="fa fa-star" data-value="5"></span>
					<a href="#" style="color: black;"></a>
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
        updateReservationLink(adultCount, infantCount);
    }

    function updateTotalAmount(adultCount, infantCount) {
        const totalAmount = (adultCount * adultPrice) + (infantCount * infantPrice);
        document.getElementById('totalAmount').textContent = totalAmount.toLocaleString() + "원";
    }

    function updateReservationLink(adultCount, infantCount) {
        const reservationLink = document.getElementById('reservationLink');
        const productId = <%=product.getProductId()%>;
        reservationLink.href = `orderPage.us?productId=${productId}&aNum=${adultCount}&cNum=${infantCount}`;
    }

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

    let reviews = [];

    function submitReview() {
    	  const reviewText = document.getElementById('reviewText').value.trim();
    	  const ratingElement = document.querySelector('.Rating .fa.selected');
    	  
    	  if (!reviewText) {
    	    alert("리뷰 내용을 입력해주세요.");
    	    return;
    	  }

    	  if (!ratingElement) {
    	    alert("별점을 선택해주세요.");
    	    return;
    	  }

    	  const rating = ratingElement.dataset.value;

    	  // db에 리뷰등록
    	  $.ajax({
    	    type: 'POST',
    	    url: '/world/insert.re',
    	    data: {
    	      content: reviewText,
    	      rating: rating,
    	    },
    	    success: function(response) {
    	      if (response === "success") {
    	        displayReviews(reviewText, rating);
    	        document.getElementById('reviewText').value = '';
    	        resetRating();
    	      } else {
    	        alert("리뷰 제출에 실패했습니다. 다시 시도해주세요.");
    	      }
    	    },
    	    error: function() {
    	      alert("리뷰 제출에 실패했습니다. 다시 시도해주세요.");
    	    }
    	  });
    	}

 // 화면에 리뷰 조회
    function loadReviews() {
        const productId = <%=product.getProductId()%>;

        $.ajax({
            type: 'GET',
            url: '/world/select.re', // 리뷰 데이터를 가져오는 URL
            data: { productId: productId },
            dataType: 'json', // 서버에서 JSON 응답을 기대
            success: function(response) {
                const reviewList = document.getElementById('reviewList');
                reviewList.innerHTML = ''; // 기존 리뷰 초기화

                if (response.length > 0) {
                    response.forEach(function(review) {
                        const li = document.createElement('li');
                        li.innerHTML = `<strong>평점:</strong> ${review.rating} / 5<br><strong>내용:</strong> ${review.content}`;
                        li.style.padding = "10px";
                        li.style.borderBottom = "1px solid #ccc";
                        reviewList.appendChild(li);
                    });
                } else {
                    reviewList.innerHTML = '<li>등록된 리뷰가 없습니다.</li>';
                }
            },
            error: function(xhr, status, error) {
                console.error("리뷰 데이터를 불러오는 데 실패했습니다:", status, error);
                alert("리뷰 데이터를 불러오는 데 실패했습니다.");
            }
        });
    }

    $(document).ready(function() {
        loadReviews();
    });

    function displayReviews(reviewText, rating) {
        const reviewList = document.getElementById('reviewList');
        const li = document.createElement('li');
        li.innerHTML = `<strong>평점:</strong> ${rating} / 5<br><strong>내용:</strong> ${reviewText}`;
        reviewList.appendChild(li);
    }

    function resetRating() {
        const stars = document.querySelectorAll('.Rating .fa');
        stars.forEach(star => {
            star.classList.remove('selected');
        });
    }

    // 별점 클릭 이벤트
    document.querySelectorAll('.Rating .fa').forEach(star => {
        star.addEventListener('click', function () {
            const value = this.dataset.value;
            resetRating(); // 기존 선택한 별점 초기화

            for (let i = 0; i < value; i++) {
                star.parentNode.children[i].classList.add('selected');
            }
        });
    });
    

    $(document).ready(function() {
        loadReviews();
    });

    function displayReviews(reviewText, rating) {
        const reviewList = document.getElementById('reviewList');
        const li = document.createElement('li');
        li.innerHTML = `<strong>평점:</strong> ${rating} / 5<br><strong>내용:</strong> ${reviewText}`;
        reviewList.appendChild(li);
    } 
    

    function resetRating() {
        const stars = document.querySelectorAll('.Rating .fa');
        stars.forEach(star => {
            star.classList.remove('selected');
        });
    }

    document.querySelectorAll('.Rating .fa').forEach(star => {
        star.addEventListener('click', function () {
            const value = this.dataset.value;
            resetRating();

            for (let i = 0; i < value; i++) {
                star.parentNode.children[i].classList.add('selected');
            }
        });
    });
    
    
    
	</script>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>
