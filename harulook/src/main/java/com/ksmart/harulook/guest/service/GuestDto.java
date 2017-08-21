package com.ksmart.harulook.guest.service;

public class GuestDto {
	private String guestNo;
	private String guestIp;
	private String guestDate;
	private String guestLoc;
	
	public String getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(String guestNo) {
		this.guestNo = guestNo;
	}
	public String getGuestIp() {
		return guestIp;
	}
	public void setGuestIp(String guestIp) {
		this.guestIp = guestIp;
	}
	public String getGuestDate() {
		return guestDate;
	}
	public void setGuestDate(String guestDate) {
		this.guestDate = guestDate;
	}
	public String getGuestLoc() {
		return guestLoc;
	}
	public void setGuestLoc(String guestLoc) {
		this.guestLoc = guestLoc;
	}
	@Override
	public String toString() {
		return "GuestDto [guestNo=" + guestNo + ", guestIp=" + guestIp + ", guestDate=" + guestDate + ", guestLoc="
				+ guestLoc + "]";
	}
	
	
}
