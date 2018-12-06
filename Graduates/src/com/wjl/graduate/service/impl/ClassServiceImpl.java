package com.wjl.graduate.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.ClassMapper;
import com.wjl.graduate.pojo.Classes;
import com.wjl.graduate.service.IClassService;

@Service("ClassService")
public class ClassServiceImpl implements IClassService{
     
	@Resource(name="classMapper")
	private  ClassMapper  classMapper;
	@Override
	public List<Classes> findAll() {
		// TODO Auto-generated method stub
		List<Classes> classes = classMapper.findClass();
		return classes;
	}

	@Override
	public void updateClassByID(Classes classes) {

		classMapper.updateClassById(classes);
	}

	@Override
	public void addClass(Classes classes) {
		// TODO Auto-generated method stub
		classMapper.addClass(classes);
	}

	@Override
	public Classes findClassById(String id) {
		// TODO Auto-generated method stub
	      Classes classes = classMapper.findClassById(id);
	      return classes;
	}

	@Override
	public void deleteClass(String classId) {
		// TODO Auto-generated method stub
		classMapper.deleteClass(classId);
		
	}

	@Override
	public int counttotal() {
		// TODO Auto-generated method stub
		return classMapper.counttotal();
	}
      
}
