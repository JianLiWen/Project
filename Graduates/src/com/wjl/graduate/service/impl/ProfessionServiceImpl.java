package com.wjl.graduate.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.wjl.graduate.dao.ProfessionMapper;

import com.wjl.graduate.pojo.Profession;

import com.wjl.graduate.service.IProfessionService;

@Service("ProfessionService")
public class ProfessionServiceImpl implements IProfessionService{
     
	@Resource(name="professionMapper")
	private  ProfessionMapper  professsionMapper;

	@Override
	public List<Profession> findmajor() {
		// TODO Auto-generated method stub
		List<Profession> list = professsionMapper.findmajor();
		
		return list;
	}
	
	
      
}
