package com.wjl.graduate.dao;

import java.util.List;




import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Classes;
import com.wjl.graduate.pojo.Profession;
@Component("classMapper")
public interface ClassMapper {
    public List<Classes> findClass();
	
	public Classes findClassById(String id);

	public void updateClassById(Classes classes) ;
	
	public void addClass(Classes classes);
	
	public  List<Profession>  findmajor();
	
	public void deleteClass(String classId);
	
	public int counttotal();
	
}
