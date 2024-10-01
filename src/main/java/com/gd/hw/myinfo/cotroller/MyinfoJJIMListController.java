package com.gd.hw.myinfo.cotroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.myinfo.model.service.MyinfoService;
import com.gd.hw.myinfo.model.vo.MyJjim;

/**
 * Servlet implementation class MyinfoJJIMListController
 */
@WebServlet("/myinfojj.us")
public class MyinfoJJIMListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyinfoJJIMListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int userNo = Integer.parseInt(request.getParameter("no")); 
	int jjimCount = new MyinfoService().selectMyinfoJJIMCount(userNo);
	
	int currentPage = 1;
	if(request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	
	int pageLimit = 5;
	int boardLimit = 5;
	
	int maxPage = (int)Math.ceil( (double)jjimCount / boardLimit );
	int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
	
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	
	PageInfo pi = new PageInfo(jjimCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

	List<MyJjim> list = new MyinfoService().myinfoJJIMListList(pi, userNo);
    MyinfoService myinfoService = new MyinfoService();
	int result = myinfoService.selectPoint(userNo);

	request.setAttribute("no", userNo);
	request.setAttribute("pi", pi);
	request.setAttribute("JJlist", list);
    request.setAttribute("re", result);

	request.getRequestDispatcher("/views/myinfo/JJIMList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
