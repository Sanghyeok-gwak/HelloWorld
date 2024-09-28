package com.gd.hw.user.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class UserSignupController
 */
@WebServlet("/signup.me")
public class UserSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청
		// 요청시 전달값 뽑기
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		User u = new User(userId, userPwd, userName, phone, email);
		
		int result = new UserService().SignupUser(u);
		
		if(result > 0) {
			/*
			 * * 회원가입 성공
			 *   ㄴ 응답페이지 : 메인페이지
			 *   ㄴ 응답데이터 : "성공적으로 회원가입 되었습니다." alert 메세지
			 */
			
			request.getRequestDispatcher("/views/common/addCompleted.jsp").forward(request, response);
			
//			request.getSession().setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
//			response.sendRedirect(request.getContextPath());
		}else {
			/*
			 * * 회원가입 실패
			 *   ㄴ 응답페이지 : 에러페이지 
			 *   ㄴ 응답데이터 : "회원가입 실패" 메세지 (해당 응답페이지에서만 필요)
			 */
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 실패");
			
//			request.setAttribute("alertMsg", "회원가입 실패");
			request.getRequestDispatcher("/views/user/signup.jsp").forward(request, response);
			
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