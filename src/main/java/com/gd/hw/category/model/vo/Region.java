package com.gd.hw.category.model.vo;

public class Region {
	
	private int regionId;
	private String regionName;
	private String regionEngName;
	private int categoryId;

	
	public Region() {}


	public Region(int regionId, String regionName, String regionEngName, int categoryId) {
		super();
		this.regionId = regionId;
		this.regionName = regionName;
		this.regionEngName = regionEngName;
		this.categoryId = categoryId;
	}


	@Override
	public String toString() {
		return "Region [regionId=" + regionId + ", regionName=" + regionName + ", regionEngName=" + regionEngName
				+ ", categoryId=" + categoryId + "]";
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


	public String getRegionEngName() {
		return regionEngName;
	}


	public void setRegionEngName(String regionEngName) {
		this.regionEngName = regionEngName;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	
	
	
	
	
}
