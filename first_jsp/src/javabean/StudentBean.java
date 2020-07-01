package javabean;

import java.util.Calendar;

public class StudentBean {
	
	private String id;
	private String name;
	private String snum;
	private int year;
	private String pass;
	private String email;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSnum() {
		return snum;
	}
	
	public void setSnum(String snum) {
		this.snum = snum;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	// 태어난 해를 이용하여 현재의 나이를
	// 반환하는 메소드 구현
	public int getAge() {
		int curYear = Calendar.getInstance().get(Calendar.YEAR);
		System.out.println("년도 : " + curYear);
		return curYear - year + 1;
	}

}
