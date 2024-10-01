<%@ page import = "java.util.List" %>
<%@ page import = "com.gd.hw.myinfo.model.vo.MyPoint" %>
<%@ page import = "com.gd.hw.product.model.vo.Product" %>
<%@ page import = "com.gd.hw.myinfo.model.vo.Myinfo" %>
<%@ page import = "com.gd.hw.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
PageInfo pi = (PageInfo)request.getAttribute("pi");
List<Myinfo> list = (List<Myinfo>)request.getAttribute("list");
int result = (Integer) request.getAttribute("re");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
 <style>
 @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');
 
 	    .JJIMList {
      display: flex;

    }

    .JJIMList-side {
      width: 15%;
      display: flex;
      flex-direction: column;
    }

    .JJIMList-side-user {
      height: 50%;
    }

    .JJIMList-side-btn {
      height: 50%;
    }

    .JJIMList-list {
      width: 85%;
      margin-left: 20px;
      border-left: 1px solid lightgrey;
      padding-left: 20px;
    }

    .JJIMList-list-text-box {
      display: flex;
      justify-content: space-between;
    }

    .mb-3 a {
      color: black;
    }

    .JJIMList-list-main-item {
      flex-grow: 1;
      padding-left: 20px;
    }

    .product-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      display: flex;
      overflow: hidden;
      position: relative;
      /* Add this */
      width: 900px;
      height: 230px;
    }

    .product-card img {
      width: 40%;
      height: auto;
      object-fit: cover;
    }

    .product-card .card-body {
      padding: 15px;
      width: 60%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .product-card .btn {
      width: auto;
      font-size: 14px;
      padding: 5px 10px;
      margin-top: 10px;
      align-self: flex-end;
    }

    .pagination {
      justify-content: center;
    }

    .pagination .page-link {
      font-size: 22px;
      /* 버튼의 텍스트 크기 */
    }

    .pagination .page-item.active .page-link {
      background-color: #007AFF;
      /* 활성화된 버튼 배경색 */
      /*border-color: #007AFF;*/
      /* 활성화된 버튼 테두리 색상 */
      color: white;
      /* 활성화된 버튼의 텍스트 색상 */
    }

    .pagination .page-link:hover {
      background-color: #007AFF;
      /* 버튼 호버 시 배경색 */
      color: white;
      /* 버튼 호버 시 텍스트 색상 */
    }

    .product-font {

      text-decoration: none !important;
      color: black;
    }

    .product-font :hover {
      color: #007AFF;
    }


    .content {
      text-align: center;
      margin: 300px;
      color: lightgray;

    }

    .content p {
      font-size: 16px;
      margin-bottom: 20px;
    }
    #btn-4 {
			background-color: #007AFF;
			color: white;
    }
    #btn-2{
    display: flex;
    justify-content: center;
    }
 </style>
 <script>
 function run() {
     if (confirm('환불처리 하시겠습니까?') == true) {
       document.run.submit();
     } else {
       return false;
     }
   }
 </script>
<body>	

<%@ include file="/views/common/header.jsp" %>

   <section>
      <div class="JJIMList">
        <div class="JJIMList-side">
          <div class="JJIMList-side-user">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title"><%= loginUser.getUserName() %>님<br>WELCOME</h5>
                <p class="card-text">
                <h5><a href="<%= contextPath %>/myinfo.us" style="color: gray; text-decoration-line: none;">내정보 관리<i class="fa-solid fa-play">
                </h5></i></a></p>
                <p>
                <h5>적립금 <%= result %>P</h5>
                </p>
              </div>
            </div>
          </div>
          <div class="JJIMList-side-btn">
            <div class="card">
              <div class="card-body" style="padding-bottom: 5px;">
                <ul class="list-unstyled">
                  <li class="mb-3">
                    <a href="<%= contextPath %>/myinfom.us?no=<%= loginUser.getUserNo() %>">
                      <h5>예약 / 결제</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="<%= contextPath %>/myinfojj.us?no=<%= loginUser.getUserNo() %>">
                      <h5>찜</h5>
                    </a>
                  </li>


                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="JJIMList-list">
          <div class="JJIMList-list-text-box">
            <div class="JJIMList-list-text">
              <span style="font-size: 24px;">전체 예약내역</span>
            </div>
            <div class="JJIMList-list-btn">
            </div>
          </div>
          <hr>
          <div class="JJIMList-list-main-item">
            <!-- 여기채우세요 -->
          <%if( list.isEmpty()) { %> 
              <div class="list-main">
              <div class="content">
                <p>
                <h5>예약 / 결제내역이 없습니다</h5>
                </p>
								<i class="fa-solid fa-circle-exclamation" style="font-size: 100px;"></i>              </div>  
              <% }else{ %>
               
               
               
               
              <!-- 1 -->
              <% for(Myinfo m : list){ %>
               <div class="col-md-12 mb-3">
              <h5><%= m.getPayDate() %></h5>
              <h5 style="font-size: 13px; color: lightgray;">예약 번호 :<%= m.getMerchantUid() %> </h5>
              <input type="hidden" value="<%= m.getMerchantUid() %>" id="merId" >
              <div class="product-card">
                <img src="<%= m.getProduct_Img() %>"  alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="productDetail.pr?productId=<%= m.getProductId() %>" class="product-font">
                    <h3 class="card-title"><%= m.getProductName() %>
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;"><%= m.getStartDate() %>~<%= m.getEndDate() %></p>
                  <dav style="display: flex; justify-content:end;">
                  <a href="<%= contextPath %>/myinfodt.us?userNo=<%= loginUser.getUserNo() %>&productNo=<%=m.getProductId() %>&mUid=<%=m.getMerchantUid() %>"type="button" class="btn" id="btn-4" style="margin-right: 15px;  width: 140px;  " onclick="fnPayListbtn();">결제내역</a>
                  <a href="#" class="btn" id="btn-2" onclick="run();" style="width: 140px; display: none; ">환불하기</a></dav>
                </div>
              </div>
            </div>         
            	<% } %>
              <!-- Pagination -->
               <div aria-label="d-flex justify-content-center">
              <ul class="pagination">
                <li class='page-item  <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
                  <a class="page-link" href='<%=contextPath%>/myinfom.us?page=<%=pi.getCurrentPage()-1%>&no=<%= loginUser.getUserNo() %> '> < </a>
								</li>
	      	  <%for (int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	        	  <li class ='page-item <%=p == pi.getCurrentPage() ? "active" : "" %>'>
  	       	<a class="page-link" href="<%=contextPath%>/myinfom.us?page=<%=p%>&no=<%= loginUser.getUserNo() %>"><%=p%></a>  
    	      	</li>
      	  	<%}%>

        				<li class= 'page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
          			  <a class="page-link" href="<%=contextPath%>/myinfom.us?page=<%=pi.getCurrentPage()+1%>&no=<%= loginUser.getUserNo() %>  "> > </a>
                </li>
              </ul>
            </div>  
            <% } %> 
              <!-- 2 -->
                
              <!-- 3 -->
              
              <!-- 4 -->
               
              <!-- 5 -->
                
                       
            </div>
          </div>
        </div>
    </section>
      <script>
      
  
      
      
      
  </script>
    <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>