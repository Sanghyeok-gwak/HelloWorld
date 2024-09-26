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
 * Servlet implementation class AjaxFavoritesDeleteController
 */
@WebServlet("/productDetailDelete.pr")
public class AjaxFavoritesDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFavoritesDeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				int userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
				int productId = Integer.parseInt(request.getParameter("productId"));
				
				int result = new ProductfavoriteService().deleteFavorite(userNo, productId);
				
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(result);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
