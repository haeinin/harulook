package com.ksmart.harulook.weather.service;

public class WeatherDto {
	private String temp1hour;		// 1시간 간격 기온
	private String sky;				// 하늘 상태 : 맑음, 흐림 등
	private String rainStat;		// 강수형태 : 비, 눈
	private String humidity;		// 습도
	private String precipitation;	// 강수량
	public String getTemp1hour() {
		return temp1hour;
	}
	public void setTemp1hour(String temp1hour) {
		this.temp1hour = temp1hour;
	}
	public String getSky() {
		return sky;
	}
	public void setSky(String sky) {
		this.sky = sky;
	}
	public String getRainStat() {
		return rainStat;
	}
	public void setRainStat(String rainStat) {
		this.rainStat = rainStat;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(String precipitation) {
		this.precipitation = precipitation;
	}
	
	@Override
	public String toString() {
		return "WeatherDto [temp1hour=" + temp1hour + ", sky=" + sky + ", rainStat=" + rainStat + ", humidity="
				+ humidity + ", precipitation=" + precipitation + "]";
	}
}
