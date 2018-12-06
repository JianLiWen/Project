package com.wjl.graduate.controller;


import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.HTTP;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjl.graduate.pojo.Classes;
import com.wjl.graduate.pojo.Student;
import com.wjl.graduate.service.IClassService;
import com.wjl.graduate.service.IStudentService;
import com.wjl.graduate.service.impl.StudentServiceImpl;

@Controller("count")
@RequestMapping("/count")
public class CountController {
	@Autowired
	private IStudentService studentServiceImpl;
	@Autowired
	private IClassService classServiceImpl;
	   //后台地区报表
		@RequestMapping("showplace")
		public String showplaces(HttpServletRequest request){
			List<String> list=studentServiceImpl.findplace();
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			int total=0;
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countplace(list.get(i));		
			map.put(list.get(i), number);
			total+=number;
			}
			request.setAttribute("map", map);
			request.setAttribute("total", total);
		
			String place = null,secondplace=null;
			double scale = 0 ,secondscale = 0;
			int max = 0,secondmax = 0;
			//int totals = studentServiceImpl.counttotal();
			 DecimalFormat df = new DecimalFormat("#.00");
			 //找最大值
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countplace(list.get(i));	
			 if(number>max)
			 {
				 max = number;
				 place = list.get(i);		
				 scale = (double)number/total*100 ;		 
			 }	
			}
			//找次最大值
			for( int i=0;i<list.size();i++)
			{
			int number2=studentServiceImpl.countplace(list.get(i));	
			 if(number2>=secondmax&&number2<max)
			 {
				 secondmax = number2;
				 secondplace = list.get(i);		
				 secondscale = (double)number2/total*100 ;		 
			 }	
			}
			System.out.println(max);
			System.out.println("我的");
	        request.setAttribute("max", max);
			request.setAttribute("place", place);
			request.setAttribute("scale", df.format(scale));
			request.setAttribute("secondmax", secondmax);
			request.setAttribute("secondplace", secondplace);
			request.setAttribute("secondscale", df.format(secondscale));
		
			return "/WEB-INF/jsp/count/place";
		}
		
		 //就业方向报表
		@RequestMapping("showdirection")
		public String showdirection(HttpServletRequest request,HttpSession session){
			List<String> list=studentServiceImpl.finddirection();
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			int total=0;
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countdirection(list.get(i));		
			map.put(list.get(i), number);
			total+=number;
			}
			request.setAttribute("map", map);
			request.setAttribute("total", total);

			List<String> types = studentServiceImpl.findtype();
			String type="计算机";
			List<String> list1=studentServiceImpl.finddirectionBytype(type);
			String most = null,seconddirection=null;
			int dmax = 0,dsecond = 0;
			 //找最大值
			for(int i=0;i<list1.size();i++)
			{
			int number	=studentServiceImpl.countdirection(list1.get(i));	
			 if(number>dmax)
			 {
				 dmax = number;
				 most = list1.get(i);		
			 }	
			}
			//找次最大值
			for( int i=0;i<list1.size();i++)
			{
			int number2=studentServiceImpl.countdirection(list1.get(i));	
			 if(number2>=dsecond&&number2<dmax)
			 {
				 dsecond = number2;
				 seconddirection = list1.get(i);		
			 }	
			}
			System.out.println(most);
			session.setAttribute("types", types);
			request.setAttribute("most", most);
			request.setAttribute("dmax", dmax);
			request.setAttribute("dsecond", dsecond);
			request.setAttribute("seconddirection", seconddirection);
		
			return "/WEB-INF/jsp/count/direction";
		}
		//显示就业地区分析(全校毕业生)
		@RequestMapping("place")
		public  String  pdemo(HttpServletRequest request)
		{
			List<String> list=studentServiceImpl.findplace();
			String place = null,secondplace=null;
			double scale = 0 ,secondscale = 0;
			int max = 0,secondmax = 0;
			int total = studentServiceImpl.counttotal();
			 DecimalFormat df = new DecimalFormat("#.00");
			 //找最大值
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countplace(list.get(i));	
			 if(number>max)
			 {
				 max = number;
				 place = list.get(i);		
				 scale = (double)number/total*100 ;		 
			 }	
			}
			//找次最大值
			for( int i=0;i<list.size();i++)
			{
			int number2=studentServiceImpl.countplace(list.get(i));	
			 if(number2>=secondmax&&number2<max)
			 {
				 secondmax = number2;
				 secondplace = list.get(i);		
				 secondscale = (double)number2/total*100 ;		 
			 }	
			}
			System.out.println(max);
			System.out.println("我的");
	        request.setAttribute("max", max);
			request.setAttribute("place", place);
			request.setAttribute("scale", df.format(scale));
			request.setAttribute("secondmax", secondmax);
			request.setAttribute("secondplace", secondplace);
			request.setAttribute("secondscale", df.format(secondscale));
			
			String type="计算机";
			List<String> list1=studentServiceImpl.finddirectionBytype(type);
			String most = null,seconddirection=null;
			int dmax = 0,dsecond = 0;
			 //找最大值
			for(int i=0;i<list1.size();i++)
			{
			int number	=studentServiceImpl.countdirection(list1.get(i));	
			 if(number>dmax)
			 {
				 dmax = number;
				 most = list1.get(i);		
			 }	
			}
			//找次最大值
			for( int i=0;i<list1.size();i++)
			{
			int number2=studentServiceImpl.countdirection(list1.get(i));	
			 if(number2>=dsecond&&number2<dmax)
			 {
				 dsecond = number2;
				 seconddirection = list1.get(i);		
			 }	
			}
			System.out.println(most);
			request.setAttribute("most", most);
			request.setAttribute("dmax", dmax);
			request.setAttribute("dsecond", dsecond);
			request.setAttribute("seconddirection", seconddirection);
			
			return  "/main";
		}
		
		
		//(就业地区全校学生统计图)
		@RequestMapping("placedemo")
		public @ResponseBody String showplace(HttpServletRequest request, HttpServletResponse response){
			
		//	System.out.println("查询就业地区、、、、、、、、、、、、、、、、、、、、、");
			
			List<String> list=studentServiceImpl.findplace();
			JSONArray arr = new JSONArray();
			int total=0;
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countplace(list.get(i));		
			total+=number;
			}
			
			//System.out.println("总人数"+total);
			for (String placeName : list) {
				if(placeName!=null&&!placeName.equals("")){
					JSONObject obj = new JSONObject();
					int some = studentServiceImpl.countplace(placeName);
					DecimalFormat df = new DecimalFormat("#.00");
					double scale = (double)some/total*100 ;
					obj.put("value", df.format(scale));
					obj.put("name", placeName);
					arr.put(obj);
				}
			}
			/*System.out.println("正在输出字符串、、、、、、、、、、、");
			System.out.println(arr.toString());*/
			return arr.toString();
		}
	     
		//显示就业地区分析(本班学生)
		  @RequestMapping("classplace")
			public  String  cpdemo(HttpServletRequest request,HttpSession  session)
				{
			     String  classid = (String)session.getAttribute("classid");	
				List<String> list=studentServiceImpl.findplaceByclass(classid);
				
					String place = null,secondplace=null;
					double scale = 0 ,secondscale = 0;
					int max = 0,secondmax = 0;
					Classes classes = classServiceImpl.findClassById(classid);
					int total = classes.getNumber();
					 DecimalFormat df = new DecimalFormat("#.00");
					 //找最大值
					for(int i=0;i<list.size();i++)
					{
					int number	=studentServiceImpl.countplaceByclass(list.get(i),classid);	
					 if(number>max)
					 {
						 max = number;
						 place = list.get(i);		
						 scale = (double)number/total*100 ;		 
					 }	
					}
					//找次最大值
					for( int i=0;i<list.size();i++)
					{
					int number2=studentServiceImpl.countplaceByclass(list.get(i),classid);	
					 if(number2>=secondmax&&number2<max)
					 {
						 secondmax = number2;
						 secondplace = list.get(i);		
						 secondscale = (double)number2/total*100 ;		 
					 }	
					}
					System.out.println(max);
					System.out.println("我的");
			        request.setAttribute("max", max);
					request.setAttribute("place", place);
					request.setAttribute("scale", df.format(scale));
					request.setAttribute("secondmax", secondmax);
					request.setAttribute("secondplace", secondplace);
					request.setAttribute("secondscale", df.format(secondscale));
					
					return  "/WEB-INF/jsp/count/classplacedemo";
				}
		//(前台登录后显示就业地区本班学生统计图)
		@RequestMapping("classplacedemo")
		public @ResponseBody String showclassplace(HttpSession  session, HttpServletResponse response){
					
			System.out.println("查询就业地区、、、、、、、、、、、、、、、、、、、、、");
		    String  classid = (String)session.getAttribute("classid");	
			List<String> list=studentServiceImpl.findplaceByclass(classid);
			JSONArray arr = new JSONArray();
			Classes classes = classServiceImpl.findClassById(classid);
			int total = classes.getNumber();
					//System.out.println("总人数"+total);
			System.out.println("总人数"+total);
			for (String placeName : list) {
				if(placeName!=null&&!placeName.equals("")){
				JSONObject obj = new JSONObject();
				int some = studentServiceImpl.countplaceByclass(placeName, classid);
			  System.out.println("有多少人"+some);
				DecimalFormat df = new DecimalFormat("#.00");
				double scale = (double)some/total*100 ;
				obj.put("value", df.format(scale));
			  obj.put("name", placeName);
				arr.put(obj);
						}
					}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
					return arr.toString();
				}
		@RequestMapping("classplacedemo1")
		public @ResponseBody String showclassplace1(HttpSession  session, HttpServletResponse response){
					
			System.out.println("查询就业地区、、、、、、、、、、、、、、、、、、、、、");
		    String  classid = (String)session.getAttribute("classid");	
			List<String> list=studentServiceImpl.findplaceByclass(classid);
			JSONArray arr = new JSONArray();
			Classes classes = classServiceImpl.findClassById(classid);
			int total = classes.getNumber();
					//System.out.println("总人数"+total);
			System.out.println("总人数"+total);
			for (String placeName : list) {
				if(placeName!=null&&!placeName.equals("")){
				JSONObject obj = new JSONObject();
				int some = studentServiceImpl.countplaceByclass(placeName, classid);
				obj.put("value", some);
			    obj.put("name", placeName);
				arr.put(obj);
						}
					}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
					return arr.toString();
			}
		//前台显示统计图就业方向的数据
		@RequestMapping("directiondemo")
     	public @ResponseBody String showdirection(HttpServletRequest request, HttpServletResponse response){
					
				String type="计算机";		
				List<String> list=studentServiceImpl.finddirectionBytype(type);
				JSONArray arr = new JSONArray();
					//System.out.println("总人数"+total);
				for (String directionName : list) {
				if(directionName!=null&&!directionName.equals("")){
				
			   	 JSONObject obj = new JSONObject();
				int some = studentServiceImpl.countdirection(directionName);
					obj.put("value", some);
					obj.put("name", directionName);
					arr.put(obj);
						}
					}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
					return arr.toString();
				}
		

		//前台显示统计图就业方向的数据
		@RequestMapping("directiondemo1")
     	public @ResponseBody String showdirection1(HttpSession session, HttpServletResponse response){
					
				String type = (String) session.getAttribute("type");
				
				System.out.println("类型"+type);
				List<String> list=studentServiceImpl.finddirectionBytype(type);
				JSONArray arr = new JSONArray();
					//System.out.println("总人数"+total);
				for (String directionName : list) {
				if(directionName!=null&&!directionName.equals("")){
				
			   	 JSONObject obj = new JSONObject();
				int some = studentServiceImpl.countdirection(directionName);
					obj.put("value", some);
					obj.put("name", directionName);
					arr.put(obj);
						}
					}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
					
				return arr.toString();
				}
		
		//显示就业分析界面
		@RequestMapping("direction1")
		public  String  directiondemo1(HttpServletRequest request,HttpSession session)
		{
			List<String> list=studentServiceImpl.finddirection();
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			int total=0;
			for(int i=0;i<list.size();i++)
			{
			int number	=studentServiceImpl.countdirection(list.get(i));		
			map.put(list.get(i), number);
			total+=number;
			}
			request.setAttribute("map", map);
			request.setAttribute("total", total);
			
			
			
			String type = request.getParameter("type");
			System.out.println("初始接收到的"+type);
			session.setAttribute("type", type);
			List<String> list1=studentServiceImpl.finddirectionBytype(type);
			String most = null,seconddirection=null;
			int dmax = 0,dsecond = 0;
			 //找最大值
			for(int i=0;i<list1.size();i++)
			{
			int number	=studentServiceImpl.countdirection(list1.get(i));	
			 if(number>dmax)
			 {
				 dmax = number;
				 most = list1.get(i);		
			 }	
			}
			//找次最大值
			for( int i=0;i<list1.size();i++)
			{
			int number2=studentServiceImpl.countdirection(list1.get(i));	
			 if(number2>=dsecond&&number2<dmax)
			 {
				 dsecond = number2;
				 seconddirection = list1.get(i);		
			 }	
			}
			request.setAttribute("most", most);
			request.setAttribute("dmax", dmax);
			request.setAttribute("dsecond", dsecond);
			request.setAttribute("seconddirection", seconddirection);
			return  "/WEB-INF/jsp/count/direction1";
		}
		
		//前台显示本班就业方向人数分析
			@RequestMapping("classdirection")
			public  String  classdirectiondemo(HttpServletRequest request,HttpSession session)
			{
					
				String classid =(String) session.getAttribute("classid");
				List<String> list1=studentServiceImpl.finddirectionByclass(classid);
				String most = null,seconddirection=null;
				int dmax = 0,dsecond = 0;
				 //找最大值
					for(int i=0;i<list1.size();i++)
					{
					int number	=studentServiceImpl.countdirectionByclass(list1.get(i),classid);	
					 if(number>dmax)
					 {
						 dmax = number;
						 most = list1.get(i);		
					 }	
					}
					//找次最大值
					for( int i=0;i<list1.size();i++)
					{
					int number2=studentServiceImpl.countdirectionByclass(list1.get(i),classid);		
					 if(number2>=dsecond&&number2<dmax)
					 {
						 dsecond = number2;
						 seconddirection = list1.get(i);		
					 }	
					}
					System.out.println(most);
					request.setAttribute("most", most);
					request.setAttribute("dmax", dmax);
					request.setAttribute("dsecond", dsecond);
					request.setAttribute("seconddirection", seconddirection);
					
					return  "/WEB-INF/jsp/count/classdirectiondemo";
				}
				
				//前台显示本班就业方向统计图
				@RequestMapping("classdirectiondemo")
		     	public @ResponseBody String showclassdirection(HttpServletRequest request, HttpSession session){
							
						
					String classid =(String) session.getAttribute("classid");
					List<String> list=studentServiceImpl.finddirectionByclass(classid);
						JSONArray arr = new JSONArray();
							//System.out.println("总人数"+total);
						for (String directionName : list) {
						if(directionName!=null&&!directionName.equals("")){
						
					   	 JSONObject obj = new JSONObject();
						int some = studentServiceImpl.countdirectionByclass(directionName, classid);
							obj.put("value", some);
							obj.put("name", directionName);
							arr.put(obj);
								}
							}
							/*System.out.println("正在输出字符串、、、、、、、、、、、");
							System.out.println(arr.toString());*/
							return arr.toString();
						}
		//显示专业分析(全校毕业生)
		@RequestMapping("showmajor")
		public  String  majordemo(HttpServletRequest request,HttpSession session)
		{
		
			DecimalFormat df = new DecimalFormat("#.00");			
			int yesnumber = studentServiceImpl.countmajor("是");	
			int nonumber = studentServiceImpl.countmajor("否");	
			int total = yesnumber+nonumber;
			double yscale = 0,nscale = 0;
			yscale=(double)yesnumber/total*100;
			nscale=(double)nonumber/total*100;
	        request.setAttribute("yscale", df.format(yscale));
	        request.setAttribute("nscale", df.format(nscale));
			
			return  "/WEB-INF/jsp/count/majordemo";
		}
				
		//前台显示专业统计图的数据
		@RequestMapping("majordemo")
		public @ResponseBody String showmajor(HttpServletRequest request, HttpServletResponse response){
					
/*					System.out.println("查询专业、、、、、、、、、、、、、、、、、、、、、");
*/					
					List<String> list=studentServiceImpl.findmajor();
					JSONArray arr = new JSONArray();
					int yesnumber = studentServiceImpl.countmajor("是");	
					int nonumber = studentServiceImpl.countmajor("否");	
					int total = yesnumber+nonumber;
					//System.out.println("总人数"+total);
					for (String ismajor : list) {
						if(ismajor!=null&&!ismajor.equals("")){
							JSONObject obj = new JSONObject();
							int some = studentServiceImpl.countmajor(ismajor);
							DecimalFormat df = new DecimalFormat("#.00");
							double scale = (double)some/total*100 ;
							obj.put("value", df.format(scale));
							obj.put("name", ismajor);
							arr.put(obj);
						}
					}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
					return arr.toString();
				}
		//显示本班专业分析
		@RequestMapping("classmajor")
		public  String  classmajordemo(HttpServletRequest request,HttpSession session)
		{
			String  classid = (String)session.getAttribute("classid");
			DecimalFormat df = new DecimalFormat("#.00");			
			int yesnumber = studentServiceImpl.countmajorByclass("是", classid);
			int nonumber = studentServiceImpl.countmajorByclass("否", classid);
	        request.setAttribute("yes", yesnumber);
	        request.setAttribute("no", nonumber);
			
			return  "/WEB-INF/jsp/count/classmajordemo";
		}
		
		//前台显示本班专业统计图的数据
			@RequestMapping("classmajordemo")
		public @ResponseBody String showclassmajor(HttpServletRequest request, HttpSession session){
							
		/*System.out.println("查询专业、、、、、、、、、、、、、、、、、、、、、");
		*/		String  classid = (String)session.getAttribute("classid");
				List<String> list=studentServiceImpl.findmajorByclass(classid);
				JSONArray arr = new JSONArray();
				for (String ismajor : list) {
				if(ismajor!=null&&!ismajor.equals("")){
					JSONObject obj = new JSONObject();
					int some = studentServiceImpl.countmajorByclass(ismajor, classid);
					obj.put("value", some);
					obj.put("name", ismajor);
						arr.put(obj);
					}
				}
					/*System.out.println("正在输出字符串、、、、、、、、、、、");
					System.out.println(arr.toString());*/
				return arr.toString();
			}
			//历史分析出现下拉框选择界面
			@RequestMapping("select")
			public  String select(HttpServletRequest request)
			{
				
	            return  "/WEB-INF/jsp/count/select";
			}
			
			
			//统计毕业生一年后就业地点
			@RequestMapping("yearplace")
			public  String  yearplacedemo(HttpServletRequest request,HttpSession session)
			{
				String year = request.getParameter("year");
				System.out.println(year);
				String student_id = request.getParameter("student_id");
				List<String> list=studentServiceImpl.findplaceByyear(year, student_id);
				HashMap<String, Integer> map=new HashMap<String, Integer>();
				int total=0;
				for(int i=0;i<list.size();i++)
				{
				int number	=studentServiceImpl.countplaceByyear(year, student_id, list.get(i));
				map.put(list.get(i), number);
				total+=number;
				}
				request.setAttribute("map", map);
				request.setAttribute("year", student_id);
				request.setAttribute("num", year);
				request.setAttribute("total", total);
			
				String place = null,secondplace=null;
				double scale = 0 ,secondscale = 0;
				int max = 0,secondmax = 0;
				int totals =  studentServiceImpl.yeartotal(year, student_id);
				 DecimalFormat df = new DecimalFormat("#.00");
				 //找最大值
				for(int i=0;i<list.size();i++)
				{
				int number = studentServiceImpl.countplaceByyear(year, student_id, list.get(i));
				 if(number>max)
				 {
					 max = number;
					 place = list.get(i);		
					 scale = (double)number/totals*100 ;		 
				 }	
				}
				//找次最大值
				for( int i=0;i<list.size();i++)
				{
				int number2=studentServiceImpl.countplaceByyear(year, student_id, list.get(i));
				 if(number2>=secondmax&&number2<max)
				 {
					 secondmax = number2;
					 secondplace = list.get(i);		
					 secondscale = (double)number2/totals*100 ;		 
				 }	
				}
				System.out.println(max);
				System.out.println("我的");
		        request.setAttribute("max", max);
				request.setAttribute("place", place);
				request.setAttribute("scale", df.format(scale));
				request.setAttribute("secondmax", secondmax);
				request.setAttribute("secondplace", secondplace);
				request.setAttribute("secondscale", df.format(secondscale));
				
				//就业方向报表
				List<String> list1=studentServiceImpl.finddirectionByyear(year, student_id);
				HashMap<String, Integer> map1=new HashMap<String, Integer>();
				int total2=0;
				for(int i=0;i<list1.size();i++)
				{
				int number1	=studentServiceImpl.countdirectionByyear(year, student_id, list1.get(i));
				map1.put(list1.get(i), number1);
				total2+=number1;
				}
				List<String> types = studentServiceImpl.findtype();
					
				request.setAttribute("map1", map1);
				
				request.setAttribute("total2", total2);
				session.setAttribute("types", types);
				
				//就业方向分析显示
				String type="计算机";
				List<String> list2=studentServiceImpl.finddirectionBytype(type);
				String most = null,seconddirection=null;
				int dmax = 0,dsecond = 0;
				 //找最大值
				for(int i=0;i<list2.size();i++)
				{
				int number	=studentServiceImpl.countdirectionByyear(year, student_id, list2.get(i));
				 if(number>dmax)
				 {
					 dmax = number;
					 most = list2.get(i);		
				 }	
				}
				//找次最大值
				for( int i=0;i<list2.size();i++)
				{
				int number2=studentServiceImpl.countdirectionByyear(year, student_id, list2.get(i));	
				 if(number2>=dsecond&&number2<dmax)
				 {
					 dsecond = number2;
					 seconddirection = list2.get(i);		
				 }	
				}
				System.out.println(most);
				session.setAttribute("types", types);
				request.setAttribute("most", most);
				request.setAttribute("dmax", dmax);
				request.setAttribute("dsecond", dsecond);
				request.setAttribute("seconddirection", seconddirection);
			
				
				int yesnumber = studentServiceImpl.countmajorByyear(year, student_id, "是");
				int nonumber = studentServiceImpl.countmajorByyear(year, student_id, "否");
				double yscale = 0,nscale = 0;
				yscale=(double)yesnumber/totals*100;
				nscale=(double)nonumber/totals*100;
				request.setAttribute("yscale", df.format(yscale));
				request.setAttribute("nscale", df.format(nscale));
						
				request.setAttribute("year", year);
				request.setAttribute("student_id", student_id);
				
				return "/WEB-INF/jsp/count/historyplace";
		
			}
			//根据毕业生级别查询第二个下拉框
			@RequestMapping("timediff")
			public @ResponseBody String selectdiff(HttpServletRequest request,String id){
				
				System.out.println("进来啦");
				JSONArray arr = new JSONArray();
				id = (String)request.getParameter("id");
				int timediff = studentServiceImpl.TimeDiff(id);
			    for(int i=1;i<=timediff;i++)
			    {
			    	JSONObject obj = new JSONObject();
			    	obj.put("id", i);
					obj.put("year", i);
					arr.put(obj);
			    }
			    return arr.toString();
			}
		   
			//(11级毕业1年后就业地区分届分年学生统计图)
			@RequestMapping("yearplacedemo")
			public @ResponseBody String showyearplace(HttpServletRequest request, HttpServletResponse response){
				String year = request.getParameter("year");
				String student_id = request.getParameter("student_id");
				List<String> list=studentServiceImpl.findplaceByyear(year, student_id);
				JSONArray arr = new JSONArray();
				int total =  studentServiceImpl.yeartotal(year, student_id);
				//System.out.println("总人数"+total);
				for (String placeName : list) {
					if(placeName!=null&&!placeName.equals("")){
						JSONObject obj = new JSONObject();
						int some = studentServiceImpl.countplaceByyear(year, student_id, placeName);
						DecimalFormat df = new DecimalFormat("#.00");
						double scale = (double)some/total*100 ;
						obj.put("value", df.format(scale));
						obj.put("name", placeName);
						arr.put(obj);
					}
				}
				
				return arr.toString();
			}
			
			//(11级毕业1年后就业方向分届分年学生统计图就业方向)
			@RequestMapping("yeardirectiondemo")
			public @ResponseBody String showyeardirection(HttpServletRequest request, HttpServletResponse response){
				String year = request.getParameter("year");
				String student_id = request.getParameter("student_id");
				List<String> list=studentServiceImpl.finddirectionByyear(year, student_id);
				JSONArray arr = new JSONArray();
				for (String direction : list) {
					if(direction!=null&&!direction.equals("")){
						JSONObject obj = new JSONObject();
						int some = studentServiceImpl.countdirectionByyear(year, student_id, direction);
						obj.put("value", some);
						obj.put("name", direction);
						arr.put(obj);
					}
				}
				
				return arr.toString();
			}
    
			//显示专业统计图的数据
			@RequestMapping("yearmajordemo")
			public @ResponseBody String showyearmajor(HttpServletRequest request, HttpServletResponse response){
						
	/*					System.out.println("查询专业、、、、、、、、、、、、、、、、、、、、、");
	*/					String year = request.getParameter("year");
	String student_id = request.getParameter("student_id");
						List<String> list=studentServiceImpl.findmajor();
						JSONArray arr = new JSONArray();
						int total =  studentServiceImpl.yeartotal(year, student_id);
						for (String ismajor : list) {
							if(ismajor!=null&&!ismajor.equals("")){
								JSONObject obj = new JSONObject();
								int some = studentServiceImpl.countmajorByyear(year, student_id, ismajor);
								DecimalFormat df = new DecimalFormat("#.00");
								double scale = (double)some/total*100 ;
								obj.put("value", df.format(scale));
								obj.put("name", ismajor);
								arr.put(obj);
							}
						}
						/*System.out.println("正在输出字符串、、、、、、、、、、、");
						System.out.println(arr.toString());*/
						return arr.toString();
					}
			@RequestMapping(value="/exports1", method = RequestMethod.GET)
			public ResponseEntity<byte[]> exportStudent(HttpServletRequest request) throws IOException{
				File file = studentServiceImpl.exportplace();
		        HttpHeaders headers = new HttpHeaders();
		        //下载显示的文件名，解决中文名称乱码问题
		        String downloadFilelName = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");
		        //通知浏览器以attachment（下载方式）打开图片
		        headers.setContentDispositionFormData("attachment", downloadFilelName);
		        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
		        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
		                headers, HttpStatus.CREATED);
			} 
			//导出就业方向
			@RequestMapping(value="/exports2", method = RequestMethod.GET)
			public ResponseEntity<byte[]> exportdir(HttpServletRequest request) throws IOException{
				File file = studentServiceImpl.exportdirection();
		        HttpHeaders headers = new HttpHeaders();
		        //下载显示的文件名，解决中文名称乱码问题
		        String downloadFilelName = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");
		        //通知浏览器以attachment（下载方式）打开图片
		        headers.setContentDispositionFormData("attachment", downloadFilelName);
		        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
		        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
		                headers, HttpStatus.CREATED);
			} 
}
