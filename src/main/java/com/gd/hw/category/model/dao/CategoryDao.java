package com.gd.hw.category.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.gd.hw.common.template.JDBCTemplate.*;

import com.gd.hw.category.model.vo.ProCategory;
import com.gd.hw.category.model.vo.Region;

public class CategoryDao {
	
	private Properties prop = new Properties();
	
	public CategoryDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(CategoryDao.class.getResource("/db/mappers/mappers-category.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} 
	public List<ProCategory> selectCategoryList(Connection conn) {
		
		List<ProCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ProCategory(rset.getInt("CATEGORY_ID"),rset.getString("CATEGORY_NAME"),rset.getString("CATEGORY_ENG_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list ;
		
	}
	public List<Region> selectRegionList(Connection conn){
		
		List<Region> list = new ArrayList<>();
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRegionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Region(rset.getInt("REGION_ID"),rset.getString("REGION_NAME"),rset.getString("REGION_ENG_NAME"),rset.getInt("CATEGORY_ID")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list ;
	}
	
	public int addCategory(Connection conn) {
		
		int result  = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
		
	}
	
	
	
	
	
	
	
}
