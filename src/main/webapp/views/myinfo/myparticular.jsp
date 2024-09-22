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
</style>
<body>
<%@ include file="/views/common/header.jsp" %>

	<div class="helloworld-main layout">
        <div class="side">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">이준님<br>WELCOME</h5>
                    <p class="card-text"><h5><a href="#" style="color: gray; text-decoration-line: none;">내정보 관리<i class="fa-solid fa-play"> </h5></i></a></p>
                    <p><h5>적립금 0P</h5></p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-3"><a href="#"><h5>예약 / 결제</h5></a></li>
                        <li class="mb-3"><a href="#"><h5>찜</h5></a></li>
                        <li class="mb-3"><a href="#"><h5>리뷰</h5></a></li>
                        <li><a href="#"><h5>고객센터</h5></a></li>
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
                <tr>
                    <th><h5>여행자명</h3></th>
                    <td><h5> JUN/LEE</h5></td>
                </tr>
                <tr>
                    <th><h5>여권 정보</h5></th>
                    <td><h5> M6713250 </h5></td>
                </tr>
                <tr>
                    <th><h5>생년월일</h5></th>
                    <td><h5> 1998.12.11</h5></td>
                </tr>
                <tr>
                    <th><h5>보험 등급</h5></th>
                    <td><h5>다이아</h5></td>
                </tr>
                <tr>
                    <th><h5>보험 가격</h5></th>
                    <td><h5>230,000원</h5></td>
                </tr>
                <tr>
                    <th><h5>적립금</h5></th>
                    <td><h5>1305원 사용</h5></td>
                </tr>
                 
            </table>
            <br>
            <div class="Product">
                <h3>상품 정보</h3>
            </div>
                <br>
            <table class="Product name">
                <tr>
                    <th><h5><상품명></h3></th>
                    <td><h5>[베스트셀러/W트립] 동유럽/발칸 5국9일,대한항공,전일4성,2대야경+자유시간,6대특식</h5></td>
                </tr>
                <tr>
                    <th><h5>여행 기간</h5></th>
                    <td><h5> 3박 5일 2024-09-23(월)~2024-09-27(금)</h5></td>
                </tr>
                <tr>
                    <th><h5>적립금</h5></th>
                    <td><h5>1300원</h5></td>
                </tr>
                <tr>
                    <th><h5>교통/ 항공편</h5></th>
                    <td><h5>비엣 항공 969 [왕복]</h5></td>
                </tr>
                <tr>
                    <th><h5>상품 가격</h5></th>
                    <td><h5>1,354,000원</h5></td>
                </tr>
                <tr>
                    <th><h5>결제정보</h5></th>
                    <td><h5>카카오페이</h5></td>
                </tr>
                <tr>
                    <th><h5>총금액 :</h5></th>
                    <td><h5>1,354,000원</h5></td>
                </tr>
            </table>
            <div><button id="btn-1" class="btn" style="float:right;width: 150px;"  >목록으로</button></div>
        </main>
    </div>
              <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>