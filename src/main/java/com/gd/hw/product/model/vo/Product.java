package com.gd.hw.product.model.vo;

public class Product {

	private int productId;
	private String productName;
	private String productImg;
	private String regionName;
	private int regionId;
	private String categoryName;
	private int categoryId;
	private String startDate;
	private String endDate;
	private String status;
	private String stay;
	private int aPrice;
	private int cPrice;
	private int amount;
	private String flight;
	private String infoEditor;
	private String scheduleEditor;
	private String detailEditor;
	private String registrationDate;
	private String modificationDate;

	public Product() {
	}

	public Product(String productName, String productImg, String startDate, String endDate, String stay, int aPrice,
			int cPrice, int amount, String flight, String infoEditor, String scheduleEditor, String detailEditor) {
		super();
		this.productName = productName;
		this.productImg = productImg;
		this.startDate = startDate;
		this.endDate = endDate;
		this.stay = stay;
		this.aPrice = aPrice;
		this.cPrice = cPrice;
		this.amount = amount;
		this.flight = flight;
		this.infoEditor = infoEditor;
		this.scheduleEditor = scheduleEditor;
		this.detailEditor = detailEditor;
	}

	public Product(String productName, String productImg, int regionId, int categoryId, String startDate,
			String endDate, String stay, int aPrice, int cPrice, int amount, String flight, String infoEditor,
			String scheduleEditor, String detailEditor) {
		super();
		this.productName = productName;
		this.productImg = productImg;
		this.regionId = regionId;
		this.categoryId = categoryId;
		this.startDate = startDate;
		this.endDate = endDate;
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
				+ ", regionName=" + regionName + ", regionId=" + regionId + ", categoryName=" + categoryName
				+ ", categoryId=" + categoryId + ", startDate=" + startDate + ", endDate=" + endDate + ", status="
				+ status + ", stay=" + stay + ", aPrice=" + aPrice + ", cPrice=" + cPrice + ", amount=" + amount
				+ ", flight=" + flight + ", infoEditor=" + infoEditor + ", scheduleEditor=" + scheduleEditor
				+ ", detailEditor=" + detailEditor + ", registrationDate=" + registrationDate + ", modificationDate="
				+ modificationDate + "]";
	}

	public Product(int productId, String productName, String productImg, String regionName, String categoryName,
			String startDate, String endDate, String status, String stay, int aPrice, int cPrice, int amount,
			String flight, String infoEditor, String scheduleEditor, String detailEditor, String registrationDate,
			String modificationDate) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productImg = productImg;
		this.regionName = regionName;
		this.categoryName = categoryName;
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
		this.registrationDate = registrationDate;
		this.modificationDate = modificationDate;
	}

	// 결제 페이지로 이동시 사용하는 매개변수 생성자
	public Product(int productId, String productName, String startDate, String endDate, int aPrice, int cPrice,
			String flight) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.aPrice = aPrice;
		this.cPrice = cPrice;
		this.flight = flight;
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

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStay() {
		return stay;
	}

	public void setStay(String stay) {
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
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(String modificationDate) {
		this.modificationDate = modificationDate;
	}

}
