package com.ksmart.harulook.partner.service;

public class PartnerStatsDto {

	private String statsDate;
	private int statsAmount;
	private String statsStartDate;
	private String statsEndDate;
	public String getStatsDate() {
		return statsDate;
	}
	public void setStatsDate(String statsDate) {
		this.statsDate = statsDate;
	}
	public int getStatsAmount() {
		return statsAmount;
	}
	public void setStatsAmount(int statsAmount) {
		this.statsAmount = statsAmount;
	}
	public String getStatsStartDate() {
		return statsStartDate;
	}
	public void setStatsStartDate(String statsStartDate) {
		this.statsStartDate = statsStartDate;
	}
	public String getStatsEndDate() {
		return statsEndDate;
	}
	public void setStatsEndDate(String statsEndDate) {
		this.statsEndDate = statsEndDate;
	}
	@Override
	public String toString() {
		return "PartnerStatsDto [statsDate=" + statsDate + ", statsAmount=" + statsAmount + ", statsStartDate="
				+ statsStartDate + ", statsEndDate=" + statsEndDate + "]";
	}
	

	
	
}
