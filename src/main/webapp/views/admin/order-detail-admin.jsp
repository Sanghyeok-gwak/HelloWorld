<%@ page import="com.gd.hw.order.model.vo.OrderAd"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gd.hw.order.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	OrderAd order = (OrderAd)request.getAttribute("order");
	List<Person> list = (List<Person>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
	display: flex;
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
			<div class="admin-page-main-item w-75 m-auto">
				        <!-- 여기부터 -->
        <div class="mb-3">
          <h1>결제관리</h1>
        </div>
        <div class="pt-3">
          <div id="table1" >
            <table class="table pb-3">
              <tr>
                <th>회원명</th>
                <td><%=order.getUserId() %></td>
              </tr>
              <tr>
                <th>상품명</th>
                <td><a href="productDetail.pr?productId=<%= order.getProductId() %>" ><%= order.getProductName() %></a></td>
              </tr>
            </table>
          </div>
          <div class="row  pt-3">
            <hr>
            <div id="table2" class="col">
              <table class="table pb-3">
                <tr>
                  <th>인원</th>
                  <td colspan="2">성인 <%= order.getAdult()%>명, 유아<%= order.getChild()%>명</td>
                </tr>
                <tr>
                  <th>총 결제금액</th>
                  <td><%= order.getAdult()+order.getChild()%>명</td>
                  <td><%= order.getFinalPay()+order.getPointU() %>원</td>
                </tr>
                <tr>
                  <th>보험</th>
                  <td><%=order.getBhClass()%>/<%= order.getPrice()%>원</td>
                  <td>총 보험금액 : <%= order.getPrice()*(order.getAdult()+order.getChild())%></td>
                </tr>
              </table>
            </div>
            <div id="table3" class="col">
              <table class="table pb-3">
                <tr>
                  <th>사용적립금</th>
                  <td><%= order.getPointU()%>원</td>
                </tr>
                <tr>
                  <th>최종 결제금액</th>
                  <td style="color: red;"><%=order.getFinalPay() %>원</td>
                </tr>
                <tr>
                  <th>적립액</th>
                  <%if(order.getPointU()>0){ %>
                  <td>적립불가</td>
                  <%}else{ %>
                 <td><%=(int)Math.ceil(order.getFinalPay()*0.01)%>원</td>
                  <%} %>
                </tr>
              </table>
            </div>
          </div>
          <div id="person" class="pt-4">
            <div id="table4">
              <table class="table pb-3">
                <tr>
                  <th>분류</th>
                  <th>영문성</th>
                  <th>영문이름</th>
                  <th>생년월일</th>
                  <th>전화번호</th>
                  <th>성별</th>
                  <th>국적</th>
                  <th>여권번호</th>
                  <th>여권만료일</th>
                </tr>
                <%
					for (Person p  : list) {
			  	%>
                <tr>
                <%if(p.getStatus().equals("A")){ %>
                  <td style="color: blue;">대표자</td>
                <%}else{ %>
               	  <td>일반</td>
                <%} %>
                  <td><%=p.getSurName() %></td>
                  <td><%=p.getEngName() %></td>
                  <td><%=p.getBirthday() %></td>
                  <td><%=p.getPhone() %></td>
                  <%if(p.getGender().equals("F")){ %>
                  <td>여</td>
                  <%}else{ %>
                  <td>남</td>
                  <%} %>
                  <td><%=p.getNation() %></td>
                  <td><%=p.getPassport() %></td>
                  <td><%=p.getPassportEx() %></td>
                </tr>
                <%
				    }
				%>
              </table>
          </div>
        </div>
        <!--테이블 영역 끝-->
        <!--버튼 영역 시작-->
        <div align="center" class="pt-4">
        <%if(order.getStatus().equals("C")){ %>
        <!--  
         <button class="btn btn-primary btn-sm" style="width:200px" id="delBtn">환불하기</button>
        -->
         <%} %>
          <button class="btn btn-primary btn-sm" style="width:200px" onclick="history.back()">목록으로</button>
        </div>
      </div>
    </div>
  </div>
	<script>
	$(document).ready(function () {
		document.getElementById("delBtn").addEventListener("click", () => {
		if(confirm('예약번호<'+'<%=order.getMerUid()%>'+'>에 대한 환불처리를 진행하시겠습니까?')){
			location.href = "<%=contextPath%>/del.or?delUid=<%=order.getMerUid()%>";
		}
      });
	})
	</script>
	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</body>
</html>