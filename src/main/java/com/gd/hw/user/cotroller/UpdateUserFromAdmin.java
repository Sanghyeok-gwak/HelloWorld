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
 * Servlet implementation class UpdateUserFromAdmin
 */
@WebServlet("/updateAd.us")
public class UpdateUserFromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserFromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user = new User(Integer.parseInt(request.getParameter("userNo")), request.getParameter("userId") ,request.getParameter("userpwd")
				            ,request.getParameter("name") ,request.getParameter("email"),request.getParameter("phone"));
		int result = new UserService().modifyUser(user);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원을 성공적으로 수정하였습니다.");
		}else {
			request.getSession().setAttribute("msg", "회원 수정 실패");
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
