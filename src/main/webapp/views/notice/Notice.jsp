<%@page import="com.gd.hw.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Notice> list = (List<Notice>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 <style>
        body {
            background-color: #f8f9fa;
        }
        .header, .footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        .notice-title {
            font-size: 24px;
            font-weight: bold;
            margin: 20px 0;
        }
        .notice-card {
            margin: 20px 0;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .notice-card-header {
            background-color: #007bff;
            color: black;
            padding: 10px;
            border-radius: 8px 8px 0 0;
            font-size:15px;
            font-weight:800;
            cursor: pointer; 
        }
        .notice-card-content {
            padding: 15px;
            display: none; 
        }
        .active .notice-card-content {
            display: block; 
        }
    </style>

</head>
<body>
<%@ include file="/views/common/header.jsp"%>
<section>
	 

    
    <div class="container">
        <div class="notice-title"><h1>공지사항</h1></div>
		<% for(int i =0; i<list.size(); i++){%>
        <!-- 공지사항 카드 예시 -->
        <div class="card notice-card">
            <div class="card-header notice-card-header">
                <h5 class="mb-0"><%=list.get(i).getNoticeTitle() %></h5>
            </div>
            <div class="card-body notice-card-content">
                <p><%=list.get(i).getNoticeContext() %></p>
                
            </div>
        </div>

        <%} %>
    </div>

    
</section>
<script>
        $(document).ready(function(){
            $('.notice-card-header').click(function(){
                $(this).parent().toggleClass('active');
                $(this).siblings('.notice-card-content').slideToggle();
            });
        });
</script>
<%@ include file="/views/common/footer.jsp"%>
</body>
</html>