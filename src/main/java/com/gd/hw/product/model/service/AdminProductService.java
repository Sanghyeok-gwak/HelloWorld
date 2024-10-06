package com.gd.hw.product.model.service;

import static com.gd.hw.common.template.JDBCTemplate.*;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.gd.hw.category.model.vo.Region;
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
		int listCount =0;
		if(selectFilterByCategory.equals("전체")) {
			System.out.println("전체");
			listCount = apDao.selectProductListCount(conn);
		}else {
			System.out.println("그외");
			listCount = apDao.selectProductListCount(conn,selectFilterByCategory);
		}
		
		System.out.println(listCount);
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
	
	public List<Region> selectSubList(String categoryEngName){
		Connection conn = getConnection();
		
		List<Region> list = apDao.selectSubList(conn,categoryEngName);
		
		
		
		close(conn);
		
		return list;
	}
	
	public int addProduct(Product p) {
		Connection conn = getConnection();
		
		int result = apDao.addProduct(conn,p);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteProduct(String[] checkedValue) {
		Connection conn = getConnection();
		int result = 0;
		
		System.out.println(checkedValue.length);
		
		for(int i =0; i<checkedValue.length; i++) {
			result = apDao.deleteProduct(conn,checkedValue[i]);
		}
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public Product modifyProduct(int no){
		Connection conn = getConnection();
		
		Product p = apDao.modifyProduct(conn,no);
		
		
		close(conn);
		
		return p;
	}
	public int updateProduct(Product p , int no) {
		
		Connection conn = getConnection();
		int result = apDao.updateProduct(conn,p,no);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
}
