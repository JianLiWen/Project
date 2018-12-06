package com.wjl.graduate.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wjl.graduate.pojo.Board;
import com.wjl.graduate.pojo.Student;
import com.wjl.graduate.service.IBoardService;
import com.wjl.graduate.utils.PageBean;


@Controller
@RequestMapping("/notice")
public class BoardController {
	@Autowired
	private IBoardService boardServiceImpl;
	
	   //查询公告
		@RequestMapping("/showboard")
		public String showboards(HttpServletRequest request){
			List<Board> list=boardServiceImpl.findAll();
			//request放在里面
			request.setAttribute("boards",list);
			return "/WEB-INF/jsp/board/showboard";
		}


		//详细信息
			@RequestMapping("/showdetail")
			public String showdetail(HttpServletRequest request){
			    int  id = Integer.valueOf(request.getParameter("id"));
				Board board = boardServiceImpl.findBoardById(id);
				//request放在里面
				request.setAttribute("board",board);
				return "/WEB-INF/jsp/board/detail";
			}

			//添加信息
			@RequestMapping("/addboard")
			public String addboard(HttpServletRequest request,Board model){
			
				 boardServiceImpl.addboard(model);
				//request放在里面
				return "redirect:/notice/showboard";
			}

			//显示添加界面
			@RequestMapping("adddemo")
				public  String adddemo(HttpServletRequest request)
			{
					return  "/WEB-INF/jsp/board/add";
				}
			
			//后台根据id查询出信息显示在文本框
			@RequestMapping("showall")
			public  String findboard(HttpServletRequest request)
			{
				String id = request.getParameter("id");
				int idd = Integer.valueOf(id);
				Board board = boardServiceImpl.findBoardById(idd);
				request.setAttribute("board",board);
	            return  "/WEB-INF/jsp/board/editboard";
			}
			
			 //保存信息
			@RequestMapping("updateboard")
			public  String updateboard(HttpServletRequest request,Board model)
			{
			
				boardServiceImpl.updateBoardByID(model);
				
				return  "redirect:/notice/showboard";
			}
			 //删除信息
			@RequestMapping("deleteboard")
			public  String deleteboard(HttpServletRequest request)
			{
				String id = request.getParameter("id");
				int idd = Integer.valueOf(id);
			     boolean flag = false;
			     flag = boardServiceImpl.deleteBoard(idd);
			     request.setAttribute("status", flag);
				return  "redirect:/notice/showboard";
			}
			/*//显示前台界面
			@RequestMapping("board")
				public  String board(HttpServletRequest request)
			{
					return  "/WEB-INF/jsp/board/board";
				}*/
	
			 //前台显示公告热点新闻
			@RequestMapping("/bshowboard")
			public String showboard(HttpServletRequest request){
				String curPageStr = request.getParameter("page");
				Integer curPage = null;
				if(curPageStr == null){
					curPage = 1;
				}else{
					curPage = Integer.parseInt(curPageStr);
				}
				int type =1;
				PageBean pageBean = boardServiceImpl.getBean(curPage, type);
				//request放在里面
				request.setAttribute("pageBean",pageBean);
				return "/WEB-INF/jsp/board/news";
			}
			
			 //前台显示公告就业信息
			@RequestMapping("/showjob")
			public String showjob(HttpServletRequest request){
				String curPageStr = request.getParameter("page");
				Integer curPage = null;
				if(curPageStr == null){
					curPage = 1;
				}else{
					curPage = Integer.parseInt(curPageStr);
				}
				int type =2;
				PageBean pageBean = boardServiceImpl.getBean(curPage, type);
				//request放在里面
				request.setAttribute("pageBean",pageBean);
				return "/WEB-INF/jsp/board/job";
			}
			 //前台显示公告校内通知
			@RequestMapping("/shownotice")
			public String shownotice(HttpServletRequest request){
				String curPageStr = request.getParameter("page");
				Integer curPage = null;
				if(curPageStr == null){
					curPage = 1;
				}else{
					curPage = Integer.parseInt(curPageStr);
				}
				int type =3;
				PageBean pageBean = boardServiceImpl.getBean(curPage, type);
				//request放在里面
				request.setAttribute("pageBean",pageBean);
				return "/WEB-INF/jsp/board/notice";
			}

			//详细信息
			@RequestMapping("/bshowdetail")
			public String bshowdetail(HttpServletRequest request){
			    int  id = Integer.valueOf(request.getParameter("id"));
				Board board = boardServiceImpl.findBoardById(id);
				//request放在里面
				request.setAttribute("board",board);
				return "/WEB-INF/jsp/board/detaildemo";
			}

}
