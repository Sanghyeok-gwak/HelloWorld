package com.gd.hw.order.model.service;

import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;
import java.sql.Connection;

import com.gd.hw.order.model.dao.OrderDao;
import com.gd.hw.product.model.vo.Product;

public class OrderService {

private OrderDao oDao = new OrderDao();	// 전역변수생성

public Product selectProductById(int productId) {
	Connection conn = getConnection();
	Product p = oDao.selectProductById(conn, productId);
	close(conn);
	
	return p;
}







}
