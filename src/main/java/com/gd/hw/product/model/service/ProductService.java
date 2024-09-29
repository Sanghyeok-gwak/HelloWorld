package com.gd.hw.product.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.common.template.JDBCTemplate;
import com.gd.hw.product.model.dao.ProductDao;
import com.gd.hw.product.model.vo.Product;

public class ProductService {

	private ProductDao productDao = new ProductDao();

	// 카테고리 클릭시 지역에 맞는 상품리스트 조회
	public List<Product> getProductList(Connection conn, String categoryName) {
		return productDao.selectProductList(conn, categoryName);
	}

	/*
	 * 추후에 위에 고칠수 있으면 고칠 코드 public List<Product> selectProductList( String
	 * categoryName) { Connection conn = getConnection(); List<Product> product =
	 * productDao.selectProductList(conn, categoryName); close(conn); return
	 * product; }
	 */

	// 상품 ID로 상세 정보를 조회하는 메서드
	public Product getProductById(int productId) {
		Connection conn = getConnection();
		Product product = productDao.getProductById(conn, productId);
		close(conn);

		return product;

	}

	 // 필터링된 상품 목록을 조회하는 메서드
	public List<Product> filterProducts(String productName, String[] stay) {
        Connection conn = getConnection();
        List<Product> productList = productDao.filterProducts(conn, productName, stay);
        close(conn);
        return productList;
    }

}
