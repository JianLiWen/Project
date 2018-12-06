package com.wjl.graduate.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.usermodel.Workbook;

import com.wjl.graduate.pojo.History;
import com.wjl.graduate.pojo.Student;

public interface IStudentService {
	
	public List<Student> findAll();
	
	public List<String> selectdirection();
	
	public List<String> findplace();
	
	public List<String> findplaceByclass(String classid);
	
	public List<String> findtype();
	
	public List<String> findmajor();
	
	public List<String> findmajorByclass(String classid);
	
	public List<String> finddirection();
	
	public List<String> finddirectionBytype(String type);
	
	public  List<String> finddirectionByclass(String classid);
	
	public Student findStudentById(String id);

	public List<Student> findStudentByclassId(String classid);
	
	public void updateStudentByID(Student student);
	
	public void updateStudentByid(Student student);
	
	public  void  finishinfo(Student student);
	
	public  void addStudent(Student student);
	
	public void deleteStudent(String id);
	
	public  List<Integer>  excelStudent(Workbook wb, String fileName ) throws Exception;

    public  int  countplace(String place);
    
    public  int  countplaceByclass(String place,String classid);
    
    public  int  countdirection(String direction);
    
	public   int  countdirectionByclass(String direction,String classid);
    
    public  int  countmajor(String ismajor);
    
    public  int  countmajorByclass(String ismajor,String classid);

     public  int  counttotal(); 
     
     public  List<History>  findhistory(String sid);

     
     public List<String>  findplaceByyear(String number,String student_id);

     public  int  countplaceByyear(String number,String student_id,String place);

     public   int yeartotal(String number,String student_id);
     
     public List<String>  finddirectionByyear(String number,String student_id);

     public List<String>  finddirectionBytypes(String number,String student_id,String type);

     
     public  int  countdirectionByyear(String number,String student_id,String direction);

 	public  int countmajorByyear(String number,String student_id,String ismajor);

     
     public File exportplace();
     
     public File exportdirection();
     
     public List<String>  selectplace();

     public  int TimeDiff(String student_id);
}
