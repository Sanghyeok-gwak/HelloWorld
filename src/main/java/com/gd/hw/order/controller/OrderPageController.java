package com.gd.hw.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.ProductOr;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class OrderPageController
 */
@WebServlet("/orderPage.us")
public class OrderPageController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 문자열로 
		request.setCharacterEncoding("utf-8");
		 
		// 상세페이지에서 결제창으로 넘길 페이지 -> 상품 정보 전달면 받으면 주석없앨 예정
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		int aNum = 0;
		int cNum = 0;
		if(request.getParameter("aNum") != null) {
			aNum = Integer.parseInt(request.getParameter("aNum"));
		}
		if(request.getParameter("cNum") != null) {
			cNum = Integer.parseInt(request.getParameter("cNum"));
		}
	
		ProductOr p = new OrderService().selectProductById(productId);
	    p.setaCount(aNum);
	    p.setcCount(cNum);
		
	    HttpSession session = request.getSession();
	    User loginUser = (User)session.getAttribute("loginUser");
	    int no = loginUser.getUserNo();
	    int point = new OrderService().selectMyPoint(no);
	    
		request.setCharacterEncoding("utf-8");
		request.setAttribute("p",p);
		request.setAttribute("point",point);
		
		request.getRequestDispatcher("/views/order/payment.jsp").forward(request, response);
		

//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
