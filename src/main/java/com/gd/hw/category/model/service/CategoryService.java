package com.gd.hw.category.model.service;

import static com.gd.hw.common.template.JDBCTemplate.*;
import static com.gd.hw.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gd.hw.category.model.dao.CategoryDao;
import com.gd.hw.category.model.vo.ProCategory;
import com.gd.hw.category.model.vo.Region;
public class CategoryService {
	
	CategoryDao cDao = new CategoryDao();
	
	public Map<String, Object>  selectCategoryList() {
		Connection conn = getConnection();
		Map<String, Object> list = new HashMap<>();
		List<Region> rList = new ArrayList<>();
		List<ProCategory> pList = cDao.selectCategoryList(conn);
		
		
		if(!pList.isEmpty()) {
			rList= cDao.selectRegionList(conn);
		}		
		list.put("category", pList);
		list.put("region", rList);
		
		
		
		close(conn);
		
		return list;
	}
	
	public int addCategory(ProCategory pc) {
		Connection conn = getConnection();
		
		int result = cDao.addCategory(conn,pc);
	
		System.out.println("dao에서 받아온 result : "+ result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	
	}
	
	public int modifyCategory(ProCategory pc) {
		Connection conn = getConnection();
		
		int result = cDao.modifyCategory(conn,pc);
		
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result ;
		
	}
	
	public int addRegion(Region r) {
		Connection conn = getConnection();
		
		int result = cDao.addRegion(conn,r);
		System.out.println("service : "+result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result ;
	}
	public int deleteCategoryList(String deleteEngTietle) {
		Connection conn = getConnection();
		// 카테고리2 가 있을시 카테고리 2도 삭제 하는 dao 생성하기 
		int result = cDao.deleteCategoryList(conn, deleteEngTietle);
		
		if(result>0) {
			result = cDao.deleteRegionList(conn, deleteEngTietle);
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		
		return result;
	}
	
	public int subModifyList(Region r) {
		Connection conn = getConnection();
		int result = cDao.subModifyList(conn,r);
		
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int subCategoryDelete(int no) {
		Connection conn = getConnection();
		int result = cDao.subCategoryDelete(conn,no);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		return result ;
	}
	
	
	
	
}
