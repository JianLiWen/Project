package com.wjl.graduate.dao;

import java.util.List;



import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Student;
@Component("studentMapper")
public interface StudentMapper {
    public List<Student> findStudent();
	
	public Student findStudentById(String id);
	
	 public  List<String> selectdirection();
	
	//查询本班学生
	public List<Student> findStudentByclassId(String classid);

	public void updateStudentById(Student student) ;
	
	public  void finishinfoById(Student student);
	
	public void addStudent(Student student);
	
	public void deleteStudent(String id);
	
	public  List<String> findplace();
	
	public  List<String> findplaceByclass(String classid);
	
	public   int  countplace(String place);
	
	public   int  countplaceByclass(@Param("job_place")String place,@Param("classid")String classid);
	
	public  int  counttotal();
	
	public  List<String> finddirectionBytype(String type);
	
	public  List<String> finddirectionByclass(String classid);
	
    public  List<String> finddirection();
	
	public   int  countdirection(String direction);
	
	public   int  countdirectionByclass(@Param("job_direction")String direction,@Param("classid")String classid);
	
	 public  List<String> selectType();
	 
	 public  List<String>  selectmajor();
	 
	 public  List<String>  selectmajorByclass(String classid);
	 
	 public   int  countmajor(String major);
	 
	 public   int  countmajorByclass(@Param("ismajor")String ismajor,@Param("classid")String classid);

	public  List<String> selectplace();
}
