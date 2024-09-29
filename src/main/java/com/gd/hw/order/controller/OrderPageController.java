package com.gd.hw.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.ProductOr;

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
		
		// 클라이언트에서 전달받은 파라미터 (productId, aNum, cNum)를 문자열로 받아오기
	    // 파라미터는 상세 페이지에서 인원 선택 후 넘겨받은 값들
	    String productIdStr = request.getParameter("productId");
	    String aNumStr = request.getParameter("aNum");
	    String cNumStr = request.getParameter("cNum");

		
	    // 받아온 파라미터가 null이거나 빈 문자열일 경우를 확인하여 처리
	    // null 또는 빈 값일 때 기본값 0을 할당하고, 정상적인 값일 때는 숫자로 변환
	    int productId = (productIdStr != null && !productIdStr.isEmpty()) ? Integer.parseInt(productIdStr) : 0;
	    int aNum = (aNumStr != null && !aNumStr.isEmpty()) ? Integer.parseInt(aNumStr) : 0;
	    int cNum = (cNumStr != null && !cNumStr.isEmpty()) ? Integer.parseInt(cNumStr) : 0;

	
		ProductOr p = new OrderService().selectProductById(productId);
	    p.setaCount(aNum);
	    p.setcCount(cNum);
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("p",p);
		
		request.getRequestDispatcher("/views/order/payment.jsp").forward(request, response);
		

//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
