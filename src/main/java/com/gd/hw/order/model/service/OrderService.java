package com.gd.hw.order.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.order.model.dao.OrderDao;
import com.gd.hw.order.model.vo.OrderAd;
import com.gd.hw.order.model.vo.Person;
import com.gd.hw.order.model.vo.ProductOr;

public class OrderService {

private OrderDao oDao = new OrderDao();	// 전역변수생성

public ProductOr selectProductById(int productId) {
	Connection conn = getConnection();
	ProductOr p = oDao.selectProductById(conn, productId);
	close(conn);
	
	return p;
}

//-----------------------관리자파트--------------------------
	public int selectUserListCount() {
		Connection conn = getConnection();
		int listCount = oDao.selectOrderListCount(conn);
		close(conn);
		return listCount;
	}
	public int selectOrderCountByKeyword(String keyword) {
		Connection conn = getConnection();
		int listCount = oDao.selectOrderCountByKeyword(conn,keyword);
		close(conn);
		return listCount;
	}

	public List<OrderAd> selectOrderLIst(PageInfo pi) {
		Connection conn = getConnection();
		List<OrderAd> list = oDao.selectOrderLIst(conn, pi);
		close(conn);
		return list;
	}
	public List<OrderAd> selectOrderLIstByKeyword(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		List<OrderAd> list = oDao.selectOrderLIstByKeyword(conn, pi,keyword);
		close(conn);
		return list;
	}

	public OrderAd selectOrderByMerUid(String merUid) {
		Connection conn = getConnection();
		OrderAd order = oDao.selectOrderByMerUid(conn,merUid);
		close(conn);
		return order;
	}

	public List<Person> selectAllPersonByMerUid(String merUid) {
		Connection conn = getConnection();
		List<Person> list = oDao.selectAllPersonByMerUid(conn, merUid);
		close(conn);
		return list;
	}




//-----------------------관리자파트 끝-----------------------





}
