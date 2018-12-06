package com.wjl.graduate.service;

import java.util.List;

import com.wjl.graduate.pojo.Board;
import com.wjl.graduate.utils.PageBean;


public interface IBoardService {
	
	public List<Board> findAll();
	
	public List<Board> findBoardBytype(int type);
	
	public List<Board> findsomeBoardBytype(int type);
	
	public Board findBoardById(int id);

	public  void addboard(Board board);
	
	public void updateBoardByID(Board board);
	
	public boolean deleteBoard(int  id);
	
	public PageBean getBean(int curPage,int type);
	
	  public int counttotal();
	/*public  void  finishinfo(Student student);
	
	public  void addStudent(Student student);
	
	
	
	public  List<Integer>  excelStudent(Workbook wb, String fileName ) throws Exception;*/
}
