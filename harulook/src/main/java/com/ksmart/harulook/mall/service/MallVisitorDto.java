package com.ksmart.harulook.mall.service;

public class MallVisitorDto {

	private String mallVisitorNo;
	private String mallVisitorIp;
	private String mallVistorDatetime;
	private String mallVisitorInflux;
	public String getMallVisitorNo() {
		return mallVisitorNo;
	}
	public void setMallVisitorNo(String mallVisitorNo) {
		this.mallVisitorNo = mallVisitorNo;
	}
	public String getMallVisitorIp() {
		return mallVisitorIp;
	}
	public void setMallVisitorIp(String mallVisitorIp) {
		this.mallVisitorIp = mallVisitorIp;
	}
	public String getMallVistorDatetime() {
		return mallVistorDatetime;
	}
	public void setMallVistorDatetime(String mallVistorDatetime) {
		this.mallVistorDatetime = mallVistorDatetime;
	}
	public String getMallVisitorInflux() {
		return mallVisitorInflux;
	}
	public void setMallVisitorInflux(String mallVisitorInflux) {
		this.mallVisitorInflux = mallVisitorInflux;
	}
	@Override
	public String toString() {
		return "MallVisitorDto [mallVisitorNo=" + mallVisitorNo + ", mallVisitorIp=" + mallVisitorIp
				+ ", mallVistorDatetime=" + mallVistorDatetime + ", mallVisitorInflux=" + mallVisitorInflux + "]";
	}
	
	
	
	
}
