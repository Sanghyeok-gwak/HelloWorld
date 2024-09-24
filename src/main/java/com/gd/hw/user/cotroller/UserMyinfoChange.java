package com.gd.hw.user.cotroller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class UserMyinfoChange
 */
@WebServlet("/myinfoCh.us")
public class UserMyinfoChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyinfoChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String modifyDate = request.getParameter("modify_date");
	
	User u = new User(userId,userName,email,phone,modifyDate);
	
	User updateU = new UserService().updateU(u);
	
	if(updateU == null) {
	  request.setAttribute("alerMsg", "회원 정보 변경 실패");
	  
	}else {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", updateU);
		
		session.setAttribute("alerMsg", "성공적으로 회원정보를 수정");
		response.sendRedirect(request.getContextPath()+"/myinfo.us");
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
