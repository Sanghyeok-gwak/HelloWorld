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

import com.gd.hw.myinfo.model.service.MyinfoService;
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

		Map<String, String> map = new HashMap<>();
		map.put("userId", request.getParameter("userId"));
		map.put("userPwd", request.getParameter("userPwd"));
		map.put("updatePwd", request.getParameter("updatePwd"));
		
		User updateMem = new MyinfoService().updateUserPwd(map);
		
		// 2. 응답
		HttpSession session = request.getSession();
		
		if(updateMem == null) { // 실패
			// 응답페이지 : 마이페이지 
			// 응답데이터 : "비밀번호 변경 실패" alert 메세지
			session.setAttribute("alertMsg", "비밀번호 변경이 실패하였습니다.");
		}else { // 성공
			// session에 담겨있는 회원 객체 갱신 
			session.setAttribute("loginUser", updateMem);
			// 응답페이지 : 마이페이지 
			// 응답데이터 : "성공적으로 비밀번호가 변경되었습니다." alert 메세지
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
		}			
	
		// 성공이든 실패든 /web/myinfo.me   url 재요청 => 마이페이지로 포워딩
		response.sendRedirect(request.getContextPath() + "/myinfo.us");
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
