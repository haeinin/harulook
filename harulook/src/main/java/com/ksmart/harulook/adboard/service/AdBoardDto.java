package com.ksmart.harulook.adboard.service;

public class AdBoardDto {
	private String adBoardNo;
	private String adContractNo;
	private String adBoardGoods1;
	private String adBoardGoods2;
	private String adBoardTempMin;
	private String adBoardTempMax;
	private String adBoardImage;
	private String adBoardDate;
	private String adGoodsNo;
	private String adGoodsImg;
	private String adBoardLink;
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
	public String getAdBoardImage() {
		return adBoardImage;
	}
	public void setAdBoardImage(String adBoardImage) {
		this.adBoardImage = adBoardImage;
	}
	public String getAdBoardDate() {
		return adBoardDate;
	}
	public void setAdBoardDate(String adBoardDate) {
		this.adBoardDate = adBoardDate;
	}
	public String getAdGoodsNo() {
		return adGoodsNo;
	}
	public void setAdGoodsNo(String adGoodsNo) {
		this.adGoodsNo = adGoodsNo;
	}
	public String getAdGoodsImg() {
		return adGoodsImg;
	}
	public void setAdGoodsImg(String adGoodsImg) {
		this.adGoodsImg = adGoodsImg;
	}
	public String getAdBoardLink() {
		return adBoardLink;
	}
	public void setAdBoardLink(String adBoardLink) {
		this.adBoardLink = adBoardLink;
	}
	@Override
	public String toString() {
		return "AdBoardDto [adBoardNo=" + adBoardNo + ", adContractNo=" + adContractNo + ", adBoardGoods1="
				+ adBoardGoods1 + ", adBoardGoods2=" + adBoardGoods2 + ", adBoardTempMin=" + adBoardTempMin
				+ ", adBoardTempMax=" + adBoardTempMax + ", adBoardImage=" + adBoardImage + ", adBoardDate="
				+ adBoardDate + ", adGoodsNo=" + adGoodsNo + ", adGoodsImg=" + adGoodsImg + ", adBoardLink="
				+ adBoardLink + "]";
	}

}
