package com.gd.hw.product.model.vo;

public class Product {
	
	 private int productId;
	 private String productName;
	 private String productImg;
	 private int regionId;
	 private String startDate;
	 private String endDate;
	 private char status;
	 private char stay;
	 private int aPrice;
	 private int cPrice;
	 private int amount;
	 private String flight;
	 private String infoEditor;
	 private String scheduleEditor;
	 private String detailEditor;
	 
	 
	 public Product() {}


	public Product(int productId, String productName, String productImg, int regionId, String startDate, String endDate,
			char status, char stay, int aPrice, int cPrice, int amount, String flight, String infoEditor,
			String scheduleEditor, String detailEditor) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.regionId = regionId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.stay = stay;
		this.aPrice = aPrice;
		this.cPrice = cPrice;
		this.amount = amount;
		this.flight = flight;
		this.infoEditor = infoEditor;
		this.scheduleEditor = scheduleEditor;
		this.detailEditor = detailEditor;
	}


	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productImg=" + productImg
				+ ", regionId=" + regionId + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status
				+ ", stay=" + stay + ", aPrice=" + aPrice + ", cPrice=" + cPrice + ", amount=" + amount + ", flight="
				+ flight + ", infoEditor=" + infoEditor + ", scheduleEditor=" + scheduleEditor + ", detailEditor="
				+ detailEditor + "]";
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


	public String getProductImg() {
		return productImg;
	}


	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}


	public int getRegionId() {
		return regionId;
	}


	public void setRegionId(int regionId) {
		this.regionId = regionId;
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


	public char getStatus() {
		return status;
	}


	public void setStatus(char status) {
		this.status = status;
	}


	public char getStay() {
		return stay;
	}


	public void setStay(char stay) {
		this.stay = stay;
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


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getFlight() {
		return flight;
	}


	public void setFlight(String flight) {
		this.flight = flight;
	}


	public String getInfoEditor() {
		return infoEditor;
	}


	public void setInfoEditor(String infoEditor) {
		this.infoEditor = infoEditor;
	}


	public String getScheduleEditor() {
		return scheduleEditor;
	}


	public void setScheduleEditor(String scheduleEditor) {
		this.scheduleEditor = scheduleEditor;
	}


	public String getDetailEditor() {
		return detailEditor;
	}


	public void setDetailEditor(String detailEditor) {
		this.detailEditor = detailEditor;
	};
	 
	 
}
