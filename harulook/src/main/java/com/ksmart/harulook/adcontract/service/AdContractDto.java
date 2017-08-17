package com.ksmart.harulook.adcontract.service;

public class AdContractDto {
	private String adContractNo;
	private String userId; 
	private String adContractPlace; 
	private String adContractStart; 
	private String adContractEnd; 
	private String adContractDate; 
	private String adCostNo;
 	private String adDcNo;
 	private String adContractPrice; 
 	private String adContractStat;
 	private String userBsName;
 	
 	
	public String getUserBsName() {
		return userBsName;
	}
	public void setUserBsName(String userBsName) {
		this.userBsName = userBsName;
	}
	
	public String getAdContractNo() {
		return adContractNo;
	}
	public void setAdContractNo(String adContractNo) {
		this.adContractNo = adContractNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAdContractPlace() {
		return adContractPlace;
	}
	public void setAdContractPlace(String adContractPlace) {
		this.adContractPlace = adContractPlace;
	}
	public String getAdContractStart() {
		return adContractStart;
	}
	public void setAdContractStart(String adContractStart) {
		this.adContractStart = adContractStart;
	}
	public String getAdContractEnd() {
		return adContractEnd;
	}
	public void setAdContractEnd(String adContractEnd) {
		this.adContractEnd = adContractEnd;
	}
	public String getAdContractDate() {
		return adContractDate;
	}
	public void setAdContractDate(String adContractDate) {
		this.adContractDate = adContractDate;
	}
	public String getAdCostNo() {
		return adCostNo;
	}
	public void setAdCostNo(String adCostNo) {
		this.adCostNo = adCostNo;
	}
	public String getAdDcNo() {
		return adDcNo;
	}
	public void setAdDcNo(String adDcNo) {
		this.adDcNo = adDcNo;
	}
	public String getAdContractPrice() {
		return adContractPrice;
	}
	public void setAdContractPrice(String adContractPrice) {
		this.adContractPrice = adContractPrice;
	}
	public String getAdContractStat() {
		return adContractStat;
	}
	public void setAdContractStat(String adContractStat) {
		this.adContractStat = adContractStat;
	}
	@Override
	public String toString() {
		return "AdContractDto [adContractNo=" + adContractNo + ", userId=" + userId + ", adContractPlace="
				+ adContractPlace + ", adContractStart=" + adContractStart + ", adContractEnd=" + adContractEnd
				+ ", adContractDate=" + adContractDate + ", adCostNo=" + adCostNo + ", adDcNo=" + adDcNo
				+ ", adContractPrice=" + adContractPrice + ", adContractStat=" + adContractStat + "]";
	}	
}
