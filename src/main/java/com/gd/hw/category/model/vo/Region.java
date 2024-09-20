package com.gd.hw.category.model.vo;

public class Region {
	
	private int regionId;
	private String regionName;
	private String regionEngName;

	
	public Region() {}
	
	public Region(String regionName, String regionEngName) {
		super();
		this.regionName = regionName;
		this.regionEngName = regionEngName;
	}

	public Region(int regionId, String regionName, String regionEngName) {
		super();
		this.regionId = regionId;
		this.regionName = regionName;
		this.regionEngName = regionEngName;
	}


	@Override
	public String toString() {
		return "Region [regionId=" + regionId + ", regionName=" + regionName + ", regionEngName=" + regionEngName
				+ ", categoryId=" + "]";
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


	

	
	
	
	
	
}
