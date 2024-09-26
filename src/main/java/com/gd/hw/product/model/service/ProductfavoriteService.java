package com.gd.hw.product.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.product.model.dao.ProductDao;


public class ProductfavoriteService {
	
	private ProductDao pDao = new ProductDao();

	public int insertFavorite(int userNo, int productId) {
		Connection conn = getConnection();
		int result = pDao.insertFavorite(conn, userNo, productId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public int deleteFavorite(int userNo, int productId) {
		Connection conn = getConnection();
		int result = pDao.deleteFavorite(conn, userNo, productId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public List<Integer> getFavoriteList(int userNo) {
		Connection conn = getConnection();
		List<Integer> list = pDao.getFavoriteList(conn, userNo);
		close(conn);
		return list;
		
	}
	

}
