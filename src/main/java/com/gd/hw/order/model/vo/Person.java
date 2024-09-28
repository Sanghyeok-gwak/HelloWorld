package com.gd.hw.order.model.vo;

public class Person {
	// Person 테이블 관련
	 private String merUid;
	 private String surName;
	 private String engName;
	 private String birthday;
	 private String phone;
	 private String gender;
	 private String nation;
	 private String passport;
	 private String passportEx;
	 private String status;
	 private String div;
	 
	 public Person() {}

	public Person(String merUid, String surName, String engName, String birthday, String phone, String gender,
			String nation, String passport, String passportEx, String status, String div) {
		super();
		this.merUid = merUid;
		this.surName = surName;
		this.engName = engName;
		this.birthday = birthday;
		this.phone = phone;
		this.gender = gender;
		this.nation = nation;
		this.passport = passport;
		this.passportEx = passportEx;
		this.status = status;
		this.div = div;
	}

	public String getMerUid() {
		return merUid;
	}

	public void setMerUid(String merUid) {
		this.merUid = merUid;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getPassportEx() {
		return passportEx;
	}

	public void setPassportEx(String passportEx) {
		this.passportEx = passportEx;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}

	@Override
	public String toString() {
		return "Person [merUid=" + merUid + ", surName=" + surName + ", engName=" + engName + ", birthday=" + birthday
				+ ", phone=" + phone + ", gender=" + gender + ", nation=" + nation + ", passport=" + passport
				+ ", passportEx=" + passportEx + ", status=" + status + ", div=" + div + "]";
	}
	 
}
