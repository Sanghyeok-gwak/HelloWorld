package com.gd.hw.user.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.user.model.service.UserService;

/**
 * Servlet implementation class DeleteUserFromAdmin
 */
@WebServlet("/deleteUser.us")
public class DeleteUserFromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserFromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**선택된 User를 탈퇴처리
	 * @see 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delUser = request.getParameter("delUser");
		System.out.println(delUser);
		
		delUser=delUser.replace("\"", "").replace("[", "").replace("]", "");
		
		String[] arr = delUser.split(",");

		
		if (arr != null) {
		    for (String userId : arr) {
		        System.out.println(userId);
		    }
		    
		    int result = new UserService().deletUser(arr);
		    if(result == arr.length) {
		    	System.out.println("탈퇴처리 성공");
	    	response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(result);
		    }
		} else {
		    System.out.println("안됨");
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
