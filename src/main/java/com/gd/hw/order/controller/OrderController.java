package com.gd.hw.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.order.model.vo.Person;

/**
 * Servlet implementation class Kakaopay
 */
@WebServlet("/Order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	      request.setCharacterEncoding("UTF-8");
	      
		  // 가지고온 데이터 PAYMENT, ORDER 테이블에 들어갈 정보들 ORDER객체 하나에 다 담음
		  String merchantUid = request.getParameter("merUid");
		  int userNo = Integer.parseInt(request.getParameter("userNo"));
		  int productId = Integer.parseInt(request.getParameter("productId"));
		  int bhNo = Integer.parseInt(request.getParameter("bhNo"));
		  String impUid = request.getParameter("impUid");
		  int adult = Integer.parseInt(request.getParameter("adult"));
		  int child = Integer.parseInt(request.getParameter("child"));
		  String flight = request.getParameter("flight");
		  int pointU = Integer.parseInt(request.getParameter("pointU"));
		  int totalPay = Integer.parseInt(request.getParameter("totalPay"));
		
		  Order o = new Order(merchantUid,userNo,productId,bhNo,impUid,adult,child,flight,pointU,totalPay);
		  // PERSON은 한 결제에 여러행 INSERT일 수 있음 넘어오는 값도 배열형태
				//->> 어려우니까 일단 생각하지 않음
	      List<Person> list = null; // 원래는 배열형태로 넘어온걸 잘 까서 넣어줘야하는데
	      //상상하기 어려워서 일단 null
	      
	      int result = new OrderService().insertOrder(o,list);

	      response.setContentType("text/html; charset=UTF-8");
	      
	      if(result>2) {
	         response.getWriter().print("결제 성공!!!!");
	         
	      }else {
	         response.getWriter().print("실패");
	      }
	   
	   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
