<%@page import="java.util.Map"%>
<%@page import="com.gd.hw.category.model.vo.ProCategory"%>
<%@page import="com.gd.hw.category.model.vo.Region"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");

	List<ProCategory> pList = (List<ProCategory>)map.get("category"); 
	List<Region> rList = (List<Region>)map.get("region"); 
	String alertMsg = (String)session.getAttribute("msg");
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
#btn-5{
	background-color: #ea0000;
	color: white;
	width: 100px;
	border-radius: 5px;
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

.modal-body input[name=categories-title] ,
.modal-body input[name=categories-add-title] ,
.modal-body input[name=categories-add-eng-title],
.modal-body input[name=categories-modify-title],
.modal-body input[name=categories-modify-eng-title],
#new-city-input1,
#new-city-input2,
#modal-eng-input2 {
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
.admin-page-main-menu{
	border-right: 0px!important;
}

.admin-page-main-item{
	border-left: 1px solid lightgray;
}
</style>
</head>
<body>
	<%if(alertMsg!= null){ %>
	<script>
		alert('<%= alertMsg%>');
	</script>
	<% session.removeAttribute("msg");} %>
	<div class="admin-page">
		<div class="admin-page-head">
			<div class="admin-page-head-logo">
				<img src="<%= contextPath %>/assets/image/logo.png" alt="logo" width="100%">
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
				<div class="category-left">

					<div class="category-left-text">
						<h3>카테고리 1</h3>
					</div>
					<hr>
					<div class="category-left-box">
					
						<!-- 기능들어갈때 target에 카테고리 명을 넣던가 아님 카테고리2와 조인되는 값을 넣기 -->
					
						<ul id="categories1">
							<%for(ProCategory pC : pList){ %>
									<li data-target="<%=pC.getCategoryEngName() %>">
										<span id="categories-no"><%=pC.getCategoryId() %></span>
										<span id="categories-name"><%=pC.getCategoryName() %></span>
										<button id="btn-3" type="button" class="btn" data-toggle="modal" data-target="#categories1-edit">수정하기</button>
										<input type="hidden"  class="categories-eng-name" value="<%=pC.getCategoryEngName() %>">	
									</li>
							<%} %>
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
											<div id="modal-text-box">한글 명</div>
											<input type="text" id="modal-input-title" name="categories-modify-title">
											<div id="modal-text-box">영문 명</div>
											<input type="text" id="modal-input-eng-title" name="categories-modify-eng-title">
											<input type="hidden" id="modal-input-no" name="categories-modify-no">
									</div>
	
									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button"  onclick="fnCategoriesEdit();" id="btn-3" class="btn" >수정</button>
										<button id="btn-5" type="button" onclick="fnDelete();" class="btn" >삭제</button>
									</div>
							</div>
						</div>
					</div>
						<script>
							function fnDelete(){
								$.ajax({
									url:'<%=contextPath%>/deleteList.cg',
									data:{value1:$('#modal-input-eng-title').val()},
									success: function(){
										alert("성공적으로 삭제되었습니다.");
										location.reload();
									},
									error: function(){
										alert("삭제하는데 실패하였습니다.");
									}
								})
							}
						
						
						//카테고리 수정 Ajax
							function fnCategoriesEdit(){
								$.ajax({
									url:'<%= contextPath%>/modifyList.cg',
									data:{value1:$('#modal-input-title').val(),value2:$('#modal-input-eng-title').val(),value3:$('#modal-input-no').val()},
									success: function(){
										alert("수정 성공");
										location.reload();
									},
									error: function(){
										alert("수정 실패");
									}
									
								})
							}	
						</script>
						
					
					
					<script>
            document.querySelectorAll('#categories1 button').forEach(button => {
              button.addEventListener('click', function() {
                // 부모 li 요소에서 카테고리명 추출
                const li = this.parentElement;
                const categoryName = li.querySelector('#categories-name').textContent;
                const categoryEngName = li.querySelector('.categories-eng-name').value;
                const categoryNo = li.querySelector('#categories-no').textContent;
        				console.log(categoryEngName);
                // 모달의 인풋 박스에 카테고리명 설정
                document.getElementById('modal-input-title').value = categoryName;
                document.getElementById('modal-input-eng-title').value = categoryEngName;
                document.getElementById('modal-input-no').value = categoryNo;
              });
            });
          </script>

					<!-- 등록하기버튼 팝업 -->
					<div class="add-categories-btn">
						<button id="btn-1" type="button" class="btn" data-toggle="modal"
							data-target="<%=pList.size()>=6 ? "#categories1-error":"#categories1-add"  %>" style="float: inline-end;">등록하기</button>

						<!-- left Add modal -->
						<!-- The AddModal -->
						<div class="modal" id="categories1-add">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h3 class="modal-title">카테고리 유형</h3>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<form action="<%= contextPath%>/addList.cg" method="POST">
										<div class="modal-body">
											<div id="modal-text-box">한글 명</div>
											<input type="text" name="categories-add-title">
											<div id="modal-text-box">영문 명</div>
											<input type="text" name="categories-add-eng-title">
										</div>
	
										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="submit" id="btn-3" class="btn">등록</button>
											<button type="button" id="btn-1" class="btn" data-dismiss="modal">취소</button>
										</div>
									</form>
									
								</div>
							</div>
						</div>
					<!-- The errorModal -->
					<div class="modal" id="categories1-error">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h3 class="modal-title">Error</h3>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<div id="modal-text-box">6개 초과 되었습니다. 더 이상 추가 할 수 없습니다.</div>
										
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										
										<button type="button" id="btn-1" class="btn"
											data-dismiss="modal">확인</button>
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
					<%for(int i=0; i<pList.size(); i++){ %>
					<%int count =1; %>
						<div id="<%= pList.get(i).getCategoryEngName() %>">
							<ul class="categories2">
								<%for(int j=0; j<rList.size(); j++) {	%>
									<%if(pList.get(i).getCategoryEngName().equals(rList.get(j).getRegionEngName())){ %>
								<li>
										<span id="categories-no"><%=count++ %></span> 
										<span class="categories-name2"><%=rList.get(j).getRegionName() %></span>
										<input type="hidden" class="categories-eng-name2" value="<%=rList.get(j).getRegionEngName()%>">
										<input type="hidden" class="categories-no2" value ="<%=rList.get(j).getRegionId() %>">
										<button id="btn-3" type="button" data-toggle="modal" data-target="#categories2-edit" style="float: inline-end;">수정하기</button>
								</li>
								<%}} %>
								
								<li style="text-align: end;">
									<button type="button" id="btn-1" class="add-btn" data-toggle="modal" data-target="#categories2-add" data-area="<%=pList.get(i).getCategoryEngName()%>">추가</button>
								</li>
							
							</ul>
						</div>
							<%} %>
						
					</div>
					<!-- 수정하기버튼 팝업 -->

					<!-- The Modal -->
					<div class="modal" id="categories2-edit">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h3 class="modal-title">서브카테고리 유형</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div id="modal-text-box">서브 명</div>
									<input type="text" id="modal-input2" name="categories-title">
									<div id="modal-text-box">서브영문 명</div>
									<input type="text" id="modal-eng-input2" name="categories-eng-title">
									<input type="hidden" id="modal-no" name="sub-categories-no">
									
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" id="btn-3" onclick="fnEditRegion();" class="btn" >수정</button>
									<button type="button" id="btn-5" onclick="fnDeleteRegion();" class="btn" >삭제</button>
								
								</div>

							</div>
						</div>
					</div>
					<script>
						function fnEditRegion(){
							$.ajax({
								url:'<%= contextPath%>/subModifyList.cg',
								data:{value1:$('#modal-input2').val(),value2:$('#modal-eng-input2').val(),value3:$('#modal-no').val()},
								success: function(){
									alert("수정 성공");
									location.reload();
								},
								error: function(){
									alert("수정 실패");
								}
								
							})
						}	
						
						function fnDeleteRegion(){
							$.ajax({
								url:'<%= contextPath%>/subDeleteList.cg',
								data:{value1:$('#modal-no').val()},
								success: function(){
									alert("삭제 성공");
									location.reload();
								},
								error: function(){
									alert("삭제 실패");
								}
								
							})
						}
						
					</script>
					
					
					<script>
            document.querySelectorAll('.categories2 button').forEach(button => {
              button.addEventListener('click', function() {
                // 부모 li 요소에서 카테고리명 추출
                const li = this.parentElement;
                const categoryName = li.querySelector('.categories-name2').textContent;
                const categoryEngName = li.querySelector('.categories-eng-name2').value;
                const categoryNo = li.querySelector('.categories-no2').value;
          
                // 모달의 인풋 박스에 카테고리명 설정
                document.getElementById('modal-input2').value = categoryName;
                document.getElementById('modal-eng-input2').value = categoryEngName;
                document.getElementById('modal-no').value = categoryNo;
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
									<h3 class="modal-title">서브카테고리 추가</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<form action="<%= contextPath%>/addCity.cg" method="POST">
									<div class="modal-body">
										<div id="modal-text-box">서브카테고리 명</div>
										<input type="text" id="new-city-input1" name="new-city-title" placeholder="도시 이름 입력">
										<br>
										<input type="text" id="new-city-input2" name="new-city-eng-title" placeholder="도시 영문 입력">
										<div id="current-cities">
											<h4>현재 도시 목록</h4>
											<ul id="city-list"></ul>
										</div>
									</div>
	
									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" id="add-city-btn"  class="btn">추가</button>
										<button type="button" id="btn-1" class="btn" data-dismiss="modal">취소</button>
									</div>
							  </form>
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