<%@ page import="com.gd.hw.order.model.vo.OrderAd"%>
<%@ page import= "com.gd.hw.myinfo.model.vo.MyOrderDt" %>
<%@ page import="com.gd.hw.order.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    OrderAd order = (OrderAd)request.getAttribute("order");
    List<Person> list = (List<Person>)request.getAttribute("list");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

        .layout {
            display: flex;
            flex-direction: row;
        }
        .side {
            width: 200px;
            border-right: 1px solid #ddd;
            padding: 20px;
        }
        .content-wrapper {
            flex-grow: 1;
            padding-left: 20px;
        }

        .content {
            text-align: center;
        }

        .content p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .list-unstyled li a {
            color: black;
            text-decoration-line: none;
        }
        .inventory{
       		 display: flex;
    			 justify-content: center;
        }
</style>
<body>
 <%@ include file="/views/common/header.jsp" %>


	<div class="helloworld-main layout">
        <div class="side">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title"><%= loginUser.getUserName() %>님<br>WELCOME</h5>
                    <p class="card-text"><h5><a href="#" style="color: gray; text-decoration-line: none;">내정보 관리<i class="fa-solid fa-play"> </h5></i></a></p>
                    <p><h5>적립금 0P</h5></p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-3"><a href="<%= contextPath %>/myinfom.us?no=<%= loginUser.getUserNo() %>"><h5>예약 / 결제</h5></a></li>
                        <li class="mb-3"><a href="<%= contextPath %>/myinfojj.us?no=<%= loginUser.getUserNo() %>"><h5>찜</h5></a></li>
                        
                        
                    </ul>
                </div>
            </div>
        </div>

        <main class="content-wrapper">
            <h3>전체 예약내역</h3>
            <hr>
            <div class="information">
                <h3>여행자 정보</h3>
                <br>
            </div>
            <table class="details">
            
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
                
              </table>
          </div>
        </div>
        <!--테이블 영역 끝-->
        <!--버튼 영역 시작-->

      </div>
    </div>
                <%} %> 
            </table>
            <div class="inventory" ><a href="<%= contextPath %>/myinfom.us?no=<%= loginUser.getUserNo() %>" id="btn-1" class="btn" style="float:right;width: 150px;"  >목록으로</a></div>
        </main>
    </div>
              <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>