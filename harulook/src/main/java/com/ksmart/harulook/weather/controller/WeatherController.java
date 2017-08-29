package com.ksmart.harulook.weather.controller;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import com.ksmart.harulook.weather.service.WeatherDao;
import com.ksmart.harulook.weather.service.WeatherDto;

@RestController
public class WeatherController {

	@Autowired
	private WeatherDao weatherDao; 
	
	@RequestMapping(value="/currentWeather", method = RequestMethod.GET)
	public WeatherDto currentWeather(
			@RequestParam(value="date", required=true) String date
			,@RequestParam(value="hour", required=true) String hour
			,@RequestParam(value="nx", required=true) String nx
			,@RequestParam(value="ny", required=true) String ny) throws IOException, ParserConfigurationException, SAXException {
		WeatherDto weather = null;
		System.out.println("date : "+date);
		System.out.println("hour : "+hour);
		System.out.println("nx : "+nx);
		System.out.println("ny : "+ny);
		weather = weatherDao.getItemList(date, hour, nx, ny);
		System.out.println("weather : "+weather+" in currentWeather");
		
		return weather;
	}
}
