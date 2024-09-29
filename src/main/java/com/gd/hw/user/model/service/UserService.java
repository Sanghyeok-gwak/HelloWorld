package com.gd.hw.user.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.vo.Product;
import com.gd.hw.user.model.dao.UserDao;
import com.gd.hw.user.model.vo.User;

public class UserService {
	
	private UserDao uDao = new UserDao();
	
	
	//--------------------------관리자 파트-------------------------------
	
	/**user의 수 알아오는 메소드
	 * @return 유저의 수
	 */
	public int selectUserListCount() {
		Connection conn = getConnection();
		int listCount = uDao.selectUserListCount(conn);
		close(conn);
		return listCount;
	}
	public int selectUserListByKeyword(String keyword) {
		Connection conn = getConnection();
		int listCount = uDao.selectUserListByKeyword(conn,keyword);
		close(conn);
		return listCount;
	}
	/**관리자 페이지-모든 회원정보 조회용 메소드
	 * @return dao로부터 조회해온 list를 반환
	 */
	public List<User> selectAllUser(PageInfo pi){
		Connection conn = getConnection();
		List<User> list = uDao.selectAllUser(conn, pi);
		close(conn);
		return list;
	}
	public List<User> selectUserByKeyword(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		List<User> list = uDao.selectUserByKeyword(conn, pi,keyword);
		close(conn);
		return list;
	}
	/**관리자 페이지-체크박스로 다중 탈퇴처리용 메소드
	 * @param arr 체크박스로 선택된 userNo이 들어있는 배열
	 * @return 성공한 행의 총 갯수
	 */
	public int deletUser(String[] arr) {
		Connection conn = getConnection();
		
		int result = uDao.deletUser(conn,arr);
		
		
		if(result == arr.length) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result ;
	}

	/**관리자 페이지- 회원 추가시 사용할 id체크 메소드
	 * @param inputId 사용자가 입력한 아이디
	 * @return 똑같은 아이디를 가진 회원의 수
	 */
	public int idCheck(String inputId) {
		Connection conn = getConnection();
		
		int result = uDao.idCheck(conn,inputId);
		close(conn);
		return result;
	}

	/**관리자 페이지-해당 회원정보를 db에 insert
	 * @param user 추가하고자하는 회원정보가 담긴 객체
	 * @return
	 */
	public int addUser(User user) {
		Connection conn = getConnection();
		
		int result = uDao.addUser(conn,user);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**관리자 페이지-userNo에 해당하는 회원의 정보를 select하기위한 메소드
	 * @param userNo
	 * @return 검색된 user객체
	 */
	public User selectUserByUserNo(int userNo) {
		Connection conn = getConnection();
		User user = uDao.selectUserByUserNo(conn, userNo);
		close(conn);
		return user;
	}

	/**관리자 페이지-수정하고자 하는 회원을 update
	 * @param user
	 * @return 수정된 행의 갯수
	 */
	public int modifyUser(User user) {
		Connection conn = getConnection();
		
		int result = uDao.modifyUser(conn,user);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	 
	 
	 
	/**사용자 페이지-로그인*/
	public User loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		User loginUser = uDao.loginMember(conn,userId,userPwd);
		
		close(conn);
		
		return loginUser;
	}
	
	
	 /**사용자 페이지 - 회원가입*/
	 public int SignupUser(User u) {
		 Connection conn = getConnection();
		 int result = uDao.SignupUser(conn, u);
		 
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
	 }


	    /** 
	     * 아이디 찾기 - 이름과 이메일로 아이디 찾기
	     * @param userName 입력받은 사용자 이름
	     * @param email 입력받은 사용자 이메일
	     * @return 일치하는 사용자의 아이디
	     */
	    public String findUserIdByNameAndEmail(String name, String email) {
	        Connection conn = getConnection();
	        String userId = uDao.findUserIdByNameAndEmail(conn, name, email);
	        close(conn);
	        return userId;
	    }

	    /**
	     * 비밀번호 찾기 - 아이디와 이메일로 비밀번호 찾기
	     * @param userId 입력받은 사용자 아이디
	     * @param email 입력받은 사용자 이메일
	     * @return 일치하는 사용자의 비밀번호
	     */
	    public String findUserPasswordByIdAndEmail(String username, String email) {
	        Connection conn = getConnection();
	        String userPwd = uDao.findUserPasswordByIdAndEmail(conn, username, email);
	        close(conn);
	        return userPwd;
	    }
	
	
	 	 

	
	
}

