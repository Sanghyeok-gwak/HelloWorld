<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 <!-- bohum css파일 -->
  <link rel="stylesheet" href="/world/assets/css/bohum.css">
  <!--bohum js파일 -->
  <script src="/world/assets/js/bohum.js"></script>

</head>

<body>
    <div class="popup">
        <div class="level">
        <br>
        		<!-- 값넘겨줄때 1 없음 -->
        		<label>선택안함</label>
            <input type="radio" id="" name="option" value="없음">
            
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
    </div>

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
        <button id="btn-1" class="btn">적용</button>
        <button class="margin-btn" id="btn-2" class="btn">취소</button>
    </div>