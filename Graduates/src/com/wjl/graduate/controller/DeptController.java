package com.wjl.graduate.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.wjl.graduate.pojo.Dept;
import com.wjl.graduate.service.IDeptService;


@Controller("dept")
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	private IDeptService deptServiceImpl;
	
	//查询系部
		@RequestMapping("showdepts")
		public String showDepts(HttpServletRequest request){
			List<Dept> list=deptServiceImpl.findAll();
			//request放在里面
			request.setAttribute("depts",list);
			return "/WEB-INF/jsp/dept/showdept";
		}
	
	//根据id查询系部显示具体描述
		@RequestMapping("showdetails")
		public  String showDetail(HttpServletRequest request)
		{
			String idstr = request.getParameter("id");
		 	int id = Integer.parseInt(idstr);
			Dept dept = deptServiceImpl.findDeptById(id);
			request.setAttribute("dept", dept);
			return  "/WEB-INF/jsp/dept/deptdetail";
		}
		//根据id查询出系部信息显示在文本框
		@RequestMapping("showall")
		public  String finddept(HttpServletRequest request)
		{
			String idstr = request.getParameter("id");
		 	int id = Integer.parseInt(idstr);
			Dept dept = deptServiceImpl.findDeptById(id);
			request.setAttribute("dept", dept);
            return  "/WEB-INF/jsp/dept/editdept";
		}
       //保存更新系部信息
		@RequestMapping("updatedept")
		public  String updatedept(HttpServletRequest request,Dept model)
		{
		     deptServiceImpl.updateDeptByID(model);
			return  "redirect:/dept/showdepts";
		}
		//显示添加界面
			@RequestMapping("adddemo")
				public  String adddemo(HttpServletRequest request)
			{
					return  "/WEB-INF/jsp/dept/add";
				}
		//添加系部信息
		@RequestMapping("adddept")
		public  String adddept(HttpServletRequest request,Dept model)
		{
		     deptServiceImpl.adddept(model);
			return  "redirect:/dept/showdepts";
		}
}
