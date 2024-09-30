package com.gd.hw.myinfo.model.vo;
import java.sql.Date;
public class Myinfo {
	private int productId;
	private String productName;
	private String productImg;
	private String startDate;
	private String endDate;
	private String merchantUid;
	private Date payDate;
	
	public Myinfo() {}
	// 마이페이지 예약목록 페이징처리 
	public Myinfo(int productId, String productName, String productImg, String startDate, String endDate,
			String merchantUid, Date payDate) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.merchantUid = merchantUid;
		this.payDate = payDate;
	}

	public int getProductId() {
		return productId;
	}

	public void setProduct_Id(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProduct_Name(String productName) {
		this.productName = productName;
	}

	public String getProduct_Img() {
		return productImg;
	}

	public void setProduct_Img(String productImg) {
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

	public void setMerchant_Uid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPay_Date(Date payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Myinfo [product_Id=" + productId + ", product_Name=" + productName + ", product_Img=" + productImg
				+ ", start_Date=" + startDate + ", end_Date=" + endDate + ", merchant_Uid=" + merchantUid
				+ ", pay_Date=" + payDate + "]";
	}

	
}
