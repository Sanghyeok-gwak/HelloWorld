package com.gd.hw.review.model.vo;

public class Review {
	
	 private int reviewNo;
	 private int userNo;
	 private String content;
	 private int rating;
	 private String writeDate;
	 private int orderNo;
	 
	 public Review() {}

	public Review(int reviewNo, int userNo, String content, int rating, String writeDate, int orderNo) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.content = content;
		this.rating = rating;
		this.writeDate = writeDate;
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userNo=" + userNo + ", content=" + content + ", rating=" + rating
				+ ", writeDate=" + writeDate + ", orderNo=" + orderNo + "]";
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	};
	 
	 
}
