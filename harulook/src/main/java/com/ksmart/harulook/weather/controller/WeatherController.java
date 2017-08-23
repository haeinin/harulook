package com.ksmart.harulook.weather.controller;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.ksmart.harulook.weather.service.WeatherDao;
import com.ksmart.harulook.weather.service.WeatherDto;

@Controller
public class WeatherController {

	@Autowired
	private WeatherDao weatherDao; 
	
	@RequestMapping(value="/currentWeather", method = RequestMethod.GET)
	public @ResponseBody WeatherDto currentWeather(
			@RequestParam(value="date", required=true) String date
			,@RequestParam(value="hour", required=true) String hour) throws IOException, ParserConfigurationException, SAXException {
		WeatherDto weather = null;
		weather = weatherDao.getItemList(date, hour);
		System.out.println("weather : "+weather+" in currentWeather");
		
		return weather;
	}
}
