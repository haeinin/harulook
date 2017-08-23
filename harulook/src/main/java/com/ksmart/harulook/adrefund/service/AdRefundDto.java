package com.ksmart.harulook.adrefund.service;

public class AdRefundDto {
	private String refundNo;
	private String adContractNo;
	private int refundPrice;
	private String refundDate;
	private String refundStat;
		
	@Override
	public String toString() {
		return "AdRefundDto [refundNo=" + refundNo + ", adContractNo=" + adContractNo + ", refundPrice=" + refundPrice
				+ ", refundDate=" + refundDate + ", refundStat=" + refundStat + "]";
	}
	public String getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(String refundNo) {
		this.refundNo = refundNo;
	}
	public String getAdContractNo() {
		return adContractNo;
	}
	public void setAdContractNo(String adContractNo) {
		this.adContractNo = adContractNo;
	}
	public int getRefundPrice() {
		return refundPrice;
	}
	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}
	public String getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}
	public String getRefundStat() {
		return refundStat;
	}
	public void setRefundStat(String refundStat) {
		this.refundStat = refundStat;
	}
}
