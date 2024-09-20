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
public class CategoryModifyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryModifyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String categoryName = request.getParameter("categories-modify-title");
		String categoryEngName =request.getParameter("categories-modify-eng-title");
		int no = Integer.parseInt(request.getParameter("categories-modify-no")) ;
		
		ProCategory pc = new ProCategory(no,categoryName,categoryEngName);
		
		int result = new CategoryService().modifyCategory(pc);
		
		
		
		if(result>0) {
			System.out.println("성공");
			response.sendRedirect(request.getContextPath()+"/list.cg");
			
		}else {
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
