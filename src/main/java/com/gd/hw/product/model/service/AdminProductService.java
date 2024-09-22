package com.gd.hw.product.model.service;

import com.gd.hw.product.model.dao.AdminProductDao;
import com.gd.hw.product.model.vo.Product;

import static com.gd.hw.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class AdminProductService {
	AdminProductDao apDao = new AdminProductDao();
	
	public int selectProductListCount() {
		Connection conn = getConnection();
		int listCount = apDao.selectProductListCount(conn);
		
		
		return listCount;
		
	}
	
	
	
	
	public List<Product> selectProductList(){
		Connection conn = getConnection();
		
		List<Product> list =apDao.selectProductList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	
}
