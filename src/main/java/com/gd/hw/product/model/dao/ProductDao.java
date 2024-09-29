package com.gd.hw.product.model.dao;

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

import com.gd.hw.product.model.vo.Product;
import com.gd.hw.review.model.vo.Review;

public class ProductDao {

	private Properties prop = new Properties();

	public ProductDao() {
		try {
			// XML 파일에서 SQL 쿼리 로드
			prop.loadFromXML(
					new FileInputStream(ProductDao.class.getResource("/db/mappers/mappers-product.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Product> selectProductList(Connection conn, String categoryName) {
		List<Product> productList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProductListByCategory");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Product product = new Product();
				product.setProductId(rset.getInt("PRODUCT_ID"));
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setProductImg(rset.getString("PRODUCT_IMG"));
				product.setStartDate(rset.getString("START_DATE"));
				product.setEndDate(rset.getString("END_DATE"));
				product.setaPrice(rset.getInt("A_PRICE"));
				product.setCategoryName(rset.getString("CATEGORY_NAME"));

				productList.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // SQLException 로그 출력
		} finally {
			close(rset);
			close(pstmt);
		}

		return productList;
	}

	public Product getProductById(Connection conn, int productId) {
		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProductById");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				product = new Product();
				product.setProductId(rset.getInt("PRODUCT_ID"));
				product.setProductName(rset.getString("PRODUCT_NAME"));
				product.setProductImg(rset.getString("PRODUCT_IMG"));
				product.setStartDate(rset.getString("START_DATE"));
				product.setEndDate(rset.getString("END_DATE"));
				product.setaPrice(rset.getInt("A_PRICE"));
				product.setcPrice(rset.getInt("C_PRICE"));
				product.setInfoEditor(rset.getString("INFO_EDITOR"));
				product.setScheduleEditor(rset.getString("SCHEDULE_EDITOR"));
				product.setDetailEditor(rset.getString("DETAIL_EDITOR"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return product;
	}

	// 찜하기 추가 부분
	public int insertFavorite(Connection conn, int userNo, int productId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFavorite");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 찜하기 삭제부분
	public int deleteFavorite(Connection conn, int userNo, int productId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFavorite");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 찜하기 가져오기 부분
	public List<Integer> getFavoriteList(Connection conn, int userNo) {

		List<Integer> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getFavoriteList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(rset.getInt("PRODUCT_ID")); // 각 상품 ID를 리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 리뷰 등록
	public int insertReview(Connection conn, int userNo, String content, int rating) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, content);
			pstmt.setInt(3, rating);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(pstmt);

		}

		return result;
	}
	/*
	 * public List<Review> selectReviews(Connection conn, int productId) {
	 * List<Review> reviews = new ArrayList<>(); PreparedStatement pstmt = null;
	 * ResultSet rs = null; String sql = prop.getProperty("selectReview");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setInt(1, productId); rs =
	 * pstmt.executeQuery();
	 * 
	 * while (rs.next()) { Review review = new Review();
	 * review.setReviewNo(rs.getInt("REVIEW_NO"));
	 * review.setUserNo(rs.getInt("USER_NO"));
	 * review.setContent(rs.getString("CONTENT"));
	 * review.setRating(rs.getInt("RATING"));
	 * review.setWriteDate(rs.getDate("WRITE_DATE")); reviews.add(review); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rs);
	 * close(pstmt); }
	 * 
	 * return reviews; }
	 */

	public List<Review> selectReviews(Connection conn, int productId) {
		List<Review> reviews = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId); // 조회할 productId를 바인딩
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();
				review.setReviewNo(rs.getInt("REVIEW_NO"));
				review.setUserNo(rs.getInt("USER_NO"));
				review.setContent(rs.getString("CONTENT"));
				review.setRating(rs.getInt("RATING"));
				review.setWriteDate(rs.getDate("WRITE_DATE"));
				reviews.add(review);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return reviews;
	}

	// 필터링된 상품 목록을 가져오는 메서드 (SQL Mapper를 사용할수도있음)
	// 필터링된 상품 목록 조회 메서드
    public List<Product> filterProducts(Connection conn, String productName, String[] stay) {
        List<Product> productList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("filterProducts");

        try {
            StringBuilder queryBuilder = new StringBuilder(sql);
            if (stay != null && stay.length > 0) {
                queryBuilder.append(" AND P.STAY IN (");
                for (int i = 0; i < stay.length; i++) {
                    queryBuilder.append("?");
                    if (i < stay.length - 1) {
                        queryBuilder.append(", ");
                    }
                }
                queryBuilder.append(")");
            }

            pstmt = conn.prepareStatement(queryBuilder.toString());
            pstmt.setString(1, "%" + productName + "%");

            if (stay != null && stay.length > 0) {
                for (int i = 0; i < stay.length; i++) {
                    pstmt.setString(i + 2, stay[i]);
                }
            }

            rset = pstmt.executeQuery();

            while (rset.next()) {
                Product product = new Product();
                product.setProductId(rset.getInt("PRODUCT_ID"));
                product.setProductName(rset.getString("PRODUCT_NAME"));
                product.setProductImg(rset.getString("PRODUCT_IMG"));
                product.setStartDate(rset.getString("START_DATE"));
                product.setEndDate(rset.getString("END_DATE"));
                product.setaPrice(rset.getInt("A_PRICE"));
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return productList;
    }
	
	
	
	
	
	
	

	
}
