package com.gd.hw.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.ProductService;
import com.gd.hw.product.model.vo.Product;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxProductFilter
 */
@WebServlet("/filterProducts.fp")
public class AjaxProductFilterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AjaxProductFilterController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        String region = request.getParameter("region");
        String status = request.getParameter("status");
        String stay = request.getParameter("stay");

        // ProductService를 호출하여 필터링된 상품 리스트를 가져옴
        List<Product> filteredProducts = new ProductService().filterProducts(categoryName, region, status, stay);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(filteredProducts, response.getWriter());
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}