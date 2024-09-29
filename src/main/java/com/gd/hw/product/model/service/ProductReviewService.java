package com.gd.hw.product.model.service;


import static com.gd.hw.common.template.JDBCTemplate.close;
import static com.gd.hw.common.template.JDBCTemplate.commit;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;
import static com.gd.hw.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.gd.hw.common.template.JDBCTemplate;
import com.gd.hw.product.model.dao.ProductDao;
import com.gd.hw.review.model.vo.Review;

public class ProductReviewService {

	private ProductDao pDao = new ProductDao();

	// 리뷰등록
    public int insertReview(int userNo, String content, int rating) {
        Connection conn = getConnection();
        int result = pDao.insertReview(conn, userNo, content, rating);
        
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
        return result;
    }
    
    // 리뷰 조회
    public List<Review> selectReview(int productId) {
        Connection conn = getConnection();
        List<Review> list = pDao.selectReviews(conn, productId);
        close(conn);
        return list;
    }
    
    
    
    
    
    
    
    
    
    
    
	
	
}
