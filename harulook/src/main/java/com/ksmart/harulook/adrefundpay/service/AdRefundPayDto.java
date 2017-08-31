package com.ksmart.harulook.adrefundpay.service;

public class AdRefundPayDto {
	private String refundPayNo;
	private String refundNo;
	private String refundPayAccount;
	private String refundPayName;
	private String refundPayDate;
	private String refundPayBank;
	

	@Override
	public String toString() {
		return "AdRefundPayDto [refundPayNo=" + refundPayNo + ", refundNo=" + refundNo + ", refundPayAccount="
				+ refundPayAccount + ", refundPayName=" + refundPayName + ", refundPayDate=" + refundPayDate
				+ ", refundPayBank=" + refundPayBank + "]";
	}
	public String getRefundPayBank() {
		return refundPayBank;
	}
	public void setRefundPayBank(String refundPayBank) {
		this.refundPayBank = refundPayBank;
	}
	public String getRefundPayNo() {
		return refundPayNo;
	}
	public void setRefundPayNo(String refundPayNo) {
		this.refundPayNo = refundPayNo;
	}
	public String getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(String refundNo) {
		this.refundNo = refundNo;
	}
	public String getRefundPayAccount() {
		return refundPayAccount;
	}
	public void setRefundPayAccount(String refundPayAccount) {
		this.refundPayAccount = refundPayAccount;
	}
	public String getRefundPayName() {
		return refundPayName;
	}
	public void setRefundPayName(String refundPayName) {
		this.refundPayName = refundPayName;
	}
	public String getRefundPayDate() {
		return refundPayDate;
	}
	public void setRefundPayDate(String refundPayDate) {
		this.refundPayDate = refundPayDate;
	}
}
