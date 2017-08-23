package com.ksmart.harulook.mall.service;

public class MallDto {

	private String mallProNo;
	private String mallProName;
	private int mallProPrice;
	private String mallProCate;
	private String mallProImg;
	private String cooContractNo;
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
	public String getCooContractNo() {
		return cooContractNo;
	}
	public void setCooContractNo(String cooContractNo) {
		this.cooContractNo = cooContractNo;
	}
	@Override
	public String toString() {
		return "MallDto [mallProNo=" + mallProNo + ", mallProName=" + mallProName + ", mallProPrice=" + mallProPrice
				+ ", mallProCate=" + mallProCate + ", mallProImg=" + mallProImg + ", cooContractNo=" + cooContractNo
				+ "]";
	}
	

}