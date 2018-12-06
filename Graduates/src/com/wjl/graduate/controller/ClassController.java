package com.wjl.graduate.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wjl.graduate.pojo.Classes;
import com.wjl.graduate.pojo.Profession;
import com.wjl.graduate.service.IClassService;
import com.wjl.graduate.service.IProfessionService;

@Controller("classes")
@RequestMapping("/cla")
public class ClassController {
	@Autowired
	private IClassService classServiceImpl;
	@Autowired
	private IProfessionService proServiceImpl;
	//查询班级
		@RequestMapping("showclass")
		public String showDepts(HttpServletRequest request){
			List<Classes> list=classServiceImpl.findAll();
			//request放在里面
			request.setAttribute("classes",list);
			return "/WEB-INF/jsp/class/showclass";
		}

	

		//根据id查询出班级信息显示在文本框
		@RequestMapping("showall")
		public  String findclass(HttpServletRequest request)
		{
			String id = request.getParameter("id");
			Classes cla = classServiceImpl.findClassById(id);
			request.setAttribute("cla",cla);
		
            return  "/WEB-INF/jsp/class/editclass";
		}

       //保存系部信息
		@RequestMapping("updateclass")
		public  String updatedept(HttpServletRequest request,Classes model)
		{
		
			classServiceImpl.updateClassByID(model);
			
			return  "redirect:/cla/showclass";
		}
		
		
			
		//显示专业和添加界面
		@RequestMapping("showmajor")
			public String showmajor(HttpServletRequest request){
				List<Profession> list=proServiceImpl.findmajor();
				//request放在里面
				System.out.println(list);
				request.setAttribute("professions",list);
				return  "/WEB-INF/jsp/class/add";
			}
		
		//添加系部信息
		@RequestMapping("addclass")
		public  String addclass(HttpServletRequest request,Classes model)
		{
			System.out.println(model.getMajor());
			classServiceImpl.addClass(model);
			return  "redirect:/cla/showclass";
		}
		@RequestMapping("deleteclass")
		public  String deleteclass(HttpServletRequest request)
		{
			String id = request.getParameter("id");
			classServiceImpl.deleteClass(id);
			return  "redirect:/cla/showclass";
		}
}
