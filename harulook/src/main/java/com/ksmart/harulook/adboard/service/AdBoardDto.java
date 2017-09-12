package com.ksmart.harulook.adboard.service;

public class AdBoardDto {
	private String adBoardNo;
	private String adContractNo;
	private String adBoardGoods1;
	private String adBoardGoods2;
	private String adBoardTempMin;
	private String adBoardTempMax;
	private String adBoardImg;
	private String adBoardDate;
	private String adBoardContent;
	
	public String getAdBoardContent() {
		return adBoardContent;
	}
	public void setAdBoardContent(String adBoardContent) {
		this.adBoardContent = adBoardContent;
	}
	public String getAdBoardNo() {
		return adBoardNo;
	}
	public void setAdBoardNo(String adBoardNo) {
		this.adBoardNo = adBoardNo;
	}
	public String getAdContractNo() {
		return adContractNo;
	}
	public void setAdContractNo(String adContractNo) {
		this.adContractNo = adContractNo;
	}
	public String getAdBoardGoods1() {
		return adBoardGoods1;
	}
	public void setAdBoardGoods1(String adBoardGoods1) {
		this.adBoardGoods1 = adBoardGoods1;
	}
	public String getAdBoardGoods2() {
		return adBoardGoods2;
	}
	public void setAdBoardGoods2(String adBoardGoods2) {
		this.adBoardGoods2 = adBoardGoods2;
	}
	public String getAdBoardTempMin() {
		return adBoardTempMin;
	}
	public void setAdBoardTempMin(String adBoardTempMin) {
		this.adBoardTempMin = adBoardTempMin;
	}
	public String getAdBoardTempMax() {
		return adBoardTempMax;
	}
	public void setAdBoardTempMax(String adBoardTempMax) {
		this.adBoardTempMax = adBoardTempMax;
	}
	public String getAdBoardImg() {
		return adBoardImg;
	}
	public void setAdBoardImg(String adBoardImg) {
		this.adBoardImg = adBoardImg;
	}
	public String getAdBoardDate() {
		return adBoardDate;
	}
	public void setAdBoardDate(String adBoardDate) {
		this.adBoardDate = adBoardDate;
	}
	@Override
	public String toString() {
		return "AdBoardDto [adBoardNo=" + adBoardNo + ", adContractNo=" + adContractNo + ", adBoardGoods1="
				+ adBoardGoods1 + ", adBoardGoods2=" + adBoardGoods2 + ", adBoardTempMin=" + adBoardTempMin
				+ ", adBoardTempMax=" + adBoardTempMax + ", adBoardImg=" + adBoardImg + ", adBoardDate="
				+ adBoardDate + ", adBoardContent=" + adBoardContent + "]";
	}
	

}
