package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.myinfo.model.service.MyinfoService;
import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.order.model.vo.OrderAd;
import com.gd.hw.user.model.vo.User;
import com.gd.hw.myinfo.model.vo.Myinfo;

/**
 * Servlet implementation class UserMyinfomovement
 */
@WebServlet("/myinfom.us")
public class UserMyinfoMovementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMyinfoMovementController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	int userNo = Integer.parseInt(request.getParameter("no")); 
	int listCount = new MyinfoService().selectMyinfoCount( userNo );

	int currentPage = 1;
	if(request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}

	int pageLimit = 5;
	int boardLimit = 5;
	

	int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
	int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
	
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	 
	
	PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	
	List<Myinfo> list = new MyinfoService().selectMyinfoList(pi , userNo);
	int result = new MyinfoService().selectPoint(userNo);
	
	
			
	request.setAttribute("re", result);		
	request.setAttribute("no", userNo);
	request.setAttribute("pi", pi);
	request.setAttribute("list", list);

	request.getRequestDispatcher("/views/myinfo/mypage.jsp").forward(request, response);
	
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
