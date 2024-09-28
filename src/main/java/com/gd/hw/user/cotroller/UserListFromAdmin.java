package com.gd.hw.user.cotroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.google.gson.Gson;

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
		request.setCharacterEncoding("utf-8");
		
		int listCount =0;
		String keyword = request.getParameter("keyword");
		if(keyword != null) {
			listCount = new UserService().selectUserListByKeyword(keyword);
		}else {
			listCount = new UserService().selectUserListCount() -1;
		}
		
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int pageLimit = 5;
		int boardLimit = 7;
		

		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<User> list = null;
		if(keyword != null) {
			list = new UserService().selectUserByKeyword(pi, keyword);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

		}else {
			list = new UserService().selectAllUser(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
		}
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
