package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.myinfo.model.service.MyinfoService;
import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class UserMyinfoChange
 */
@WebServlet("/myinfoch.us")
public class UserMyinfoChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyinfoChangeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	int userNo = Integer.parseInt(request.getParameter("userNo"));
	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	User u = new User(userNo,userId,userName,email,phone);
	
	User updateUn = new MyinfoService().updateUser(u);
	
	request.setAttribute("no", userNo);
	request.getParameter("userId");
	
	
	
	HttpSession session = request.getSession();
	if(updateUn == null) {
	  session.setAttribute("alertMsg", "회원 정보 변경 실패");
      request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);


	}else {
		session.setAttribute("loginUser", updateUn);
		
		session.setAttribute("alertMsg", "성공적으로 회원정보를 수정");
		response.sendRedirect(request.getContextPath()+"/myinfom.us?no=" + userNo );
		
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
