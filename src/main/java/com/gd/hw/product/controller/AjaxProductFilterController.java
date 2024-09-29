package com.gd.hw.product.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gd.hw.product.model.service.ProductService;
import com.gd.hw.product.model.vo.Product;
import com.google.gson.Gson;

@WebServlet("/filterProducts.fp")
public class AjaxProductFilterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AjaxProductFilterController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파라미터 받아오기
        String productName = request.getParameter("productName");
        String[] stay = request.getParameterValues("stay");

        // 필터링된 상품 목록 조회
        ProductService productService = new ProductService();
        List<Product> productList = productService.filterProducts(productName, stay);

        // 필터링된 상품 리스트를 request 객체에 저장하고 JSP로 전달
        request.setAttribute("productList", productList);

        // 결과 페이지로 포워딩
        request.getRequestDispatcher("/views/product/productList.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
