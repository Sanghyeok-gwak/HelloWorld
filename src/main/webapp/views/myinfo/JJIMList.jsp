<%@ page import = "java.util.List" %>
<%@ page import = "com.gd.hw.myinfo.model.vo.MyPoint" %>
<%@ page import = "com.gd.hw.product.model.vo.Product" %>
<%@ page import = "com.gd.hw.myinfo.model.vo.MyJjim" %>
<%@ page import = "com.gd.hw.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
PageInfo pi = (PageInfo)request.getAttribute("pi");
List<MyJjim> JJlist = (List<MyJjim>)request.getAttribute("JJlist");
int result = (Integer) request.getAttribute("re");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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

      .heart {
            display: flex;
            color: red;
            font-size: 32px;
            cursor: pointer;
            margin-right: 10px;
            align-self: flex-end;
        }
    </style>

<body>
<%@ include file="/views/common/header.jsp" %>

	 <!-- body -->
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
              </div>
            </div>
          </div>
        </div>
        <div class="JJIMList-list">
          <div class="JJIMList-list-text-box">
            <div class="JJIMList-list-text">
              <span style="font-size: 24px;">찜 목록</span>
            </div>
            <div class="JJIMList-list-btn">
              <button id="btn-2" class="btn" style="width: 140px;" onclick="allDel();"> 전체삭제 </button>
            </div>
          </div>
          <hr>
          <div class="JJIMList-list-main-item">
            <!-- 여기채우세요 -->
            <%if( JJlist.isEmpty()) { %> 
             <div class="list-main">
              <div class="content">
                <p>
                <h5>찜에 담긴 상품이 없습니다.</h5>
                </p>
                <i class="fa-solid fa-circle-exclamation" style="font-size: 100px;"></i>
              </div> 
							<% }else{ %>
              <!-- 1 -->
              <% for(MyJjim j : JJlist){ %>
               <div class="col-md-12 mb-3">
              <h5><%= j.getAddedDate() %></h5>
              <input type="hidden" value="<%= j.getMerchantUid() %>" id="merId" >
              <div class="product-card">
                <img src="<%= j.getProductImg() %>"  alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="productDetail.pr?productId=<%= j.getProdcutId() %>" class="product-font">
                    <h3 class="card-title"><%= j.getProductName() %>
                    </h3>
                  </a>
                 	
                  <p class="card-text" style="font-size: 18px;"><%= j.getStartDate() %>~<%= j.getEndDate() %></p>
									<div class="d-flex justify-content-end">
                  <div id="heart-icon-<%=j.getProdcutId()%>" class="fa-solid fa-heart heart" data-productid="<%=j.getProdcutId()%>" onclick="run();"></div><!-- 찜하트 -->
                  <a href="orderPage.us?productId=<%=j.getProdcutId()%>&aNum=0&cNum=0" id="btn-1" class="btn" style="width: 140px;">예약</a>
                 </div>
                </div>               
              </div>
            </div> 
            	<% } %>
              <!-- Pagination -->
						<div aria-label="d-flex justify-content-center">
              <ul class="pagination">
                <li class='page-item  <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
                  <a class="page-link" href='<%=contextPath%>/myinfojj.us?page=<%=pi.getCurrentPage()-1%>&no=<%= loginUser.getUserNo() %>'> < </a>
								</li>
	      	  <%for (int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
	        	  <li class ='page-item <%=p == pi.getCurrentPage() ? "active" : "" %>'>
  	       <a class="page-link" href="<%=contextPath%>/myinfojj.us?page=<%=p%>&no=<%= loginUser.getUserNo() %> "><%=p%></a>   
    	      	</li>
      	  	<%}%>

        				<li class= 'page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
          			  <a class="page-link" href="<%=contextPath%>/myinfojj.us?page=<%=pi.getCurrentPage()+1%>&no=<%= loginUser.getUserNo() %> " > > </a>
                </li>
              </ul>
            </div>  						
            <% } %>
              
          </div>
        </div>
      </div>
    </section>
          <%@ include file="/views/common/footer.jsp" %>
        <script>
      $(document).ready(function () {
        $('.heart').click(function () {
          $(this).toggleClass('fas far-heart');
          alert('찜 목록에서 해제 되었습니다.');
        });
      });
      
      
      function run(){
    	  //const jjimValue= document.querySelector('#hidden_id').value;
    	  const jjimValue= $(window.event.target).data("productid");
    	  $.ajax({
    		  url:'<%=contextPath%>/myinfoJjd.us',
    		  data:{
    			  userNo: <%= loginUser.getUserNo() %>,
    				productId: jjimValue
    		  },
    		  success:function(res){
    			  console.log(res);
    			  location.reload();
    			  
    		  }
    		  
    	  })
    	  
    	  
      }
      
     function allDel(){
    	 $.ajax({
    		 url:'<%= contextPath%>/myinfoall.us',
    		 data:{
    			 userNo: <%= loginUser.getUserNo() %>
    		 },
    		 success:function(res){
    			 
    			 if(confirm("전체삭제 하시겠습니까?")){
    				 
    				 console.log(res);
    				 	alert('전체삭제 되었습니다');
        			 location.reload(); 
    			 }
    			 
    		 }
    	 })
     } 
			
    </script>
</body>
</html>