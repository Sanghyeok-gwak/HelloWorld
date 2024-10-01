package com.gd.hw.myinfo.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.myinfo.model.service.MyinfoService;
import com.gd.hw.user.model.service.UserService;

/**
 * Servlet implementation class UserMyinfoLogin
 */
@WebServlet("/myinfolo.us")
public class UserMyinfoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyinfoLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		String checkPwd = new MyinfoService().longincheck(userId,userPwd);
		
		
		
		if(checkPwd != null && userPwd.equals(checkPwd)) {
			request.getRequestDispatcher("/views/myinfo/mypagecorrection.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "비밀번호가 다릅니다");
			response.sendRedirect(request.getContextPath() + "/myinfo.us");
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
