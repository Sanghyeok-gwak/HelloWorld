package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class UserMyinfoPwdCotroller
 */
@WebServlet("/myinfopwd.us")
public class UserMyinfoPwdCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyinfoPwdCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Map<String, String>map = new HashMap<>();
		map.put("userId",request.getParameter("userId"));
		map.put("userPwd",request.getParameter("userPwd"));
		map.put("updatePwd", request.getParameter("updatePwd"));
		
		User updateUn = new UserService().updateUserPwd(map);
		
		HttpSession session = request.getSession();
		
		if(updateUn == null) {
			session.setAttribute("alertMsg", "비밀번호 변경 실패");
		}else {
			session.setAttribute("loginUser", updateUn);
			session.setAttribute("alertMsg","비밀번호 변경 완료.");
		}
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
