package com.ksmart.harulook.dto;

public class AdPayDto {
	private String adContractNo;
	private String adPayWay;
	private String adPayName;
	private int adPayPrice;
	private String adPayDate;
	
	@Override
	public String toString() {
		return "AdPayDto [adContractNo=" + adContractNo + ", adPayWay=" + adPayWay + ", adPayName=" + adPayName
				+ ", adPayPrice=" + adPayPrice + ", adPayDate=" + adPayDate + "]";
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
