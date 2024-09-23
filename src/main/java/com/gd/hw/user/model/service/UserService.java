package com.gd.hw.user.model.service;

import java.sql.Connection;
import java.util.List;
import com.gd.hw.user.model.dao.UserDao;
import com.gd.hw.user.model.vo.User;
import static com.gd.hw.common.template.JDBCTemplate.*;

public class UserService {
	
	private UserDao uDao = new UserDao();
	
	
	//--------------------------관리자 파트-------------------------------
	/**관리자 페이지-모든 회원정보 조회용 메소드
	 * @return dao로부터 조회해온 list를 반환
	 */
	public List<User> selectAllUser(){
		Connection conn = getConnection();
		List<User> list = uDao.selectAllUser(conn);
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
}