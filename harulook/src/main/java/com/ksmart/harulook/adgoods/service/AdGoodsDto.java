package com.ksmart.harulook.adgoods.service;

public class AdGoodsDto {
	private String adGoodsNo;
	private String adGoodsImage;
	private String adGoodsLink;
	public String getAdGoodsNo() {
		return adGoodsNo;
	}
	public void setAdGoodsNo(String adGoodsNo) {
		this.adGoodsNo = adGoodsNo;
	}
	public String getAdGoodsImage() {
		return adGoodsImage;
	}
	public void setAdGoodsImage(String adGoodsImage) {
		this.adGoodsImage = adGoodsImage;
	}
	public String getAdGoodsLink() {
		return adGoodsLink;
	}
	public void setAdGoodsLink(String adGoodsLink) {
		this.adGoodsLink = adGoodsLink;
	}
	@Override
	public String toString() {
		return "AdGoodsDto [adGoodsNo=" + adGoodsNo + ", adGoodsImage=" + adGoodsImage + ", adGoodsLink=" + adGoodsLink
				+ "]";
	}
}





