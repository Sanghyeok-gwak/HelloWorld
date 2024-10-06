package com.gd.hw.product.model.dao;

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

import com.gd.hw.category.model.vo.Region;
import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.vo.Product;



public class AdminProductDao {
private Properties prop = new Properties();
	
	public AdminProductDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(AdminProductDao.class.getResource("/db/mappers/mappers-adminProduct.xml").getPath()));
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
	public int selectProductListCount(Connection conn,String selectFilterByCategory) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductCategoryListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, selectFilterByCategory);
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
	
	
	
	
	public List<Product> selectProductList(Connection conn,PageInfo pi){
		List<Product> list = new ArrayList<>();
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProductList");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public List<Product> filterByCategory(Connection conn,String filterByCategory,PageInfo pi){
		List<Product> list = new ArrayList<>();
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("filterByCategory");
		
		try {
			pstmt=conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, filterByCategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
	
	
	public List<Region> selectSubList(Connection conn ,String categoryEngName) {
		
		List<Region> list = new ArrayList<>(); 
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectSubList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,categoryEngName );
			rset= pstmt.executeQuery();
			
			
			while(rset.next()) {
				list.add(new Region(rset.getInt("REGION_ID"),rset.getString("REGION_NAME"),rset.getString("REGION_ENG_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list ;
	}
	public int addProduct (Connection conn ,Product p) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("addProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductImg());
			pstmt.setInt(3, p.getRegionId()); //번호를보내야한다 
			pstmt.setInt(4, p.getCategoryId()); // 번호를보내야한다
			pstmt.setString(5, p.getStartDate());
			pstmt.setString(6, p.getEndDate());
			pstmt.setString(7, p.getStay());
			pstmt.setInt(8, p.getaPrice());
			pstmt.setInt(9, p.getcPrice());
			pstmt.setInt(10, p.getAmount());
			pstmt.setString(11, p.getFlight());
			pstmt.setString(12, p.getInfoEditor());
			pstmt.setString(13, p.getScheduleEditor());
			pstmt.setString(14, p.getDetailEditor());
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	
	public int deleteProduct(Connection conn ,String checkedValue) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		System.out.println("dao");
		System.out.println(checkedValue);
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, checkedValue);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}
	
	public Product modifyProduct(Connection conn, int no){
		Product p = new Product();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("modifyProduct");
		
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p.setProductName(rset.getString("PRODUCT_NAME"));
				p.setProductImg(rset.getString("PRODUCT_IMG"));
				p.setRegionName(rset.getString("REGION_NAME"));
				p.setCategoryName(rset.getString("CATEGORY_NAME"));
				p.setStartDate(rset.getString("START_DATE"));
				p.setEndDate(rset.getString("END_DATE"));
				p.setaPrice(rset.getInt("A_PRICE"));
				p.setcPrice(rset.getInt("C_PRICE"));
				p.setAmount(rset.getInt("AMOUNT"));
				p.setFlight(rset.getString("FLIGHT"));
				p.setInfoEditor(rset.getString("INFO_EDITOR"));
				p.setScheduleEditor(rset.getString("SCHEDULE_EDITOR"));
				p.setDetailEditor(rset.getString("DETAIL_EDITOR"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 
		
		
		return p;
	}
	
	public int updateProduct (Connection conn ,Product p,int no) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductImg());
			pstmt.setString(3, p.getStartDate());
			pstmt.setString(4, p.getEndDate());
			pstmt.setString(5, p.getStay());
			pstmt.setInt(6, p.getaPrice());
			pstmt.setInt(7, p.getcPrice());
			pstmt.setInt(8, p.getAmount());
			pstmt.setString(9, p.getFlight());
			pstmt.setString(10, p.getInfoEditor());
			pstmt.setString(11, p.getScheduleEditor());
			pstmt.setString(12, p.getDetailEditor());
			pstmt.setInt(13,no);
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
}

