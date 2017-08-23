package com.ksmart.harulook.point.service;

public class PointDto {
	private String pointPolicyNo;
	private String pointPolicyValue;
	private String pointPolicyReason;
	private String pointNo;
	private String userId;
	private String pointDate;
	public String getPointPolicyNo() {
		return pointPolicyNo;
	}
	public void setPointPolicyNo(String pointPolicyNo) {
		this.pointPolicyNo = pointPolicyNo;
	}
	public String getPointPolicyValue() {
		return pointPolicyValue;
	}
	public void setPointPolicyValue(String pointPolicyValue) {
		this.pointPolicyValue = pointPolicyValue;
	}
	public String getPointPolicyReason() {
		return pointPolicyReason;
	}
	public void setPointPolicyReason(String pointPolicyReason) {
		this.pointPolicyReason = pointPolicyReason;
	}
	public String getPointNo() {
		return pointNo;
	}
	public void setPointNo(String pointNo) {
		this.pointNo = pointNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPointDate() {
		return pointDate;
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
	@Override
	public String toString() {
		return "PointDto [pointPolicyNo=" + pointPolicyNo + ", pointPolicyValue=" + pointPolicyValue
				+ ", pointPolicyReason=" + pointPolicyReason + ", pointNo=" + pointNo + ", userId=" + userId
				+ ", pointDate=" + pointDate + "]";
	}
	
	
}
