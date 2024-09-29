<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->
<style>
.complete-page {
	justify-content: center;
}

.btn {
	margin-top: 50px;
}
</style>
</head>

<body>
	<%@ include file="/views/common/header.jsp"%>
	<section
		style="margin-top: 200px; margin-bottom: 200px; display: flex; justify-content: center; align-items: center;">
		<div class="add-complete text-center">
			<div>
				<img
					src="<%=contextPath%>/assets/image/Check_circle-removebg-preview.png"
					alt="Check_circle">
			</div>
			<div class="container complete-page">
				<div>
					<h1>
						<b>회원가입이 완료되었습니다!</b>
					</h1>
				</div>
				<%
				    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy.MM.dd");
				    String today = sdf.format(new java.util.Date());
				%>

				<div>
					<span id="currentDate" style="font-weight: bold;"><%= today %></span>
				</div>

				<div>
					<button class="btn" onclick="location.href='<%=contextPath%>'"
						style="color: #007AFF; background-color: #cadfff;">
						<img src="<%=contextPath%>/assets/image/icon-removebg-preview.png"
							alt="버튼이미지"> <span><b>돌아가기</b></span>
					</button>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/views/common/footer.jsp"%>

	<!-- 스크립트 추가: 날짜를 yyyy.mm.dd 형식으로 표시 -->
	<!--  
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date();
            const year = today.getFullYear();
            const month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더함
            const day = String(today.getDate()).padStart(2, '0');
            
            // yyyy.mm.dd 형식으로 날짜 만들기
            const currentDate = `${year}.${month}.${day}`;
            document.getElementById('currentDate').textContent = currentDate; // span 태그에 날짜 삽입
        });
    </script>
    -->
</body>
</html>
