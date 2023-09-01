package kr.ac.kopo.web;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.web.*;
public interface BjangDao {


	List<GradeVo> grade_inf(HashMap<String, Object> map);

	List<SiVo> SiVo(HashMap<String, Object> map);

	List<InfectionVo> Key1();

	List<InfectionVo> InfDis_LastYear(HashMap<String, Object> map);

	List<NewsVo> NewsVo(HashMap<String, Object> map);

	List<SearchVo> search_keyword_total(HashMap<String, Object> map);
	
	List<InfectionVo> InfDis_genderPer(HashMap<String, Object> map);
	
	List<InfectionVo> InfDis_current_year(HashMap<String, Object> map);

	List<InfectionVo> InfDis_last_year(HashMap<String, Object> map);

	List<InfectionVo> InfDis_before_last_year(HashMap<String, Object> map);

	List<InfectionVo> InfDis_Top5(HashMap<String, Object> map);
	
	List<InfectionVo> InfDis_age(HashMap<String, Object> map);
	
	
	
	
	List<ContentVo> NCont(HashMap<String, Object> map);

	List<ContentVo> NSCont(HashMap<String, Object> map);


	List<kr.ac.kopo.web.SiVo> Key2();

	double NContCnt(HashMap<String, Object> map);

	double NSContCnt(HashMap<String, Object> map);

	List<InfectionVo> InfDis(HashMap<String, Object> map);

	List<MapCatoVo> prev_month_InfDis_dif(HashMap<String, Object> map);

	List<UDVo> UpDe(HashMap<String, Object> map);

	List<UDVo> InDe(HashMap<String, Object> map);

	List<InfectionVo> InfDis_year_list();

	List<UDVo> JIC(HashMap<String, Object> map);

	List<InfectionVo> InfDis_nation(HashMap<String, Object> map);

	List<InfectionVo> InfDis_region(HashMap<String, Object> map);

	List<InfectionVo> InfDis_chart(HashMap<String, Object> map);

	List<RiskVo> Risk(HashMap<String, Object> map);

	int SDInf(HashMap<String, Object> map);

	int news_volume_totalMax(HashMap<String, Object> map);

	int search_keyword_total_Max(HashMap<String, Object> map);

	List<PearVo> Pearson(HashMap<String, Object> map);

	Double NPear(HashMap<String, Object> map);

	List<InfNmVo> InfNm();

	int insertNews(HashMap<String, Object> map);

	int newsdelete();

	int insertSearchq(HashMap<String, Object> map);

	List<InfNmVo> InfNms();

	int AlterDate();

	int AlterVarchar();

	int measles();

	List<InfectionVo2> one_month_inf(HashMap<String, Object> map);

	List<GenderVo> gender_inf(HashMap<String, Object> map);

	List<AgeVo> age_inf(HashMap<String, Object> map);

	List<YearsVo> Years_inf(HashMap<String, Object> map);

	List<YearsVo> Years1_inf(HashMap<String, Object> map);

	List<YearsVo> Years2_inf(HashMap<String, Object> map);

	List<TrendVo> search_trend(HashMap<String, Object> map);

	List<CountVo> news_count(HashMap<String, Object> map);

	List<NewscontentVo> news_content(HashMap<String, Object> map);

	List<ArrangeVo> inf_arrange(HashMap<String, Object> map);

	List<Sicd_DateVo> year_count(HashMap<String, Object> map);

	List<Sicd_DateVo> month_count(HashMap<String, Object> map);

	List<Sicd_DateVo> back_month(HashMap<String, Object> map);

	List<Sicd_DateVo> sicd_max(HashMap<String, Object> map);

	List<Sicd_DateVo> age_max(HashMap<String, Object> map);

	List<GradeVo> search_inf(HashMap<String, Object> map);

	List<GradeVo> covid_date(HashMap<String, Object> map);

	List<GradeVo> covid_gender(HashMap<String, Object> map);

	List<GradeVo> covid_age(HashMap<String, Object> map);




}
