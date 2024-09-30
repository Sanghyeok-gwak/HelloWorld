package com.gd.hw.order.model.vo;
import java.sql.Date;

public class Order {
   //Order 테이블 관련
   private String merchantUid;
   private int userNo;
   private int productId;
   private int bhNo;
   private String impUid;    // order payment 둘다
   private int adult;
   private int child;
   private String request;
   private String flight;
   private int pointU;
   
   //Payment 테이블 관련
   private String payOp;
   private Date payDate;
   private String status;
   private int totalPay;
   
   public Order() {}
   public Order(String merchantUid, int userNo, int productId, int bhNo, String impUid, int adult, int child,
         String request, String flight, int pointU, String payOp, Date payDate, String status, int totalPay) {
      super();
      this.merchantUid = merchantUid;
      this.userNo = userNo;
      this.productId = productId;
      this.bhNo = bhNo;
      this.impUid = impUid;
      this.adult = adult;
      this.child = child;
      this.request = request;
      this.flight = flight;
      this.pointU = pointU;
      this.payOp = payOp;
      this.payDate = payDate;
      this.status = status;
      this.totalPay = totalPay;
   }
   
   
   public Order(String merchantUid, int userNo, int productId, int bhNo, String impUid, int adult, int child,
         String flight, int pointU, int totalPay) {
      super();
      this.merchantUid = merchantUid;
      this.userNo = userNo;
      this.productId = productId;
      this.bhNo = bhNo;
      this.impUid = impUid;
      this.adult = adult;
      this.child = child;
      this.flight = flight;
      this.pointU = pointU;
      this.totalPay = totalPay;
   }
   public String getMerchantUid() {
      return merchantUid;
   }
   public void setMerchantUid(String merchantUid) {
      this.merchantUid = merchantUid;
   }
   public int getUserNo() {
      return userNo;
   }
   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }
   public int getProductId() {
      return productId;
   }
   public void setProductId(int productId) {
      this.productId = productId;
   }
   public int getBhNo() {
      return bhNo;
   }
   public void setBhNo(int bhNo) {
      this.bhNo = bhNo;
   }
   public String getImpUid() {
      return impUid;
   }
   public void setImpUid(String impUid) {
      this.impUid = impUid;
   }
   public int getAdult() {
      return adult;
   }
   public void setAdult(int adult) {
      this.adult = adult;
   }
   public int getChild() {
      return child;
   }
   public void setChild(int child) {
      this.child = child;
   }
   public String getRequest() {
      return request;
   }
   public void setRequest(String request) {
      this.request = request;
   }
   public String getFlight() {
      return flight;
   }
   public void setFlight(String flight) {
      this.flight = flight;
   }
   public int getPointU() {
      return pointU;
   }
   public void setPointU(int pointU) {
      this.pointU = pointU;
   }
   public String getPayOp() {
      return payOp;
   }
   public void setPayOp(String payOp) {
      this.payOp = payOp;
   }
   public Date getPayDate() {
      return payDate;
   }
   public void setPayDate(Date payDate) {
      this.payDate = payDate;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   public int getTotalPay() {
      return totalPay;
   }
   public void setTotalPay(int totalPay) {
      this.totalPay = totalPay;
   }
   @Override
   public String toString() {
      return "Order [merchantUid=" + merchantUid + ", userNo=" + userNo + ", productId=" + productId + ", bhNo="
            + bhNo + ", impUid=" + impUid + ", adult=" + adult + ", child=" + child + ", request=" + request
            + ", flight=" + flight + ", pointU=" + pointU + ", payOp=" + payOp + ", payDate=" + payDate
            + ", status=" + status + ", totalPay=" + totalPay + "]";
   }
   

}
