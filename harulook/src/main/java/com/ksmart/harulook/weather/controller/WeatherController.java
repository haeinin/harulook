package com.ksmart.harulook.weather.controller;

import java.io.IOException;
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
		HashMap<String,WeatherDongneDto> map = new HashMap<String,WeatherDongneDto>();
		map = weatherDao.getDongneItemList(date, hour, nx, ny);
		model.addAttribute("map", map);
		System.out.println("model : "+model+" in forecastWeather");
		return "weather/forecast_weather";
	}
}
