<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gd.hw.product.model.vo.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* 사용자 정의 스타일 */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            display: flex;
            overflow: hidden;
            position: relative;
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
            width: 140px;
            font-size: 14px;
            padding: 5px 10px;
            margin-top: 10px;
            align-self: flex-end;
        }

        .filter-section {
            border: 1px solid #ddd;
            /* 회색 선 추가 */
            border-radius: 5px;
            /* 둥글게 하기 (옵션) */
            padding: 20px;
            /* 안쪽 여백 */
            height: 550px;
        }

        .pagination .page-link {
            font-size: 20px;
            /* 버튼의 텍스트 크기 */
        }

        .pagination .page-item.active .page-link {
            background-color: #007AFF;
            /* 활성화된 버튼 배경색 */
            /* border-color: #007AFF; 활성화된 버튼 테두리 색상 */
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
				
        .heart-icon {
        		display: flex;
            color: red;
            font-size: 32px;
            cursor: pointer;
            margin-right: 10px;
            align-self: flex-end;
        }
    
    </style>

    <script>
        $(document).ready(function () {
            $('.heart-icon').click(function () {
                $(this).toggleClass('fas far');
            });
        });
    </script>

</head>

<body>
<%@ include file="/views/common/header.jsp"%>

    <section class="helloworld-main">
        <div class="row">
            <aside class="col-md-3 filter-section">
            		<br>
                <h3>결과 내 검색</h3>
                <div class="mb-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="search-input" placeholder="지역을 검색해 보세요.">
                        <div class="input-group-append">
                            <span class="input-group-text" id="search-button" style="cursor: pointer;">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                    </div>
                </div>
								<br>
                <h3>여행 상태</h3>
                <div class="mb-3">
                    <button class="btn btn-primary">예약 가능</button>
                    <button class="btn btn-primary">출발 확정</button>
                </div>
								<br>
                <h3>여행 기간</h3>
                <div class="mb-3">
                    <button class="btn btn-primary">전체</button>
                    <button class="btn btn-primary">2박 3일</button>
                    <button class="btn btn-primary">3박 4일</button>
                </div>
            </aside>

            <div class="col-md-9">
                <div class="row">
                    <%
                        List<Product> productList = (List<Product>) request.getAttribute("productList");
                        int itemsPerPage = 5;
                        int currentPage = (request.getParameter("page") == null) ? 1 : Integer.parseInt(request.getParameter("page"));
                        int totalPages = (productList != null) ? (int) Math.ceil((double) productList.size() / itemsPerPage) : 0;

                        if (productList == null || productList.isEmpty()) {
                            out.println("<p>No products available.</p>");
                        } else {
                            if (currentPage > totalPages) {
                                currentPage = totalPages; // 페이지가 초과될 경우 마지막 페이지로 설정
                            }

                            int start = (currentPage - 1) * itemsPerPage;
                            int end = Math.min(start + itemsPerPage, productList.size());

                            for (int i = start; i < end; i++) {
                                Product product = productList.get(i);
                    %>
                                <div class="col-12 mb-3">
                                    <div class="product-card">
                                        <img src="<%= product.getProductImg() %>" alt="Product Image">
                                        <div class="card-body">
                                            <a href="productDetail.pr?productId=<%= product.getProductId() %>" class="product-font">
                                                <h3 class="card-title"><%= product.getProductName() %></h3>
                                            </a>
                                            <p class="card-text"><%= product.getStartDate() %> ~ <%= product.getEndDate() %></p>
                                            <p class="card-text" style="font-size: 18px; color: green;">
                                                가격: <%= product.getaPrice() %>원
                                            </p>
                                            <div class="d-flex justify-content-end">
                                                <i class="far fa-heart heart-icon"></i>
                                                <a href="orderPage.us?productId=<%= product.getProductId() %>&aNum=0&cNum=0" class="btn btn-primary">예약</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    <%
                            }
                        }
                    %>
                </div>

              <%
    String categoryName = (String) request.getAttribute("categoryName");
%>

<div class="d-flex justify-content-center">
    <ul class="pagination">
        <%
            boolean isFirstPage = (currentPage == 1);
            boolean isLastPage = (currentPage == totalPages);
        %>

        <li class="page-item <%= isFirstPage ? "disabled" : "" %>">
            <a class="page-link" href="?page=<%= (currentPage > 1) ? (currentPage - 1) : 1 %>&categoryName=<%= categoryName %>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <%
            for (int i = 1; i <= totalPages; i++) {
        %>
            <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                <a class="page-link" href="?page=<%= i %>&categoryName=<%= categoryName %>"><%= i %></a>
            </li>
        <%
            }
        %>

        <li class="page-item <%= isLastPage ? "disabled" : "" %>">
            <a class="page-link" href="?page=<%= (currentPage < totalPages) ? (currentPage + 1) : totalPages %>&categoryName=<%= categoryName %>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</div>




            </div>
        </div>
    </section>

<%@ include file="/views/common/footer.jsp"%>

</body>

</html>
