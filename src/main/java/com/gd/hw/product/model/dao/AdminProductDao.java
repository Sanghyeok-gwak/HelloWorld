package com.gd.hw.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.gd.hw.product.model.vo.Product;
import static com.gd.hw.common.template.JDBCTemplate.*;



public class AdminProductDao {
private Properties prop = new Properties();
	
	public AdminProductDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(AdminProductDao.class.getResource("/db/mappers/mappers-product.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int selectProductListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listCount;
		
	}
	
	
	
	
	public List<Product> selectProductList(Connection conn){
		List<Product> list = new ArrayList<>();
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(
									 rset.getInt("PRODUCT_ID"),
									 rset.getString("PRODUCT_NAME"),		
									 rset.getString("PRODUCT_IMG"),		
									 rset.getString("REGION_NAME"),		
									 rset.getString("CATEGORY_NAME"),		
									 rset.getString("START_DATE"),		
									 rset.getString("END_DATE"),		
									 rset.getString("STATUS"),
									 rset.getString("STAY"),
									 rset.getInt("A_PRICE"),
									 rset.getInt("C_PRICE"),
									 rset.getInt("AMOUNT"),
									 rset.getString("FLIGHT"),		
									 rset.getString("INFO_EDITOR"),		
									 rset.getString("SCHEDULE_EDITOR"),		
									 rset.getString("DETAIL_EDITOR"),		
									 rset.getString("REGISTRATION_DATE"),		
									 rset.getString("MODIFICATION_DATE")		
									));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list;
	}
}