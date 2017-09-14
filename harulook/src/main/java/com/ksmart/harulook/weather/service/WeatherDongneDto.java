package com.ksmart.harulook.weather.service;

public class WeatherDongneDto {
	private String temp3hour;		// 1시간 간격 기온
	private String sky;				// 하늘 상태 : 맑음, 흐림 등
	private String rainStat;		// 강수형태 : 비, 눈
	private String humidity;		// 습도
	private String rainProbability;
	private String precipitation;	// 강수량
	private String tempMax;
	private String tempMin;
	public String getRainProbability() {
		return rainProbability;
	}
	public void setRainProbability(String rainProbability) {
		this.rainProbability = rainProbability;
	}
	public String getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(String precipitation) {
		this.precipitation = precipitation;
	}
	public String getTemp1hour() {
		return temp3hour;
	}
	public void setTemp1hour(String temp1hour) {
		this.temp3hour = temp1hour;
	}
	public String getSky() {
		return sky;
	}
	public String getTemp3hour() {
		return temp3hour;
	}
	public void setTemp3hour(String temp3hour) {
		this.temp3hour = temp3hour;
	}
	public String getTempMax() {
		return tempMax;
	}
	public void setTempMax(String tempMax) {
		this.tempMax = tempMax;
	}
	public String getTempMin() {
		return tempMin;
	}
	public void setTempMin(String tempMin) {
		this.tempMin = tempMin;
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
	@Override
	public String toString() {
		return "WeatherDongneDto [temp3hour=" + temp3hour + ", sky=" + sky + ", rainStat=" + rainStat + ", humidity=" + humidity
				+ ", rainProbability=" + rainProbability + ", precipitation=" + precipitation + ", tempMax=" + tempMax
				+ ", tempMin=" + tempMin + "]";
	}
}
