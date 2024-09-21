package com.gd.hw.category.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.category.model.service.CategoryService;
import com.gd.hw.category.model.vo.ProCategory;

/**
 * Servlet implementation class CategoryModifyListController
 */
@WebServlet("/modifyList.cg")
public class AjaxCategoryModifyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCategoryModifyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String categoryName = request.getParameter("value1");
		String categoryEngName =request.getParameter("value2");
		int no = Integer.parseInt(request.getParameter("value3")) ;
		System.out.println(categoryName);
		System.out.println(categoryEngName);
		
		ProCategory pc = new ProCategory(no,categoryName,categoryEngName);
		
		int result = new CategoryService().modifyCategory(pc);
		
		
		
		if(result>0) {
			System.out.println("성공");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(result);
		}
		else {
			System.out.println("실패");
		}
		
		
		
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
