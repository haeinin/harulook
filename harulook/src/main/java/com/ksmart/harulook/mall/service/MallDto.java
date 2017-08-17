package com.ksmart.harulook.mall.service;

public class MallDto {

	private String partnerNo;
	private String mallProNo;
	private String mallProName;
	private int mallProPrice;
	private String mallProCate;
	private String mallProImg;
	
	
	public String getPartnerNo() {
		return partnerNo;
	}


	public void setPartnerNo(String partnerNo) {
		this.partnerNo = partnerNo;
	}


	public String getMallProNo() {
		return mallProNo;
	}


	public void setMallProNo(String mallProNo) {
		this.mallProNo = mallProNo;
	}


	public String getMallProName() {
		return mallProName;
	}


	public void setMallProName(String mallProName) {
		this.mallProName = mallProName;
	}


	public int getMallProPrice() {
		return mallProPrice;
	}


	public void setMallProPrice(int mallProPrice) {
		this.mallProPrice = mallProPrice;
	}


	public String getMallProCate() {
		return mallProCate;
	}


	public void setMallProCate(String mallProCate) {
		this.mallProCate = mallProCate;
	}


	public String getMallProImg() {
		return mallProImg;
	}


	public void setMallProImg(String mallProImg) {
		this.mallProImg = mallProImg;
	}


	@Override
	public String toString() {
		return "MallDto [partnerNo=" + partnerNo + ", mallProNo=" + mallProNo + ", mallProName=" + mallProName
				+ ", mallProPrice=" + mallProPrice + ", mallProCate=" + mallProCate + ", mallProImg=" + mallProImg
				+ "]";
	}
	
}