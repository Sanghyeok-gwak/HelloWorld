package com.gd.hw.category.model.vo;

public class Region {
	
	private int regionId;
	private String regionName;
	private int categoryId;
	
	public Region() {}

	@Override
	public String toString() {
		return "Region [regionId=" + regionId + ", regionName=" + regionName + ", categoryId=" + categoryId + "]";
	}

	public Region(int regionId, String regionName, int categoryId) {
		super();
		this.regionId = regionId;
		this.regionName = regionName;
		this.categoryId = categoryId;
	}
	public Region(String regionName) {
		super();
		this.regionName = regionName;
	}

	public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
	
	
}
