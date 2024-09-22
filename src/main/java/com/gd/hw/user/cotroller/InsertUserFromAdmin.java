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
 * Servlet implementation class InsertUserFromAdmin
 */
@WebServlet("/insertAd.us")
public class InsertUserFromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserFromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		User user = new User(request.getParameter("userid"),request.getParameter("userpwd"),request.getParameter("name")
							,request.getParameter("email"),request.getParameter("phone"));
		int result = new UserService().addUser(user);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원을 성공적으로 추가하였습니다.");
		}else {
			request.getSession().setAttribute("msg", "회원 추가 실패");
		}
		response.sendRedirect(request.getContextPath() + "/list.us");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
