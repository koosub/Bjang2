package kr.ac.kopo.web;

public class InfectionVo {
	
	private String sicd;
	private String infdisnm;
	private String sinm;
	private float lat;
	private float lng;
	private int year;
	private int month;
	private int day;
	private int count;
	private int scount;
	private String sex;
	private String age;
	
	
	
	
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSicd() {
		return sicd;
	}
	public void setSicd(String sicd) {
		this.sicd = sicd;
	}
	public String getInfdisnm() {
		return infdisnm;
	}
	public void setInfdisnm(String infdisnm) {
		this.infdisnm = infdisnm;
	}
	public String getSinm() {
		return sinm;
	}
	public void setSinm(String sinm) {
		this.sinm = sinm;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	
	
}
