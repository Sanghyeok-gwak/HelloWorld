package com.gd.hw.banner.model.service;

import static com.gd.hw.common.template.JDBCTemplate.*;

import java.sql.Connection;
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
		
		System.out.println("서비스");
		System.out.println(bannerList.isEmpty());
		System.out.println(productList.isEmpty());
		
		map.put("banner", bannerList);
		map.put("product", productList);
		
		close(conn);
		return map;
	}
	
}
