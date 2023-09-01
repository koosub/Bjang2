package kr.ac.kopo.web;

import java.util.List;

public interface GisService {

	public List<GisVo> getSdList();
	
	public List<GisVo> getSggList(GisVo gisVo);

	public List<GisVo> getEmdList(GisVo gisVo);
	
	public List<GisVo> getSdGeojson();

	public List<GisVo> getSggGeojson();

	public List<GisVo> getEmdGeojson();

	public List<GisVo> getDailyEmdDensity(GisVo gisVo);

	public List<GisVo> getPopulationMovementStart(GisVo gisVo);

	public List<GisVo> getPopulationMovementEnd(GisVo gisVo);

	public List<GisVo> getInfectionDiseaseList();

	public List<GisVo> getInfectionDiseaseCount(GisVo gisVo);
	
}
