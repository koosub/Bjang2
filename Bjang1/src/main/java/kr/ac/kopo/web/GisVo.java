package kr.ac.kopo.web;

public class GisVo {
	private String sd_cd; // 시도 코드
	private String sd_nm; // 시도 이름
	private String sgg_cd; // 시군구 코드
	private String sgg_nm; // 시군구 이름
	private String emd_cd; // 읍면동 코드
	private String emd_nm; // 읍면동 이름
	private String vst_ymd; // 방문일자
	
//	private String sdCd; // 시도 코드
//	private String sdNm; // 시도 이름
//	private String sggCd; // 시군구 코드
//	private String sggNm; // 시군구 이름
//	private String emdNm; // 읍면동 코드
//	private String emdCd; // 읍면동 이름
//	private String vstYmd; // 방문일자
	
	private int year; // 연도
	private int month; // 월
	private int day; // 일
	private int currInfYear; // 현재 전염병 연도
	private int currInfMonth; // 현재 전염병 월
	private int prevInfYear; // 전월 전염병 연도
	private int prevInfMonth; // 전월 전염병 월
	private int infdisid; // 감염병id
	private String gb; // 감염병등급
	private String infdisnm; // 감염병이름
	private String jsonb_build_object;
	public String getSd_cd() {
		return sd_cd;
	}
	public void setSd_cd(String sd_cd) {
		this.sd_cd = sd_cd;
	}
	public String getSd_nm() {
		return sd_nm;
	}
	public void setSd_nm(String sd_nm) {
		this.sd_nm = sd_nm;
	}
	public String getSgg_cd() {
		return sgg_cd;
	}
	public void setSgg_cd(String sgg_cd) {
		this.sgg_cd = sgg_cd;
	}
	public String getSgg_nm() {
		return sgg_nm;
	}
	public void setSgg_nm(String sgg_nm) {
		this.sgg_nm = sgg_nm;
	}
	public String getEmd_cd() {
		return emd_cd;
	}
	public void setEmd_cd(String emd_cd) {
		this.emd_cd = emd_cd;
	}
	public String getEmd_nm() {
		return emd_nm;
	}
	public void setEmd_nm(String emd_nm) {
		this.emd_nm = emd_nm;
	}
	public String getVst_ymd() {
		return vst_ymd;
	}
	public void setVst_ymd(String vst_ymd) {
		this.vst_ymd = vst_ymd;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getCurrInfYear() {
		return currInfYear;
	}
	public void setCurrInfYear(int currInfYear) {
		this.currInfYear = currInfYear;
	}
	public int getCurrInfMonth() {
		return currInfMonth;
	}
	public void setCurrInfMonth(int currInfMonth) {
		this.currInfMonth = currInfMonth;
	}
	public int getPrevInfYear() {
		return prevInfYear;
	}
	public void setPrevInfYear(int prevInfYear) {
		this.prevInfYear = prevInfYear;
	}
	public int getPrevInfMonth() {
		return prevInfMonth;
	}
	public void setPrevInfMonth(int prevInfMonth) {
		this.prevInfMonth = prevInfMonth;
	}
	public int getInfdisid() {
		return infdisid;
	}
	public void setInfdisid(int infdisid) {
		this.infdisid = infdisid;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getInfdisnm() {
		return infdisnm;
	}
	public void setInfdisnm(String infdisnm) {
		this.infdisnm = infdisnm;
	}
	public String getJsonb_build_object() {
		return jsonb_build_object;
	}
	public void setJsonb_build_object(String jsonb_build_object) {
		this.jsonb_build_object = jsonb_build_object;
	}
	@Override
	public String toString() {
		return "GisVo [sd_cd=" + sd_cd + ", sd_nm=" + sd_nm + ", sgg_cd=" + sgg_cd + ", sgg_nm=" + sgg_nm + ", emd_cd="
				+ emd_cd + ", emd_nm=" + emd_nm + ", vst_ymd=" + vst_ymd + ", year=" + year + ", month=" + month
				+ ", day=" + day + ", currInfYear=" + currInfYear + ", currInfMonth=" + currInfMonth + ", prevInfYear="
				+ prevInfYear + ", prevInfMonth=" + prevInfMonth + ", infdisid=" + infdisid + ", gb=" + gb
				+ ", infdisnm=" + infdisnm + ", jsonb_build_object=" + jsonb_build_object + "]";
	}
	
	
}