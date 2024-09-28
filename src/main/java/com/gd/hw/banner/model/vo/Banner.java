package com.gd.hw.banner.model.vo;

public class Banner {
	 private int bannerNo;
	 private String img;
	 private String stay; 
	 private String status;
	 private int proNo;
	 private String tietle;
	 private int price;
	 private String content;
	 
	 
	public Banner(int bannerNo, String img, String stay, String status, int proNo, String tietle, int price,
			String content) {
		super();
		this.bannerNo = bannerNo;
		this.img = img;
		this.stay = stay;
		this.status = status;
		this.proNo = proNo;
		this.tietle = tietle;
		this.price = price;
		this.content = content;
	}
	public Banner(String img, int proNo, String tietle, int price) {
		super();
		this.img = img;
		this.proNo = proNo;
		this.tietle = tietle;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", img=" + img + ", stay=" + stay + ", status=" + status + ", proNo="
				+ proNo + ", tietle=" + tietle + ", price=" + price + ", content=" + content + "]";
	}
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStay() {
		return stay;
	}
	public void setStay(String stay) {
		this.stay = stay;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public String getTietle() {
		return tietle;
	}
	public void setTietle(String tietle) {
		this.tietle = tietle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	 
	 
	 
	 
}
