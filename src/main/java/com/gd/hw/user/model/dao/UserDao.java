package com.gd.hw.user.model.dao;

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
import com.gd.hw.product.model.vo.Product;
import com.gd.hw.user.model.vo.User;

import oracle.net.aso.r;

/**
 * 
 */
public class UserDao {

	private Properties prop = new Properties();

	public UserDao() {

		String filePath = UserDao.class.getResource("/db/mappers/mappers-user.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 관리자 페이지-모든 회원정보 조회용 메소드
	 * 
	 * @param conn
	 * @return 모든 user의 정보를 담은 List<User> 반환
	 */
	public List<User> selectAllUser(Connection conn, PageInfo pi) {

		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllUser");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new User(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("EMAIL"), rset.getString("PHONE"),
						rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"), rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public List<User> selectUserByKeyword(Connection conn, PageInfo pi, String keyword) {
		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserByKeyword");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new User(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("EMAIL"), rset.getString("PHONE"),
						rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"), rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	/**관리자-페이지 페이징처리를 위한 User행 갯수 알아가는 매소드
	 * @param conn
	 * @return 
	 */
	public int selectUserListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserListCount");
		
		
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
	public int selectUserListByKeyword(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserListByKeyword");
		
		
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
	/**
	 * 관리자 페이지-체크박스를 통한 다중 삭제 메소드
	 * 
	 * @param conn
	 * @param arr  삭제할 유저의 userNo을 담은 배열
	 * @return 성공한 행의 총 갯수
	 */
	public int deletUser(Connection conn, String[] arr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletUser");

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
	 * 관리자 페이지- 회원 추가시 사용할 id체크 메소드
	 * 사용자 페이지- 회원가입시 아이디체크에서 재활용
	 * 
	 * @param inputId 사용자가 입력한 아이디
	 * @return 똑같은 아이디를 가진 회원의 수
	 */
	public int idCheck(Connection conn, String inputId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	/**관리자 페이지-해당 회원정보를 db에 insert
	 * @param user 추가하고자하는 회원정보가 담긴 객체
	 * @return
	 */
	public int addUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("addUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	/**관리자 페이지-userNo에 해당하는 회원의 정보를 select하기위한 메소드
	 * @param userNo
	 * @return 검색된 user객체
	 */
	public User selectUserByUserNo(Connection conn, int userNo) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectUserByUserNo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				user = new User(rset.getInt("USER_NO"), rset.getString("USER_ID"), rset.getString("USER_PWD"),
						rset.getString("USER_NAME"), rset.getString("EMAIL"), rset.getString("PHONE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}

	/**관리자 페이지-수정하고자 하는 회원을 update
	 * @param user
	 * @return 수정된 행의 갯수
	 */
	public int modifyUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("modifyUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserPwd());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setInt(5, user.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	/* * 사용자 페이지-로그인 */
	
	public User loginMember(Connection conn, String userId, String userPwd) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User(rset.getInt("user_no")
						   , rset.getString("user_id")
						   , rset.getString("user_pwd")
						   , rset.getString("user_name")
						   , rset.getString("email")
						   , rset.getString("phone")
						   , rset.getDate("enroll_date")
						   , rset.getDate("modify_date")
						   , rset.getString("roll")
						   , rset.getString("status"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return u;
	}

	
	
	/* 사용자 페이지 회원가입*/
	public int SignupUser(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("SignupUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getPhone());
			pstmt.setString(5, u.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	

		}
	
	
    public String findUserIdByNameAndEmail(Connection conn, String name, String email) {
        String userId = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("findUserIdByNameAndEmail");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                userId = rset.getString("USER_ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return userId;
    }

    /**
     * 사용자 아이디와 이메일로 비밀번호 찾기
     * @param conn
     * @param userId
     * @param email
     * @return 일치하는 사용자의 비밀번호
     */
    public String findUserPasswordByIdAndEmail(Connection conn, String username, String email) {
        String userPwd = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("findUserPasswordByIdAndEmail");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                userPwd = rset.getString("USER_PWD");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return userPwd;
    }




	

}
