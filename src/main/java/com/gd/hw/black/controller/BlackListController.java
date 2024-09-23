package com.gd.hw.black.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.black.model.service.BlackService;
import com.gd.hw.black.model.vo.BlackList;

/**
 * Servlet implementation class BlackListController
 */
@WebServlet("/list.bk")
public class BlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("admin-blackList 서블릿 호출됨");
		List<BlackList> list = new BlackService().selectAllBlack();
		System.out.println("가져오는 행의 갯수 : "+ list.size());
		
		/*
		 * 페이징처리 나중에
		 */
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/black-admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
