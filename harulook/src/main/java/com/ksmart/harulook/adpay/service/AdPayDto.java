package com.ksmart.harulook.adpay.service;

public class AdPayDto {
	private String adContractNo;
	private String adPayWay;
	private String adPayName;
	private int adPayPrice;
	private String adPayDate;
	private String adPayBank;
	private String adPayNo;
	
	
	
	
	@Override
	public String toString() {
		return "AdPayDto [adContractNo=" + adContractNo + ", adPayWay=" + adPayWay + ", adPayName=" + adPayName
				+ ", adPayPrice=" + adPayPrice + ", adPayDate=" + adPayDate + ", adPayBank=" + adPayBank + ", adPayNo="
				+ adPayNo + "]";
	}
	public String getAdPayNo() {
		return adPayNo;
	}
	public void setAdPayNo(String adPayNo) {
		this.adPayNo = adPayNo;
	}
	
	public String getAdPayBank() {
		return adPayBank;
	}
	public void setAdPayBank(String adPayBank) {
		this.adPayBank = adPayBank;
	}
	public String getAdContractNo() {
		return adContractNo;
	}
	public void setAdContractNo(String adContractNo) {
		this.adContractNo = adContractNo;
	}
	public String getAdPayWay() {
		return adPayWay;
	}
	public void setAdPayWay(String adPayWay) {
		this.adPayWay = adPayWay;
	}
	public String getAdPayName() {
		return adPayName;
	}
	public void setAdPayName(String adPayName) {
		this.adPayName = adPayName;
	}
	public int getAdPayPrice() {
		return adPayPrice;
	}
	public void setAdPayPrice(int adPayPrice) {
		this.adPayPrice = adPayPrice;
	}
	public String getAdPayDate() {
		return adPayDate;
	}
	public void setAdPayDate(String adPayDate) {
		this.adPayDate = adPayDate;
	}
	

}
