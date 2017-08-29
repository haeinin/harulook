package com.ksmart.harulook.adgoods;

public class AdGoodsDto {
	private String adGoodsNo;
	private String adGoodsImg;
	private String adGoodsLink;
	
	@Override
	public String toString() {
		return "AdGoodsDto [adGoodsNo=" + adGoodsNo + ", adGoodsImg=" + adGoodsImg + ", adGoodsLink=" + adGoodsLink
				+ "]";
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
	public String getAdGoodsLink() {
		return adGoodsLink;
	}
	public void setAdGoodsLink(String adGoodsLink) {
		this.adGoodsLink = adGoodsLink;
	}
}
