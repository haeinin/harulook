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

@Repository
public class WeatherDao {

	public String xmlDownload(String date, String hour) throws IOException {
   	 
	    String host = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?"
	            +URLEncoder.encode("base_date","UTF-8")+"="
	            +URLEncoder.encode(date,"UTF-8")+"&"
	            +URLEncoder.encode("base_time","UTF-8")+"="
	            +URLEncoder.encode(hour,"UTF-8")+"&"
	            + URLEncoder.encode("nx","UTF-8")+"="
	            +URLEncoder.encode("63","UTF-8")+"&"
	            + URLEncoder.encode("ny","UTF-8")+"="
	            + URLEncoder.encode("89","UTF-8")+"&"
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
	
	public WeatherDto getItemList(String date, String hour) throws IOException, ParserConfigurationException, SAXException {
        String xml = this.xmlDownload(date, hour);
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
    } else {
    	continue;
    }
    }
		System.out.println("getItemList : "+weather);
		
  return weather;
}
}
