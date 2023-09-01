//package kr.ac.kopo.web;
//
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.net.URLEncoder;
//import java.io.*;
//
//
//public class NaverCrawler {
//	//베이스 url
//	final String baseUrl = "https://openapi.naver.com/v1/search/news.json?query=감염";
//	
//	public String search(String clientId, String secret, String _url) {
//		HttpURLConnection con = null;
//		String result = "";
//		
//		try {
//			URL url = new URL(baseUrl + _url);
//			con = (HttpURLConnection) url.openConnection();
//			
//			con.setRequestMethod("GET");
//			con.setRequestProperty("slVMadKzcfCGgXyWcE1O", clientId);
//			con.setRequestProperty("PFqqwFM85l", secret);
//			
//			int responseCode = con.getResponseCode();
//			if (responseCode == HttpURLConnection.HTTP_OK) result = readBody(con.getInputStream());
//			
//			else result = readBody(con.getErrorStream());
//			
//		} catch(Exception e) {
//			System.out.println("연결오류 : "+ e);
//		} finally {
//			con.disconnect();
//		}
//		
//		
//		return result;
//		
//	}
//	public String readBody(InputStream body) {
//		InputStreamReader streamReader = new InputStreamReader(body);
//		
//		try(BufferedReader lineReader = new BufferedReader(streamReader)){
//			StringBuilder responseBody = new StringBuilder();
//			
//			String line;
//			while((line = lineReader.readLine()) != null) {
//				responseBody.append(line);
//			}
//			
//			return responseBody.toString();
//			
//		} catch (IOException e) {
//			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
//		}
//		
//	}
//	public static void main(String[] args) {
//		
//		String id="slVMadKzcfCGgXyWcE1O";
//		String secret = "PFqqwFM85l";
//		
//		try {
//			NaverCrawler crawler = new NaverCrawler();
//			String url = URLEncoder.encode("needjarvis", "UTF-8");
//			
//			String response = crawler.search(id, secret, url);
//			System.out.println(response);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//	}
//	
//	
//
//	
//	
//	
//}
