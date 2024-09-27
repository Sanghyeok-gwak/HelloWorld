package com.gd.hw.myinfo.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.myinfo.model.dao.MyinfoDao;
import com.gd.hw.myinfo.model.vo.Myinfo;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.user.model.dao.UserDao;
import com.gd.hw.user.model.vo.User;

public class MyinfoService {
	
	private MyinfoDao uDao = new MyinfoDao();
	
	



	
	/**
	 * -마이페이지- 회원정보수정 들어가기전 로그인
	 * 
	 * @return 유저 아이디
	 */
	 public String longincheck(String userId, String userPwd ) {
		 Connection conn = getConnection();
		 String checkPwd = uDao.longincheck(conn, userId,userPwd);
		 close(conn);
		 
		 return checkPwd;
	 }
	 
	 
	
	/*
	 * 마이페이지 회원정보수정 
	 */
	public User updateUser(User u) {
		Connection conn = getConnection();
		
		// 회원정보 변경
		int result = uDao.updateUser(conn, u);
		
		User updateUn = null;
		
		if(result > 0) {
			commit(conn);
		// 조회
			System.out.println("=======");
			System.out.println(u.getUserId());
			updateUn = uDao.selectUserById(conn, u.getUserId());	 
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateUn;
	}
	 // 회원상태 탈퇴로 변경
	 public int deleteUser(String userId) {
		 Connection conn = getConnection();
		 int result = uDao.deleteUser(conn, userId);
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 return result;
	 }
	 
	
	 // 회원 비밀번호 변경
	 public User updateUserPwd(Map<String , String>map) {
		 Connection conn = getConnection();
		 
		 int result = uDao.updateUserPwd(conn, map);
		 
		 User updateUn = null;
		 if(result > 0) {
			 commit(conn);
			 
			 updateUn = uDao.selectUserById(conn, map.get("userId"));
		 }else {
			 rollback(conn);
		 }
		 
		 close(conn);
		 return updateUn;
	 }
	 	 
	 // 마이페이지 페이징 
	  public int selectMyinfoCount() {
		  Connection conn = getConnection(); 
		  int listCount = uDao.selectMyinfoCount(conn);
		  close(conn);
		  return listCount;
	  } 

	  public List<Myinfo> selectMyinfoList(PageInfo pi , int userNo){
		  Connection conn = getConnection();
		  List<Myinfo> list = uDao.selectMyinfoList(conn , pi , userNo);
		  close(conn);
		  return list; 
	  }
	  

	
	}
	 
	


