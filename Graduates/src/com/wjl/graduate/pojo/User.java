package com.wjl.graduate.pojo;

public class User {
      private int id;
      private String username;
      private String password;
      private int status;
      private  int logincount;
	public int getLogincount() {
		return logincount;
	}
	public void setLogincount(int logincount) {
		this.logincount = logincount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User (){	};
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
}
