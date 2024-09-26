package com.gd.hw.order.model.dao;

import static com.gd.hw.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.order.model.vo.OrderAd;
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

//-----------------------관리자파트--------------------------
	public int selectOrderListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	public List<OrderAd> selectOrderLIst(Connection conn, PageInfo pi) {

		List<OrderAd> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOrderLIst");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new OrderAd(rset.getString("USER_ID"), rset.getString("MERCHANT_UID"),
						rset.getDate("PAY_DATE"), rset.getInt("FINAL_PAY"), rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
//-----------------------관리자파트 끝-----------------------
	
}
