package com.wjl.graduate.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Board;


@Component("boardMapper")
public interface BoardMapper {
   
	public List<Board> queryboard();
	
	public  Board  findBoardById(int id);
	
	public   void  addboard(Board board);
	
	public  void  updateBoardById(Board board);
	
	public  boolean  deleteboard(int id);
	
	public List<Board> findBoardBytype(int type);
	
	public List<Board> findsomeBoard(int type);

	public List<Board> findSomeBoardBytype(@Param("offset")Integer offset, @Param("pagesize")Integer pagesize,@Param("type")Integer type);

    public int counttotal();
}
