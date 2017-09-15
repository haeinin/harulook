package com.ksmart.harulook.weather.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Repository
public class WeatherService {

	/* 동네예보 API에서 필요한 데이터만 추출 */
	public WeatherDongneDto getDongneItemList(
			String date		// 요청 날짜
			, String hour	// 요청 시간
			, String nx		// x좌표
			, String ny		// y좌표
			, String updateHour	// 예보 날짜
			, String updateDate	// 예보 시각
			) throws IOException, ParserConfigurationException, SAXException, ParseException {
		System.out.println("date : "+date);
		System.out.println("hour : "+hour);
		System.out.println("nx : "+nx);
		System.out.println("ny : "+ny);
		System.out.println("updateDate : "+updateDate);
		System.out.println("updateHour : "+updateHour);
		
		String xml = this.dongneXmlDownload(date, hour, nx, ny); // 동네 예보 API 요청
        System.out.println(xml);
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")));
		NodeList nodeList = doc.getElementsByTagName("item");
		
		WeatherDongneDto weatherDongneDto = new WeatherDongneDto(); // 동네예보 데이터를 저장할 Dto
		
		for(int i=0; i<nodeList.getLength(); i++) {
	    
		    String category = "";	// 카테고리 에보하는 데이터의 종류(T3H, SKY, PTY 등의 구분)
		    String fcstValue = "";	// 예보 값
		    String fcstTime = "";	// 예보 시간
		    String fcstDate = "";	// 예보 날짜
		    Node node = nodeList.item(i);
		    Element e = (Element)node;
		    fcstDate = e.getElementsByTagName("fcstDate").item(0).getTextContent();		// 요청받은 xml의 <fcstDate> 태그 값
		    fcstTime = e.getElementsByTagName("fcstTime").item(0).getTextContent();		// 요청받은 xml의 <fcstTime> 태그 값
		    category = e.getElementsByTagName("category").item(0).getTextContent();		// 요청받은 xml의 <category> 태그 값
		    fcstValue = e.getElementsByTagName("fcstValue").item(0).getTextContent();	// 요청받은 xml의 <fcstValue> 태그 값
		    
		    // 입력 받은 예보 날짜에 해당하는 데이터 추출
		    if(fcstDate.equals(updateDate)) {
	    		// 입력 받은 예보 시각에 해당하는 데이터 추출
	    		if(fcstTime.equals(updateHour)) {	
	    			
	    			if(category.equals("T3H")) {	// 3시간 간격의 예보 기온
	    				weatherDongneDto.setTemp3hour(fcstValue);
	    	        } else if(category.equals("SKY")) {	// 하늘 상태 - 1: 맑음, 2: 구름 조금, 3: 구름 많음, 4: 흐림
	    	        	weatherDongneDto.setSky(fcstValue);
	    	        } else if(category.equals("PTY")) {	// 강수형태
	    	        	weatherDongneDto.setRainStat(fcstValue);
	    	        } else if(category.equals("REH")) {	// 습도
	    	        	weatherDongneDto.setHumidity(fcstValue);
	    	        } else if(category.equals("R06")) {	// 6시간 동안 강우량
	    	        	weatherDongneDto.setPrecipitation(fcstValue);
	    	        } else if(category.equals("POP")) {	// 강수 확률
	    	        	weatherDongneDto.setRainProbability(fcstValue);
	    	        } else if(category.equals("TMN")) {	// 최저 기온 - 0600에 예보
	    	        	weatherDongneDto.setTempMin(fcstValue);
	    	        } else if(category.equals("TMX")) {	// 최고 기온 - 1500에 예보
	    	        	weatherDongneDto.setTempMax(fcstValue);
	    	        } else {
	    		        continue;
	    		    }
	    		}
		    }
	    }
	  return weatherDongneDto;
	}
	
	/* 동네예보 API 요청 */
	public String dongneXmlDownload(
			String date		// 날짜
			, String hour	// 시간	
			, String nx		// x좌표
			, String ny		// y좌표
			) throws IOException {
   	 
		// 요청 URL 작성
	    String host = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?"
	            +URLEncoder.encode("base_date","UTF-8")+"="
	            +URLEncoder.encode(date,"UTF-8")+"&"
	            +URLEncoder.encode("base_time","UTF-8")+"="
	            +URLEncoder.encode(hour,"UTF-8")+"&"
	            +URLEncoder.encode("nx","UTF-8")+"="
	            + URLEncoder.encode(nx,"UTF-8")+"&"
	            +URLEncoder.encode("ny","UTF-8")+"="
	            + URLEncoder.encode(ny,"UTF-8")+"&"
	    		+ URLEncoder.encode("numOfRows","UTF-8")+"="
	            + URLEncoder.encode("216","UTF-8")+"&"
	    		+ URLEncoder.encode("_type","UTF-8")+"="
	            + URLEncoder.encode("xml","UTF-8")+"&"
	            + URLEncoder.encode("serviceKey","UTF-8")
	            +"=U2ZPWtp9VT8Nt8wxB%2FEQGSjuQ2oDzwM2Lmv0mDtUHC0wrm6%2F25ZXZAp7vBkv5zqpoiNGDHTJHSBjxsf3fw9D7g%3D%3D";
	    System.out.println("host : "+host);
		StringBuilder urlBuilder = new StringBuilder(host); /*URL*/
		 
		URL url = new URL(urlBuilder.toString());
		 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
		sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	 
	    }
	
	public String xmlDownload(String date, String hour, String nx, String ny) throws IOException {
   	 
		System.out.println("date : "+date);
		System.out.println("hour : "+hour);
		System.out.println("nx : "+nx);
		System.out.println("ny : "+ny);
		
	    String host = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?"
	            +URLEncoder.encode("base_date","UTF-8")+"="
	            +URLEncoder.encode(date,"UTF-8")+"&"
	            +URLEncoder.encode("base_time","UTF-8")+"="
	            +URLEncoder.encode(hour,"UTF-8")+"&"
	            + URLEncoder.encode("nx","UTF-8")+"="
	            + URLEncoder.encode(nx,"UTF-8")+"&"
	            + URLEncoder.encode("ny","UTF-8")+"="
	            + URLEncoder.encode(ny,"UTF-8")+"&"
	    		+ URLEncoder.encode("numOfRows","UTF-8")+"="
	            + URLEncoder.encode("10","UTF-8")+"&"
				+ URLEncoder.encode("pageNo","UTF-8")+"="
		        + URLEncoder.encode("1","UTF-8")+"&"
	    		+ URLEncoder.encode("_type","UTF-8")+"="
	            + URLEncoder.encode("xml","UTF-8")+"&"
	            + URLEncoder.encode("serviceKey","UTF-8")
	            +"=U2ZPWtp9VT8Nt8wxB%2FEQGSjuQ2oDzwM2Lmv0mDtUHC0wrm6%2F25ZXZAp7vBkv5zqpoiNGDHTJHSBjxsf3fw9D7g%3D%3D";
	      
		StringBuilder urlBuilder = new StringBuilder(host); /*URL*/
		 
		URL url = new URL(urlBuilder.toString());
		 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
		sb.append(line);
		}
		rd.close();
		conn.disconnect();
		 System.out.println("xmlDownload : "+sb.toString());
		return sb.toString();
	 
	    }
	
	public WeatherDto getItemList(String date, String hour, String nx, String ny) throws IOException, ParserConfigurationException, SAXException {
        String xml = this.xmlDownload(date, hour, nx, ny);
        WeatherDto weather = new WeatherDto();
        // xml 을-> List<Item>
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")));
		NodeList nodeList = doc.getElementsByTagName("item");
		for(int i=0; i<nodeList.getLength(); i++) {
    
		    String category = "";
		    String obsrValue = "";
		    Node node = nodeList.item(i);
		    Element e = (Element)node;
		    category = e.getElementsByTagName("category").item(0).getTextContent();
		    obsrValue = e.getElementsByTagName("obsrValue").item(0).getTextContent();
		    if(category.equals("T1H")) {
		    	weather.setTemp1hour(obsrValue);
		    } else if(category.equals("SKY")) {
		    	weather.setSky(obsrValue);
		    } else if(category.equals("PTY")) {
		    	weather.setRainStat(obsrValue);
		    } else if(category.equals("REH")) {
		    	weather.setHumidity(obsrValue);
		    } else if(category.equals("RN1")) {
		    	weather.setPrecipitation(obsrValue);
		    } else if(category.equals("LGT")) {
		        weather.setThunder(obsrValue);
		    } else {
		        continue;
		    }
		}
		System.out.println("getItemList : "+weather);
		return weather;
	}
}
