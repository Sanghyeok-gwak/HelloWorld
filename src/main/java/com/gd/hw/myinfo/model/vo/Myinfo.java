package com.gd.hw.myinfo.model.vo;
import java.sql.Date;
public class Myinfo {
	private int product_Id;
	private String product_Name;
	private String product_Img;
	private String start_Date;
	private String end_Date;
	private String merchant_Uid;
	private Date pay_Date;
	
	public Myinfo() {}
	// 마이페이지 예약목록 페이징처리 
	public Myinfo(int product_Id, String product_Name, String product_Img, String start_Date, String end_Date,
			String merchant_Uid, Date pay_Date) {
		super();
		this.product_Id = product_Id;
		this.product_Name = product_Name;
		this.product_Img = product_Img;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
		this.merchant_Uid = merchant_Uid;
		this.pay_Date = pay_Date;
	}

	public int getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public String getProduct_Img() {
		return product_Img;
	}

	public void setProduct_Img(String product_Img) {
		this.product_Img = product_Img;
	}

	public String getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(String start_Date) {
		this.start_Date = start_Date;
	}

	public String getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(String end_Date) {
		this.end_Date = end_Date;
	}

	public String getMerchant_Uid() {
		return merchant_Uid;
	}

	public void setMerchant_Uid(String merchant_Uid) {
		this.merchant_Uid = merchant_Uid;
	}

	public Date getPay_Date() {
		return pay_Date;
	}

	public void setPay_Date(Date pay_Date) {
		this.pay_Date = pay_Date;
	}

	@Override
	public String toString() {
		return "Myinfo [product_Id=" + product_Id + ", product_Name=" + product_Name + ", product_Img=" + product_Img
				+ ", start_Date=" + start_Date + ", end_Date=" + end_Date + ", merchant_Uid=" + merchant_Uid
				+ ", pay_Date=" + pay_Date + "]";
	}

	
}
