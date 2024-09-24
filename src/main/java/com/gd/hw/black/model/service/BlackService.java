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
	
	/**관리자 페이지-해당 회원을 블랙리스트로 추가하는 메서드
	 * @param black 추가하고자하는 정보가 담긴 객체
	 * @return
	 */
	public int insertBlack(BlackList black) {
		Connection conn = getConnection();
		// 블랙리스트 테이블에 insert 하고 결과 가져옴
		int result = bDao.insertBlack(conn, black);
		if(result > 0) {
			System.out.println();
			// 블랙리스트 테이블에 잘 insert 됐으면
			// 회원정보 update
			result = bDao.updateUserToBlack(conn, black);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	/**
	 * 관리자 페이지-모든 블랙리스트 회원 조회용 메소드
	 * @return 모든 black의 정보를 담은 List<BlackList> 반환
	 */
	public List<BlackList> selectAllBlack(PageInfo pi) {
		Connection conn = getConnection();
		List<BlackList> list = bDao.selectAllBlack(conn, pi);
		close(conn);
		
		return list;
	}
	/**
	 * 관리자 페이지-페이지네이션을 위한 행의 총 갯수
	 * @return  행의 총 갯수 반환
	 */
	public int selectBlackListCount() {
		Connection conn = getConnection();
		int listCount = bDao.selectBlackListCount(conn);
		close(conn);
		return listCount;
	}
}
