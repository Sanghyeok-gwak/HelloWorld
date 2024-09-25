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
 * Servlet implementation class ProductListController
 */
@WebServlet("/productAdd.pro")
public class AdminAddProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		
		int category = Integer.parseInt(request.getParameter("categoryValue")); 
		int subCategory = Integer.parseInt(request.getParameter("subCategoryValue")); 
		
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
		
		
		
		
		
		if((Integer.parseInt(endDate)-Integer.parseInt(startDate))==3) {
			stay="T";
		}
		else if ((Integer.parseInt(endDate)-Integer.parseInt(startDate))==4) {
			stay="F";
		}
		else {
			stay="E";
		}
		
		
		
		
		
		
		Product p = new Product(
								productName
							   ,productImg
							   ,subCategory
							   ,category
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
		
		
		
		int result = new AdminProductService().addProduct(p);
		
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
