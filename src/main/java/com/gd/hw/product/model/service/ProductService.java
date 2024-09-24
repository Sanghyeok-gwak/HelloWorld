package com.gd.hw.product.model.service;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.product.model.dao.ProductDao;
import com.gd.hw.product.model.vo.Product;

public class ProductService {

    private ProductDao productDao = new ProductDao();

    public List<Product> getProductList(Connection conn, String categoryName) {
        return productDao.selectProductList(conn, categoryName);
    }
}
