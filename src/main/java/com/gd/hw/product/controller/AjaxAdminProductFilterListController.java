package com.gd.hw.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.service.AdminProductService;
import com.gd.hw.product.model.vo.Product;
import com.google.gson.Gson;

/**
 * Servlet implementation class AdminProductFilterListController
 */
@WebServlet("/filterByCategory.pro")
public class AjaxAdminProductFilterListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminProductFilterListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String selectFilterByCategory = request.getParameter("category");
		System.out.println(selectFilterByCategory);
		int listCount = new AdminProductService().selectProductCategoryListCount(selectFilterByCategory);
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int pageLimit = 5;
		int boardLimit = 5;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		
		List<Product> list = new AdminProductService().filterByCategory(selectFilterByCategory,pi);
		
		
		Map<String, Object> responseData = new HashMap<>();
        responseData.put("list", list);
        responseData.put("pi", pi);

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // JSON으로 변환하여 출력 (Gson 라이브러리 사용)
        out.print(new Gson().toJson(responseData));
        out.flush();
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
