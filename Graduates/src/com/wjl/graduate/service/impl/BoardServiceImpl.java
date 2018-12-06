package com.wjl.graduate.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.BoardMapper;
import com.wjl.graduate.pojo.Board;
import com.wjl.graduate.service.IBoardService;
import com.wjl.graduate.utils.PageBean;


@Service("BoardService")
public class BoardServiceImpl implements IBoardService{

	@Resource(name="boardMapper")
	private BoardMapper  boardMapper;
	@Override
	public List<Board> findAll() {
		// TODO Auto-generated method stub
		 List <Board>  list = boardMapper.queryboard();
		return list;
	}
	@Override
	public Board findBoardById(int id) {
		// TODO Auto-generated method stub
		Board   board  = boardMapper.findBoardById(id);
		return board;
	}
	@Override
	public void addboard(Board board) {
		// TODO Auto-generated method stub
		boardMapper.addboard(board);
	}
	@Override
	public void updateBoardByID(Board board) {
		// TODO Auto-generated method stub
		boardMapper.updateBoardById(board);
	}
	@Override
	public boolean deleteBoard(int id) {
		// TODO Auto-generated method stub
		
		return boardMapper.deleteboard(id);
	}
	@Override
	public List<Board> findBoardBytype(int type) {
		// TODO Auto-generated method stub
		
		 List <Board>  list = boardMapper.findBoardBytype(type);
			return list;
	}
	
	@Override
	public PageBean getBean(int curPage,int type){
		//获取分页显示对象
		int pagesize=5;
		int totalrows=0;
		List<Board> data=null;
		PageBean pagebean=new PageBean();
		data=this.getPageBeanList(curPage,pagesize,type);
		totalrows=boardMapper.findBoardBytype(type).size();
		pagebean.setData(data);//设置每页数据信息
		pagebean.setPageSize(pagesize);//设置每页数据大小
		pagebean.setCurPage(curPage);//设置当前页数
		pagebean.setTotalRows(totalrows);//设置要分页显示的总行数
		return pagebean;
	}
	
	
	//获取学生分页链表 
	public List<Board> getPageBeanList(int curPage,int pagesize,int type){
		
		List<Board> data=new ArrayList<Board>();
		data = boardMapper.findSomeBoardBytype((curPage-1)*pagesize,pagesize,type);
		return data;
	}
	@Override
	public List<Board> findsomeBoardBytype(int type) {
		// TODO Auto-generated method stub
		List<Board> list = boardMapper.findsomeBoard(type);
		return list;
	}
	@Override
	public int counttotal() {
		// TODO Auto-generated method stub
		return boardMapper.counttotal();
	}
	
	
	
	
	
      
}
