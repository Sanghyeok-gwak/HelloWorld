package com.gd.hw.user.model.vo;

import java.sql.Date;

public class User {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private Date enrollDate;
	private Date modifyDate;
	private String roll;
	private String status;

	public User() {
	}

	/*전체를 담아주는 매개변수생성자*/
	public User(int userNo, String userId, String userPwd, String userName, String email, String phone, Date enrollDate,
			Date modifyDate, String roll, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.roll = roll;
		this.status = status;
	}
	/*관리자 회원조회용 매개변수생성자*/
	public User(int userNo, String userId, String userPwd, String userName, String email, 
			    String phone, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	/*관리자 회원추가용 매개변수생성자*/ /*사용자 회원가입insert에도 사용중*/
	public User(String userId, String userPwd, String userName, String email, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
	}
	/*관리자 회원수정용 매개변수생성자*/
	public User(int userNo, String userId, String userPwd, String userName, String email, String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
	}
	/*사용자 회원정보수정용 매개변수생성자*/
	public User(int userNo, String userId, String userName, String email, String phone ) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", phone=" + phone + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", roll=" + roll + ", status=" + status + "]";
	}
}
