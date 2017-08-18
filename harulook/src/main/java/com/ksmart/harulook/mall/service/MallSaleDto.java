package com.ksmart.harulook.mall.service;

public class MallSaleDto {
	private String userId;
	private String mallProNo;
	private int mallSaleAmount;
	private int mallSalePrice;
	private int mallSaleTotal;
	private String mallSaleDate;
	private String cooContractCode;
	private String mallProName;
	
	@Override
	public String toString() {
		return "MallSaleDto [userId=" + userId + ", mallProNo=" + mallProNo + ", mallSaleAmount=" + mallSaleAmount
				+ ", mallSalePrice=" + mallSalePrice + ", mallSaleTotal=" + mallSaleTotal + ", mallSaleDate="
				+ mallSaleDate + ", cooContractCode=" + cooContractCode + ", mallProName=" + mallProName + "]";
	}
	public String getMallProName() {
		return mallProName;
	}
	public void setMallProName(String mallProName) {
		this.mallProName = mallProName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMallProNo() {
		return mallProNo;
	}
	public void setMallProNo(String mallProNo) {
		this.mallProNo = mallProNo;
	}
	public int getMallSaleAmount() {
		return mallSaleAmount;
	}
	public void setMallSaleAmount(int mallSaleAmount) {
		this.mallSaleAmount = mallSaleAmount;
	}
	public int getMallSalePrice() {
		return mallSalePrice;
	}
	public void setMallSalePrice(int mallSalePrice) {
		this.mallSalePrice = mallSalePrice;
	}
	public int getMallSaleTotal() {
		return mallSaleTotal;
	}
	public void setMallSaleTotal(int mallSaleTotal) {
		this.mallSaleTotal = mallSaleTotal;
	}
	public String getMallSaleDate() {
		return mallSaleDate;
	}
	public void setMallSaleDate(String mallSaleDate) {
		this.mallSaleDate = mallSaleDate;
	}
	public String getCooContractCode() {
		return cooContractCode;
	}
	public void setCooContractCode(String cooContractCode) {
		this.cooContractCode = cooContractCode;
	}
	
	
	
}
