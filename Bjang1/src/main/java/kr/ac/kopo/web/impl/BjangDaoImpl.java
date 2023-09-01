package kr.ac.kopo.web.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.web.*;

@Repository
public class BjangDaoImpl implements BjangDao {

	
	@Autowired
	SqlSession sql;
	

	@Override
	public List<SiVo> SiVo(HashMap<String, Object> map) {
		return sql.selectList("Bjang.SiVo", map);
	}


	@Override
	public List<InfectionVo> Key1() {
		return sql.selectList("Bjang.Key1");
	}
	
	@Override
	public List<kr.ac.kopo.web.SiVo> Key2() {
		return sql.selectList("Bjang.Key2");
	}


	@Override
	public List<InfectionVo> InfDis_LastYear(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_LastYear", map);
	}


	@Override
	public List<NewsVo> NewsVo(HashMap<String, Object> map) {
		
		return sql.selectList("Bjang.news_volume_total", map);
	}


	@Override
	public List<SearchVo> search_keyword_total(HashMap<String, Object> map) {
		return sql.selectList("Bjang.search_keyword_total", map);
	}

	@Override
	public List<MapCatoVo> prev_month_InfDis_dif(HashMap<String, Object> map) {
		return sql.selectList("Bjang.prev_month_InfDis_dif",map);
	}
	


	
	@Override
	public List<InfectionVo> InfDis_current_year(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_current_year",map);
	}


	@Override
	public List<InfectionVo> InfDis_last_year(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_last_year",map);
	}


	@Override
	public List<InfectionVo> InfDis_before_last_year(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_before_last_year",map);
	}


	@Override
	public List<InfectionVo> InfDis_Top5(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_Top5",map);
	}

	@Override
	public List<InfectionVo> InfDis_genderPer(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_genderPer",map);
	}
	
	
	@Override
	public List<InfectionVo> InfDis_age(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_age",map);
	}
	
	@Override
	public List<InfectionVo> InfDis_year_list() {
		return sql.selectList("Bjang.InfDis_year_list");
	}




	@Override
	public List<ContentVo> NCont(HashMap<String, Object> map) {
		return sql.selectList("Bjang.NCont",map);
	}


	@Override
	public List<ContentVo> NSCont(HashMap<String, Object> map) {
		return sql.selectList("Bjang.NSCont",map);
	}


	@Override
	public List<InfectionVo> InfDis_nation(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_nation",map);
	}
	
	

	@Override
	public List<InfectionVo> InfDis_region(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_region",map);
	}


	@Override
	public List<InfectionVo> InfDis_chart(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis_chart",map);
	}

	

	@Override
	public double NContCnt(HashMap<String, Object> map) {
		return sql.selectOne("Bjang.NContCnt", map);
	}


	@Override
	public double NSContCnt(HashMap<String, Object> map) {
		return sql.selectOne("Bjang.NSContCnt", map);
	}


	@Override
	public List<InfectionVo> InfDis(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InfDis", map);
	}

	@Override
	public List<UDVo> InDe(HashMap<String, Object> map) {
		return sql.selectList("Bjang.InDe", map);
	}


	@Override
	public List<UDVo> UpDe(HashMap<String, Object> map) {
		return sql.selectList("Bjang.UpDe", map);
	}
	@Override
	public List<UDVo> JIC(HashMap<String, Object> map) {
		return sql.selectList("Bjang.JIC", map);
	}


	@Override
	public List<RiskVo> Risk(HashMap<String, Object> map) {
		return sql.selectList("Bjang.Risk", map);
	}


	@Override
	public int SDInf(HashMap<String, Object> map) {
		return sql.selectOne("Bjang.SDInf", map);
	}


	@Override
	public int news_volume_totalMax(HashMap<String, Object> map) {

		return sql.selectOne("Bjang.news_volume_totalMax", map);
	}


	@Override
	public int search_keyword_total_Max(HashMap<String, Object> map) {
		return sql.selectOne("Bjang.search_keyword_total_Max", map);
	}


	@Override
	public List<PearVo> Pearson(HashMap<String, Object> map) {
		return sql.selectList("Bjang.Pearson", map);
	}


	@Override
	public Double NPear(HashMap<String, Object> map) {
		return sql.selectOne("Bjang.NPear", map);
	}
	
	@Override
	public List<InfNmVo> InfNm() {
		return sql.selectList("Bjang.InfNm");
	}


	@Override
	public int insertNews(HashMap<String, Object> map) {
		return sql.insert("Bjang.insertNews", map);
	}


	@Override
	public int newsdelete() {
		return sql.delete("Bjang.newsdelete");
	}

	@Override
	public int insertSearchq(HashMap<String, Object> map) {
		return sql.insert("Bjang.insertSearchq", map);
	}


	@Override
	public List<InfNmVo> InfNms() {
		return sql.selectList("Bjang.InfNms");
	}


	@Override
	public int AlterDate() {
		return sql.update("Bjang.AlterDate");
	}


	@Override
	public int AlterVarchar() {
		return sql.update("Bjang.AlterVarchar");
	}


	@Override
	public int measles() {
		return sql.delete("Bjang.measles");
	}


	@Override
	public List<GradeVo> grade_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.grade_inf", map);
	}


	@Override
	public List<InfectionVo2> one_month_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.one_month_inf", map);
	}


	@Override
	public List<GenderVo> gender_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.gender_inf", map);
	}


	@Override
	public List<AgeVo> age_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.age_inf", map);
	}


	@Override
	public List<YearsVo> Years_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.Years_inf", map);
	}


	@Override
	public List<YearsVo> Years1_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.Years1_inf", map);
	}


	@Override
	public List<YearsVo> Years2_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.Years2_inf", map);
	}


	@Override
	public List<TrendVo> search_trend(HashMap<String, Object> map) {
		return sql.selectList("Bjang.search_trend", map);
	}


	@Override
	public List<CountVo> news_count(HashMap<String, Object> map) {
		return sql.selectList("Bjang.news_count", map);
	}


	@Override
	public List<NewscontentVo> news_content(HashMap<String, Object> map) {
		return sql.selectList("Bjang.news_content", map);
	}


	@Override
	public List<ArrangeVo> inf_arrange(HashMap<String, Object> map) {
		return sql.selectList("Bjang.inf_arrange", map);
	}

	@Override
	public List<Sicd_DateVo> year_count(HashMap<String, Object> map) {
		return sql.selectList("Bjang.year_count", map);
	}

	@Override
	public List<Sicd_DateVo> month_count(HashMap<String, Object> map) {
		return sql.selectList("Bjang.month_count", map);
	}


	@Override
	public List<Sicd_DateVo> back_month(HashMap<String, Object> map) {
		return sql.selectList("Bjang.back_month", map);
	}


	@Override
	public List<Sicd_DateVo> sicd_max(HashMap<String, Object> map) {
		return sql.selectList("Bjang.sicd_max", map);
	}


	@Override
	public List<Sicd_DateVo> age_max(HashMap<String, Object> map) {
		return sql.selectList("Bjang.age_max", map);
	}


	@Override
	public List<GradeVo> search_inf(HashMap<String, Object> map) {
		return sql.selectList("Bjang.search_inf", map);
	}


	@Override
	public List<GradeVo> covid_date(HashMap<String, Object> map) {
		return sql.selectList("Bjang.covid_date", map);
	}


	@Override
	public List<GradeVo> covid_gender(HashMap<String, Object> map) {
		return sql.selectList("Bjang.covid_gender", map);
	}


	@Override
	public List<GradeVo> covid_age(HashMap<String, Object> map) {
		return sql.selectList("Bjang.covid_age", map);
	}




	




	








}
