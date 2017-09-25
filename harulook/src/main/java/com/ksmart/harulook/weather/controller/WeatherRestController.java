package com.ksmart.harulook.weather.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import com.ksmart.harulook.weather.service.WeatherService;
import com.ksmart.harulook.weather.service.WeatherDto;

@RestController
public class WeatherRestController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private WeatherService weatherService; 
	
	@RequestMapping(value="/currentWeather", method = RequestMethod.GET)
	public WeatherDto currentWeather(
			@RequestParam(value="date", required=true) String date
			,@RequestParam(value="hour", required=true) String hour
			,@RequestParam(value="nx", required=true) String nx
			,@RequestParam(value="ny", required=true) String ny
			,HttpSession session) throws IOException, ParserConfigurationException, SAXException {
		WeatherDto weather = null;
		String sessionWeather = "";
		log.debug("date : "+date);
		log.debug("hour : "+hour);
		log.debug("nx : "+nx);
		log.debug("ny : "+ny);
		weather = weatherService.getItemList(date, hour, nx, ny);
		log.debug("weather : "+weather+" in currentWeather");
		
		/* 현재 날씨 상태를 세션에 셋팅(게시물 등록, 맞춤 추천에 사용) */
		if(weather.getRainStat().equals("1")) {
			sessionWeather = "비";
		} else if(weather.getRainStat().equals("2") || weather.getRainStat().equals("3")) {
			sessionWeather = "눈";
		} else {
			if(weather.getSky().equals("1")) {
				sessionWeather = "맑음";
			} else if(weather.getSky().equals("2")) {
				sessionWeather = "구름 조금";
			} else if(weather.getSky().equals("3") || weather.getSky().equals("4")) {
				sessionWeather = "흐림";
			} else {
				sessionWeather = "";
			}
		}
		session.setAttribute("sessionWeather", sessionWeather);
		session.setAttribute("sessionTemp", weather.getTemp1hour());
		
		return weather;
	}
}
