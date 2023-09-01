package kr.ac.kopo;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.web.BjangService;
import kr.ac.kopo.web.Inf;
import kr.ac.kopo.web.InfNmVo;
import kr.ac.kopo.web.Searchq;

@Component
public class AutoCrawling {

	@Autowired
	BjangService service;
	
	//검색트렌드 api 크롤링
	@Scheduled(cron = "0 3 9 1 * ?")
	public String searchq() {
		String clientId = "slVMadKzcfCGgXyWcE1O"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "PFqqwFM85l"; // 애플리케이션 클라이언트 시크릿

        String apiUrl = "https://openapi.naver.com/v1/datalab/search.json";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        requestHeaders.put("Content-Type", "application/json");
        
		Calendar c1 = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		cal.add(cal.DATE, -1);
		c1.add(c1.YEAR, -1);
		String endDate1 = sdf.format(cal.getTime());
		String startDate1 = sdf.format(c1.getTime());
        
        List<InfNmVo> InfNms = service.InfNms();
        for(int i=0; i<InfNms.size(); i++) {        	
	        String searchq = InfNms.get(i).getInfdisnm();
	        String body = "" ;
	        String date = "{\"startDate\":\""+startDate1+"\",\"endDate\":\""+endDate1+"\",\"timeUnit\":\"month\",";
	        
	        //검색키워드 값이 없거나 부족한 키워드에 검색키워드 추가
	        //body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\""+searchq+"\"]}],"; 		
	        if(searchq.equals("중증열성혈소판감소증후군(SFTS)")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"SFTS\"]}],";
	        }
	        else if(searchq.contains("풍진(2018년이전)")){ 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"풍진\"]}],"; 
	        }
	        else if(searchq.equals("크로이츠펠트-야콥병(CJD) 및 변종크로이츠펠트-야콥병(vCJD)")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+ searchq+"\",\"keywords\":[\""+searchq+"\",\"CJD\",\"vCJD\",\"클로이츠펠트-야콥병\"]}],";
	        }
	        else if(searchq.equals("반코마이신내성황색포도알균(VRSA) 감염증")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"VRSA\"]}],"; 
	        }
	        else if(searchq.equals("카바페넴내성장내세균속균종(CRE) 감염증")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"CRE\"]}],"; 
	        }
	        else if(searchq.equals("중동호흡기증후군(MERS)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"중동호흡기증후군\",\"MERS\",\"메르스\"]}],"; }
	        else if(searchq.equals("풍진(선천성)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"풍진\",\"선천적\"]}],"; }
	        else if(searchq.equals("풍진(후천성)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"풍진\",\"후천적\"]}],"; }
	        else if(searchq.equals("중증급성호흡기증후군(SARS)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"SARS\"]}],"; }
	        else if(searchq.equals("폐렴구균 감염증")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"폐렴\"]}],"; }
	        else if(searchq.equals("에볼라바이러스병")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"에볼라\"]}],"; }
	        else if(searchq.equals("리프트밸리열")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"벨리열\",\"리프트\"]}],"; }
	        else if(searchq.equals("진드기매개뇌염")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"진드기뇌염\",\"뇌염\"]}],"; }
	        else if(searchq.equals("지카바이러스감염증")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"지카바이러스\"]}],"; }
	        else if(searchq.equals("크리미안콩고출혈열")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"콩고출혈열\",\"크리미안\", \"콩고\"]}],"; }
	        else if(searchq.equals("치쿤구니야열")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"치쿤구니야 바이러스\", \"치쿤구니야\"]}],"; }
	        else if(searchq.equals("웨스트나일열")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"웨스트나일 바이러스\"]}],"; }
	        else if(searchq.equals("남아메리카출혈열")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"출혈열\"]}],"; }
	        else if(searchq.equals("보툴리눔독소증")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"보툴리눔\"]}],"; }
	        else if(searchq.equals("수막구균 감염증")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"수막구균\"]}],"; }
	        else { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\"]}],"; 
	        }
	        
	        //requestBody에 날짜와 검색 키워드 담기
	        String requestBody =
	        		date +
	                body +
					/* "{\"groupName\":\"한글\"," + "\"keywords\":[\"B형간염\",\"korean\"]}]," + */
	                "\"device\":\"pc\"}";
	
	        //요청보내고 responseBody로 담기
	        String responseBody = post(apiUrl, requestHeaders, requestBody);
			//JSON객체로 받은 데이터 파싱
			org.json.JSONObject obj;
			//obj = (org.json.JSONObject)parser.parse(responseBody);
			obj = new org.json.JSONObject(responseBody);
			org.json.JSONArray item = (org.json.JSONArray)obj.get("results");
				
			List<Searchq> list = null;
			list = new ArrayList<Searchq>();
			Searchq f = new Searchq();
			String datee = null;
			String infnm = null;
			List<String> sq = null;
			
			//데이터 갯수만큼 반복해서 map에 저장하고 DB에 적재
			for(int b = 0; b<item.length(); b++){
				
				org.json.JSONObject tmp = (org.json.JSONObject)item.get(b);
				org.json.JSONObject temp = (org.json.JSONObject)item.get(b);
				org.json.JSONArray data = (org.json.JSONArray)temp.get("data");
				
				List<String> ratio = new ArrayList<String>();
				
					for(int aa = 0; aa<data.length(); aa++) {
						if(String.valueOf(data.getJSONObject(aa).get("ratio")).equals(null)) {
							ratio.add("0");
						}else {
							ratio.add(String.valueOf(data.getJSONObject(aa).get("ratio")));
						}
					}
					String endDate = (String)obj.get("endDate");
					String title = (String)tmp.get("title");
					f.setPeriod(endDate);
					f.setTitle(title);
					for(int aa = 0; aa<data.length(); aa++) {
						f.setRatio(ratio);
						}
				
					if(f != null)list.add(f);
				}
				for(Searchq F:list) {
					datee = (F.getPeriod());
					infnm = (F.getTitle());
					sq = (F.getRatio());
					
					HashMap<String,Object> map = new HashMap<String,Object>();      
					map.put("date", datee);
					map.put("infnm", infnm);
					for(int aa = 0; aa<sq.size(); aa++) {
					map.put("sq"+aa, sq.get(aa));
					}
					int num = service.insertSearchq(map);
	//					System.out.println("");
	//					System.out.println(datee);
	//					System.out.println(infnm);
	//					for(int aa = 0; aa<sq.size(); aa++) {
	//					System.out.print(sq.get(aa)+ ", ");
	//					}
				}
			//System.out.println(responseBody);
        }
        
		return "searchq";
	}
	
	//병명별 뉴스 크롤링
	@Scheduled(cron = "0 0 9 * * ?")
	public String searchn() throws ParseException {
    	
        List<InfNmVo> InfNm = service.InfNm();
		/* model.addAttribute(InfNm); */
        
        try {
        	String text = null;
        	int b = 0;
        for(int i=0; i<InfNm.size(); i++) {        	
            String searchq = InfNm.get(i).getInfdisnm();
            //text = URLEncoder.encode(searchq, "UTF-8");
            
            if(searchq.equals("중증열성혈소판감소증후군(SFTS)")) { 
            	text = URLEncoder.encode(searchq, "UTF-8");
            }
            else if(searchq.contains("b형헤모필")){ 
            	text = URLEncoder.encode("B형 헤모", "UTF-8");
            }
            else if(searchq.contains("크로이츠펠")){ 
            	text = URLEncoder.encode("크로이츠펠트-야콥병(CJD) 및 변종크로이츠펠트-야콥병(vCJD)", "UTF-8");
            }
            else if(searchq.contains("중증열성혈")){ 
            	text = URLEncoder.encode("SFTS", "UTF-8");
            }
            else if(searchq.contains("풍진(후천")){ 
            	text = URLEncoder.encode("풍진", "UTF-8");
            }
            else if(searchq.contains("풍진(선천")){ 
            	text = URLEncoder.encode("풍진", "UTF-8");
            }
            else if(searchq.contains("보툴리눔")){ 
            	text = URLEncoder.encode("보툴리눔독소증", "UTF-8");
            }
            else if(searchq.contains("동물인플루")){ 
            	text = URLEncoder.encode("동물인플루엔자 인체감염증", "UTF-8");
            }
            else if(searchq.contains("웨스트나일")){ 
            	text = URLEncoder.encode("나일열", "UTF-8");
            }
            else if(searchq.contains("비브리오패")){ 
            	text = URLEncoder.encode("비브리오 패혈증", "UTF-8");
            }
            else if(searchq.contains("지카바이러")){ 
            	text = URLEncoder.encode("지카바이러스감염증", "UTF-8");
            }
            else if(searchq.contains("폐렴구균 ")){ 
            	text = URLEncoder.encode("폐렴구균 감염증", "UTF-8");
            }
            else if(searchq.contains("반코마이신")){ 
            	text = URLEncoder.encode("반코마이신내성황색포도알균", "UTF-8");
            }
            else if(searchq.contains("카바페넴내")){ 
            	text = URLEncoder.encode("카바페넴내성장내세균속균종(CRE) 감염증", "UTF-8");
            }
            else if(searchq.contains("에볼라바이")){ 
            	text = URLEncoder.encode("에볼라바이러스병", "UTF-8");
            }
            else if(searchq.contains("신종인플")){ 
            	text = URLEncoder.encode("신종인플루엔자", "UTF-8");
            }
            else if(searchq.contains("수막구균 ")){ 
            	text = URLEncoder.encode("수막구균 감염증", "UTF-8");
            }
            else if(searchq.contains("b형헤모필")){ 
            	text = URLEncoder.encode("b형헤모필루스인플루엔자", "UTF-8");
            }
            else if(searchq.contains("지카바이러")){ 
            	text = URLEncoder.encode("지카바이러스감염증", "UTF-8");
            }
            else if(searchq.contains("코로나바이")) {
            	text = URLEncoder.encode("코로나", "UTF-8"); 
            }
            else {
            	text = URLEncoder.encode(searchq, "UTF-8"); 
            }

           // String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text + "&display=100&start=1&sort=date";    // JSON 결과
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text +"&display=100&start=1&sort=date";    // JSON 결과
            
            String clientId = "slVMadKzcfCGgXyWcE1O"; //애플리케이션 클라이언트 아이디
            String clientSecret = "PFqqwFM85l"; //애플리케이션 클라이언트 시크릿
            Map<String, String> requestHeaders = new HashMap<>();

            requestHeaders.put("X-Naver-Client-Id", clientId);
            requestHeaders.put("X-Naver-Client-Secret", clientSecret);

            String responseBody = get(apiURL,requestHeaders);
        	
            String json = responseBody;
            
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(responseBody);
            JSONArray item = (JSONArray)obj.get("items");
            
            List<Inf> list = null;
            list = new ArrayList<Inf>();
            char quotes = '\u0022';
        	Inf f = new Inf();
        	String datee = null;
        	String content = null;
        	String url = null;
        	JSONObject tmp = (JSONObject)item.get(b);
        	String date = (String)tmp.get("pubDate");
        	String description = (String)tmp.get("description");
        	String link = (String)tmp.get("link");
        	f.setDate(date);
        	f.setDescription(description);
        	f.setLink(link);
        	if(f != null)list.add(f);
            for(Inf F:list) {
            	//System.out.println("('{\n "+quotes+"date"+quotes+" : " +quotes+ F.getDate() +quotes+ ", \n "+quotes+"content"+quotes+" : " + quotes + F.getDescription() + quotes + ",\n "+quotes+"url"+quotes+" : "+ quotes + F.getLink() + quotes + "\n}'),");
            	datee = (F.getDate());
            	content = (F.getDescription());
            	url = (F.getLink());
            	            	
            	HashMap<String,Object> map = new HashMap<String,Object>();      
            	map.put("date", datee);
            	map.put("content", content);
            	map.put("url", url);
            	
            	int num = service.insertNews(map);
            }
        }


        } catch (UnsupportedEncodingException e) {
        	throw new RuntimeException("검색어 인코딩 실패",e);
        }
        //String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text; // XML 결과

        return "searchn";

    }

	//감염병 키워드 뉴스크롤링
		@Scheduled(cron = "0 1 9 * * ?")
	    public String searchg() throws ParseException {

	        try {
	        	//String text = null;
	        	String text = URLEncoder.encode("감염병", "UTF-8"); 
	                 String apiURL = null;
	                 apiURL = "https://openapi.naver.com/v1/search/news?query="+ text +"&display=100&start=1&sort=date";    // JSON 결과
	        	//System.out.println(apiURL);
	        	String clientId = "slVMadKzcfCGgXyWcE1O"; //애플리케이션 클라이언트 아이디
	        	String clientSecret = "PFqqwFM85l"; //애플리케이션 클라이언트 시크릿
	        	Map<String, String> requestHeaders = new HashMap<>();
	        	
	        	requestHeaders.put("X-Naver-Client-Id", clientId);
	        	requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        	
	        	String responseBody = get(apiURL,requestHeaders);
	        	
	            JSONParser parser = new JSONParser();
	            JSONObject obj = (JSONObject)parser.parse(responseBody);
	            JSONArray item = (JSONArray)obj.get("items");
	            
	            List<Inf> list = null;
	            list = new ArrayList<Inf>();
	        	Inf f = new Inf();
	        	String datee = null;
	        	String content = null;
	        	String url = null;
	        	
	        	for(int i = 0; i < item.size(); i++) {
	        		
	        	JSONObject tmp = (JSONObject)item.get(i);
	        	String date = (String)tmp.get("pubDate");
	        	String description = (String)tmp.get("description");
	        	String link = (String)tmp.get("link");
	        	f.setDate(date);
	        	f.setDescription(description);
	        	f.setLink(link);
	        	if(f != null)list.add(f);
	        	}
	        	
	            for(Inf F:list) {
	            	datee = (F.getDate());
	            	content = (F.getDescription());
	            	url = (F.getLink());
	            	
	            	HashMap<String,Object> map = new HashMap<String,Object>();
	            	map.put("date", datee);
	            	map.put("content", content);
	            	map.put("url", url);
	            	int num = service.insertNews(map);
	            }
	        } catch (UnsupportedEncodingException e) {
	        	throw new RuntimeException("검색어 인코딩 실패",e);
	        }
	        return "searchn";
	    }

	
	//중복제거
	@Scheduled(cron = "0 2 9 * * ?")
    public String delete() {
    	int num = service.newsdelete();
    	return "searchn";
    }
	//홍역을 치뤘다 제거
	@Scheduled(cron = "2 2 9 * * ?")
    public String measles() {
    	int num = service.measles();
    	return "searchn";
	}
	//Date형태 변경
	@Scheduled(cron = "5 2 9 * * ?")
    public String AlterDate() {
    	int num = service.AlterDate();
    	return "searchn";
    }
    //날짜형태 문자열로 변경
	@Scheduled(cron = "10 2 9 * * ?")
    public String AlterVarchar() {
    	int num = service.AlterVarchar();
    	return "searchn";
    }
	
	//네이버 크롤링 필수
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }
	
	    private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
	        HttpURLConnection con = connect(apiUrl);

	        try {
	            con.setRequestMethod("POST");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            con.setDoOutput(true);
	            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
	                wr.write(requestBody.getBytes());
	                wr.flush();
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
	                return readBody(con.getInputStream());
	            } else {  // 에러 응답
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
	        }
	    }
    
    
}
