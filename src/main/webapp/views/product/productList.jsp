<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.gd.hw.product.model.vo.Product"%>
<%@ page import="java.text.NumberFormat"%>

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
            border-radius: 5px;
            padding: 20px;
            height: 550px;
        }

        .pagination .page-link {
            font-size: 20px;
        }

        .pagination .page-item.active .page-link {
            background-color: #007AFF;
            color: white;
        }

        .pagination .page-link:hover {
            background-color: #007AFF;
            color: white;
        }

        .product-font {
            text-decoration: none !important;
            color: black;
        }

        .product-font:hover {
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
</head>

<body>
    <%@ include file="/views/common/header.jsp"%>
    <jsp:include page="productFavoritesfunction.jsp" />
    <!-- 찜하기 기능 인클루드 -->

    <section class="helloworld-main">
        <div class="row">
        		<!-- 
            <aside class="col-md-3 filter-section">
                <br>
                <h3>결과 내 검색</h3>
                <div class="mb-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="search-input" placeholder="지역을 검색해 보세요.">
                        <div class="input-group-append">
                            <span class="input-group-text" id="search-button" style="cursor: pointer;"> <i class="fas fa-search"></i></span>
                        </div>
                    </div>
                </div>
                <br>
                <h3>여행 상태</h3>
                <div class="mb-3">
                    <button class="btn btn-primary travel-status-button" data-status="예약가능">예약 가능</button>
                    <button class="btn btn-primary travel-status-button" data-status="출발확정">출발 확정</button>
                </div>
                <br>
                <h3>여행 기간</h3>
                <div class="mb-3">
                    <button class="btn btn-primary travel-period-button" data-period="전체">전체</button>
                    <button class="btn btn-primary travel-period-button" data-period="2박3일">2박 3일</button>
                    <button class="btn btn-primary travel-period-button" data-period="3박4일">3박 4일</button>
                </div>
            </aside> -->
            
            <div class="search-container">
    <input type="text" id="search-input" class="form-control" placeholder="검색어를 입력하세요">
    <button id="search-button" class="btn btn-primary">검색</button>
</div>

<div class="filter-section">
    <h3>여행 상태</h3>
    <button class="btn btn-secondary filter-status" data-status="예약가능">예약 가능</button>
    <button class="btn btn-secondary filter-status" data-status="출발확정">출발 확정</button>

    <h3>여행 기간</h3>
    <button class="btn btn-secondary filter-period" data-period="2박3일">2박 3일</button>
    <button class="btn btn-secondary filter-period" data-period="3박4일">3박 4일</button>
</div>

<div id="product-list">
    <!-- 검색 결과가 여기에 표시됩니다. -->
</div>
            


            <div class="col-md-9">
                <div class="row">
                    <% List<Product> productList = (List<Product>) request.getAttribute("productList");
                    int itemsPerPage = 5;
                    int currentPage = (request.getParameter("page") == null) ? 1 : Integer.parseInt(request.getParameter("page"));
                    int totalPages = (productList != null) ? (int) Math.ceil((double) productList.size() / itemsPerPage) : 0;

                    if (productList == null || productList.isEmpty()) {
                        out.println("<p>No products available.</p>");
                    } else {
                        if (currentPage > totalPages) {
                            currentPage = totalPages;
                        }

                        int start = (currentPage - 1) * itemsPerPage;
                        int end = Math.min(start + itemsPerPage, productList.size());

                        for (int i = start; i < end; i++) {
                            Product product = productList.get(i);
                    %>

                    <% NumberFormat numberFormat = NumberFormat.getInstance();
                    String formattedAdultPrice = numberFormat.format(product.getaPrice());
                    %>

                    <div class="col-12 mb-3">
                        <div class="product-card">
                            <img src="<%=product.getProductImg()%>" alt="Product Image">
                            <div class="card-body">
                                <a href="productDetail.pr?productId=<%=product.getProductId()%>" class="product-font">
                                    <h3 class="card-title"><%=product.getProductName()%></h3>
                                </a>
                                <p class="card-text"><%=product.getStartDate()%> ~ <%=product.getEndDate()%></p>
                                <p class="card-text" style="font-size: 18px; color: green;">가격: <%=formattedAdultPrice%>원~</p>
                                <div class="d-flex justify-content-end">
                                    <i id="heart-icon-<%=product.getProductId()%>" class="far fa-heart heart-icon" onclick="toggleFavorite(<%=product.getProductId()%>, this)"></i>
                                    <a href="orderPage.us?productId=<%=product.getProductId()%>&aNum=0&cNum=0" class="btn btn-primary">예약</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } } %>
                </div>
            </div>
        </div>

        <script>
        
            /* $(document).ready(function () {
                // 필터 버튼 클릭 시 'active' 클래스 추가/제거
                $(".travel-status-button").on("click", function () {
                    $(".travel-status-button").removeClass("active");
                    $(this).addClass("active");
                });

                $(".travel-period-button").on("click", function () {
                    $(".travel-period-button").removeClass("active");
                    $(this).addClass("active");
                });

                // 필터 버튼 클릭 시 AJAX 요청
                $(".travel-status-button, .travel-period-button, #search-button").on("click", function () {
                    var region = $("#search-input").val(); // 입력된 지역 필터값
                    var status = $(".travel-status-button.active").data("status") || ""; // 선택된 여행 상태 필터값
                    var period = $(".travel-period-button.active").data("period") || ""; // 선택된 여행 기간 필터값

                    console.log("AJAX 요청 시작 - region:", region, "status:", status, "period:", period); // 디버깅용 로그

                    // AJAX 요청
                    $.ajax({
                        type: 'GET',
                        url: '/filterProducts', // 경로에 '/world/' 추가
                        data: {  region_id: region, status: status, stay: period },
                        success: function (response) {
                            console.log("AJAX 응답 성공:", response); // 성공 응답 확인

                            var productList = $("#product-list");
                            productList.empty(); // 기존 리스트 초기화

                            // 서버로부터 받은 데이터로 상품 목록 업데이트
                            response.forEach(function (product) {
                                var productHtml = `
                                    <div class="product-card">
                                        <img src="${product.productImg}" alt="Product Image">
                                        <div class="card-body">
                                            <a href="productDetail.pr?productId=${product.productId}" class="product-font">
                                                <h3>${product.productName}</h3>
                                            </a>
                                            <p>${product.startDate} ~ ${product.endDate}</p>
                                            <p style="font-size: 18px; color: green;">가격: ${product.aPrice}원~</p>
                                            <div class="d-flex justify-content-end">
                                                <i class="far fa-heart heart-icon" onclick="toggleFavorite(${product.productId}, this)"></i>
                                                <a href="orderPage.us?productId=${product.productId}&aNum=0&cNum=0" class="btn btn-primary">예약</a>
                                            </div>
                                        </div>
                                    </div>
                                `;
                                productList.append(productHtml); // 새로 받은 상품들을 리스트에 추가
                            });
                        },
                        error: function () {
                            console.error("AJAX 요청 실패");
                            alert("상품을 불러오는데 실패했습니다.");
                        }
                    });
                });
            }); */
            
            $(document).ready(function () {
                function fetchProducts() {
                    var searchKeyword = $("#search-input").val();
                    var status = $(".filter-status.active").data("status") || "";
                    var period = $(".filter-period.active").data("period") || "";

                    $.ajax({
                        url: '/filterProducts.fp',
                        type: 'GET',
                        data: {
                            region: searchKeyword,
                            status: status,
                            stay: stay
                        },
                        success: function (response) {
                            $("#product-list").empty();
                            response.forEach(function (product) {
                                var productHtml = `
                                    <div class="product-card">
                                        <img src="${product.productImg}" alt="${product.productName}">
                                        <div class="card-body">
                                            <h3>${product.productName}</h3>
                                            <p>${product.startDate} ~ ${product.endDate}</p>
                                            <p>가격: ${product.aPrice}원</p>
                                        </div>
                                    </div>`;
                                $("#product-list").append(productHtml);
                            });
                        },
                        error: function () {
                            alert("상품을 불러오는 데 실패했습니다.");
                        }
                    });
                }

                // 검색 및 필터 버튼 클릭 시 상품 목록 갱신
                $("#search-button").click(fetchProducts);
                $(".filter-status, .filter-period").click(function () {
                    $(this).toggleClass('active');
                    fetchProducts();
                });
            });
            
        </script>
    </section>

    <%@ include file="/views/common/footer.jsp"%>
</body>

</html>
