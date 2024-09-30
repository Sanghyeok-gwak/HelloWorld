package com.gd.hw.user.cotroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserPwdCheckController
 */
@WebServlet("/pwdCheck.me")
public class UserPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	        // 요청 파라미터 가져오기

	        String userPwd = request.getParameter("userPwd");
	        String userConfirmPwd = request.getParameter("userConfirmPwd");

	        // 비밀번호 확인
	        if (!userPwd.equals(userConfirmPwd)) {
	        	
	        	response.setContentType("text/html; charsert=utf-8");
	        	String str = "fail";
	        	response.getWriter().print(str);
//	            request.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
//	            request.getRequestDispatcher("/views/user/signup.jsp").forward(request, response);
//	            return;
	        }

	        // 비밀번호와 기타 사용자 정보 저장 로직 추가 (예: DB에 저장)

	        // 사용자 등록 완료 후 로그인 페이지로 이동
//	        response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
	    }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
