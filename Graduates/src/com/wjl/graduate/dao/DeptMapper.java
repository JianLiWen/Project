package com.wjl.graduate.dao;

import java.util.List;


import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Dept;
@Component("deptMapper")
public interface DeptMapper {
    public List<Dept> findDept();
	
	public Dept findDeptById(int id);

	public void updateDeptById(Dept dept) ;
	
	public void addDept(Dept dept);
	
}
