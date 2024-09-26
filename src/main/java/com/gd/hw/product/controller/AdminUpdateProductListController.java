package com.gd.hw.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.AdminProductService;
import com.gd.hw.product.model.vo.Product;

/**
 * Servlet implementation class AdminUpdateProductListController
 */
@WebServlet("/updateProduct.pro")
public class AdminUpdateProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//추후 변경
//		int category = Integer.parseInt(request.getParameter("categoryValue")); 
//		int subCategory = Integer.parseInt(request.getParameter("subCategoryValue")); 
		
		String productName = request.getParameter("productName");
		String flight = request.getParameter("flight");
		String productImg = request.getParameter("productImg");
		int amount = Integer.parseInt(request.getParameter("amount")); 
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int aPrice = Integer.parseInt(request.getParameter("aPrice"));
		int cPrice = Integer.parseInt(request.getParameter("cPrice"));
		String infoEditor = request.getParameter("summernote1");
		String scheduleEditor = request.getParameter("summernote2");
		String detailEditor = request.getParameter("summernote3");
		String stay = "";
		int no = Integer.parseInt(request.getParameter("no"));
		if((Integer.parseInt(endDate)-Integer.parseInt(startDate))==3) {
			stay="T";
		}
		else if ((Integer.parseInt(endDate)-Integer.parseInt(startDate))==4) {
			stay="F";
		}
		else {
			stay="E";
		}
		System.out.println(no);
		// 시작 일 .넣어서 추가하기
		String day = startDate.substring(0, 2);    
		String month = startDate.substring(2, 4);  
		String year = startDate.substring(4, 6); 
		startDate = day + "." + month + "." + year;
		
		// 끝 일 .넣어서 추가하기
		day = endDate.substring(0, 2);    
		month = endDate.substring(2, 4);  
		year = endDate.substring(4, 6); 
		endDate = day + "." + month + "." + year;
		
		Product p = new Product(
				productName
			   ,productImg
			   ,startDate
			   ,endDate
			   ,stay
			   ,aPrice
			   ,cPrice
			   ,amount
			   ,flight
			   ,infoEditor
			   ,scheduleEditor
			   ,detailEditor
			   );
		int result = new AdminProductService().updateProduct(p ,no);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/list.pro");
			System.out.println("성공");
		}else {
			System.out.println("실패");
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
