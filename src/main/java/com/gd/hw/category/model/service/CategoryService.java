package com.gd.hw.category.model.service;

import java.sql.Connection;

import com.gd.hw.category.model.dao.CategoryDao;
import static com.gd.hw.common.template.JDBCTemplate.*;
public class CategoryService {
	
	CategoryDao cDao = new CategoryDao();
	
	public void selectCategoryList() {
		Connection conn = getConnection();
		cDao.selectCategoryList(conn);
		
	}
	
}
