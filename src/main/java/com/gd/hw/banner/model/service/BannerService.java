package com.gd.hw.banner.model.service;

import static com.gd.hw.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gd.hw.banner.model.dao.BannerDao;
import com.gd.hw.banner.model.vo.Banner;
import com.gd.hw.common.model.vo.PageInfo;
import com.gd.hw.product.model.vo.Product;



public class BannerService {
	private BannerDao bDao = new BannerDao();
	
	
	public Map<String,Object> selectLists(PageInfo pi){
		Connection conn =getConnection();
		Map<String,Object> map = new HashMap<>();
		
		List<Banner> bannerList = bDao.selectBannerList(conn);
		List<Product> productList = bDao.selectProductList(conn, pi);
		
		
		
		map.put("banner", bannerList);
		map.put("product", productList);
		
		close(conn);
		return map;
	}
	
	public int addBannerProduct(String checkedValues[],String bannerSelect){
		Connection conn = getConnection();
		List<Banner> bannerList = new ArrayList<>();
		
		List<Product> productList = new ArrayList<>();
		int result = 0;
		
		for(int i=0; i<checkedValues.length; i++) {
			System.out.println(checkedValues[i]);
		}
		
		for(int i =0; i<checkedValues.length; i++) {
			productList = bDao.selectProductLists(conn, checkedValues[i],productList);
		}
		
		for(int i =0; i<productList.size(); i++) {
			bannerList.add(new Banner(
									  productList.get(i).getProductImg(),
									  productList.get(i).getProductId(),
									  productList.get(i).getProductName(),
									  productList.get(i).getaPrice()
									  ));
		}
		
		if(bannerSelect.equals("banner-top")) {
			
			result = bDao.addMainBannerProduct(conn,bannerList);
			
		}
		else if(bannerSelect.equals("banner-sub-1")) {
			
			result = bDao.addSub1BannerProduct(conn,bannerList);
		}
		else {
			result = bDao.addSub2BannerMainProduct(conn,bannerList);
			
		}
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		
		
		return result;
	}
	
	public List<Banner> selectBannerList(){
		Connection conn = getConnection();
		
		List<Banner> bannerList = bDao.selectBannerList(conn);
		
		close(conn);
		return bannerList;
		
	}
	public int deleteBanner(String checkedValue[]) {
		Connection conn = getConnection();
		int result = 0;
		
		
		for(int i =0; i<checkedValue.length; i++) {
			result = bDao.deleteBanner(conn,checkedValue[i]);
		}
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
		
		
	}
	
	
}
