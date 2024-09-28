package com.gd.hw.notice.model.vo;

import java.sql.Date;

public class Notice {
	 private int noticeNo;
	 private String noticeTitle;
	 private String noticeContext;
	 private String noticeWriter;
	 private Date registDate;
	 
	 
	 
	public Notice(int noticeNo, String noticeTitle, String noticeContext, String noticeWriter, Date registDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContext = noticeContext;
		this.noticeWriter = noticeWriter;
		this.registDate = registDate;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContext=" + noticeContext
				+ ", noticeWriter=" + noticeWriter + ", registDate=" + registDate + "]";
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContext() {
		return noticeContext;
	}
	public void setNoticeContext(String noticeContext) {
		this.noticeContext = noticeContext;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	 
	 
	 
}
