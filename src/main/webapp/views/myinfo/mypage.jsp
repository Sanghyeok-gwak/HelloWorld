<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      border-color: #007AFF;
      /* 활성화된 버튼 테두리 색상 */
      color: white;
      /* 활성화된 버튼의 텍스트 색상 */
    }

    .pagination .page-link:hover {
      background-color: #0056b3;
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

    .list-main {
      display: flex;
      align-items: center;
      justify-content: center;
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
                <h5 class="card-title">이준님<br>WELCOME</h5>
                <p class="card-text">
                <h5><a href="#" style="color: gray; text-decoration-line: none;">내정보 관리<i class="fa-solid fa-play">
                </h5></i></a></p>
                <p>
                <h5>적립금 0P</h5>
                </p>
              </div>
            </div>
          </div>
          <div class="JJIMList-side-btn">
            <div class="card">
              <div class="card-body" style="padding-bottom: 5px;">
                <ul class="list-unstyled">
                  <li class="mb-3">
                    <a href="#">
                      <h5>예약 / 결제</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>찜</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>리뷰</h5>
                    </a>
                  </li>
                  <li class="mb-3">
                    <a href="#">
                      <h5>고객센터</h5>
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
          <%--   <div class="list-main">
              <div class="content">
                <p>
                <h5>예약 / 결제내역이 없습니다</h5>
                </p>
                <button id="btn-2" class="btn">상품둘러보기 <i class="fa-solid fa-arrow-right"></i></button>
              </div>  --%>


              <!-- 1 -->
               <div class="col-md-12 mb-3">
              <h5>2023-11-20(수)</h5>
              <h5 style="font-size: 13px; color: lightgray;">예약 번호 : 134562</h5>
              <div class="product-card">
                <img src="<%=contextPath %>/assets/image/imgTest.jpeg" alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="#" class="product-font">
                    <h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
                  <a href="#" class="btn" id="btn-2" onclick="run();" style="width: 140px; ">환불하기</a>
                </div>
              </div>
            </div>   
              <!-- 2 -->
               <div class="col-md-12 mb-3">
                <h5 style="font-size: 13px; color: lightgray;">예약 번호 : 134562</h5>
              <h5>2023-11-20(수)</h5>
              <div class="product-card">
                <img src="<%=contextPath %>/assets/image/imgTest.jpeg" alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="#" class="product-font">
                    <h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
                  <a href="#" class="btn" id="btn-2" onclick="run();"  style="width: 140px;">환불하기</a>
                </div>
              </div>
            </div>  
              <!-- 3 -->
               <div class="col-md-12 mb-3">
              <h5>2023-11-20(수)</h5>
              <h5 style="font-size: 13px; color: lightgray;">예약 번호 : 134562</h5>
              <div class="product-card">
                <img src="<%=contextPath %>/assets/image/imgTest.jpeg" alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="#" class="product-font">
                    <h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
                  <a href="#" class="btn" id="btn-2"  onclick="run();"  style="width: 140px;">환불하기</a>
                </div>
              </div>
            </div>  
              <!-- 4 -->
               <div class="col-md-12 mb-3">
              <h5>2023-11-20(수)</h5>
              <h5 style="font-size: 13px; color: lightgray;">예약 번호 : 134562</h5>
              <div class="product-card">
                <img src="<%=contextPath %>/assets/image/imgTest.jpeg" alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="#" class="product-font">
                    <h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
                  <a href="#" class="btn" id="btn-2" onclick="run();"  style="width: 140px;">환불하기</a>
                </div>
              </div>
            </div> 
              <!-- 5 -->
               <div class="col-md-12 mb-3">
              <h5>2023-11-20(수)</h5>
              <h5 style="font-size: 13px; color: lightgray;">예약 번호 : 134562</h5>
              <div class="product-card">
                <img src="<%=contextPath %>/assets/image/imgTest.jpeg" alt="Product Image">
                <div class="card-body">
                  <br>
                  <a href="#" class="product-font">
                    <h3 class="card-title">유럽4국, 대한항공, 프라하 시내호텔 2연박 포함 전일정 4성, 프라하 필스너 양조장 레스토랑
                    </h3>
                  </a>
                  <p class="card-text" style="font-size: 18px;">2024/01/01~2024/01/15</p>
                  <a href="#" class="btn" id="btn-2"  onclick="run();"  style="width: 140px;">환불하기</a>
                </div>
              </div>
            </div>  
              <!-- Pagination -->
               <div aria-label="Page navigation">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </div>  
            </div>
          </div>
        </div>
    </section>
    <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>