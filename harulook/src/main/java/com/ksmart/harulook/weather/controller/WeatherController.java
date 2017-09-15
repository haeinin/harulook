package com.ksmart.harulook.weather.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.xml.sax.SAXException;

import com.ksmart.harulook.weather.service.WeatherDao;
import com.ksmart.harulook.weather.service.WeatherDongneDto;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
public class WeatherController {

	@Autowired
	private WeatherDao weatherDao; 
	
	/* 동네예보 화면 요청 */
	@RequestMapping(value="/forecastWeather", method = RequestMethod.GET)
	public String forecastWeather(
			Model model
			,@RequestParam(value="date", required=true) String date
			,@RequestParam(value="hour", required=true) String hour
			,@RequestParam(value="nx", required=true) String nx
			,@RequestParam(value="ny", required=true) String ny) throws ParseException, IOException, ParserConfigurationException, SAXException {
		
		
		ArrayList<WeatherDongneDto> weatherList = new ArrayList<WeatherDongneDto>();
        int dateInt = Integer.parseInt(date);	// 내일, 모레 날짜를 구하기 위해 오늘 날짜를 int로 변환
        String tomorrow = String.valueOf(dateInt+1);	// 내일 날짜
        String moere = String.valueOf(dateInt+2);		// 모레 날짜
    	// 예보 시간을 구하는 반복문 
    	// 동네예보는 0시부터 3시간 간격으로 8번마다 예보 데이터를 보낸다.
    	for(int j=3; j<24; j +=3) {
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		WeatherDongneDto weather = new WeatherDongneDto();
			weather = weatherDao.getDongneItemList(date, hour, nx, ny, updateHour, date);
			weather.setUpdateDate(date.substring(6));
			weather.setUpdateHour(updateHour.substring(0, 2));
			
			System.out.println("weather : "+weather+" in forecastWeather");
			if(weather.getRainProbability() != null) {
				weatherList.add(weather);
			}
			
    	}
    	for(int j=3; j<24; j +=3) {
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		WeatherDongneDto weather = new WeatherDongneDto();
			weather = weatherDao.getDongneItemList(date, hour, nx, ny, updateHour, tomorrow);
			System.out.println("weather : "+weather+" in forecastWeather");
			weather.setUpdateDate(tomorrow.substring(6));
			weather.setUpdateHour(updateHour.substring(0, 2));
			weatherList.add(weather);
    	}
    	for(int j=3; j<24; j +=3) {
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		WeatherDongneDto weather = new WeatherDongneDto();
			weather = weatherDao.getDongneItemList(date, hour, nx, ny, updateHour, moere);
			System.out.println("weather : "+weather+" in forecastWeather");
			weather.setUpdateDate(moere.substring(6));
			weather.setUpdateHour(updateHour.substring(0, 2));
			weatherList.add(weather);
    	}
		
		model.addAttribute("weatherList", weatherList);
		System.out.println("model : "+model+" in forecastWeather");
		return "weather/forecast_weather";
	}
}
