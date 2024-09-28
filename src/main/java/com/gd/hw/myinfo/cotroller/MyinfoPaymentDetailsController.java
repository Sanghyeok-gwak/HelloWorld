package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.myinfo.model.service.MyinfoService;
import com.gd.hw.myinfo.model.vo.MyOrderDt;

/**
 * Servlet implementation class MyinfoPaymentDetailsController
 */
@WebServlet("/myinfodt.us")
public class MyinfoPaymentDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyinfoPaymentDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String userNo = request.getParameter("userNo");
	    String productNo = request.getParameter("productNo");
	    
	   
		
        List<MyOrderDt>list  = new MyinfoService().myinfoPaymentdetails(userNo, productNo);
        
        request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/myinfo/myparticular.jsp").forward(request, response);
        

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
