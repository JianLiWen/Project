package com.wjl.graduate.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.DeptMapper;
import com.wjl.graduate.pojo.Dept;
import com.wjl.graduate.service.IDeptService;
@Service("DeptService")
public class DeptServiceImpl implements IDeptService{
     
	@Resource(name="deptMapper")
	private  DeptMapper  deptMapper;
	@Override
	public List<Dept> findAll() {
		// TODO Auto-generated method stub
		List<Dept> depts = deptMapper.findDept();
		return depts;
	}

	@Override
	public void updateDeptByID(Dept dept) {

		deptMapper.updateDeptById(dept);
	}

	@Override
	public Dept findDeptById(int id) {
		// TODO Auto-generated method stub]
		Dept dept = deptMapper.findDeptById(id);
		return dept;
	}

	@Override
	public void adddept(Dept dept) {
		// TODO Auto-generated method stub
		deptMapper.addDept(dept);
	}
      
}
