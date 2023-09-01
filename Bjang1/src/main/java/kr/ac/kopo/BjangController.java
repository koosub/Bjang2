package kr.ac.kopo;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.web.AgeVo;
import kr.ac.kopo.web.ArrangeVo;
import kr.ac.kopo.web.BjangService;
import kr.ac.kopo.web.CountVo;
import kr.ac.kopo.web.GenderVo;
import kr.ac.kopo.web.GradeVo;
import kr.ac.kopo.web.InfectionVo;
import kr.ac.kopo.web.InfectionVo2;
import kr.ac.kopo.web.MapCatoVo;
import kr.ac.kopo.web.NewscontentVo;
import kr.ac.kopo.web.SiVo;
import kr.ac.kopo.web.Sicd_DateVo;
import kr.ac.kopo.web.TrendVo;
import kr.ac.kopo.web.UDVo;
import kr.ac.kopo.web.YearsVo;

@Controller
public class BjangController {

	@Autowired
	BjangService service;
	
	@GetMapping("/")
	public String index1(@RequestParam(value="keyword1", required = false) String keyword1,
			@RequestParam(value="keyword2", required = false) String keyword2,
			Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
	    
	    c2.add(c2.MONTH,-1);
	    
	    String year = sdf.format(c1.getTime());
	    String month = sdf2.format(c2.getTime());
	    
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("keyword1", keyword1);
		map.put("keyword2", keyword2);
		
		model.addAttribute("month", month);
		model.addAttribute("year", year);

		List<SiVo> key2 = service.Key2(); // 지역 리스트
		model.addAttribute("key2",key2);
		
		List<UDVo> InDe = service.InDe(map); //감염자순 위기경보
		model.addAttribute("InDe", InDe);
		
		List<UDVo> UpDe = service.UpDe(map); //증가율순 위기경보
		model.addAttribute("UpDe", UpDe);
		
		return "index1";
	}
	
	@GetMapping("/info-lookup")
	public String lookup(@RequestParam(value="infdisnm", required = false) String infdisnm, Model model) {
		
		model.addAttribute("infdisnm", infdisnm);
		
		return "info-lookup";
	}
	@GetMapping("/infdis_country")
	public String infdis_country() {
		
		return "infdis_country";
	}

	//맵(새로제작)
	@ResponseBody
	@GetMapping("/infdis_map")
	public Map<String, Object> infdis_map(String infdisnm, String sinm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	  
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}
				
		  map.put("keyword1", infdisnm);
		  map.put("keyword2", sinm);
		  
		  List<MapCatoVo> prev_month_InfDis_dif = service.prev_month_InfDis_dif(map);
		  
		  Map<String,Object> item = new HashMap<String,Object>();
		  
		  item.put("InfDis_dif", prev_month_InfDis_dif);
			
		  return item;
	}
	
	//감염병에 대한 정의(새로)
	@ResponseBody
	@GetMapping("/inf_arrange")
	public Map<String, Object> inf_arrange(String infdisnm) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "카바페넴내성장내세균속균종(CRE) 감염증";
		} else if(infdisnm.equals("")) {
			infdisnm = "카바페넴내성장내세균속균종(CRE) 감염증";
		}
		map.put("infdisnm", infdisnm);
		
		List<ArrangeVo> inf_arrange = service.inf_arrange(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("inf_arrange", inf_arrange);
		
		return item;
	}
	
	//등급별 감염병 (새로제작)
	@ResponseBody
	@PostMapping("/grade_inf")
	public Map<String, Object> grade_inf(String grade){
		
	HashMap<String, Object> map = new HashMap<String, Object>();
	if(grade.equals("전체")) {
		grade = "";
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
	Calendar c1 = Calendar.getInstance();
	Calendar c2 = Calendar.getInstance();
    
    c2.add(c2.MONTH,-1);
    
    String year = sdf.format(c1.getTime());
    String month = sdf2.format(c2.getTime());
	
	map.put("grade", grade);
	map.put("year", year);
	map.put("month", month);
	List<GradeVo> grade_inf = service.grade_inf(map);
		
	Map<String,Object> item = new HashMap<String,Object>();
	item.put("grade_inf", grade_inf);

	return item;
	}

	//한달간 감염자 수
	@ResponseBody
	@GetMapping("/one_month_inf")
	public Map<String, Object> one_month_inf(String infdisid){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisid.equals("전체")) {
			infdisid = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
        
		map.put("date", date);
		map.put("infdisid", infdisid);
		
		List<InfectionVo2> one_month_inf = service.one_month_inf(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("one_month_inf", one_month_inf);

		return item;
		}
		
	@ResponseBody
	@GetMapping("/gender_inf")
	public Map<String, Object> gender_inf(String infdisid){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisid.equals("전체")) {
			infdisid = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
        
		map.put("date", date);
		map.put("infdisid", infdisid);
		
		List<GenderVo> gender_inf = service.gender_inf(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("gender_inf", gender_inf);

		return item;
		}
		
	@ResponseBody
	@GetMapping("/age_inf")
	public Map<String, Object> age_inf(String infdisid){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisid.equals("전체")) {
			infdisid = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
        
		map.put("date", date);
		map.put("infdisid", infdisid);
		
		List<AgeVo> age_inf = service.age_inf(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("age_inf", age_inf);

		return item;
		}
	
	@ResponseBody
	@GetMapping("/Year_inf")
	public Map<String, Object> Year_inf(String infdisid){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisid.equals("전체")) {
			infdisid = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

        Calendar c1 = Calendar.getInstance();
               
        String date = sdf.format(c1.getTime());
        
		map.put("year", date);
		map.put("infdisid", infdisid);

		List<YearsVo> Years_inf = service.Years_inf(map);
		List<YearsVo> Years1_inf = service.Years1_inf(map);
		List<YearsVo> Years2_inf = service.Years2_inf(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("Years_inf", Years_inf);
		item.put("Years_inf1", Years1_inf);
		item.put("Years_inf2", Years2_inf);

		return item;
		}
	
	@ResponseBody
	@GetMapping("/OneYear_inf")
	public Map<String, Object> OneYear_inf(String infdisnm){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}
		map.put("keyword1", infdisnm);
		
		List<InfectionVo> InfDis_LastYear = service.InfDis_LastYear(map);	//년도 감염자 수
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("LastYear", InfDis_LastYear);
		return item;
	}
	
	
	
	@ResponseBody
	@GetMapping("/search_trend")
	public Map<String, Object> search_trend(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
        
		map.put("date1", date);
		map.put("infdisnm", infdisnm);

		List<TrendVo> search_trend = service.search_trend(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("search_trend", search_trend);

		return item;
		}
	
	@ResponseBody
	@GetMapping("/news_count")
	public Map<String, Object> news_count(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();


        String date = sdf.format(c1.getTime());
		
        c1.add(c1.YEAR, -1);
        String year = sdf.format(c1.getTime());
        
		map.put("date", date);
		map.put("year", year);
		map.put("infdisnm", infdisnm);

		List<CountVo> news_count = service.news_count(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		item.put("news_count", news_count);

		return item;
		}
	
	@ResponseBody
	@GetMapping("/risk_count")
	public Map<String, Object> risk_count(String infdisnm, String sinm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}
		map.put("infdisnm", infdisnm);
		map.put("sinm", sinm);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();


        String date = sdf.format(c1.getTime());
        
        c1.add(c1.YEAR, -1);
        String year = sdf.format(c1.getTime());
        
		map.put("year", year);
        map.put("date", date);

        
        List<CountVo> news_count = service.news_count(map);
        
        c1.add(c1.MONTH,-1);
        c1.add(c1.YEAR, +1);
        String date1 = sdf.format(c1.getTime());
        date1 = '%'+date1+'%';
        map.put("date1", date1);
        
		List<TrendVo> search_trend = service.search_trend(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("news_count", news_count);
		item.put("search_trend", search_trend);
		
		return item;
	}
	
	@ResponseBody
	@GetMapping("news_content")
	public Map<String, Object> news_content(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(infdisnm.equals("전체")) {
			infdisnm = "";
		}else if(infdisnm.equals("코로나바이러스감염증-19")) {
			infdisnm = "코로나";
		}
		map.put("infdisnm", infdisnm);
		
		List<NewscontentVo> news_content = service.news_content(map);
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("news_content", news_content);
		
		return item;
	}
	@ResponseBody
	@GetMapping("year_month_count")
	public Map<String, Object> year_month_count(String sicd, int year, int month){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
        
        if(sicd.equals("전국")) {
        	sicd = "";
        }
		map.put("sicd", sicd);
		map.put("year", year);
		map.put("month", month);
		int month2 = month-1;

		if(month == 1) {
			if(year == 2019) {
				year = 2019;
				month2 = 1;
			}else {
				year = year-1;
				month2 = 12;
			}
		}
		map.put("month2", month2);
		map.put("year2", year);
		
		List<Sicd_DateVo> year_count = service.year_count(map);
		List<Sicd_DateVo> month_count = service.month_count(map);
		List<Sicd_DateVo> back_month = service.back_month(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("year_count", year_count);
		item.put("month_count", month_count);
		item.put("back_month", back_month);
		
		return item;
	}
	
	@ResponseBody
	@GetMapping("max_count_age")
	public Map<String, Object> max_count_age(String sicd, String year, String month){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
        if(sicd.equals("전국")) {
        	sicd = "";
        }

		map.put("sicd", sicd);
		map.put("year", year);
		map.put("month", month);
		String date = ('%'+year+'-'+month+'%');
		map.put("date", date);
		
		List<Sicd_DateVo> sicd_max = service.sicd_max(map);
		List<Sicd_DateVo> age_max = service.age_max(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("sicd_max", sicd_max);
		item.put("age_max", age_max);
		
		return item;
	}
	
	//검색창(새로)
	@ResponseBody
	@GetMapping("search_inf")
	public Map<String, Object> search_inf(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(infdisnm.equals("")) {
			infdisnm = "%%";
		}else {
			infdisnm = "%"+infdisnm+"%";
		}
		
		map.put("text", infdisnm);
		
		List<GradeVo> search_inf = service.search_inf(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("infdisnm", search_inf);
		
		return item;
	}
	
	//지난달 나이별 코로나
	@ResponseBody
	@GetMapping("covid_age")
	public Map<String, Object> covid_age(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
		
		map.put("date", date);
		
		List<GradeVo> covid_age = service.covid_age(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("covid_age", covid_age);
		
		return item;
	}
	//지난달 성별 코로나
	@ResponseBody
	@GetMapping("covid_gender")
	public Map<String, Object> covid_gender(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';
		
		map.put("date", date);
		
		List<GradeVo> covid_gender = service.covid_gender(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("covid_gender", covid_gender);
		
		return item;
	}
	//지난달 일별 코로나
	@ResponseBody
	@GetMapping("covid_date")
	public Map<String, Object> covid_date(String infdisnm){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        
        c1.add(c1.MONTH,-1);
        
        String date = sdf.format(c1.getTime());
		
        date = '%'+date+'%';

		map.put("date", date);
		
		List<GradeVo> covid_date = service.covid_date(map);
		
		Map<String,Object> item = new HashMap<String, Object>();
		
		item.put("covid_date", covid_date);
		
		return item;
	}
	//신규제작 끝	

}
