package com.gd.hw.myinfo.model.vo;

import java.sql.Date;
public class MyJjim{
	
	private int prodcutId;
	private String productName;
	private String productImg;
	private String startDate;
	private String endDate;
	private String merchantUid;
	private Date payDate;
	private Date addedDate;
	private String userName;


	public MyJjim () {
		
	}


	public MyJjim(int prodcutId, String productName, String productImg, String startDate, String endDate,
			String merchantUid, Date payDate, Date addedDate, String userName) {
		super();
		this.prodcutId = prodcutId;
		this.productName = productName;
		this.productImg = productImg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.merchantUid = merchantUid;
		this.payDate = payDate;
		this.addedDate = addedDate;
		this.userName = userName;
	}


	public int getProdcutId() {
		return prodcutId;
	}


	public void setProdcutId(int prodcutId) {
		this.prodcutId = prodcutId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductImg() {
		return productImg;
	}


	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getMerchantUid() {
		return merchantUid;
	}


	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}


	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	public Date getAddedDate() {
		return addedDate;
	}


	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "MyJjim [prodcutId=" + prodcutId + ", productName=" + productName + ", productImg=" + productImg
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", merchantUid=" + merchantUid + ", payDate="
				+ payDate + ", addedDate=" + addedDate + ", userName=" + userName + "]";
	}
	
}
	

