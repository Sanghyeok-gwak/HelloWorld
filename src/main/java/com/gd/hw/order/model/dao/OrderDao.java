package com.gd.hw.order.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao () {
		
		String filePath = OrderDao.class.getResource("/db/mappers/mappers-order.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
}
