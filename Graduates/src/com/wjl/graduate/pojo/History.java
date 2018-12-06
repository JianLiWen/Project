package com.wjl.graduate.pojo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component(value="history")
public class History {
    
	   private  int id;
	   private String student_id;
	   private  String  direction;
	   private  String company;
	   public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	private  String  place;
	   private  Date  time;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private  String ismajor;
	   
	public String getIsmajor() {
		return ismajor;
	}
	public void setIsmajor(String ismajor) {
		this.ismajor = ismajor;
	}
	public History(String student_id, String direction, String place,
			Date time) {
		super();
		this.student_id = student_id;
		this.direction = direction;
		this.place = place;
		this.time = time;
	}
	public History() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
}
