package com.gd.hw.order.model.vo;

import java.sql.Date;

public class ProductOr {
	
	//Product 테이블 관련 
	private	int productId;
	private String productName;
	private String day;	// startDate - endDate 형식으로 생긴 문자열이 들어감 (여행기간)
	private String flight;
	private int aPrice;
	private int cPrice;
	private int aCount;
	private int cCount;
	

	public ProductOr() {}

	public ProductOr(int productId, String productName, String day, String flight, int aPrice, int cPrice,
			int aCount, int cCount) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.day = day;
		this.flight = flight;
		this.aPrice = aPrice;
		this.cPrice = cPrice;
		this.aCount = aCount;
		this.cCount = cCount;
	}

	public ProductOr(int productId, String productName, String day, String flight, int aPrice, int cPrice) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.day = day;
		this.flight = flight;
		this.aPrice = aPrice;
		this.cPrice = cPrice;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getFlight() {
		return flight;
	}

	public void setFlight(String flight) {
		this.flight = flight;
	}

	public int getaPrice() {
		return aPrice;
	}

	public void setaPrice(int aPrice) {
		this.aPrice = aPrice;
	}

	public int getcPrice() {
		return cPrice;
	}

	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	@Override
	public String toString() {
		return "ProductOr [productId=" + productId + ", productName=" + productName + ", day=" + day + ", flight="
				+ flight + ", aPrice=" + aPrice + ", cPrice=" + cPrice + ", aCount=" + aCount + ", cCount=" + cCount
				+ "]";
	}
	
	
}
