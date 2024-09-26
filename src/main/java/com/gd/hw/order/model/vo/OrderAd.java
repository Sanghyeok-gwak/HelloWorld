package com.gd.hw.order.model.vo;
import java.sql.Date;
public class OrderAd {
	private String userId; // 세부페이지-USER_NAME
	private String merUid; 
	private Date payDate;
	private int finalPay;  // 세부페이지-FINAL_PAY
	private String status;
	
	private int productId;
	private String productName;
	private String bhClass;
	private int price;
	private int adult;
	private int child;
	private int pointU;
	
	
	public OrderAd() {}

	public OrderAd(String userId, String merUid, Date payDate, int finalPay, String status) {
		super();
		this.userId = userId;
		this.merUid = merUid;
		this.payDate = payDate;
		this.finalPay = finalPay;
		this.status = status;
	}
	
	

	public OrderAd(String userId, String merUid, int finalPay, String status,int productId, String productName, String bhClass,
			int price, int adult, int child, int pointU) {
		super();
		this.userId = userId; //USER_NAME
		this.merUid = merUid;
		this.finalPay = finalPay;
		this.status = status;
		
		this.productId = productId;
		this.productName = productName;
		this.bhClass = bhClass;
		this.price = price;
		this.adult = adult;
		this.child = child;
		this.pointU = pointU;
	}
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMerUid() {
		return merUid;
	}

	public void setMerUid(String merUid) {
		this.merUid = merUid;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getFinalPay() {
		return finalPay;
	}

	public void setFinalPay(int finalPay) {
		this.finalPay = finalPay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBhClass() {
		return bhClass;
	}

	public void setBhClass(String bhClass) {
		this.bhClass = bhClass;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
	}

	public int getPointU() {
		return pointU;
	}

	public void setPointU(int pointU) {
		this.pointU = pointU;
	}

	@Override
	public String toString() {
		return "OrderAd [userId=" + userId + ", merUid=" + merUid + ", payDate=" + payDate + ", finalPay=" + finalPay
				+ ", status=" + status + ", productId=" + productId + ", productName=" + productName + ", bhClass="
				+ bhClass + ", price=" + price + ", adult=" + adult + ", child=" + child + ", pointU=" + pointU + "]";
	}

	

	
}
