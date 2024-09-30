<%@ page import = "java.util.List" %>
<%@ page import = "com.gd.hw.order.model.vo.ProductOr" %>
<%@ page import = "com.gd.hw.order.model.vo.Order" %>
<%@ page import = "com.gd.hw.order.model.vo.Person" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 		<script type="text/javascript"
   		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript"
  	 src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 		
 
 	<!-- bohum css파일 -->
  <link rel="stylesheet" href="/world/assets/css/bohum.css">
  <!--bohum js파일 -->
  <script src="/world/assets/js/bohum.js"></script>
  <!-- jquery 사용가능 파일 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
    
        <div class="level">
        <br>
        		<!-- 값넘겨줄때 1 없음 -->
        		<label>선택안함</label>
            <input type="radio" id="none" name="option" value="선택안함">
        		<!-- 값넘겨줄때 2 브론즈 -->
            <label>브론즈</label>
            <input type="radio" id="bronze" name="option" value="브론즈">
        		<!-- 값넘겨줄때 3 실버 -->
            <label>실버</label>
            <input type="radio" id="silver" name="option" value="실버">
        		<!-- 값넘겨줄때 4 골드 -->
            <label>골드</label>
            <input type="radio" id="gold" name="option" value="골드">
        		<!-- 값넘겨줄때 5 다이아 -->
            <label>다이아</label>
            <input type="radio" id="diamond" name="option" value="다이아">
        </div>

        
			
        <script>
          $(document).ready(function(){
            $(".dropdown-toggle").dropdown("toggle");
          });
          </script>
          



    <div class="bohum-list">
        <p>※ 적용 되지 않는 보험은 회색으로 표시됩니다.</p>
        <ul>
            <li>휴대품(분실제외)손해</li>
            <li>여행중 배상책임</li>  
            <li>상해후유장해</li>
            <li>상해사망</li>
        </ul>
    </div>
    
    <div class="bohum-choise">
		<a href="/bohum.us" style="color: gray; text-decoration-line: none;"> 
        <button id="btn-1" class="btn">적용</button>
        </a>
        <button class="margin-btn" id="btn-2" class="btn">취소</button>
    </div>
    
    </body>
    </html>
  