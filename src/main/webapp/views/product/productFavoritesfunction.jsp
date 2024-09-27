<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gd.hw.product.model.vo.Product"%>

<!DOCTYPE html>
<html>
<head>
</head>

<body>

<script>

// 찜하기
function toggleFavorite(productId, iconElement) {
    if (iconElement.classList.contains("far")) {  // 빈 하트일 경우
        $.ajax({
            url: 'productDetailInsert.pr', // 찜 테이블에 insert
            data: { productId: productId },
            success: function(result) {
                if (result > 0) {  // 성공했을 경우
                    iconElement.classList.remove("far");
                    iconElement.classList.add("fas");  // 채워진 하트
                }
            }
        });
    } else {  // 채워진 하트일 경우
        $.ajax({
            url: 'productDetailDelete.pr',  // 찜 테이블에서 delete
            data: { productId: productId },
            success: function(result) {
                if (result > 0) {  // 성공했을 경우
                    iconElement.classList.remove("fas");
                    iconElement.classList.add("far");  // 빈 하트
                }
            }
        });
    }
}

// 페이지가 로드되면 자동으로 찜한 상품 목록
function loadFavoriteList() {
    $.ajax({
        url: 'getFavoriteList.pr',  // 서버에서 찜한 상품 목록을 가져오는 경로
        success: function(favoriteList) {
            for (let i = 0; i < favoriteList.length; i++) {
                const productId = favoriteList[i];  // 찜한 상품의 ID를 가져옵니다.

                // 각 상품의 하트 아이콘을 찾아서 (빈 하트를) 채워진 하트로 변경합니다.
                const heartIcon = document.getElementById('heart-icon-' + productId);
                
                if (heartIcon) {  // 해당 상품에 맞는 하트 아이콘이 있을 경우
                    heartIcon.classList.remove("far");  // 빈 하트 클래스 제거
                    heartIcon.classList.add("fas");  // 채워진 하트 클래스 추가
                }
            }
        }
    });
}

// 페이지가 로드시 하트가져오는구문
$(document).ready(function() {
    loadFavoriteList();  // 페이지 로드 시 자동으로 호출
});

</script>
</body>
</html>
