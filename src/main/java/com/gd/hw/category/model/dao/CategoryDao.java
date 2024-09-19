package com.gd.hw.category.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

public class CategoryDao {
	
	private Properties prop = new Properties();
	
	public CategoryDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(CategoryDao.class.getResource("db/mappers/mappers-category.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} 
	public void selectCategoryList(Connection conn) {
		
	}
	
	
	
	
}
