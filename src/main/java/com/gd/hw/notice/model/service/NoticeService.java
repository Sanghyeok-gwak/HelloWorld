package com.gd.hw.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.notice.model.dao.NoticeDao;
import com.gd.hw.notice.model.vo.Notice;

import static com.gd.hw.common.template.JDBCTemplate.*;

public class NoticeService {
	private NoticeDao nDao = new NoticeDao();
	
	
	
	public List<Notice> selectNoticeList(){
		Connection conn = getConnection();
		
		List<Notice> list = nDao.selectNoticeList(conn);
		
		close(conn);
		
		return list;
		
	}
}
