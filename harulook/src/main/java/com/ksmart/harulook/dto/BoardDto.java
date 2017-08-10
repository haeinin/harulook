package com.ksmart.harulook.dto;

public class BoardDto {
	private String snsBoardNO;
	private String userId;
	private String snsBoardContent;
	private String snsBoardWeather;
	private String snsBoardTall;
	private String snsBoardSize;
	private String snsBoardLoc;
	private String snsBoardDate;
	private String snsBoardGender;
	private String snsBoardAge;
	public String getSnsBoardNO() {
		return snsBoardNO;
	}
	public void setSnsBoardNO(String snsBoardNO) {
		this.snsBoardNO = snsBoardNO;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSnsBoardContent() {
		return snsBoardContent;
	}
	public void setSnsBoardContent(String snsBoardContent) {
		this.snsBoardContent = snsBoardContent;
	}
	public String getSnsBoardWeather() {
		return snsBoardWeather;
	}
	public void setSnsBoardWeather(String snsBoardWeather) {
		this.snsBoardWeather = snsBoardWeather;
	}
	public String getSnsBoardTall() {
		return snsBoardTall;
	}
	public void setSnsBoardTall(String snsBoardTall) {
		this.snsBoardTall = snsBoardTall;
	}
	public String getSnsBoardSize() {
		return snsBoardSize;
	}
	public void setSnsBoardSize(String snsBoardSize) {
		this.snsBoardSize = snsBoardSize;
	}
	public String getSnsBoardLoc() {
		return snsBoardLoc;
	}
	public void setSnsBoardLoc(String snsBoardLoc) {
		this.snsBoardLoc = snsBoardLoc;
	}
	public String getSnsBoardDate() {
		return snsBoardDate;
	}
	public void setSnsBoardDate(String snsBoardDate) {
		this.snsBoardDate = snsBoardDate;
	}
	public String getSnsBoardGender() {
		return snsBoardGender;
	}
	public void setSnsBoardGender(String snsBoardGender) {
		this.snsBoardGender = snsBoardGender;
	}
	public String getSnsBoardAge() {
		return snsBoardAge;
	}
	public void setSnsBoardAge(String snsBoardAge) {
		this.snsBoardAge = snsBoardAge;
	}
	@Override
	public String toString() {
		return "BoardDto [snsBoardNO=" + snsBoardNO + ", userId=" + userId + ", snsBoardContent=" + snsBoardContent
				+ ", snsBoardWeather=" + snsBoardWeather + ", snsBoardTall=" + snsBoardTall + ", snsBoardSize="
				+ snsBoardSize + ", snsBoardLoc=" + snsBoardLoc + ", snsBoardDate=" + snsBoardDate + ", snsBoardGender="
				+ snsBoardGender + ", snsBoardAge=" + snsBoardAge + "]";
	}
	
}
