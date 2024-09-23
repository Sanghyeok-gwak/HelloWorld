package com.gd.hw.product.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.dao.AdminProductDao;
import com.gd.hw.product.model.vo.Product;

public class AdminProductService {
	AdminProductDao apDao = new AdminProductDao();
	
	public int selectProductListCount() {
		Connection conn = getConnection();
		int listCount = apDao.selectProductListCount(conn);
		
		
		return listCount;
		
	}
	public int selectProductCategoryListCount(String selectFilterByCategory) {
		Connection conn = getConnection();
		int listCount = apDao.selectProductListCount(conn,selectFilterByCategory);
		
		
		return listCount;
	}
	
	
	
	
	public List<Product> selectProductList(PageInfo pi){
		Connection conn = getConnection();
		
		List<Product> list =apDao.selectProductList(conn,pi);
		close(conn);
		
		return list;
		
	}
	
	public List<Product> filterByCategory(String filterByCategory,PageInfo pi){
		Connection conn= getConnection();
		List<Product> list = new ArrayList<>();
		if(filterByCategory.equals("전체")) {
			list =apDao.selectProductList(conn,pi);
		}else {
			list = apDao.filterByCategory(conn,filterByCategory,pi);
		}
		
		
		close(conn);
		
		return list;
		
	}
	
	
	
}
