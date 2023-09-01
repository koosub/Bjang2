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
	
	//�˻�Ʈ���� api ũ�Ѹ�
	@Scheduled(cron = "0 3 9 1 * ?")
	public String searchq() {
		String clientId = "slVMadKzcfCGgXyWcE1O"; // ���ø����̼� Ŭ���̾�Ʈ ���̵�
        String clientSecret = "PFqqwFM85l"; // ���ø����̼� Ŭ���̾�Ʈ ��ũ��

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
	        
	        //�˻�Ű���� ���� ���ų� ������ Ű���忡 �˻�Ű���� �߰�
	        //body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\""+searchq+"\"]}],"; 		
	        if(searchq.equals("�������������ǰ������ı�(SFTS)")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"SFTS\"]}],";
	        }
	        else if(searchq.contains("ǳ��(2018������)")){ 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"ǳ��\"]}],"; 
	        }
	        else if(searchq.equals("ũ��������Ʈ-���ߺ�(CJD) �� ����ũ��������Ʈ-���ߺ�(vCJD)")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+ searchq+"\",\"keywords\":[\""+searchq+"\",\"CJD\",\"vCJD\",\"Ŭ��������Ʈ-���ߺ�\"]}],";
	        }
	        else if(searchq.equals("���ڸ��̽ų���Ȳ�������˱�(VRSA) ������")) { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"VRSA\"]}],"; 
	        }
	        else if(searchq.equals("ī����۳����峻���ռӱ���(CRE) ������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"CRE\"]}],"; 
	        }
	        else if(searchq.equals("�ߵ�ȣ������ı�(MERS)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"�ߵ�ȣ������ı�\",\"MERS\",\"�޸���\"]}],"; }
	        else if(searchq.equals("ǳ��(��õ��)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"ǳ��\",\"��õ��\"]}],"; }
	        else if(searchq.equals("ǳ��(��õ��)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"ǳ��\",\"��õ��\"]}],"; }
	        else if(searchq.equals("�����޼�ȣ������ı�(SARS)")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"SARS\"]}],"; }
	        else if(searchq.equals("��ű��� ������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"���\"]}],"; }
	        else if(searchq.equals("��������̷�����")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"������\"]}],"; }
	        else if(searchq.equals("����Ʈ�븮��")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"������\",\"����Ʈ\"]}],"; }
	        else if(searchq.equals("�����Ű�����")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"��������\",\"����\"]}],"; }
	        else if(searchq.equals("��ī���̷���������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"��ī���̷���\"]}],"; }
	        else if(searchq.equals("ũ���̾����������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"���������\",\"ũ���̾�\", \"���\"]}],"; }
	        else if(searchq.equals("ġ�ﱸ�Ͼ߿�")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"ġ�ﱸ�Ͼ� ���̷���\", \"ġ�ﱸ�Ͼ�\"]}],"; }
	        else if(searchq.equals("����Ʈ���Ͽ�")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"����Ʈ���� ���̷���\"]}],"; }
	        else if(searchq.equals("���Ƹ޸�ī������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"������\"]}],"; }
	        else if(searchq.equals("��������������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"��������\"]}],"; }
	        else if(searchq.equals("�������� ������")) {
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\",\"��������\"]}],"; }
	        else { 
	        	body = "\"keywordGroups\":[{\"groupName\":\""+searchq+"\",\"keywords\":[\""+searchq+"\"]}],"; 
	        }
	        
	        //requestBody�� ��¥�� �˻� Ű���� ���
	        String requestBody =
	        		date +
	                body +
					/* "{\"groupName\":\"�ѱ�\"," + "\"keywords\":[\"B������\",\"korean\"]}]," + */
	                "\"device\":\"pc\"}";
	
	        //��û������ responseBody�� ���
	        String responseBody = post(apiUrl, requestHeaders, requestBody);
			//JSON��ü�� ���� ������ �Ľ�
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
			
			//������ ������ŭ �ݺ��ؼ� map�� �����ϰ� DB�� ����
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
	
	//���� ���� ũ�Ѹ�
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
            
            if(searchq.equals("�������������ǰ������ı�(SFTS)")) { 
            	text = URLEncoder.encode(searchq, "UTF-8");
            }
            else if(searchq.contains("b�������")){ 
            	text = URLEncoder.encode("B�� ���", "UTF-8");
            }
            else if(searchq.contains("ũ��������")){ 
            	text = URLEncoder.encode("ũ��������Ʈ-���ߺ�(CJD) �� ����ũ��������Ʈ-���ߺ�(vCJD)", "UTF-8");
            }
            else if(searchq.contains("����������")){ 
            	text = URLEncoder.encode("SFTS", "UTF-8");
            }
            else if(searchq.contains("ǳ��(��õ")){ 
            	text = URLEncoder.encode("ǳ��", "UTF-8");
            }
            else if(searchq.contains("ǳ��(��õ")){ 
            	text = URLEncoder.encode("ǳ��", "UTF-8");
            }
            else if(searchq.contains("��������")){ 
            	text = URLEncoder.encode("��������������", "UTF-8");
            }
            else if(searchq.contains("�������÷�")){ 
            	text = URLEncoder.encode("�������÷翣�� ��ü������", "UTF-8");
            }
            else if(searchq.contains("����Ʈ����")){ 
            	text = URLEncoder.encode("���Ͽ�", "UTF-8");
            }
            else if(searchq.contains("��긮����")){ 
            	text = URLEncoder.encode("��긮�� ������", "UTF-8");
            }
            else if(searchq.contains("��ī���̷�")){ 
            	text = URLEncoder.encode("��ī���̷���������", "UTF-8");
            }
            else if(searchq.contains("��ű��� ")){ 
            	text = URLEncoder.encode("��ű��� ������", "UTF-8");
            }
            else if(searchq.contains("���ڸ��̽�")){ 
            	text = URLEncoder.encode("���ڸ��̽ų���Ȳ�������˱�", "UTF-8");
            }
            else if(searchq.contains("ī����۳�")){ 
            	text = URLEncoder.encode("ī����۳����峻���ռӱ���(CRE) ������", "UTF-8");
            }
            else if(searchq.contains("���������")){ 
            	text = URLEncoder.encode("��������̷�����", "UTF-8");
            }
            else if(searchq.contains("��������")){ 
            	text = URLEncoder.encode("�������÷翣��", "UTF-8");
            }
            else if(searchq.contains("�������� ")){ 
            	text = URLEncoder.encode("�������� ������", "UTF-8");
            }
            else if(searchq.contains("b�������")){ 
            	text = URLEncoder.encode("b������ʷ罺���÷翣��", "UTF-8");
            }
            else if(searchq.contains("��ī���̷�")){ 
            	text = URLEncoder.encode("��ī���̷���������", "UTF-8");
            }
            else if(searchq.contains("�ڷγ�����")) {
            	text = URLEncoder.encode("�ڷγ�", "UTF-8"); 
            }
            else {
            	text = URLEncoder.encode(searchq, "UTF-8"); 
            }

           // String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text + "&display=100&start=1&sort=date";    // JSON ���
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text +"&display=100&start=1&sort=date";    // JSON ���
            
            String clientId = "slVMadKzcfCGgXyWcE1O"; //���ø����̼� Ŭ���̾�Ʈ ���̵�
            String clientSecret = "PFqqwFM85l"; //���ø����̼� Ŭ���̾�Ʈ ��ũ��
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
        	throw new RuntimeException("�˻��� ���ڵ� ����",e);
        }
        //String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text; // XML ���

        return "searchn";

    }

	//������ Ű���� ����ũ�Ѹ�
		@Scheduled(cron = "0 1 9 * * ?")
	    public String searchg() throws ParseException {

	        try {
	        	//String text = null;
	        	String text = URLEncoder.encode("������", "UTF-8"); 
	                 String apiURL = null;
	                 apiURL = "https://openapi.naver.com/v1/search/news?query="+ text +"&display=100&start=1&sort=date";    // JSON ���
	        	//System.out.println(apiURL);
	        	String clientId = "slVMadKzcfCGgXyWcE1O"; //���ø����̼� Ŭ���̾�Ʈ ���̵�
	        	String clientSecret = "PFqqwFM85l"; //���ø����̼� Ŭ���̾�Ʈ ��ũ��
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
	        	throw new RuntimeException("�˻��� ���ڵ� ����",e);
	        }
	        return "searchn";
	    }

	
	//�ߺ�����
	@Scheduled(cron = "0 2 9 * * ?")
    public String delete() {
    	int num = service.newsdelete();
    	return "searchn";
    }
	//ȫ���� ġ��� ����
	@Scheduled(cron = "2 2 9 * * ?")
    public String measles() {
    	int num = service.measles();
    	return "searchn";
	}
	//Date���� ����
	@Scheduled(cron = "5 2 9 * * ?")
    public String AlterDate() {
    	int num = service.AlterDate();
    	return "searchn";
    }
    //��¥���� ���ڿ��� ����
	@Scheduled(cron = "10 2 9 * * ?")
    public String AlterVarchar() {
    	int num = service.AlterVarchar();
    	return "searchn";
    }
	
	//���̹� ũ�Ѹ� �ʼ�
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
	                return readBody(con.getInputStream());
	            } else { // ���� �߻�
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API ��û�� ���� ����", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
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
	            throw new RuntimeException("API ������ �д� �� �����߽��ϴ�.", e);
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
	            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ����
	                return readBody(con.getInputStream());
	            } else {  // ���� ����
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API ��û�� ���� ����", e);
	        } finally {
	            con.disconnect(); // Connection�� ��Ȱ���� �ʿ䰡 ���� ���μ����� ���
	        }
	    }
    
    
}
