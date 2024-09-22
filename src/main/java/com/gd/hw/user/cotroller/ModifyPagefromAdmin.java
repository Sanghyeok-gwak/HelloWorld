package com.gd.hw.user.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class ModifyPagefromAdmin
 */
@WebServlet("/modiAd.us")
public class ModifyPagefromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyPagefromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("no"));
		System.out.println(userNo);
		
		// 해당 회원의 정보를 가져옴
		User user = new UserService().selectUserByUserNo(userNo);
		
		if(user != null) {// 가져온 정보가 있으면  수정페이지로 
			request.setAttribute("user", user);
			request.getRequestDispatcher("/views/admin/user-admin-modify.jsp").forward(request, response);
		}else {// 없으면 msg와함께 회원메인페이지로
			request.getSession().setAttribute("msg", "회원이 존재하지 않습니다.");
			response.sendRedirect(request.getContextPath() + "/list.us");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
