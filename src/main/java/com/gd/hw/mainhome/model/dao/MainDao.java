package com.gd.hw.mainhome.model.dao;

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

public class MainDao {
	private Properties prop = new Properties();
	
	public MainDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(MainDao.class.getResource("/db/mappers/mappers-category.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<ProCategory> selectList(Connection conn){
		
		List<ProCategory> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new ProCategory(rset.getInt("CATEGORY_ID")
										 ,rset.getString("CATEGORY_NAME")
										 ,rset.getString("CATEGORY_ENG_NAME")));
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
