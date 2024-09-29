package com.gd.hw.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.ProductReviewService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class AjaxReviewInsertController
 */
@WebServlet("/insert.re")
public class AjaxReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        
        if (loginUser == null) {
            response.getWriter().print("fail");
            return;
        }

        int userNo = loginUser.getUserNo();
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));

        ProductReviewService reviewService = new ProductReviewService();
        int result = reviewService.insertReview(userNo, content, rating);

        if (result > 0) {
            response.getWriter().print("success");
        } else {
            response.getWriter().print("fail");
        }
    }
	

}
