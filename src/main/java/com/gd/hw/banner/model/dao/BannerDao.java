package com.gd.hw.banner.model.dao;

import static com.gd.hw.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.gd.hw.banner.model.vo.Banner;
import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.vo.Product;


public class BannerDao {

	private Properties prop = new Properties();
	
	public BannerDao(){
			
			try {
				prop.loadFromXML(new FileInputStream(BannerDao.class.getResource("/db/mappers/mappers-banner.xml").getPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	public List<Banner> selectBannerList(Connection conn){
		List<Banner> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBannerList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(
						rset.getInt("BANNER_NO"),
						rset.getString("IMG"),
						rset.getString("URL"),
						rset.getString("STATUS"),
						rset.getInt("FK_PRO_NO"),
						rset.getString("TITLE"),
						rset.getInt("PRICE"),
						rset.getString("CONTENT")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
		
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
	
	public List<Product> selectProductLists(Connection conn, String checkedValue , List<Product> productList){
		
		
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProductLists");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkedValue);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				productList.add(new Product(
						 rset.getInt("PRODUCT_ID"),
						 rset.getString("PRODUCT_NAME"),		
						 rset.getString("PRODUCT_IMG"),		
						 rset.getString("REGION_ID"),		
						 rset.getString("CATEGORY_ID"),		
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
		
		
		
		
		return productList;
	}
	
	
	
	public int addMainBannerProduct(Connection conn, List<Banner> bannerList){
		
		System.out.println("메인");
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addMainBannerProduct");
		try {
			
			for(int i =0; i<bannerList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bannerList.get(i).getImg());
				System.out.println(bannerList.get(i).getImg());
				pstmt.setInt(2, bannerList.get(i).getProNo());
				System.out.println(bannerList.get(i).getProNo());
				pstmt.setString(3, bannerList.get(i).getTietle());
				System.out.println(bannerList.get(i).getTietle());
				pstmt.setInt(4,bannerList.get(i).getPrice());
				System.out.println(bannerList.get(i).getPrice());
				result=pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(pstmt);
		}
		
		
		
		return result;
		
	}
	public int addSub1BannerProduct(Connection conn,List<Banner> bannerList){
		
		System.out.println("서브1");
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addSub1BannerProduct");
		try {
			
			for(int i =0; i<bannerList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bannerList.get(i).getImg());
				pstmt.setInt(2, bannerList.get(i).getProNo());
				pstmt.setString(3, bannerList.get(i).getTietle());
				pstmt.setInt(4, bannerList.get(i).getPrice());
				result=pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(pstmt);
		}
		
		
		
		return result;
		
	}
	public int addSub2BannerMainProduct(Connection conn,List<Banner> bannerList){
		System.out.println("서브2");
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addSub2BannerMainProduct");
		try {
			
			for(int i =0; i<bannerList.size(); i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bannerList.get(i).getImg());
				pstmt.setInt(2, bannerList.get(i).getProNo());
				pstmt.setString(3, bannerList.get(i).getTietle());
				pstmt.setInt(4, bannerList.get(i).getPrice());
				result=pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(pstmt);
		}
		
		
		
		return result;
		
	}
	
	public int deleteBanner(Connection conn , String checkedValue ) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBanner");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkedValue);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}
}
