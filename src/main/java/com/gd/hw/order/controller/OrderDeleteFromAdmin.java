package com.gd.hw.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.order.model.service.OrderService;

/**
 * Servlet implementation class OrderDeleteFromAdmin
 */
@WebServlet("/del.or")
public class OrderDeleteFromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeleteFromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delUid =  request.getParameter("delUid");
		int result =  new OrderService().DeleteOrderByMerUid(delUid);
		if(result > 0) {
			request.getSession().setAttribute("msg", "환불처리가 완료되었습니다.");
		}else {
			request.getSession().setAttribute("msg", "환불처리 실패");
		}
		response.sendRedirect(request.getContextPath() + "/list.or");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
