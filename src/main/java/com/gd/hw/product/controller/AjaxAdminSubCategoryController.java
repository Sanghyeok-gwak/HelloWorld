package com.gd.hw.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.category.model.vo.Region;
import com.gd.hw.product.model.service.AdminProductService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdminSubCategoryController
 */
@WebServlet("/subList.pro")
public class AjaxAdminSubCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminSubCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String categoryEngName = request.getParameter("categoryName");
//		System.out.println(categoryName);
		List<Region> list = new AdminProductService().selectSubList(categoryEngName);
		
	    response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // JSON으로 변환하여 출력 (Gson 라이브러리 사용)
	    out.print(new Gson().toJson(list));
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
