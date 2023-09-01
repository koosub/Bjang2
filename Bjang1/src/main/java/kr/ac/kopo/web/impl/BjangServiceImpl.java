package kr.ac.kopo.web.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.web.*;

@Service
public class BjangServiceImpl implements BjangService {

	@Autowired
	BjangDao bjangDao;

	@Override
	public List<SiVo> SiVo(HashMap<String, Object> map) {
		return bjangDao.SiVo(map);
	}
	
	@Override
	public List<SiVo> Key2() {
		return bjangDao.Key2();
	}

	@Override
	public List<InfectionVo> Key1() {
		return bjangDao.Key1();
	}

	@Override
	public List<InfectionVo> InfDis_LastYear(HashMap<String, Object> map) {
		return bjangDao.InfDis_LastYear(map);
	}

	@Override
	public List<NewsVo> NewsVo(HashMap<String, Object> map) {
		
		return bjangDao.NewsVo(map);
	}

	@Override
	public List<SearchVo> SearchVo(HashMap<String, Object> map) {
		return bjangDao.search_keyword_total(map);
	}
	
	@Override
	public List<MapCatoVo> prev_month_InfDis_dif(HashMap<String, Object> map) {
		return bjangDao.prev_month_InfDis_dif(map);
	}
	

	
	@Override
	public List<InfectionVo> InfDis_current_year(HashMap<String, Object> map) {
		return bjangDao.InfDis_current_year(map);
	}

	@Override
	public List<InfectionVo> InfDis_last_year(HashMap<String, Object> map) {
		return bjangDao.InfDis_last_year(map);
	}

	@Override
	public List<InfectionVo> InfDis_before_last_year(HashMap<String, Object> map) {

		return bjangDao.InfDis_before_last_year(map);
	}

	@Override
	public List<InfectionVo> InfDis_Top5(HashMap<String, Object> map) {
		return bjangDao.InfDis_Top5(map);
	}
	
	@Override
	public List<InfectionVo> InfDis_genderPer(HashMap<String, Object> map) {
		return bjangDao.InfDis_genderPer(map);
	}

	@Override
	public List<InfectionVo> InfDis_age(HashMap<String, Object> map) {
		return bjangDao.InfDis_age(map);
	}

	@Override
	public List<ContentVo> NCont(HashMap<String, Object> map) {
		return bjangDao.NCont(map);
	}

	@Override
	public List<ContentVo> NSCont(HashMap<String, Object> map) {
		return bjangDao.NSCont(map);
	}

	@Override
	public List<InfectionVo> InfDis_nation(HashMap<String, Object> map) {
		return bjangDao.InfDis_nation(map);
	}
	
	@Override
	public List<InfectionVo> InfDis_region(HashMap<String, Object> map) {
		return bjangDao.InfDis_region(map);
	}
	
	@Override
	public List<InfectionVo> InfDis_chart(HashMap<String, Object> map) {
		return  bjangDao.InfDis_chart(map);
	}

	
	@Override
	public double NContCnt(HashMap<String, Object> map) {
		return bjangDao.NContCnt(map);
	}

	@Override
	public double NSContCnt(HashMap<String, Object> map) {
		return bjangDao.NSContCnt(map);
	}

	@Override
	public List<InfectionVo> InfDis(HashMap<String, Object> map) {
		return bjangDao.InfDis(map);
	}

	@Override
	public List<UDVo> InDe(HashMap<String, Object> map) {
		return bjangDao.InDe(map);
	}

	@Override
	public List<UDVo> UpDe(HashMap<String, Object> map) {
		return bjangDao.UpDe(map);
	}

	@Override
	public List<InfectionVo> InfDis_year_list() {
		return bjangDao.InfDis_year_list();
	}

	@Override
	public List<UDVo> JIC(HashMap<String, Object> map) {
		return bjangDao.JIC(map);
	}

	@Override
	public List<RiskVo> Risk(HashMap<String, Object> map) {
		return bjangDao.Risk(map);
	}

	@Override
	public int SDInf(HashMap<String, Object> map) {
		return bjangDao.SDInf(map);
	}

	@Override
	public int news_volume_totalMax(HashMap<String, Object> map) {
		return bjangDao.news_volume_totalMax(map);
	}

	@Override
	public int search_keyword_total_Max(HashMap<String, Object> map) {
		return bjangDao.search_keyword_total_Max(map);
	}

	@Override
	public List<PearVo> Pearson(HashMap<String, Object> map) {
		return bjangDao.Pearson(map);
	}

	@Override
	public Double NPear(HashMap<String, Object> map) {
		return bjangDao.NPear(map);
	}

	@Override
	public List<InfNmVo> InfNm() {
		return bjangDao.InfNm();
	}

	@Override
	public int insertNews(HashMap<String, Object> map) {
		return bjangDao.insertNews(map);
	}

	@Override
	public int newsdelete() {
		return bjangDao.newsdelete();
	}

	@Override
	public int insertSearchq(HashMap<String, Object> map) {
		return bjangDao.insertSearchq(map);
	}

	@Override
	public List<InfNmVo> InfNms() {
		return bjangDao.InfNms();
	}

	@Override
	public int AlterDate() {
		return bjangDao.AlterDate();
	}

	@Override
	public int AlterVarchar() {
		return bjangDao.AlterVarchar();
	}

	@Override
	public int measles() {
		return bjangDao.measles();
	}

	@Override
	public List<GradeVo> grade_inf(HashMap<String, Object> map) {
		return bjangDao.grade_inf(map);
	}

	@Override
	public List<InfectionVo2> one_month_inf(HashMap<String, Object> map) {
		return bjangDao.one_month_inf(map);
	}

	@Override
	public List<GenderVo> gender_inf(HashMap<String, Object> map) {
		return bjangDao.gender_inf(map);
	}

	@Override
	public List<AgeVo> age_inf(HashMap<String, Object> map) {
		return bjangDao.age_inf(map);
	}

	@Override
	public List<YearsVo> Years_inf(HashMap<String, Object> map) {
		return bjangDao.Years_inf(map);
	}

	@Override
	public List<YearsVo> Years1_inf(HashMap<String, Object> map) {
		return bjangDao.Years1_inf(map);
	}

	@Override
	public List<YearsVo> Years2_inf(HashMap<String, Object> map) {
		return bjangDao.Years2_inf(map);
	}

	@Override
	public List<TrendVo> search_trend(HashMap<String, Object> map) {
		return bjangDao.search_trend(map);
	}

	@Override
	public List<CountVo> news_count(HashMap<String, Object> map) {
		return bjangDao.news_count(map);
	}

	@Override
	public List<NewscontentVo> news_content(HashMap<String, Object> map) {
		return bjangDao.news_content(map);
	}

	@Override
	public List<ArrangeVo> inf_arrange(HashMap<String, Object> map) {
		return bjangDao.inf_arrange(map);
	}

	@Override
	public List<Sicd_DateVo> year_count(HashMap<String, Object> map) {
		return bjangDao.year_count(map);
	}

	@Override
	public List<Sicd_DateVo> month_count(HashMap<String, Object> map) {
		return bjangDao.month_count(map);
	}

	@Override
	public List<Sicd_DateVo> back_month(HashMap<String, Object> map) {
		return bjangDao.back_month(map);
	}

	@Override
	public List<Sicd_DateVo> sicd_max(HashMap<String, Object> map) {
		return bjangDao.sicd_max(map);
	}

	@Override
	public List<Sicd_DateVo> age_max(HashMap<String, Object> map) {
		return bjangDao.age_max(map);
	}

	@Override
	public List<GradeVo> search_inf(HashMap<String, Object> map) {
		return bjangDao.search_inf(map);
	}

	@Override
	public List<GradeVo> covid_date(HashMap<String, Object> map) {
		return bjangDao.covid_date(map);
	}

	@Override
	public List<GradeVo> covid_gender(HashMap<String, Object> map) {
		return bjangDao.covid_gender(map);
	}

	@Override
	public List<GradeVo> covid_age(HashMap<String, Object> map) {
		return bjangDao.covid_age(map);
	}



	



	

	


	


	

	
}
