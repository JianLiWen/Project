package com.wjl.graduate.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wjl.graduate.pojo.Classes;
import com.wjl.graduate.pojo.History;
import com.wjl.graduate.pojo.Message;
import com.wjl.graduate.pojo.Student; 
import com.wjl.graduate.pojo.User;
import com.wjl.graduate.service.IClassService;
import com.wjl.graduate.service.IMessageService;
import com.wjl.graduate.service.IStudentService;
import com.wjl.graduate.service.IUserService;
import com.wjl.graduate.utils.ReadExcel;

@Controller("student")
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private IStudentService studentServiceImpl;
	@Autowired
	private IUserService usrServiceImpl;
	@Autowired
	private IMessageService messageServiceImpl;
	@Autowired
	private IClassService classServiceImpl;
	   //查询学生
		@RequestMapping("showstudent")
		public String showDepts(HttpServletRequest request){
			List<Student> list=studentServiceImpl.findAll();
			//request放在里面
			request.setAttribute("students",list);
			return "/WEB-INF/jsp/student/showstudent";
		}
	   
		 //学生登录后显示姓名
		@RequestMapping("showname")
		public String showName(HttpServletRequest request,HttpSession session){
			User  user = (User) session.getAttribute("user");
			String id = user.getUsername();
			Student student = studentServiceImpl.findStudentById(id);
		//request放在里面
			request.setAttribute("student",student);
			return "/index1";
		}
		
		//后台根据id查询出学生信息显示在文本框
		@RequestMapping("showall")
		public  String findStudent(HttpServletRequest request)
		{
			String id = request.getParameter("id");
			Student student = studentServiceImpl.findStudentById(id);
			request.setAttribute("student",student);
            return  "/WEB-INF/jsp/student/editstudent";
		}
		//前台根据id查询出学生信息显示在文本框,同时显示工作历经历
		@RequestMapping("beforeshowall")
		public  String queryStudent(HttpServletRequest request,HttpSession session)
		{
			//String id = request.getParameter("id");
			String id =(String) session.getAttribute("id");
			Student student = studentServiceImpl.findStudentById(id);
			request.setAttribute("student",student);
			 List<History>  list = studentServiceImpl.findhistory(id);
			 String author = (String)session.getAttribute("name");
			  List<Message> messages = messageServiceImpl.mymessage(author);
			  request.setAttribute("messages", messages);
			 request.setAttribute("historys",list);		
            return  "/WEB-INF/jsp/student/personalin";
		}
		
       //保存学生信息
		@RequestMapping("updatestudent")
		public  String updatestudent(HttpServletRequest request,Student model)
		{
		
			studentServiceImpl.updateStudentByid(model);
			
			return  "redirect:/student/showstudent";
		}
		
		//前台保存用户修改信息
		@RequestMapping("save")
		public  String save(HttpSession  session,Student model)
		{
			
			String id = (String) session.getAttribute("id");
			model.setId(id);
			studentServiceImpl.updateStudentByID(model);
			
			return "redirect:/student/beforeshowall";
		}
		
				
		//显示添加界面
		@RequestMapping("adddemo")
			public  String adddemo(HttpServletRequest request)
		{
			    List<Classes> classes = classServiceImpl.findAll();
				request.setAttribute("classes", classes);
			    return  "/WEB-INF/jsp/student/add";
			}
		
		//显示录入界面
		@RequestMapping("exceldemo")
		public  String exceldemo(HttpServletRequest request)
		{
			return  "/WEB-INF/jsp/student/excel";
		}
		//显示录入界面
		@RequestMapping("index1demo")
	   public  String index1demo(HttpServletRequest request)
		{
				return  "/index1";
				}
		//通讯录
		@RequestMapping("contact")
		public  String contact(HttpServletRequest request,HttpSession session,String classid)
		{
			classid  = (String)session.getAttribute("classid");
			List<Student> list=studentServiceImpl.findStudentByclassId(classid);
			//request放在里面
			request.setAttribute("students",list);
			return  "/WEB-INF/jsp/contact/econtact";
		}
		
		//初始化信息后保存并进入主页面
  		@RequestMapping("inital")
  		public  String inital(HttpServletRequest request,Student model) throws Exception 
  		{
  			
  			String id = request.getParameter("id");
  			String name =new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
  			request.setAttribute("name", name);
  			model.setId(id);
  			String  password = request.getParameter("pawd");
  			studentServiceImpl.finishinfo(model);		
  			usrServiceImpl.updatepawd(id, password);	
  			return  "/index1";
  		}
  		
		/*	
		//显示专业和添加界面
		@RequestMapping("showmajor")
			public String showmajor(HttpServletRequest request){
				List<Profession> list=proServiceImpl.findmajor();
				//request放在里面
				System.out.println(list);
				request.setAttribute("professions",list);
				return  "/WEB-INF/jsp/class/add";
			}*/
		
		//添加系部信息
		@RequestMapping("addstudent")
		public  String addclass(HttpServletRequest request,Student model)
		{	
			studentServiceImpl.addStudent(model);
			return  "redirect:/student/showstudent";
		}
		@InitBinder
		public void initBinder(WebDataBinder binder)
		{
			binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		}
		//逻辑删除学生的同时注销登录账号
		@RequestMapping("deletestudent")
		public  String deleteclass(HttpServletRequest request)
		{
			String id = request.getParameter("id");
			System.out.println("id");
			User user = usrServiceImpl.findUserByName(id);
			studentServiceImpl.deleteStudent(id);
			usrServiceImpl.deleteuser(user.getId());
			return  "redirect:/student/showstudent";
		}
		@RequestMapping(value = "/ImportXls")
		public String ImporXls(@RequestParam(value = "filename") MultipartFile file, HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			// 判断文件是否为空
			
			 if (file == null) {System.out.println("文件为空");}
			 
			// 获取文件名
			String fileName = file.getOriginalFilename();// 教师文件名
			// 进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
			long size = file.getSize();// 教师文件名长度
			// 1.通过对文件名进行文件存在的判断
			// 2.可以同时导入两个文件，也可以只导入一个
			// 3.没有选着文件时，系统报错，文件名为空
			if (fileName == null || ("").equals(fileName) && size == 0) {
				System.out.println("文件名为空");
			} else {
				infouser(fileName, file);
			}
			return  "redirect:/student/showstudent";  
		}
	
		/**
		 * 信息导入调用的方法 调用工具类
		 * 
		 * @param fileName
		 * @param file
		 */
	public void infouser(String fileName, MultipartFile file) {
			String errorInfo = null;
			// 批量导入。参数：文件,文件名。
			List<Integer> list = null;
			try {
				// 创建处理EXCEL
				ReadExcel readExcel = new ReadExcel();
				// 解析excel，获取信息集合。
				Workbook wb = readExcel.getWorkbook(fileName, file);
				errorInfo = readExcel.getErrorInfo();
				try {
					list = studentServiceImpl.excelStudent(wb, fileName);
					for (Integer integer : list) {
						System.out.println(integer);
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("导入失败");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(errorInfo);
		}
	
	//通讯录进入个人主页
			@RequestMapping("person")
		   public  String person(HttpServletRequest request)
			{
			    String id = request.getParameter("id");
			    Student student = studentServiceImpl.findStudentById(id);
				request.setAttribute("student",student);
				return  "/WEB-INF/jsp/contact/personal";
			}
			//查询历史工作记录
			@RequestMapping("history")
			  public  String history(HttpSession session,HttpServletRequest request)
				{
				    String sid = (String)session.getAttribute("id");
					 List<History>  list = studentServiceImpl.findhistory(sid);
				    request.setAttribute("historys",list);
					return  "/WEB-INF/jsp/contact/personal";
				}
			//前台个人中心修改用户密码
	  		@RequestMapping("updatepawd")
	  		public  String update(HttpServletRequest request,HttpSession session)
	  		{
	  			String username = (String)session.getAttribute("id");			
	  			String password = request.getParameter("pawd");
	  			System.out.println("修改没密码"+password);
	  			usrServiceImpl.updatepawd(username, password);
	  			return  "redirect:/student/beforeshowall";
	  		}
}
