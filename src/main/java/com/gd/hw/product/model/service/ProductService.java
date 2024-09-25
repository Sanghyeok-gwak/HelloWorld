package com.gd.hw.product.model.service;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.product.model.dao.ProductDao;
import com.gd.hw.product.model.vo.Product;

public class ProductService {

    private ProductDao productDao = new ProductDao();

    // 카테고리 클릭시 지역에 맞는 상품리스트 조회
    public List<Product> getProductList(Connection conn, String categoryName) {
        return productDao.selectProductList(conn, categoryName);
    }
    
    
    
    
    
    
}
