package com.gd.hw.black.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.black.model.dao.BlackDao;
import com.gd.hw.black.model.vo.BlackList;
import com.gd.hw.common.model.vo.PageInfo;

public class BlackService {
	private BlackDao bDao = new BlackDao();

	/**
	 * 관리자 페이지-모든 블랙리스트 회원 조회용 메소드
	 * 
	 * @return 모든 black의 정보를 담은 List<BlackList> 반환
	 */
	public List<BlackList> selectAllBlack(PageInfo pi) {
		Connection conn = getConnection();
		List<BlackList> list = bDao.selectAllBlack(conn, pi);
		close(conn);

		return list;
	}
	
	public List<BlackList> selectAllBlackByKeyword(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		List<BlackList> list = bDao.selectAllBlackByKeyword(conn, pi, keyword);
		close(conn);

		return list;
	}
	/**
	 * 관리자 페이지-페이지네이션을 위한 행의 총 갯수
	 * 
	 * @return 행의 총 갯수 반환
	 */
	public int selectBlackListCount() {
		Connection conn = getConnection();
		int listCount = bDao.selectBlackListCount(conn);
		close(conn);
		return listCount;
	}
	public int selectBlackCountByKeyword(String keyword) {
		Connection conn = getConnection();
		int listCount = bDao.selectBlackCountByKeyword(conn, keyword);
		close(conn);
		return listCount;
	}
	public int delBlackList(String[] arr) {
		Connection conn = getConnection();

		int result = bDao.delBlackList(conn, arr);

		if (result == arr.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public String idCheck(String inputId) {
		Connection conn = getConnection();
		String result = bDao.idCheck(conn, inputId);
		close(conn);
		return result;
	}

	public int addBlackList(BlackList b) {
		Connection conn = getConnection();
		int result = bDao.addBlackList(conn, b);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}








}
