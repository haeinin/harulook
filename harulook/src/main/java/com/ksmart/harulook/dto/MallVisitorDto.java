package com.ksmart.harulook.dto;

public class MallVisitorDto {

	private String mallVistorNo;
	private String mallProNo;
	private String mallVistorDate;
	private String mallVistorTime;
	private int mallVistitorCheck;
	private int mallVistitorPrice;
	
	public String getMallVistorNo() {
		return mallVistorNo;
	}
	public void setMallVistorNo(String mallVistorNo) {
		this.mallVistorNo = mallVistorNo;
	}
	public String getMallProNo() {
		return mallProNo;
	}
	public void setMallProNo(String mallProNo) {
		this.mallProNo = mallProNo;
	}
	public String getMallVistorDate() {
		return mallVistorDate;
	}
	public void setMallVistorDate(String mallVistorDate) {
		this.mallVistorDate = mallVistorDate;
	}
	public String getMallVistorTime() {
		return mallVistorTime;
	}
	public void setMallVistorTime(String mallVistorTime) {
		this.mallVistorTime = mallVistorTime;
	}
	public int getMallVistitorCheck() {
		return mallVistitorCheck;
	}
	public void setMallVistitorCheck(int mallVistitorCheck) {
		this.mallVistitorCheck = mallVistitorCheck;
	}
	public int getMallVistitorPrice() {
		return mallVistitorPrice;
	}
	public void setMallVistitorPrice(int mallVistitorPrice) {
		this.mallVistitorPrice = mallVistitorPrice;
	}
	@Override
	public String toString() {
		return "MallVisitorDto [mallVistorNo=" + mallVistorNo + ", mallProNo=" + mallProNo + ", mallVistorDate="
				+ mallVistorDate + ", mallVistorTime=" + mallVistorTime + ", mallVistitorCheck=" + mallVistitorCheck
				+ ", mallVistitorPrice=" + mallVistitorPrice + "]";
	}
	
	
	
}
