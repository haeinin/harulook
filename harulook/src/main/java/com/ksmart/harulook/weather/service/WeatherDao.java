package com.ksmart.harulook.weather.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

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
public class WeatherDao {

	/* 동네예보 API에서 필요한 데이터만 추출 */
	public HashMap<String,WeatherDongneDto> getDongneItemList(
			String date		// 요청 날짜
			, String hour	// 요청 시간
			, String nx		// x좌표
			, String ny		// y좌표
			) throws IOException, ParserConfigurationException, SAXException, ParseException {
		System.out.println("date : "+date);
		System.out.println("hour : "+hour);
		System.out.println("nx : "+nx);
		System.out.println("ny : "+ny);
		
		String xml = this.dongneXmlDownload(date, hour, nx, ny); // 동네 예보 API 요청
        System.out.println(xml);
        
        int dateInt = Integer.parseInt(date);	// 내일, 모레 날짜를 구하기 위해 오늘 날짜를 int로 변환
        String tomorrow = String.valueOf(dateInt+1);	// 내일 날짜
        String moere = String.valueOf(dateInt+2);		// 모레 날짜
        System.out.println("tomorrow : "+tomorrow);
        System.out.println("moere : "+moere);
        WeatherDongneDto weatherDongneDto = new WeatherDongneDto(); // 동네예보 데이터를 저장할 Dto
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")));
		NodeList nodeList = doc.getElementsByTagName("item");
		
		HashMap<String,WeatherDongneDto> map = new HashMap<String,WeatherDongneDto>();
		
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
		    
		    // 오늘 날짜의 예보 데이터 추출
		    if(fcstDate.equals(date)) {
		    	
		    	// 예보 시간을 구하는 반복문 
		    	// 동네예보는 0시부터 3시간 간격으로 8번마다 예보 데이터를 보낸다.
		    	for(int j=0; j<24; j +=3) {
		    		String updateHour = String.valueOf(j);	// 예보를 받는 시간 : updateHour
		    		
		    		// 예보 시간 형식(18시 --> 1800으로 표시)을 맞추기 위한 조건문 
		    		if(j < 10) {	// 시간이 10보다 작을 경우 앞에 0을 붙여준다.
		    			updateHour = "0"+updateHour;
		    		}
		    		updateHour = updateHour+"00"; // 시간형식을 맞추기 위해 뒤에 00을 붙인다.
		    		
		    		// 예보 시간마다 해당 데이터 추출
		    		if(fcstTime.equals(updateHour)) {	
		    			if(category.equals("T3H")) {	// 3시간 간격의 예보 기온
		    	        	weatherDongneDto.setTemp3hour(fcstValue);
		    	        }
		    			if(category.equals("SKY")) {	// 하늘 상태 - 1: 맑음, 2: 구름 조금, 3: 구름 많음, 4: 흐림
		    	        	weatherDongneDto.setSky(fcstValue);
		    	        }
		    			if(category.equals("PTY")) {	// 강수형태
		    	        	weatherDongneDto.setRainStat(fcstValue);
		    	        }
		    			if(category.equals("REH")) {	// 습도
		    	        	weatherDongneDto.setHumidity(fcstValue);
		    	        }
		    			if(category.equals("R06")) {	// 6시간 동안 강우량
		    	        	weatherDongneDto.setPrecipitation(fcstValue);
		    	        }
		    			if(category.equals("POP")) {	// 강수 확률
		    	        	weatherDongneDto.setRainProbability(fcstValue);
		    	        }
		    			if(category.equals("TMN")) {	// 최저 기온 - 0600에 예보
		    	        	weatherDongneDto.setTempMin(fcstValue);
		    	        }
		    			if(category.equals("TMX")) {	// 최고 기온 - 1500에 예보
		    	        	weatherDongneDto.setTempMax(fcstValue);
		    	        } 
		    			if(category.equals("WSD")) {	// 해당 시간의 마지막 예보 데이터, 이 때 weatherDongneDto에 모든 데이터가 셋팅된다.
		    				System.out.print(date+" "+fcstTime+" ");
		    				System.out.println("today : "+weatherDongneDto);
		    				map.put(date+updateHour, weatherDongneDto); // 맵에 날짜와 시간을 키 값으로 셋팅하고 컨트롤러로 반환
		    	        } 
		    		}
		    	}
		    }
		    
		    // 내일 날짜의 예보 데이터 추출
		    if(fcstDate.equals(tomorrow)) {
		    	for(int j=0; j<24; j +=3) {
		    		String updateHour = String.valueOf(j);
		    		if(j < 10) {
		    			updateHour = "0"+updateHour;
		    		}
		    		updateHour = updateHour+"00";
		    		if(fcstTime.equals(updateHour)) {
		    			if(category.equals("T3H")) {
		    	        	weatherDongneDto.setTemp3hour(fcstValue);
		    	        }
		    			if(category.equals("SKY")) {
		    	        	weatherDongneDto.setSky(fcstValue);
		    	        }
		    			if(category.equals("PTY")) {
		    	        	weatherDongneDto.setRainStat(fcstValue);
		    	        }
		    			if(category.equals("REH")) {
		    	        	weatherDongneDto.setHumidity(fcstValue);
		    	        }
		    			if(category.equals("R06")) {
		    	        	weatherDongneDto.setPrecipitation(fcstValue);
		    	        }
		    			if(category.equals("POP")) {
		    	        	weatherDongneDto.setRainProbability(fcstValue);
		    	        }
		    			if(category.equals("TMN")) {
		    	        	weatherDongneDto.setTempMin(fcstValue);
		    	        }
		    			if(category.equals("TMX")) {
		    	        	weatherDongneDto.setTempMax(fcstValue);
		    	        } 
		    			if(category.equals("WSD")) {
		    				System.out.print(tomorrow+" "+fcstTime+" ");
		    				System.out.println("tomorrow : "+weatherDongneDto);
		    				map.put(tomorrow+updateHour, weatherDongneDto);
		    	        } 
		    		}
		    	}
		    }
	
		    // 모레 날짜의 예보 데이터 추출
		    if(fcstDate.equals(moere)) {
		    	
		    	for(int j=0; j<24; j +=3) {
		    		String updateHour = String.valueOf(j);
		    		if(j < 10) {
		    			updateHour = "0"+updateHour;
		    		}
		    		updateHour = updateHour+"00";
		    		if(fcstTime.equals(updateHour)) {
		    			if(category.equals("T3H")) {
		    	        	weatherDongneDto.setTemp3hour(fcstValue);
		    	        }
		    			if(category.equals("SKY")) {
		    	        	weatherDongneDto.setSky(fcstValue);
		    	        }
		    			if(category.equals("PTY")) {
		    	        	weatherDongneDto.setRainStat(fcstValue);
		    	        }
		    			if(category.equals("REH")) {
		    	        	weatherDongneDto.setHumidity(fcstValue);
		    	        }
		    			if(category.equals("R06")) {
		    	        	weatherDongneDto.setPrecipitation(fcstValue);
		    	        }
		    			if(category.equals("POP")) {
		    	        	weatherDongneDto.setRainProbability(fcstValue);
		    	        }
		    			if(category.equals("TMN")) {
		    	        	weatherDongneDto.setTempMin(fcstValue);
		    	        }
		    			if(category.equals("TMX")) {
		    	        	weatherDongneDto.setTempMax(fcstValue);
		    	        } 
		    			if(category.equals("WSD")) {
		    				System.out.print(moere+" "+fcstTime+" ");
		    				System.out.println("moere : "+weatherDongneDto);
		    				map.put(moere+updateHour, weatherDongneDto);
		    	        } 
		    		}
		    	}
		    }
	    }
	  return map;
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
