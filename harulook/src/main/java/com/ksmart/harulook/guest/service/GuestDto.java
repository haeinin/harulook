package com.ksmart.harulook.guest.service;

public class GuestDto {
	private String guestNo;
	private String guestIp;
	private String guestDate;
	private String guestLoc;
	private String dailyDate;
	private String weeklyStart;
	private String weeklyEnd;
	private String monthlyDate;
	private int guestCount;
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
	public String getDailyDate() {
		return dailyDate;
	}
	public void setDailyDate(String dailyDate) {
		this.dailyDate = dailyDate;
	}
	public String getWeeklyStart() {
		return weeklyStart;
	}
	public void setWeeklyStart(String weeklyStart) {
		this.weeklyStart = weeklyStart;
	}
	public String getWeeklyEnd() {
		return weeklyEnd;
	}
	public void setWeeklyEnd(String weeklyEnd) {
		this.weeklyEnd = weeklyEnd;
	}
	public String getMonthlyDate() {
		return monthlyDate;
	}
	public void setMonthlyDate(String monthlyDate) {
		this.monthlyDate = monthlyDate;
	}
	public int getGuestCount() {
		return guestCount;
	}
	public void setGuestCount(int guestCount) {
		this.guestCount = guestCount;
	}
	@Override
	public String toString() {
		return "GuestDto [guestNo=" + guestNo + ", guestIp=" + guestIp + ", guestDate=" + guestDate + ", guestLoc="
				+ guestLoc + ", dailyDate=" + dailyDate + ", weeklyStart=" + weeklyStart + ", weeklyEnd=" + weeklyEnd
				+ ", monthlyDate=" + monthlyDate + ", guestCount=" + guestCount + "]";
	}
	
	
	
}
