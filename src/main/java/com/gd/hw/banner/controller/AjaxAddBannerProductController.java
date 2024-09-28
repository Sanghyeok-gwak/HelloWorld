package com.gd.hw.banner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.banner.model.service.BannerService;
import com.gd.hw.banner.model.vo.Banner;

/**
 * Servlet implementation class AjaxAddBannerProductController
 */
@WebServlet("/addBannerProduct.pro")
public class AjaxAddBannerProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddBannerProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String checkedValues[] = request.getParameterValues("checkedValues");
		String bannerSelect = request.getParameter("bannerSelect");		
		
		
		
		
		
		
		int result = new BannerService().addBannerProduct(checkedValues,bannerSelect);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
