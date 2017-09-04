package com.ksmart.harulook.adgoods.service;

public class AdGoodsDto {
	private String adGoodsNo;
	private String adGoodsImg;
	private String adGoodsLink;
	public String getAdGoodsNo() {
		return adGoodsNo;
	}
	public void setAdGoodsNo(String adGoodsNo) {
		this.adGoodsNo = adGoodsNo;
	}
	public String getAdGoodsImage() {
		return adGoodsImg;
	}
	public void setAdGoodsImage(String adGoodsImage) {
		this.adGoodsImg = adGoodsImage;
	}
	public String getAdGoodsLink() {
		return adGoodsLink;
	}
	public void setAdGoodsLink(String adGoodsLink) {
		this.adGoodsLink = adGoodsLink;
	}
	@Override
	public String toString() {
		return "AdGoodsDto [adGoodsNo=" + adGoodsNo + ", adGoodsImg=" + adGoodsImg + ", adGoodsLink=" + adGoodsLink
				+ "]";
	}
}





