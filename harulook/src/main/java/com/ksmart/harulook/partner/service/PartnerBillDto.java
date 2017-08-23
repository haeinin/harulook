package com.ksmart.harulook.partner.service;

public class PartnerBillDto {
	private String cooBillNo;
	private String cooContractNo;
	private int cooBillValue;
	private int cooBillMonth;
	private String cooBillDate;
	
	@Override
	public String toString() {
		return "PartnerBillDto [cooBillNo=" + cooBillNo + ", cooContractNo=" + cooContractNo + ", cooBillValue="
				+ cooBillValue + ", cooBillMonth=" + cooBillMonth + ", cooBillDate=" + cooBillDate + "]";
	}
	public String getCooBillNo() {
		return cooBillNo;
	}
	public void setCooBillNo(String cooBillNo) {
		this.cooBillNo = cooBillNo;
	}
	public String getCooContractNo() {
		return cooContractNo;
	}
	public void setCooContractNo(String cooContractNo) {
		this.cooContractNo = cooContractNo;
	}
	public int getCooBillValue() {
		return cooBillValue;
	}
	public void setCooBillValue(int cooBillValue) {
		this.cooBillValue = cooBillValue;
	}
	public int getCooBillMonth() {
		return cooBillMonth;
	}
	public void setCooBillMonth(int cooBillMonth) {
		this.cooBillMonth = cooBillMonth;
	}
	public String getCooBillDate() {
		return cooBillDate;
	}
	public void setCooBillDate(String cooBillDate) {
		this.cooBillDate = cooBillDate;
	}
	

	

}
