package com.gd.hw.order.model.vo;
import java.sql.Date;
public class OrderAd {
	private String userId;
	private String merUid;
	private Date payDate;
	private int finalPay;
	private String status;
	
	public OrderAd() {}

	public OrderAd(String userId, String merUid, Date payDate, int finalPay, String status) {
		super();
		this.userId = userId;
		this.merUid = merUid;
		this.payDate = payDate;
		this.finalPay = finalPay;
		this.status = status;
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

	@Override
	public String toString() {
		return "OrderAdDao [userId=" + userId + ", merUid=" + merUid + ", payDate=" + payDate + ", finalPay=" + finalPay
				+ ", status=" + status + "]";
	}
	
}
