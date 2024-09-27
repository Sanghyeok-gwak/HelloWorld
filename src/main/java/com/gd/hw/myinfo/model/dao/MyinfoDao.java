package com.gd.hw.myinfo.model.dao;

import static com.gd.hw.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.gd.hw.category.model.dao.CategoryDao;
import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.myinfo.model.vo.Myinfo;
import com.gd.hw.product.model.vo.Product;
import com.gd.hw.user.model.vo.User;

import oracle.net.aso.r;

/**
 * 
 */
public class MyinfoDao {

	private Properties prop = new Properties();

	public MyinfoDao() {

		String filePath = MyinfoDao.class.getResource("/db/mappers/mappers-myinfo.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	
	
	
	
	// 마이페이지 로그인 확인
	public String longincheck(Connection conn, String userId, String userPwd) {
		
		String userPwdCheck = null;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("longincheck");
		ResultSet result = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				userPwdCheck = result.getString("USER_PWD");
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(result);
			close(pstmt);
		}
			
		return userPwdCheck;
	}

	
	
	public int updateUser (Connection conn , User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPhone());
			pstmt.setString(4, u.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
		public User selectUserById(Connection conn , String userId) {
			User u = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("SelectUserById");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					u = new User(rset.getInt("user_no")
								,rset.getString("user_id")
								,rset.getString("user_pwd")
								,rset.getString("user_name")
								,rset.getString("email")
								,rset.getString("phone")
								,rset.getDate("enroll_date")
								,rset.getDate("modify_date")
								,rset.getString("roll")
								,rset.getString("status"));
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return u;
		}
	
	public int deleteUser(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int updateUserPwd(Connection conn,Map<String,String>map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("updatePwd"));
			pstmt.setString(2, map.get("userId"));
			pstmt.setString(3,map.get("userPwd"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}

	public int selectMyinfoCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyinfoCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("userNo");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listCount;
	} 
	public List<Myinfo> selectMyinfoList(Connection conn, PageInfo pi ,int userNo){
		List<Myinfo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectMyinfoList");
		System.out.println("SQL Query: " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, userNo);
			System.out.print(userNo);
			pstmt.setInt(2, startRow);
			System.out.print(startRow);
			pstmt.setInt(3, endRow);
			System.out.print(endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Myinfo(rset.getInt("PRODUCT_ID"),
									rset.getString("PRODUCT_NAME"),
									rset.getString("PRODUCT_IMG"),
									rset.getString("START_DATE"),
									rset.getString("END_DATE"),
									rset.getString("MERCHANT_UID"),
									rset.getDate("PAY_DATE")));
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

