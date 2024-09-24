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
 * Servlet implementation class UserLoginController
 */
@WebServlet("/login.me")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//  인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// 요청 파라미터 가져오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		// 사용자 서비스 호출
		User loginUser = new UserService().loginMember(userId, userPwd);
		// 로그인 처리
		if(loginUser == null) {
			// 로그인 실패시 실패메세지를 저장하고 로그인 페이지로 리다이렉트
			request.setAttribute("alertMsg", "아이디 또는 비밀번호가 잘못되었습니다. 다시 입력해 주세요.");
	        request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
			
        } else {
        	String status = loginUser.getStatus(); // 상태 가져오기 (탈퇴, 블랙리스트 등)
            
            if ("R".equals(status)) {
                // 탈퇴 회원일 경우

                request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
                
            } else if ("B".equals(status)) {
                // 블랙리스트 회원일 경우

                request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
                
            } else {

	            // 로그인 성공 시, 세션에 사용자 정보 저장 및 메인 페이지로 리다이렉트
	            HttpSession session = request.getSession();
	            session.setAttribute("loginUser", loginUser); 
	          
	            String roll = loginUser.getRoll(); // 역할 가져오기
	            if ("A".equals(roll)) {
	                response.sendRedirect(request.getContextPath());
	            } else if ("M".equals(roll)) {
	                response.sendRedirect(request.getContextPath());
	            } else {
	                response.sendRedirect(request.getContextPath()); // 일반 사용자
	            }

            
            }
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
