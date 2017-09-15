package com.ksmart.harulook.weather.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.xml.sax.SAXException;

import com.ksmart.harulook.weather.service.WeatherService;
import com.ksmart.harulook.weather.service.WeatherDongneDto;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
public class WeatherController {

	@Autowired
	private WeatherService weatherService; 
	
	/* 동네예보 화면 요청 */
	@RequestMapping(value="/forecastWeather", method = RequestMethod.GET)
	public String forecastWeather(
			Model model
			,@RequestParam(value="date", required=true) String date // 오늘 날짜
			,@RequestParam(value="hour", required=true) String hour	// 현재 시간과 가장 가까운 요청 시간
			,@RequestParam(value="nx", required=true) String nx		// 현재 위치의 x좌표
			,@RequestParam(value="ny", required=true) String ny		// 현재 위치의 y좌표
			) throws ParseException, IOException, ParserConfigurationException, SAXException {
		
		// 예보 데이터를 셋팅한 객체를 저장할 리스트 선언
		ArrayList<WeatherDongneDto> weatherList = new ArrayList<WeatherDongneDto>();
        int dateInt = Integer.parseInt(date);	// 내일, 모레 날짜를 구하기 위해 오늘 날짜를 int로 변환
        String tomorrow = String.valueOf(dateInt+1);	// 내일 날짜
        String moere = String.valueOf(dateInt+2);		// 모레 날짜
    	
        // 오늘 시간대별 예보
    	for(int j=0; j<24; j +=3) {	// 예보 시간을 구하는 반복문. 동네예보는 0시부터 3시간 간격으로 8번마다 예보 데이터를 보낸다.
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		WeatherDongneDto weather = new WeatherDongneDto();
    		
    		// 동네 예보 API로 데이터를 받는 메서드를 호출하여 객체에 셋팅
			weather = weatherService.getDongneItemList(date, hour, nx, ny, updateHour, date);
			weather.setUpdateDate("오늘");	// 예보 날짜를 오늘로 셋팅
			weather.setUpdateHour(updateHour.substring(0, 2)+":00");	// 에보 시각을 보기 쉬운 형태로 변경하여 셋팅(18:00, 21:00, ...)
			
			System.out.println("weather : "+weather+" in forecastWeather");
			if(weather.getRainProbability() != null) {	// 해당 시간대의 데이터가 있는 경우만 리스트에 추가
				weatherList.add(weather);				// 오늘 날짜 예보 중 이미 지난 시간대의 예보 데이터는 받지 않는다.
			}
			
    	}
    	
    	// 내일 시간대별 예보
    	for(int j=0; j<24; j +=3) {	// 예보 시간을 구하는 반복문. 동네예보는 0시부터 3시간 간격으로 8번마다 예보 데이터를 보낸다.
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		
    		WeatherDongneDto weather = new WeatherDongneDto();
    		
    		// 동네 예보 API로 데이터를 받는 메서드를 호출하여 객체에 셋팅
			weather = weatherService.getDongneItemList(date, hour, nx, ny, updateHour, tomorrow);
			System.out.println("weather : "+weather+" in forecastWeather");
			weather.setUpdateDate("내일");	// 예보 날짜를 내일로 셋팅
			weather.setUpdateHour(updateHour.substring(0, 2)+":00");	// 에보 시각을 보기 쉬운 형태로 변경하여 셋팅
			weatherList.add(weather);	// 리스트에 객체를 추가
    	}
    	
    	// 모레 시간대별 예보
    	for(int j=0; j<24; j +=3) {	// 예보 시간을 구하는 반복문. 동네예보는 0시부터 3시간 간격으로 8번마다 예보 데이터를 보낸다.
    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
    		
    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
    			updateHour = "0"+updateHour;
    		}
    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
    		System.out.println("updateHour : "+updateHour+" in forecastWeather");
    		WeatherDongneDto weather = new WeatherDongneDto();
    		
    		// 동네 예보 API로 데이터를 받는 메서드를 호출하여 객체에 셋팅
			weather = weatherService.getDongneItemList(date, hour, nx, ny, updateHour, moere);
			System.out.println("weather : "+weather+" in forecastWeather");
			weather.setUpdateDate("모레");	// 예보 날짜를 모레로 셋팅
			weather.setUpdateHour(updateHour.substring(0, 2)+":00");	// 에보 시각을 보기 쉬운 형태로 변경하여 셋팅
			weatherList.add(weather);	// 리스트에 객체를 추가
    	}
		
		model.addAttribute("weatherList", weatherList);	// 데이터를 저장한 리스트를 모델에 담는다.
		System.out.println("model : "+model+" in forecastWeather");
		return "weather/forecast_weather";		// 날씨 예보 페이지로 이동
	}
}
