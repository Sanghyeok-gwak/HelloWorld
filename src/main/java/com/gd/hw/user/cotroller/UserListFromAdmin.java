package com.gd.hw.user.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.service.AdminProductService;
import com.gd.hw.product.model.vo.Product;
import com.gd.hw.user.model.service.UserService;
import com.gd.hw.user.model.vo.User;

/**
 * Servlet implementation class UserListFromAdmin
 */
@WebServlet("/list.us")
public class UserListFromAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListFromAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("admin-userList 서블릿 호출됨");
		
		// 총 회원의 갯수를 가져옴
		// 근데 관리자는 목록에 보이지 않게 해줄거라 조회된 행의 갯수에서도 -1해줌
		int listCount = new UserService().selectUserListCount() -1;
		System.out.println("회원갯수 : "+listCount);
		// 현재 페이지를 1로 설정해두고 만약 서블릿이 호출될 때 전달된 페이지값이 있다면 그걸로 바꿔줌
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		// 페이징바에 숫자 몇까지 보일지 , 한 페이지당 보일 행의 갯수
		int pageLimit = 5;
		int boardLimit = 10;
		
		// 총 페이지수, 사용자에게 보여질 시작수, 사용자에게 보여질 마지막수 
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		System.out.println("마지막 페이지수 : "+maxPage);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이지 관련 정보들을 페이지 객체에 담아줌
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<User> list = new UserService().selectAllUser(pi);
		
		// pi라는 이름으로 다음 페이지로 전달시킴
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/user-admin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
