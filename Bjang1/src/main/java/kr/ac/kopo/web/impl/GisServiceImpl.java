package kr.ac.kopo.web.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.web.GisService;
import kr.ac.kopo.web.GisVo;


@Service("gisService")
public class GisServiceImpl implements GisService {

	@Autowired
	public GisDao gisDao;
	
	@Override
	public List<GisVo> getSdList() {
		List<GisVo> list = gisDao.getSdList();
		return list;
	}

	@Override
	public List<GisVo> getSggList(GisVo gisVo) {
		List<GisVo> list = gisDao.getSggList(gisVo);
		return list;
	}

	@Override
	public List<GisVo> getEmdList(GisVo gisVo) {
		List<GisVo> list = gisDao.getEmdList(gisVo);
		return list;
	}
	
	@Override
	public List<GisVo> getSdGeojson() {
		List<GisVo> list = gisDao.getSdGeojson();
		return list;
	}

	@Override
	public List<GisVo> getSggGeojson() {
		List<GisVo> list = gisDao.getSggGeojson();
		return list;
	}

	@Override
	public List<GisVo> getEmdGeojson() {
		List<GisVo> list = gisDao.getEmdGeojson();
		return list;
	}
	
	@Override
	public List<GisVo> getDailyEmdDensity(GisVo gisVo) {
		List<GisVo> list = gisDao.getDailyEmdDensity(gisVo);
		return list;
	}

	@Override
	public List<GisVo> getPopulationMovementStart(GisVo gisVo) {
		List<GisVo> list = gisDao.getPopulationMovementStart(gisVo);
		return list;
	}
	
	@Override
	public List<GisVo> getPopulationMovementEnd(GisVo gisVo) {
		List<GisVo> list = gisDao.getPopulationMovementEnd(gisVo);
		return list;
	}
	
	@Override
	public List<GisVo> getInfectionDiseaseList() {
		List<GisVo> list = gisDao.getInfectionDiseaseList();
		return list;
	}
	
	@Override
	public List<GisVo> getInfectionDiseaseCount(GisVo gisVo) {
		List<GisVo> list = gisDao.getInfectionDiseaseCount(gisVo);
		return list;
	}
}