package com.gd.hw.category.model.vo;

public class ProCategory {
	
	private int categoryId;
	private String categoryName;
	
	
	public ProCategory() {};
	
	
	@Override
	public String toString() {
		return "ProCategory [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}
	public ProCategory(int categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
	public ProCategory(String categoryName) {
		super();
		this.categoryName = categoryName;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
	
}
