package com.gd.hw.notice.model.dao;

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

import com.gd.hw.notice.model.vo.Notice;


public class NoticeDao {
private Properties prop = new Properties();
	
	public NoticeDao () {
		
		String filePath = NoticeDao.class.getResource("/db/mappers/mappers-notice.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		}catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public List<Notice> selectNoticeList(Connection conn){
	
		List<Notice> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new Notice(
							rset.getInt("NOTICE_NO"),
							rset.getString("NOTICE_TITLE"),
							rset.getString("NOTICE_CONTENT"),
							rset.getString("NOTICE_WRITER"),
							rset.getDate("REGIST_DATE")));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
