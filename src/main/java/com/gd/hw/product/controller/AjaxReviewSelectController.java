package com.gd.hw.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.ProductReviewService;
import com.gd.hw.review.model.vo.Review;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxReviewDeleteController
 */
@WebServlet("/select.re")
public class AjaxReviewSelectController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 상품 ID를 받아오기
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        // 리뷰 목록을 불러오는 서비스 호출
        List<Review> reviewList = new ProductReviewService().selectReview(productId);
        
        // 리뷰 목록을 JSON 형식으로 변환 후 반환
        response.setContentType("application/json; charset=UTF-8");
        
        // Gson을 이용해 reviewList를 JSON 형식으로 변환하여 응답에 작성
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(reviewList);
        response.getWriter().write(jsonResponse);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // POST 요청도 GET과 동일하게 처리
    }
}