package com.wjl.graduate.service.impl;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.HistoryMapper;
import com.wjl.graduate.dao.StudentMapper;
import com.wjl.graduate.pojo.Export;
import com.wjl.graduate.pojo.History;
import com.wjl.graduate.pojo.Student;
import com.wjl.graduate.service.IStudentService;
import com.wjl.graduate.utils.ExcelUtils;
import com.wjl.graduate.utils.RequestUtils;

@Service("StudentService")
public class StudentServiceImpl implements IStudentService{
	private static final Logger logger = LoggerFactory.getLogger(StudentServiceImpl.class);
	@Resource(name="history")
     private History  history;

	@Resource(name="studentMapper")
	private  StudentMapper  studentMapper;
	@Resource(name="historyMapper")
	private  HistoryMapper  historyMapper;
	@Override
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		List<Student> student = studentMapper.findStudent();
		return student;
	}
	@Override
	public Student findStudentById(String id) {
		// TODO Auto-generated method stub
		Student  student = studentMapper.findStudentById(id);
		
		return student;
	}
	@Override
	public void updateStudentByID(Student student) {
		// TODO Auto-generated method stub	
		
		
			studentMapper.updateStudentById(student);
		
		if(student.getJob_direction().equals(history.getDirection())==false||student.getJob_company().equals(history.getCompany())==false||student.getJob_place().equals(history.getPlace())==false)
		  {
			history.setDirection(student.getJob_direction());
			history.setCompany(student.getJob_company());
			history.setPlace(student.getJob_place());
			history.setTime(student.getJob_time());
			history.setIsmajor(student.getIsmajor());
			history.setStudent_id(student.getId());
			historyMapper.add(history);
		  }
		
	}
	
	@Override
	public void updateStudentByid(Student student) {
		// TODO Auto-generated method stub	
		
		studentMapper.updateStudentById(student);
	}
	@Override
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		studentMapper.addStudent(student);
	}
	@Override
	public void deleteStudent(String id) {
		// TODO Auto-generated method stub
		studentMapper.deleteStudent(id);
	}
	@Override
	public List<Integer> excelStudent(Workbook wb, String fileName) throws Exception {
		// TODO Auto-generated method stub
		// 得到第一个sheet
		Sheet sheet = wb.getSheetAt(0);
		// 得到Excel的行数
		int totalRows = sheet.getPhysicalNumberOfRows();

		// 得到Excel的列数(前提是有行数)
		int totalCells = 0;
		if (totalRows >= 1 && sheet.getRow(0) != null) {
			totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
		}
		List<Student> userList = new ArrayList<Student>();
		// 循环Excel行数,从第二行开始。标题不入库
		for (Row row : sheet) {
			int rowNum = row.getRowNum();
			if (rowNum == 0) {
				continue;
			}
			// 获取cell(0)值，赋值给user_id，空报错，跳过此条数据，进行下一条数据
			String id = null;
			if (row.getCell(0) != null && !("".equals(row.getCell(0).toString()))) {
				row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
				id = row.getCell(0).getStringCellValue();
			}
			// 获取cell(1)值，赋值给user_name，空报错，跳过此条数据，进行下一条数据
			String name = null;
			if (row.getCell(1) != null && !("".equals(row.getCell(1).toString()))) {
				row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			    name = row.getCell(1).getStringCellValue();
			}
			// 获取cell(2)值，赋值给password，空报错，跳过此条数据，进行下一条数据
			String sex = null;
			if (row.getCell(2) != null && !("".equals(row.getCell(2).toString()))) {
				row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			    sex = row.getCell(2).getStringCellValue();
			}
			// 获取cell(3)值，赋值给password，空报错，跳过此条数据，进行下一条数据
			String classid = null;
			if (row.getCell(3) != null && !("".equals(row.getCell(3).toString()))) {
				row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
				classid = row.getCell(3).getStringCellValue();
			}
			String leave_time1 = null;
			if (row.getCell(4) != null && !("".equals(row.getCell(4).toString()))) {
				row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
				leave_time1 = row.getCell(4).getStringCellValue();
			}
			SimpleDateFormat formatter=new SimpleDateFormat("dd-MM-yyyy");
			Date leave_time=new Date();
			leave_time=formatter.parse(leave_time1);
			String birthdate1 = null;
			if (row.getCell(5) != null && !("".equals(row.getCell(5).toString()))) {
				row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
				birthdate1 = row.getCell(5).getStringCellValue();
			}
			Date birthdate=new Date();
			 birthdate=formatter.parse(birthdate1);
			String birthplace = null;
			if (row.getCell(6) != null && !("".equals(row.getCell(6).toString()))) {
				row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
				birthplace = row.getCell(6).getStringCellValue();
			}
			String phone = null;
			if (row.getCell(7) != null && !("".equals(row.getCell(7).toString()))) {
				row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
				phone = row.getCell(7).getStringCellValue();
			}
			Student student=new Student(id, name, sex, birthdate,classid,leave_time, birthplace, phone);
			// 将teacher对象存到teacherList中
			userList.add(student);
		}
		// 导入正确个数
		int flagT = 0;
		// 导入错误个数
		int flagF = 0;
		// 创建list集合，用来存储flagT和flagF
		List<Integer> list = new ArrayList<Integer>();
		// 对teacherList进行循环，将其传入Dao层
		for (int i = 0; i < userList.size(); i++) {
			try {
				studentMapper.addStudent(userList.get(i));
				// 正确个数++
				flagT++;
			}
			// 捕获异常，对失败个数进行++
			catch (Exception e) {
				e.printStackTrace();
				// 失败列
				Integer false_i = i + 2;
				list.add(false_i);
				flagF++;

			}
		}
		list.add(flagT);// 添加入list中
		list.add(flagF);// 添加入list中
		return list;
	}
	@Override
	public void finishinfo(Student student) {
		// TODO Auto-generated method stub
		studentMapper.finishinfoById(student);
		history.setStudent_id(student.getId());
		history.setDirection(student.getJob_direction());
		history.setCompany(student.getJob_company());
		history.setPlace(student.getJob_place());
		history.setTime(student.getJob_time());
		history.setIsmajor(student.getIsmajor());
		historyMapper.add(history);
		
	}
	@Override
	public List<String> findplace() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.findplace();
		return list;
	}
	@Override
	public int countplace(String place) {
		// TODO Auto-generated method stub
		int number = studentMapper.countplace(place);
		return number;
	}
	@Override
	public int counttotal() {
		// TODO Auto-generated method stub
		int number = studentMapper.counttotal();
		return number;
	}
	@Override
	public List<String> finddirection() {
		List<String> list = studentMapper.finddirection();
		return list;
	}
	@Override
	public int countdirection(String direction) {
		// TODO Auto-generated method stub
		int number = studentMapper.countdirection(direction);
		return number;
	}
	@Override
	public List<String> finddirectionBytype(String type) {
		List<String> list = studentMapper.finddirectionBytype(type);
		return list;
	}
	@Override
	public List<String> findtype() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.selectType();		
		return list;
	}
	@Override
	public List<String> findmajor() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.selectmajor();		
		return list;
	}
	@Override
	public int countmajor(String ismajor) {
		// TODO Auto-generated method stub
		int number = studentMapper.countmajor(ismajor);
		return number;
	}
	@Override
	public List<Student> findStudentByclassId(String classid) {
		// TODO Auto-generated method stub
		List<Student>  list = studentMapper.findStudentByclassId(classid);
		return list;
	}
	@Override
	public List<History> findhistory(String sid) {
		// TODO Auto-generated method stub
		List<History>  list = historyMapper.findhistory(sid);
		return list;
	}
	@Override
	public List<String> findplaceByclass(String classid) {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.findplaceByclass(classid);
		return list;
	}
	@Override
	public int countplaceByclass(String place, String classid) {
		// TODO Auto-generated method stub
		int number = studentMapper.countplaceByclass(place, classid);
		return number;
	}
	@Override
	public List<String> finddirectionByclass(String classid) {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.finddirectionByclass(classid);
		return list;
	}
	@Override
	public int countdirectionByclass(String direction,String classid) {
		// TODO Auto-generated method stub
		int number = studentMapper.countdirectionByclass(direction,classid);
		return number;
	}
	@Override
	public List<String> findmajorByclass(String classid) {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.selectmajorByclass(classid);	
		return list;
	}
	@Override
	public int countmajorByclass(String ismajor, String classid) {
		// TODO Auto-generated method stub
		int number = studentMapper.countmajorByclass(ismajor, classid);
		return number;
	}
	@Override
	public List<String> selectdirection() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.selectdirection();
		return list;
	}
	@Override
	public List<String> findplaceByyear(String number, String student_id) {
		// TODO Auto-generated method stub
       List<String> list = historyMapper.findplaceByyear(number, student_id);
		return list;
	}
	@Override
	public int countplaceByyear(String num, String student_id, String place) {
		// TODO Auto-generated method stub
		int number1 = historyMapper.countplaceByyear(num, student_id, place);
		return number1;
	}
	@Override
	public int yeartotal(String number, String student_id) {
		// TODO Auto-generated method stub
		int num = historyMapper.counttotal(number, student_id);
		return num;
	}
	@Override
	public List<String> finddirectionByyear(String number, String student_id) {
		// TODO Auto-generated method stub
		 List<String> list = historyMapper.finddirectionByyear(number, student_id);
			return list;
	}
	@Override
	public int countdirectionByyear(String number, String student_id,
			String direction) {
		// TODO Auto-generated method stub
		int number1 = historyMapper.countdirectionByyear(number, student_id, direction);
		return number1;
	}
	@Override
	public List<String> finddirectionBytypes(String number, String student_id,
			String type) {
		List<String> list = historyMapper.finddirectionBytype(number, student_id, type);
		return list;
	}
	
	@Override
	public File exportplace() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.findplace();
		List<Export> exlist=new ArrayList<>();
		 int total=0;
		for(int i=0;i<list.size();i++)
		{  
			int number = studentMapper.countplace(list.get(i));
		    total+=number;
		    Export export=new Export(list.get(i),number,total);
		    exlist.add(export);
		}
		for(int i=0;i<list.size();i++){
			exlist.get(i).setTotal(total);
		}
		try {
            File file = ExcelUtils.exportExcel(exlist, RequestUtils.getRequest().getSession().getServletContext().getRealPath(File.separator) +
                            UUID.randomUUID().toString() + ".xls",
                    new String[]{"就业地点", "学生人数", "总人数",
                    		}, "updateTime");
            return file;
        } catch (IOException e) {
            logger.error(e.getMessage(),e.toString());
        } catch (IllegalAccessException e) {
            logger.error(e.getMessage(),e.toString());
        }
		return null;
	}
	@Override
	public File exportdirection() {
		// TODO Auto-generated method stub
		List<String> list = studentMapper.finddirection();
		List<Export> exlist=new ArrayList<>();
		 int total=0;
		for(int i=0;i<list.size();i++)
		{   
			int number = studentMapper.countdirection(list.get(i));
			 total+=number;
			Export export=new Export(list.get(i),number,total);
		    exlist.add(export);
		}
		for(int i=0;i<list.size();i++){
			exlist.get(i).setTotal(total);
		}
		try {
            File file = ExcelUtils.exportExcel(exlist, RequestUtils.getRequest().getSession().getServletContext().getRealPath(File.separator) +
                            UUID.randomUUID().toString() + ".xls",
                    new String[]{"就业方向", "学生人数", "总人数",
                    		}, "updateTime");
            return file;
        } catch (IOException e) {
            logger.error(e.getMessage(),e.toString());
        } catch (IllegalAccessException e) {
            logger.error(e.getMessage(),e.toString());
        }
		return null;
	}
	@Override
	public List<String> selectplace() {
		// TODO Auto-generated method stub
		return studentMapper.selectplace();
	}
	@Override
	public int TimeDiff(String student_id) {
		// TODO Auto-generated method stub
		
		return historyMapper.TimeDiff(student_id);
	}
	@Override
	public int countmajorByyear(String number, String student_id, String ismajor) {
		// TODO Auto-generated method stub
		return historyMapper.countmajorByyear(number, student_id, ismajor);
	}


}
