package com.gd.hw.black.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.black.model.service.BlackService;

/**
 * Servlet implementation class AjaxDeleteBlackListController
 */
@WebServlet("/delBlack.bk")
public class AjaxDeleteBlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDeleteBlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delUser = request.getParameter("delUser");
		
		delUser=delUser.replace("\"", "").replace("[", "").replace("]", "");
		
		String[] arr = delUser.split(",");

		
		if (arr != null) {
		    
		    int result = new BlackService().delBlackList(arr);
		    if(result == arr.length) {
		    	System.out.println("탈퇴처리 성공");
	    	response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(result);
		    }
		} else {
		    System.out.println("안됨");
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
