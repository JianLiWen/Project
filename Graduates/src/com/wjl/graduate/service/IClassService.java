package com.wjl.graduate.service;

import java.util.List;

import com.wjl.graduate.pojo.Classes;

public interface IClassService {
	
	public List<Classes> findAll();
	
	public Classes findClassById(String id);

	public void updateClassByID(Classes classes);
	
	public  void addClass(Classes classes);
	
	public void deleteClass(String classId);
	
	public int counttotal();
}
