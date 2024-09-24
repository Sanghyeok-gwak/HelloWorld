package com.gd.hw.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.template.JDBCTemplate;
import com.gd.hw.product.model.service.ProductService;
import com.gd.hw.product.model.vo.Product;

@WebServlet("/productList.pr")
public class ProductListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String categoryName = request.getParameter("categoryName");

        Connection conn = JDBCTemplate.getConnection();
        ProductService productService = new ProductService();

        List<Product> productList = productService.getProductList(conn, categoryName);

        request.setAttribute("productList", productList);
        request.setAttribute("categoryName", categoryName); 

        request.getRequestDispatcher("/views/product/productList.jsp").forward(request, response);

        JDBCTemplate.close(conn);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
