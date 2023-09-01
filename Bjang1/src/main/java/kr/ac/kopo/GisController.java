package kr.ac.kopo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.web.GisVo;
import kr.ac.kopo.web.GisService;

@Controller
public class GisController {
	
	@Autowired
	GisService gisService;
	
	@RequestMapping(value = "/gis", method = RequestMethod.GET)
	public String gis() {
		return "gis";
	}
	
	@ResponseBody
	@RequestMapping("/getSdList.do")
	public Map<String, Object> getSdList() {
		
		List<GisVo> values = gisService.getSdList();
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getSggList.do")
	public Map<String, Object> getSggList(GisVo gisVo) {

		List<GisVo> values = gisService.getSggList(gisVo);

		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getEmdList.do")
	public Map<String, Object> getEmdList(GisVo gisVo) {

		List<GisVo> values = gisService.getEmdList(gisVo);

		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getDivisionGeojson.do")
	public Map<String, Object> getDivisionGeojson(@RequestParam(required=true) String divisionLevel) {
		
		List<GisVo> values = null;

		if (divisionLevel.equals("sd")) {
			values = gisService.getSdGeojson();
		} else if (divisionLevel.equals("sgg")) {
			values = gisService.getSggGeojson();
		} else {
			values = gisService.getEmdGeojson();
		}

		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getPopulationDensity.do")
	public Map<String, Object> getPopulationDensity(GisVo gisVo) {
		
		List<GisVo> values = gisService.getDailyEmdDensity(gisVo);
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getPopulationMovement.do")
	public Map<String, Object> getPopulationMovement(GisVo gisVo) {

		List<GisVo> start = gisService.getPopulationMovementStart(gisVo);
		
		List<GisVo> end = gisService.getPopulationMovementEnd(gisVo);
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("start", start);
		item.put("end", end);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getInfectionDiseaseList.do")
	public Map<String, Object> getInfectionDiseaseList() {
		
		List<GisVo> values = gisService.getInfectionDiseaseList();

		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
	
	@ResponseBody
	@RequestMapping("/getInfectionDiseaseCount.do")
	public Map<String, Object> getInfectionDiseaseCount(GisVo gisVo) {
		
		List<GisVo> values = gisService.getInfectionDiseaseCount(gisVo);
		
		Map<String,Object> item = new HashMap<String,Object>();
		
		item.put("values", values);
		
		return item;
	}
}