<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .warning-main {
        text-align: center;
        margin-top: 200px;
        margin-bottom: 200px;

    }
    .warning-msg {
        color: red;
        margin-top: 100px;
    }
    .warning-text {
        margin-bottom: 30px;
    }
    #btn-1 {
        border: 1px solid #007AFF;
        border-radius: 5px;      
		height: 55px;
    }
    .warning-btn {
    	margin-top: 60px;
    }

</style>
</head>
<body>
<body>
	<%@ include file="/views/common/header.jsp"%>
	    <div class="warning-main">
    <div class="warning-msg">
        <h1><b>경고: 접근이 불가합니다</b></h1> <br>
    </div>

        <div class="warning-btn">
        <button type="submit" id="btn-1" onclick="location.href='<%=contextPath %>'"><b>메인으로 돌아가기</b></button>
    </div>
    </div>
    	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>