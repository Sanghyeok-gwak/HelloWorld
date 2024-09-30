package com.gd.hw.myinfo.model.vo;



public class MyPoint {
	
	 private int pointP;
	 private int pointU;

	 public MyPoint() {}
	 public MyPoint(int pointP, int pointU) {
	    this.pointP = pointP;
	    this.pointU = pointU;
	    }

	    public int getPointP() {
	        return pointP;
	    }

	    public int getPointU() {
	        return pointU;
	    }
	    public int getRemainingPoints() {
	        return pointP - pointU;
	    
}
}
