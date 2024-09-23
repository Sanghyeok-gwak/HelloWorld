package com.gd.hw.black.model.vo;

import java.sql.Date;

public class BlackList {
	 private int userNo;
	 private String userId;
	 private String reason;
	 private Date blackDate;
	 private String status;
	 
	 public BlackList() {}
	 
	 // 조회용
	 public BlackList(int userNo, String userId, String reason, Date blackDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.reason = reason;
		this.blackDate = blackDate;
		this.status = status;
	}
	 
	 // 추가용
	 public BlackList(int userNo, String reason, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.reason = reason;
		this.blackDate = blackDate;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getBlackDate() {
		return blackDate;
	}

	public void setBlackDate(Date blackDate) {
		this.blackDate = blackDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BlackList [userNo=" + userNo + ", userId=" + userId + ", reason=" + reason + ", blackDate=" + blackDate
				+ ", status=" + status + "]";
	}
	
}
