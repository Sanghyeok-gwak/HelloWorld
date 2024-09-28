package com.gd.hw.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.OrderAd;
import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class OrderListFromAdminController
 */
@WebServlet("/list.or")
public class OrderListFromAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListFromAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount =0;
		String keyword = request.getParameter("keyword");
		if(keyword != null) {
			listCount = new OrderService().selectOrderCountByKeyword(keyword);
		}else {
			listCount = new OrderService().selectUserListCount();
		}
		
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
	
		int pageLimit = 5;
		int boardLimit = 7;
		

		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<OrderAd> list = null;
		if(keyword != null) {
			list = new OrderService().selectOrderLIstByKeyword(pi, keyword);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

		}else {
			list = new OrderService().selectOrderLIst(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		}

		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/order-admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
