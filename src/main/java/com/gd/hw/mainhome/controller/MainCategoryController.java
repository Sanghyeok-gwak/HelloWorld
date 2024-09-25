package com.gd.hw.mainhome.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.category.model.vo.ProCategory;
import com.gd.hw.mainhome.model.service.MainService;
import com.google.gson.Gson;

/**
 * Servlet implementation class MainCategoryController
 */
@WebServlet("/list.mcc")
public class MainCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 여기다가 테스트!
		// 여기다가 테스트2!
		// 여기다가 테스트3!
		// 여기다가 테스트4!
		List<ProCategory> list = new MainService().selectList();
		
		if(!list.isEmpty()) {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
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
