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
	
	public ProductDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		Product product = new ProductService().getProductById(productId);

		if (product != null) {
			request.setAttribute("product", product); // JSP로 product 객체 전달
			request.getRequestDispatcher("/views/product/productDetail.jsp").forward(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}