package com.gd.hw.order.model.dao;

import static com.gd.hw.common.template.JDBCTemplate.close;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.gd.hw.product.model.vo.Product;

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

	public Product selectProductById(Connection conn, int productId) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			rset = pstmt.executeQuery();
			
			// productId ->						
			if(rset.next()) {
				p = new Product (productId, rset.getString("PRODUCT_NAME")
										   ,rset.getString("START_DATE")
										   ,rset.getString("END_DATE")
										   ,rset.getInt("A_PRICE")
										   ,rset.getInt("C_PRICE")
										   ,rset.getString("FLIGHT"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	
}
