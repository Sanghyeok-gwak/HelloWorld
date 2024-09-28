package com.gd.hw.black.model.dao;

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

import com.gd.hw.black.model.vo.BlackList;
import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.user.model.vo.User;


public class BlackDao {
private Properties prop = new Properties();
	
	public BlackDao(){
		
		try {
			prop.loadFromXML(new FileInputStream(BlackDao.class.getResource("/db/mappers/mappers-black.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
	
	/**관리자 페이지-해당 회원을 블랙리스트 테이블에 insert
	 * @param black 추가하고자하는 정보가 담긴 객체
	 * @return
	 */
	public int addBlackList(Connection conn,BlackList b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addBlackList");

		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getUserId());
				pstmt.setString(2, b.getReason());
				pstmt.setString(3, b.getTreatment());
				result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	/**
	 * 관리자 페이지-모든 블랙리스트 회원 조회용 메소드
	 * 
	 * @param conn
	 * @return 모든 black의 정보를 담은 List<BlackList> 반환
	 */
	public List<BlackList> selectAllBlack(Connection conn, PageInfo pi) {
		
		List<BlackList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAllBlack");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new BlackList(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("REASON")
						 ,rset.getString("TREATMENT"), rset.getDate("BLACK_DATE"), rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<BlackList> selectAllBlackByKeyword(Connection conn, PageInfo pi, String keyword) {
		List<BlackList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAllBlackByKeyword");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new BlackList(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("REASON")
						 ,rset.getString("TREATMENT"), rset.getDate("BLACK_DATE"), rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	/**
	 * 관리자 페이지-특정 블랙리스트 회원 조회용 메소드
	 * 
	 * @param conn
	 * @return 특정 black의 정보를 담은 BlackList 반환
	 */
	public BlackList selectOneBlack(Connection conn, int userNo) {

		BlackList black = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectOneBlack");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				black = new BlackList(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("REASON")
						,rset.getString("TREATMENT"),rset.getDate("BLACK_DATE"), rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return black;
	}

	/**
	 * 관리자 페이지-체크박스를 통한 다중 삭제 메소드
	 * 
	 * @param conn
	 * @param arr  삭제할 유저의 userNo을 담은 배열
	 * @return 성공한 행의 총 갯수
	 */
	public int deleteBleak(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBleak");

		try {
			for (int i = 0; i < arr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arr[i]));
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	/**
	 * 관리자 페이지-체크박스를 통한 다중 삭제된 회원의 정보 수정
	 * 
	 * @param conn
	 * @param arr  삭제한 유저의 userNo을 담은 배열
	 * @return 성공한 행의 총 갯수
	 */
	public int updateUserToU(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserToU");

		try {
			for (int i = 0; i < arr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arr[i]));
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**관리자-페이지 페이징처리를 위한 행 갯수 알아가는 매소드
	 * @param conn
	 * @return 
	 */
	public int selectBlackListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackListCount");
		
		
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
	public int selectBlackCountByKeyword(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackCountByKeyword");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
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
	public int delBlackList(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delBlackList");

		try {
			for (int i = 0; i < arr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arr[i]));
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String idCheck(Connection conn, String inputId) {
		String status = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				status =rset.getString("STATUS");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return status;
	}








}
