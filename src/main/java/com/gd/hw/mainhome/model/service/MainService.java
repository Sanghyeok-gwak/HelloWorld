package com.gd.hw.mainhome.model.service;

import static com.gd.hw.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.category.model.vo.ProCategory;
import com.gd.hw.mainhome.model.dao.MainDao;


public class MainService {
	MainDao md = new MainDao();
	
	public List<ProCategory> selectList() {
		Connection conn = getConnection();
		List<ProCategory> list = md.selectList(conn);
		
		
		close(conn);
		
		return list;
	}
	
	
	
}
