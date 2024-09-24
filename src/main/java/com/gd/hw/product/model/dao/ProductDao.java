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

public class ProductDao {

    private Properties prop = new Properties();

    public ProductDao() {
        try {
            // XML 파일에서 SQL 쿼리 로드
            prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/mappers/mappers-product.xml").getPath()));
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
            e.printStackTrace();  // SQLException 로그 출력
        } finally {
            close(rset);
            close(pstmt);
        }

        return productList;
    }
    
   
}
