package com.gd.hw.category.model.vo;

public class ProCategory {
	
	private int categoryId;
	private String categoryName;
	private String categoryEngName;
	
	
	public ProCategory() {}

	
	public ProCategory(String categoryName, String categoryEngName) {
		super();
		this.categoryName = categoryName;
		this.categoryEngName = categoryEngName;
	}
	
	

	public ProCategory(int categoryId, String categoryName, String categoryEngName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryEngName = categoryEngName;
	}


	@Override
	public String toString() {
		return "ProCategory [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryEngName="
				+ categoryEngName + "]";
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


	public String getCategoryEngName() {
		return categoryEngName;
	}


	public void setCategoryEngName(String categoryEngName) {
		this.categoryEngName = categoryEngName;
	};
	
	
	
	
}
