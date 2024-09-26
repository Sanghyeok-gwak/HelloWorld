package com.gd.hw.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.ProductfavoriteService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class AjaxFavoritesinsertController
 */
@WebServlet("/productDetailInsert.pr")
public class AjaxFavoritesInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
       public AjaxFavoritesInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 유저정보를 먼저 해야됨
		int userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		
		int result = new ProductfavoriteService().insertFavorite(userNo, productId);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
		
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
