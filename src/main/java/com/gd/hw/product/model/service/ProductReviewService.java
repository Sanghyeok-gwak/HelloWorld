package com.gd.hw.product.model.service;


import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.gd.hw.product.model.dao.ProductDao;

public class ProductReviewService {

	private ProductDao reviewDao = new ProductDao();

    public int insertReview(int userNo, String content, int rating, String merchantUid) {
        Connection conn = getConnection();
        int result = reviewDao.insertReview(conn, userNo, content, rating, merchantUid);
        
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
        return result;
    }
	
	
}
