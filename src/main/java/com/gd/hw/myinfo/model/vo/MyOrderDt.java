package com.gd.hw.myinfo.model.vo;
import java.sql.Date;
public class MyOrderDt {
	
    private String userName;
    private int productId;
    private String productName;
    private String startDate;
    private String endDate;
    private String status;
    private String bhClass;
    private int price;
    private int aPrice;
    private int child;
    private int pointUsed;
    private int finalPay;
    private String flight;
    private String name;
    private String birthday;
    private String passport;
    private String payOp;
    private int totalPay;
	
    public MyOrderDt() {}

	public MyOrderDt(String userName, int productId, String productName, String startDate, String endDate,
			String status, String bhClass, int price, int aPrice, int child, int pointUsed, int finalPay, String flight,
			String name, String birthday, String passport, String payOp, int totalPay) {
		super();
		this.userName = userName;
		this.productId = productId;
		this.productName = productName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.bhClass = bhClass;
		this.price = price;
		this.aPrice = aPrice;
		this.child = child;
		this.pointUsed = pointUsed;
		this.finalPay = finalPay;
		this.flight = flight;
		this.name = name;
		this.birthday = birthday;
		this.passport = passport;
		this.payOp = payOp;
		this.totalPay = totalPay;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public int getaPrice() {
		return aPrice;
	}

	public void setaPrice(int aPrice) {
		this.aPrice = aPrice;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
	}

	public int getPointUsed() {
		return pointUsed;
	}

	public void setPointUsed(int pointUsed) {
		this.pointUsed = pointUsed;
	}

	public int getFinalPay() {
		return finalPay;
	}

	public void setFinalPay(int finalPay) {
		this.finalPay = finalPay;
	}

	public String getFlight() {
		return flight;
	}

	public void setFlight(String flight) {
		this.flight = flight;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getPayOp() {
		return payOp;
	}

	public void setPayOp(String payOp) {
		this.payOp = payOp;
	}

	public int getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}

	@Override
	public String toString() {
		return "MyOrderDt [userName=" + userName + ", productId=" + productId + ", productName=" + productName
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + ", bhClass=" + bhClass
				+ ", price=" + price + ", adult=" + aPrice + ", child=" + child + ", pointUsed=" + pointUsed
				+ ", finalPay=" + finalPay + ", flight=" + flight + ", name=" + name + ", birthday=" + birthday
				+ ", passport=" + passport + ", payOp=" + payOp + ", totalPay=" + totalPay + "]";
	}
	
    
}
