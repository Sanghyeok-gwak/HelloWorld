package com.gd.hw.black.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.black.model.service.BlackService;
import com.gd.hw.black.model.vo.BlackList;

/**
 * Servlet implementation class AddBlackController
 */
@WebServlet("/addlBlack.bk")
public class AddBlackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBlackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userid");
		String reason = request.getParameter("reason");
		String treatment = request.getParameter("op");
		BlackList b = new BlackList(userId, reason, treatment);
		
		int result = new BlackService().addBlackList(b);
		if(result > 0) {
			request.getSession().setAttribute("msg", "블랙리스트를 성공적으로 추가하였습니다.");
		}else {
			request.getSession().setAttribute("msg", "블랙리스트 추가 실패");
		}
		response.sendRedirect(request.getContextPath() + "/list.bk");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
