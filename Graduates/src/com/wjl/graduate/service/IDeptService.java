package com.wjl.graduate.service;

import java.util.List;

import com.wjl.graduate.pojo.Dept;



public interface IDeptService {
	
	public List<Dept> findAll();
	
	public Dept findDeptById(int id);

	public void updateDeptByID(Dept dept);
	
	public  void adddept(Dept dept);
}
