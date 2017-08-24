package com.ksmart.harulook.partner.service;

public class PartnerStatsDto {

	private String statsDate;
	private int statsAmount;
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
	@Override
	public String toString() {
		return "PartnerStatsDto [statsDate=" + statsDate + ", statsAmount=" + statsAmount + "]";
	}
	
	
}
