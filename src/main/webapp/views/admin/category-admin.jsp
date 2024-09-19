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

/* 상품등록 부분 */
.admin-page-main-item {
	display: flex;
	padding: 50px;
}

.category-left, .category-right {
	width: 50%;
	height: 100%;
	padding: 20px;
}

.category-left {
	border-right: 1px solid lightgray;
}

.category-left-text, .category-right-text {
	text-align: center;
}

.category-left-box, .category-right-box {
	margin: 30px;
	padding: 20px;
	background-color: rgb(240, 236, 236);
	border-radius: 5px;
}

.category-left-box ul, .category-right-box ul {
	list-style: none;
	padding: 0;
}

.category-left-box li, .category-right-box li {
	padding: 10px;
	cursor: pointer;
}

.category-left-box li:hover, .category-right-box li:hover {
	background-color: #e0e0e0;
}

.category-right-box>div {
	display: none;
}

.category-right-box .active {
	display: block;
}

.category-left-box button {
	margin-left: 10px;
}

#categories-no {
	display: inline-block;
	width: 100px;
	font-size: 15px;
	text-align: center;
}

#categories-name {
	display: inline-block;
	width: 150px;
	font-size: 15px;
	text-align: center;
}

#btn-3, #add-city-btn {
	width: 100px;
	border-radius: 5px;
	background-color: #ffffff;
	border: 1px solid lightgray;
	color: black;
}

ul {
	margin: 0px;
}

#btn-1 {
	width: 100px;
	border-radius: 5px;
	border: 1px solid #007AFF;
	margin-left: 5px;
}

.add-categories-btn {
	text-align: end;
}

.modal-body {
	text-align: left;
}

.modal-text {
	padding-right: 20px;
}

.modal-body input[name=categories-title] {
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 100%;
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
					<button id="btn-2" class="btn" onclick="location.href='<%= contextPath%>/list.cg'">카테고리
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
				<div class="category-left">

					<div class="category-left-text">
						<h3>카테고리 1</h3>
					</div>
					<hr>
					<div class="category-left-box">
						<!-- 기능들어갈때 target에 카테고리 명을 넣던가 아님 카테고리2와 조인되는 값을 넣기 -->
						<!-- 임시로 설정한값들 -->

						<!-- 6개이상 추가 x -->
						<ul id="categories1">
							<li data-target="usaCities"><span id="categories-no">01</span>
								<span id="categories-name">미국</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
							<li data-target="europeCities"><span id="categories-no">
									02</span> <span id="categories-name">유럽</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
							<li data-target="southAmericaCities"><span
								id="categories-no">03</span> <span id="categories-name">남미</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
							<li data-target="japanCities"><span id="categories-no">04</span>
								<span id="categories-name">일본</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
							<li data-target="chinaCities"><span id="categories-no">05</span>
								<span id="categories-name">중국</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
							<li data-target="southeastAsiaCities"><span
								id="categories-no">06</span> <span id="categories-name">동남아</span>
								<button id="btn-3" type="button" class="btn" data-toggle="modal"
									data-target="#categories1-edit">수정하기</button></li>
						</ul>
					</div>
					<!-- 수정하기버튼 팝업 -->

					<!-- The Modal -->
					<div class="modal" id="categories1-edit">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h3 class="modal-title">카테고리 유형</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div id="modal-text-box">카테고리 명</div>
									<input type="text" id="modal-input" name="categories-title">
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" id="btn-3" class="btn"
										data-dismiss="modal">등록</button>
									<button type="button" id="btn-1" class="btn"
										data-dismiss="modal">취소</button>
								</div>

							</div>
						</div>
					</div>
					<script>
            document.querySelectorAll('#categories1 button').forEach(button => {
              button.addEventListener('click', function() {
                // 부모 li 요소에서 카테고리명 추출
                const li = this.parentElement;
                const categoryName = li.querySelector('#categories-name').textContent;
        
                // 모달의 인풋 박스에 카테고리명 설정
                document.getElementById('modal-input').value = categoryName;
              });
            });
          </script>

					<!-- 등록하기버튼 팝업 -->
					<div class="add-categories-btn">
						<button id="btn-1" type="button" class="btn" data-toggle="modal"
							data-target="#categories1-add" style="float: inline-end;">등록하기</button>

						<!-- left Add modal -->
						<!-- The Modal -->
						<div class="modal" id="categories1-add">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h3 class="modal-title">카테고리 유형</h3>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<div id="modal-text-box">카테고리 명</div>
										<input type="text" name="categories-title">
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" id="btn-3" class="btn"
											data-dismiss="modal">등록</button>
										<button type="button" id="btn-1" class="btn"
											data-dismiss="modal">취소</button>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="category-right">

					<div class="category-right-text">
						<h3>카테고리 2</h3>
					</div>
					<hr>
					<div class="category-right-box">
						<div id="usaCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">뉴욕</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">샌프란시스코</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="usaCities">추가</button>
								</li>
							</ul>
						</div>
						<div id="europeCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">파리</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">로마</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="europeCities">추가</button>
								</li>
							</ul>
						</div>
						<div id="southAmericaCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">부에노스아이레스</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">리우데자네이루</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="southAmericaCities">추가</button>
								</li>
							</ul>
						</div>
						<div id="japanCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">오사카</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">도쿄</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="japanCities">추가</button>
								</li>
							</ul>
						</div>
						<div id="chinaCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">상하이</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">베이징</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="chinaCities">추가</button>
								</li>
							</ul>
						</div>
						<div id="southeastAsiaCities">
							<ul class="categories2">
								<li><span id="categories-no">01</span> <span
									class="categories-name2">방콕</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li><span id="categories-no">02</span> <span
									class="categories-name2">호치민</span>
									<button id="btn-3" type="button" data-toggle="modal"
										data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn"
										data-toggle="modal" data-target="#categories2-add"
										data-area="southeastAsiaCities">추가</button>
								</li>
							</ul>
						</div>
					</div>
					<!-- 수정하기버튼 팝업 -->

					<!-- The Modal -->
					<div class="modal" id="categories2-edit">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h3 class="modal-title">카테고리 유형</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div id="modal-text-box">카테고리 명</div>
									<input type="text" id="modal-input2" name="categories-title">
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" id="btn-3" class="btn"
										data-dismiss="modal">등록</button>
									<button type="button" id="btn-1" class="btn"
										data-dismiss="modal">취소</button>
								</div>

							</div>
						</div>
					</div>
					<script>
            document.querySelectorAll('.categories2 button').forEach(button => {
              button.addEventListener('click', function() {
                // 부모 li 요소에서 카테고리명 추출
                const li = this.parentElement;
                const categoryName = li.querySelector('.categories-name2').textContent;
          
                // 모달의 인풋 박스에 카테고리명 설정
                document.getElementById('modal-input2').value = categoryName;
              });
            });
          </script>
					<!-- ---------------------------------------------------------------------------------------- -->
					<!-- right Add Modal -->
					<!-- The Modal for Adding Cities -->
					<div class="modal" id="categories2-add">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h3 class="modal-title">도시 추가</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div id="modal-text-box">도시명</div>
									<input type="text" id="new-city-input" name="new-city-title"
										placeholder="도시 이름 입력">
									<div id="current-cities">
										<h4>현재 도시 목록</h4>
										<ul id="city-list"></ul>
									</div>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" id="add-city-btn" class="btn"
										data-dismiss="modal">추가</button>
									<button type="button" id="btn-1" class="btn"
										data-dismiss="modal">취소</button>
								</div>

							</div>
						</div>
					</div>
					<script>
            // 클릭된 영역에 맞는 도시 목록을 모달에 표시하고 새로운 도시 추가
            document.querySelectorAll('.add-btn').forEach(button => {
              button.addEventListener('click', function() {
                // 클릭한 버튼이 속한 영역(USA, Europe 등) 가져오기
                const areaId = this.getAttribute('data-area');
                const areaElement = document.getElementById(areaId);
                const cityList = areaElement.querySelectorAll('.categories-name2');
                
                // 모달에 현재 도시 목록 표시
                const modalCityList = document.getElementById('city-list');
                modalCityList.innerHTML = ''; // 기존 리스트 초기화
                cityList.forEach(city => {
                  const li = document.createElement('li');
                  li.textContent = city.textContent;
                  modalCityList.appendChild(li);
                });
          
                // 도시 추가 버튼 클릭 시 처리
                document.getElementById('add-city-btn').addEventListener('click', function() {
                  const newCityName = document.getElementById('new-city-input').value;
                  if (newCityName) {
                    const newLi = document.createElement('li');
                    newLi.innerHTML = `<span id="categories-no">${areaElement.querySelectorAll('li').length}</span>
                                       <span class="categories-name2">${newCityName}</span>
                                       <button type="button" class="edit-btn" style="float: inline-end;">수정하기</button>`;
                    areaElement.querySelector('ul').insertBefore(newLi, areaElement.querySelector('ul li:last-child'));
                    
                    // 모달 입력 초기화
                    document.getElementById('new-city-input').value = '';
                  }
                });
              });
            });
          </script>


				</div>
				<script>
        document.getElementById('categories1').addEventListener('click', function (e) {
          if (e.target && e.target.nodeName === 'LI') {
            const targetId = e.target.getAttribute('data-target');

            // 모든 도시 리스트 숨기기
            document.querySelectorAll('.category-right-box > div').forEach(div => {
              div.classList.remove('active');
            });

            // 선택된 도시 리스트만 표시하기
            const targetDiv = document.getElementById(targetId);
            if (targetDiv) {
              targetDiv.classList.add('active');
            }
          }
        });
      </script>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>