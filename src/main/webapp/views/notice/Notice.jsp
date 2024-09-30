<%@page import="com.gd.hw.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Notice> list = (List<Notice>) request.getAttribute("list");
%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            text-align: center;
        }
        .notice-card {
            margin: 20px 0;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .notice-card-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .notice-card-header i {
            transition: transform 0.3s ease; /* 회전 애니메이션 추가 */
        }
        .notice-card-content {
            padding: 15px;
            display: none; /* 처음에 닫힌 상태로 설정 */
            font-size: 16px;
        }
        .active .notice-card-content {
            display: block; /* 활성화된 상태에서는 열림 */
        }
        .active .notice-card-header i {
            transform: rotate(180deg); /* 클릭 시 아이콘 회전 */
        }
        p {
            margin-bottom: 0px!important;
        }
    </style>
</head>
<body>

<%@ include file="/views/common/header.jsp"%>

<section>
    <div class="container">
        <div class="notice-title">
            <h1>공지사항</h1>
        </div>

        <% for(int i = 0; i < list.size(); i++) { %>
        <div class="notice-card">
            <div class="notice-card-header">
                <span><%= list.get(i).getNoticeTitle() %></span>
                <i class="fas fa-chevron-down"></i> <!-- 기본적으로 아래 화살표 -->
            </div>
            <div class="notice-card-content">
                <p><%= list.get(i).getNoticeContext() %></p>
            </div>
        </div>
        <% } %>

    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 모든 카드 내용 숨기기
        $('.notice-card-content').hide();

        // 카드 헤더 클릭 시 내용 토글
        $('.notice-card-header').click(function() {
            var card = $(this).parent();
            
            // 카드 토글
            card.toggleClass('active');
            $(this).siblings('.notice-card-content').slideToggle();
        });
    });
</script>

</body>
</html>
