package com.gd.hw.category.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.category.model.service.CategoryService;
import com.gd.hw.category.model.vo.Region;

/**
 * Servlet implementation class AjaxSubCategoryModifyListController
 */
@WebServlet("/subModifyList.cg")
public class AjaxSubCategoryModifyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSubCategoryModifyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String subTietle = request.getParameter("value1");
		String subEngTietle = request.getParameter("value2");
		int subNo = Integer.parseInt(request.getParameter("value3"));
		
		Region r = new Region(subNo,subTietle,subEngTietle);
	
		int result = new CategoryService().subModifyList(r);
		
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(result);
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
