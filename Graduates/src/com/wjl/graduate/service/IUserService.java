package com.wjl.graduate.service;

import java.util.List;

import org.apache.poi.ss.usermodel.Workbook;

import com.wjl.graduate.pojo.User;

public interface IUserService {
	  
	public User checkLogin(String username, String password);
    
	public  User   findUserByName(String name);
	
	public  List<Integer>  exceluser(Workbook wb, String fileName ) throws Exception;

	 public  void  deleteuser(int id);
	 
	 public  void  updatepawd(String username,String password);

      public  void  logincount(String name);
}
