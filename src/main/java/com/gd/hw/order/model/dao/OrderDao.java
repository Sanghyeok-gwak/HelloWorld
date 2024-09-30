package com.gd.hw.order.model.dao;

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

import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.order.model.vo.OrderAd;
import com.gd.hw.order.model.vo.Person;
import com.gd.hw.order.model.vo.ProductOr;

public class OrderDao {

   private Properties prop = new Properties();
   
   public OrderDao () {
      
      String filePath = OrderDao.class.getResource("/db/mappers/mappers-order.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(filePath));
      }catch (IOException e) {
         e.printStackTrace();
      }
   
   }

	public ProductOr selectProductById(Connection conn, int productId) {
		
		ProductOr p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);
			rset = pstmt.executeQuery();
			
			// productId ->						
			if(rset.next()) {
				p = new ProductOr (productId, rset.getString("PRODUCT_NAME")
										   ,rset.getString("DAY")
										   ,rset.getString("FLIGHT")
										   ,rset.getInt("A_PRICE")
										   ,rset.getInt("C_PRICE"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int insertPayMent(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayMent");

		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, o.getImpUid());
				pstmt.setInt(2, o.getTotalPay());
				result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertOrder(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");

		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,o.getMerchantUid());
				pstmt.setInt(2, o.getUserNo());
				pstmt.setInt(3,o.getProductId());
				pstmt.setInt(4, o.getBhNo());
				pstmt.setString(5, o.getImpUid());
				pstmt.setInt(6, o.getAdult());
				pstmt.setInt(7, o.getChild());
				pstmt.setInt(8, o.getPointU());
				pstmt.setInt(9, o.getTotalPay() + o.getPointU());
				pstmt.setString(10, o.getFlight());
				result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertPerSon(Connection conn, Person p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPerSon");

		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p.getMerUid());
				pstmt.setString(2, p.getSurName());
				pstmt.setString(3, p.getEngName());
				pstmt.setString(4, p.getBirthday());
				pstmt.setString(5, p.getPhone());
				pstmt.setString(6, p.getGender());
				pstmt.setString(7, p.getNation());
				pstmt.setString(8, p.getPassport());
				pstmt.setString(9, p.getPassportEx());
				pstmt.setString(10, p.getStatus());
				pstmt.setString(11, p.getDiv());
				result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public Person selectComletePerson(Connection conn, String merchantUid) {
		Person p = new Person();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectComletePerson");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, merchantUid);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				p.setEngName(rset.getString("NAME"));
				p.setPhone(rset.getString("PHONE"));
				p.setBirthday(rset.getString("BIRTHDAY"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int selectMyPoint(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPoint");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("POINT_P") - rset.getInt("POINT_U");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

//-----------------------관리자파트--------------------------
   public int selectOrderListCount(Connection conn) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectOrderListCount");
      
      
      try {
         pstmt = conn.prepareStatement(sql);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }
   public int selectOrderCountByKeyword(Connection conn, String keyword) {
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectOrderCountByKeyword");
      
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "%"+keyword+"%");
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }
   public List<OrderAd> selectOrderLIst(Connection conn, PageInfo pi) {

      List<OrderAd> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectOrderLIst");

      try {
         pstmt = conn.prepareStatement(sql);
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         rset = pstmt.executeQuery();

         while (rset.next()) {
            list.add(new OrderAd(rset.getString("USER_ID"), rset.getString("MERCHANT_UID"),
                  rset.getDate("PAY_DATE"), rset.getInt("FINAL_PAY"), rset.getString("STATUS")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   public List<OrderAd> selectOrderLIstByKeyword(Connection conn, PageInfo pi, String keyword) {
      List<OrderAd> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectOrderLIstByKeyword");

      try {
         pstmt = conn.prepareStatement(sql);
         int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
         int endRow = startRow + pi.getBoardLimit() - 1;
         
         pstmt.setString(1, "%"+keyword+"%");
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         rset = pstmt.executeQuery();

         while (rset.next()) {
            list.add(new OrderAd(rset.getString("USER_ID"), rset.getString("MERCHANT_UID"),
                  rset.getDate("PAY_DATE"), rset.getInt("FINAL_PAY"), rset.getString("STATUS")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   public OrderAd selectOrderByMerUid(Connection conn, String merUid) {
      OrderAd order = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectOrderByMerUid");

      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, merUid);
         rset = pstmt.executeQuery();

         if (rset.next()) {
            order = new OrderAd(rset.getString("USER_NAME"), merUid,rset.getInt("FINAL_PAY"),rset.getString("STATUS")
                  ,rset.getInt("PRODUCT_ID"),rset.getString("PRODUCT_NAME"), rset.getString("BH_CLASS"), rset.getInt("PRICE")
                  ,rset.getInt("ADULT"),rset.getInt("CHILD"),rset.getInt("POINT_U"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return order;
   }

   public List<Person> selectAllPersonByMerUid(Connection conn, String merUid) {
      List<Person> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectAllPersonByMerUid");

      try {
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, merUid);
         rset = pstmt.executeQuery();

         while(rset.next()) {
            list.add(new Person(merUid,rset.getString("SURNAME"), rset.getString("ENG_NAME"),
                  rset.getString("BIRTHDAY"), rset.getString("PHONE"), rset.getString("GENDER"),
                  rset.getString("NATION"),rset.getString("PASSPORT"),rset.getString("PASSPROT_EX"),
                  rset.getString("STATUS"),rset.getString("DIV")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   public int DeleteOrderByMerUid(Connection conn, String delUid) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("DeleteOrderByMerUid");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,delUid);
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }

      return result;
   }
//-----------------------관리자파트 끝-----------------------



   
}
