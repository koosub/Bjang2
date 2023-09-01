package kr.ac.kopo.web.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.web.GisVo;

@Repository("GisDao")
public class GisDao {
	
	@Autowired
	SqlSession sql;

	public List<GisVo> getSdList() {
		return sql.selectList("gisSql.getSdList");
	}

	public List<GisVo> getSggList(GisVo gisVo) {
		return sql.selectList("gisSql.getSggList", gisVo);
	}

	public List<GisVo> getEmdList(GisVo gisVo) {
		return sql.selectList("gisSql.getEmdList", gisVo);
	}

	public List<GisVo> getSdGeojson() {
		return sql.selectList("gisSql.getSdGeojson");
	}

	public List<GisVo> getSggGeojson() {
		return sql.selectList("gisSql.getSggGeojson");
	}

	public List<GisVo> getEmdGeojson() {
		return sql.selectList("gisSql.getEmdGeojson");
	}
	
	public List<GisVo> getDailyEmdDensity(GisVo gisVo) {
		return sql.selectList("gisSql.getDailyEmdDensity", gisVo);
	}

	public List<GisVo> getPopulationMovementStart(GisVo gisVo) {
		return sql.selectList("gisSql.getPopulationMovementStart", gisVo);
	}
	
	public List<GisVo> getPopulationMovementEnd(GisVo gisVo) {
		return sql.selectList("gisSql.getPopulationMovementEnd", gisVo);
	}
	
	public List<GisVo> getInfectionDiseaseList() {
		return sql.selectList("gisSql.getInfectionDiseaseList");
	}
	
	public List<GisVo> getInfectionDiseaseCount(GisVo gisVo) {
		return sql.selectList("gisSql.getInfectionDiseaseCount", gisVo);
	}
}
