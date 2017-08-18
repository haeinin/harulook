package com.ksmart.harulook.board.service;

import java.util.Arrays;

public class BoardDto {
	private String snsBoardNo;
	private String userId;
	private String snsBoardImg;
	private String snsBoardContent;
	private String snsBoardWeather;
	private String snsBoardTall;
	private String snsBoardSize;
	private String snsBoardLoc;
	private String snsBoardDate;
	private String snsBoardGender;
	private String snsBoardAge;
	private int snsCommentCount;
	private int snsLikeCount;
	private String[] colorValue;
	private String[] styleValue;
	private String[] situationValue;
	
	public String[] getColorValue() {
		return colorValue;
	}
	public void setColorValue(String[] colorValue) {
		this.colorValue = colorValue;
	}
	public String[] getStyleValue() {
		return styleValue;
	}
	public void setStyleValue(String[] styleValue) {
		this.styleValue = styleValue;
	}
	public String[] getSituationValue() {
		return situationValue;
	}
	public void setSituationValue(String[] situationValue) {
		this.situationValue = situationValue;
	}
	public int getSnsCommentCount() {
		return snsCommentCount;
	}
	public void setSnsCommentCount(int snsCommentCount) {
		this.snsCommentCount = snsCommentCount;
	}
	public String getSnsBoardNo() {
		System.out.println(snsBoardNo);
		return snsBoardNo;
	}
	public void setSnsBoardNo(String snsBoardNO) {
		this.snsBoardNo = snsBoardNO;
		System.out.println(snsBoardNo);
	}
	public String getSnsBoardImg() {
		return snsBoardImg;
	}
	public void setSnsBoardImg(String snsBoardImg) {
		this.snsBoardImg = snsBoardImg;
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
	public int getSnsLikeCount() {
		return snsLikeCount;
	}
	public void setSnsLikeCount(int snsLikeCount) {
		this.snsLikeCount = snsLikeCount;
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
		return "BoardDto [snsBoardNo=" + snsBoardNo + ", userId=" + userId + ", snsBoardImg=" + snsBoardImg
				+ ", snsBoardContent=" + snsBoardContent + ", snsBoardWeather=" + snsBoardWeather + ", snsBoardTall="
				+ snsBoardTall + ", snsBoardSize=" + snsBoardSize + ", snsBoardLoc=" + snsBoardLoc + ", snsBoardDate="
				+ snsBoardDate + ", snsBoardGender=" + snsBoardGender + ", snsBoardAge=" + snsBoardAge
				+ ", snsCommentCount=" + snsCommentCount + ", snsLikeCount=" + snsLikeCount + ", colorValue="
				+ Arrays.toString(colorValue) + ", styleValue=" + Arrays.toString(styleValue) + ", situationValue="
				+ Arrays.toString(situationValue) + "]";
	}
	
}
