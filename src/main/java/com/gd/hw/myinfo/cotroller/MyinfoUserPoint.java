package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.myinfo.model.service.MyinfoService;

/**
 * Servlet implementation class MyinfoUserPoint
 */
@WebServlet("/myinfopo.us")
public class MyinfoUserPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyinfoUserPoint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	int userNo = Integer.parseInt(request.getParameter("userNo"));
        MyinfoService myinfoService = new MyinfoService();
        
        System.out.println(userNo);
        int result = myinfoService.selectPoint(userNo);

        request.setAttribute("re", result);
        
        request.getRequestDispatcher("/views/myinfo/mypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
