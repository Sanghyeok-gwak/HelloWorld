package com.gd.hw.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.template.JDBCTemplate;
import com.gd.hw.product.model.service.ProductService;
import com.gd.hw.product.model.vo.Product;

@WebServlet("/productDetail.pr")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = new ProductService().getProductById(productId);

		if (product != null) {
			request.setAttribute("product", product); // JSP로 product 객체 전달
			request.getRequestDispatcher("/views/product/productDetail.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int userNo = (int) request.getSession().getAttribute("userNo"); // 로그인 유저 정보
	    int productId = Integer.parseInt(request.getParameter("productId"));
	    String action = request.getParameter("action");

	    Connection conn = null; // Connection 객체를 추가
	    try {
	        conn = JDBCTemplate.getConnection(); // Connection 객체 생성
	        if ("toggleFavorite".equals(action)) {
	            ProductService productService = new ProductService();
	            productService.toggleFavorite(conn, userNo, productId); // Connection 객체 전달
	        }
	        conn.commit(); // 변경 사항을 커밋
	    } catch (SQLException e) {
	        if (conn != null) {
	            try {
	                conn.rollback(); // 오류 발생 시 롤백
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }
	        }
	        e.printStackTrace(); // 예외를 출력하여 디버깅
	    } finally {
	        JDBCTemplate.close(conn); // Connection 객체 닫기
	    }

	    response.sendRedirect("productDetail.pr?productId=" + productId); // 상품 상세 페이지로 리다이렉트
	}
}