package com.wjl.graduate.pojo;



import java.util.Date;

public class Student {
	//基本信息字段
    private String id;
    private String  name;
    private  String sex;
    private  Date birthdate;
	private  String classid;
	private  Date  leave_time;
    public Date getLeave_time() {
		return leave_time;
	}
	public void setLeave_time(Date leave_time) {
		this.leave_time = leave_time;
	}
	private  String birthplace;
    private  String phone;
    private   int del_flg;
	//用户登录完善信息字段
    private   String  job_direction;
    public String getJob_direction() {
		return job_direction;
	}
	public void setJob_direction(String job_direction) {
		this.job_direction = job_direction;
	}
	private   String  job_company;
    private   String  job_place;
    private   Date    job_time;
    public Date getJob_time() {
		return job_time;
	}
	public void setJob_time(Date job_time) {
		this.job_time = job_time;
	}
	private    String  ismajor;
    private   String  email;
	private   String  address;
    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}


    public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getJob_company() {
		return job_company;
	}
	public void setJob_company(String job_company) {
		this.job_company = job_company;
	}
	public String getJob_place() {
		return job_place;
	}
	public void setJob_place(String job_place) {
		this.job_place = job_place;
	}
	
	public String getIsmajor() {
		return ismajor;
	}
	public void setIsmajor(String ismajor) {
		this.ismajor = ismajor;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	private    String  others;
    public Student(){};
	public Student(String id, String name, String sex, Date birthdate,
			String classid,Date leave_time, String birthplace, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birthdate = birthdate;
		this.classid = classid;
		this.leave_time = leave_time;
		this.birthplace = birthplace;
		this.phone = phone;
	}
	public int getDel_flg() {
		return del_flg;
	}
	public void setDel_flg(int del_flg) {
		this.del_flg = del_flg;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getBirthplace() {
		return birthplace;
	}
	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}
}
