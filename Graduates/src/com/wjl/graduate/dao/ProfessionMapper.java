package com.wjl.graduate.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Profession;
@Component("professionMapper")
public interface ProfessionMapper {
      public List<Profession>  findmajor();
}
