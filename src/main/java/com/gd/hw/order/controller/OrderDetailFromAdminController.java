package com.gd.hw.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.OrderAd;
import com.gd.hw.order.model.vo.Person;

/**
 * Servlet implementation class OrderDetailFromAdminController
 */
@WebServlet("/detail.or")
public class OrderDetailFromAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailFromAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String merUid = request.getParameter("no");
		OrderAd order = new OrderService().selectOrderByMerUid(merUid);
		List<Person> list = new OrderService().selectAllPersonByMerUid(merUid);
		request.setAttribute("order", order);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/order-detail-admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
