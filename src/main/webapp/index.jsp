<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.notice-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 40px 60px;
	background: rgba(255, 255, 255, 0.1);
	max-width: 1000px;
	margin: 100px auto;
	border-radius: 30px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
	backdrop-filter: blur(10px);
	border: 2px solid rgba(255, 255, 255, 0.3);
	position: relative;
	overflow: hidden;
}

.notice-box::before {
	content: '';
	position: absolute;
	top: 0;
	left: -50%;
	width: 200%;
	height: 100%;
	background: linear-gradient(120deg, rgba(255, 255, 255, 0.2),
		rgba(255, 255, 255, 0));
	transform: skewX(-30deg);
	transition: 0.8s;
}

.notice-box:hover::before {
	left: 150%;
}

.notice-box-text span {
	font-size: 18px;
	font-weight: bold;
	color: black;
	letter-spacing: 1.2px;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
	position: relative;
	z-index: 1;
}

.notice-box-text {
	flex: 1;
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.notice-box-btn {
	flex: 1;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.notice-box-btn button {
	font-size: 20px;
	font-weight: bold;
	padding: 14px 40px;
	color: #fff;
	background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
	border: none;
	border-radius: 30px;
	cursor: pointer;
	position: relative;
	z-index: 1;
	overflow: hidden;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease;
}

.notice-box-btn button::before {
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 300%;
	background-color: rgba(255, 255, 255, 0.2);
	transition: all 0.6s ease;
	border-radius: 50%;
	transform: translate(-50%, -50%) scale(0);
}

.notice-box-btn button:hover::before {
	transform: translate(-50%, -50%) scale(1);
}

.notice-box-btn button:hover {
	background: linear-gradient(135deg, #6dd5fa 0%, #2193b0 100%);
	transform: scale(1.05);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.card {
	width: 250px;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 6px rgba(0, 0, 0, 0.2);
	transition: box-shadow 0.3s ease;
	border-radius: 10px;
}

.card:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.card img {
	border-radius: 10px 10px 0 0;
}

.popular-title, .imminent-title {
	font-size: 28px;
	font-weight: bold;
	color: #4A90E2;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
	margin-left: 10px;
	letter-spacing: 1px;
	transition: color 0.3s;
}

.popular-title:hover, .imminent-title:hover {
	color: #FF6347;
}

/* 메인페이지 */
.main-popular-products, .main-popular-imminent {
	margin-top: 100px;
}

.main-popular-products-sub, .main-popular-imminent-sub {
	display: flex;
	justify-content: center;
}

.main-popular-products-text, .main-popular-imminent-text,
	.main-event-text {
	text-align: center;
	margin-bottom: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.main-deadline-imminent, .main-event {
	margin-top: 50px;
}

.main-event {
	margin-bottom: 200px;
}

.card-title {
	font-size: 15px;
}
</style>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div id="main-top" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#main-top" data-slide-to="0" class="active"></li>
				<li data-target="#main-top" data-slide-to="1"></li>
				<li data-target="#main-top" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div id ="main-top-banner" class="carousel-inner">
				
	                
                
				
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#main-top" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> 
			<a class="carousel-control-next" href="#main-top" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>
		
		<div class="helloworld-main-sub">
			<div class="notice-box">
				<div class="notice-box-text">
					<span>✈️ 여행을 떠나기 전, 필수 정보를 꼭 확인하세요!</span>
				</div>
				<div class="notice-box-btn">
					<button onclick="location.href='<%=contextPath%>/list.no'">필수 공지 확인하기</button>
				</div>
			</div>
			<div class="main-popular-products">
				<div class="main-popular-products-text">
					<img src="./assets/image/fire.gif" alt="fire" width="100px"
						height="100px">
					<h3>인기상품</h3>
				</div>
				<div class="main-popular-products-sub">
					
				</div>
			</div>

			<!------------------------------------------------------------------------------------------------------------->
			<div class="main-deadline-imminent" style="margin-bottom : 100px;">
				<div class="main-popular-imminent-text">
					<img src="./assets/image/time.gif" alt="fire" width="100px"
						height="100px">
					<h3>마감임박</h3>
				</div>

				<div class="main-popular-imminent-sub">
					
				</div>

			</div>
		</div>


	</section>
	
	<script>
	
	 window.onload = function () {
	        $.ajax({
	            url: '<%= contextPath%>/list.mcc', // 카테고리 리스트를 가져오는 URL
	            success: function(res) {
	                let liEl = '';
	                for (let i = 0; i < res.length; i++) {
	                    // 카테고리 클릭 시 해당 카테고리 이름을 productlist 서블릿으로 전달
	                    liEl += '<li id="world-navbav-nav" class="nav-item">'
	                          + '<a class="nav-link" href="' + '<%=contextPath %>/productList.pr?categoryName=' + res[i].categoryName + '">'
	                          + '<h3>' + res[i].categoryName + '</h3>'
	                          + '</a></li>';
	                }
	                $('#world-navbar-nav').html(liEl);
	            }
	        });
		$.ajax({
			url:'<%= contextPath%>/bannerList.bn',
			success: function(res){
				let topDivEl = '';
				let sub1DivEl = '';
				let sub2DivEl = '';
					for(let i =0; i<res.length; i++){
						
						if(res[i].status === 'M') {
							if(i==0){
								topDivEl += '<div class="carousel-item active">'
									+'<img src="' + res[i].img + '" width="100%" height="400px" >'
									+'</div>';
								
							}else if(i==1){
								topDivEl += '<div class="carousel-item">'
									+'<img src="' + res[i].img + '" width="100%" height="400px" >'
									+'</div>';	
							}else if (i==2){
								topDivEl += '<div class="carousel-item">'
									+'<img src="' + res[i].img + '" width="100%" height="400px" >'
									+'</div>';
							}
						}
						else if(res[i].status === 'H'){
							sub1DivEl += '<div class="card" style="width: 250px; margin-left:10px; border-radius: 5px; margin-right:10px; cursor: pointer;" onclick="window.location.href=\'productDetail.pr?productId='+res[i].proNo+'\'">'
									   + '<img class="card-img-top" src="'+res[i].img+'" alt="Card image" style="height: 180px;">'
									   + '<div class="card-body">'
									   + '<h4 class="card-title" style="height: 60px;" >'+res[i].tietle+'</h4>'
									   + '<p class="card-text"> <h5>'+parseInt(res[i].price).toLocaleString()+'원'+'</h5> </p>'
									   + '</div>'
									   + '</div>'
						}
						else if(res[i].status === 'D'){
							sub2DivEl += '<div class="card" style="width: 250px; margin-left:10px; border-radius: 5px; margin-right:10px; cursor: pointer;" onclick="window.location.href=\'productDetail.pr?productId='+res[i].proNo+'\'">'
								   + '<img class="card-img-top" src="'+res[i].img+'" alt="Card image"  style="height: 180px;">'
								   + '<div class="card-body">'
								   + '<h4 class="card-title" style="height: 60px;">'+res[i].tietle+'</h4>'
								   + '<p class="card-text"> <h5>'+parseInt(res[i].price).toLocaleString()+'원'+'</h5> </p>'
								   + '</div>'
								   + '</div>'
						}
						
						
						
										
					}
				
				$('#main-top-banner').html(topDivEl);
				$('.main-popular-products-sub').html(sub1DivEl);
				$('.main-popular-imminent-sub').html(sub2DivEl);
			}
		})
	    }
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>