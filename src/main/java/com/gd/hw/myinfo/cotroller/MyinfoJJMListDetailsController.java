package com.gd.hw.myinfo.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.myinfo.model.service.MyinfoService;
import com.google.gson.Gson;

/**
 * Servlet implementation class MyinfoJJMListDetailsController
 */
@WebServlet("/myinfoJjd.us")
public class MyinfoJJMListDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyinfoJJMListDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   // 
    	int userNo = Integer.parseInt(request.getParameter("userNo"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        MyinfoService myinfoService = new MyinfoService();
        int result = myinfoService.deleteJjimOut(userNo, productId);

        
        
        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(result, response.getWriter());
        
		
    }	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
