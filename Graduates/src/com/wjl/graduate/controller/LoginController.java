package com.wjl.graduate.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wjl.graduate.pojo.Board;
import com.wjl.graduate.pojo.Student;
import com.wjl.graduate.pojo.User;
import com.wjl.graduate.service.IBoardService;
import com.wjl.graduate.service.IClassService;
import com.wjl.graduate.service.IStudentService;
import com.wjl.graduate.service.IUserService;
import com.wjl.graduate.utils.ReadExcel;


/**
 * 业务对接
 * 
 * 
 */
@Controller("user")
@Scope(value="prototype")
@RequestMapping("/user")
public class LoginController {

    @Resource
    private IUserService userService;
    @Resource
	private IStudentService studentServiceImpl;
    
    @Autowired
	private IBoardService boardServiceImpl;
    @Autowired
	private IClassService classServiceImpl;

    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(User user,Model model,HttpServletRequest request,HttpSession session) throws Exception {
    	System.err.println("login");
        user=userService.checkLogin(user.getUsername(), user.getPassword());
       // session.setAttribute("user", user);
        if(user!=null&&user.getStatus()==0){
            model.addAttribute(user);
            return "/index";           
        }
        if(user!=null&&user.getStatus()==1&&user.getLogincount()==0){
          model.addAttribute(user);
          String id = user.getUsername();
          Student student = studentServiceImpl.findStudentById(id);
          String name = student.getName();
          String classid = student.getClassid();
          userService.logincount(id);
          session.setAttribute("name", name);
          session.setAttribute("id", id);
          session.setAttribute("classid", classid);
          List<String> list  = studentServiceImpl.selectdirection();
          request.setAttribute("directions", list);
          List<String> place = studentServiceImpl.selectplace();
          request.setAttribute("place", place);
            return  "/inital";          
        }
        if(user!=null&&user.getStatus()==1&&user.getLogincount()!=0){
            model.addAttribute(user);
            String id = user.getUsername();
            Student student = studentServiceImpl.findStudentById(id);
            String name = student.getName();
            String classid = student.getClassid();
            userService.logincount(id);
            session.setAttribute("name", name);
            session.setAttribute("id", id);
            session.setAttribute("classid", classid);
            //request.setAttribute("name", name);
          //  request.setAttribute("id", id);
              return  "/index1";          
          }
        return "/login";
    }
    
     //返回登录界面
  		@RequestMapping("logindemo")
  		public  String logindemo(HttpServletRequest request)
  		{
  			return  "/login";
  		}
  	  //修改登录密码
  		@RequestMapping("updatepawd")
  		public  String updatepawd(HttpServletRequest request,HttpSession session)
  		{
  			String username = (String)session.getAttribute("id");			
  			String password = request.getParameter("pawd");
  			System.out.println("修改没密码"+password);
  			userService.updatepawd(username, password);
  			return  "/index1";
  		}
  		
         //显示前台的主页面
  	  	 @RequestMapping("main1")
  	  	 public  String main(HttpServletRequest request)
  	  	{
  	  		 List<Board> news = boardServiceImpl.findsomeBoardBytype(1);
  	  	     List<Board> jobs = boardServiceImpl.findsomeBoardBytype(2);
  	         List<Board> notices = boardServiceImpl.findsomeBoardBytype(3);
  	         request.setAttribute("news", news);
  	         request.setAttribute("jobs", jobs);
  	          request.setAttribute("notices", notices);
  	  			return  "/main1";
  	  		}
  	  	 
  	   //显示后台的主页面
  	  	 @RequestMapping("main")
  	  	 public  String main1(HttpServletRequest request)
  	  	{
  	  	int studentnumber = studentServiceImpl.counttotal();
  	     request.setAttribute("snumber", studentnumber);
  	     int cnumber = classServiceImpl.counttotal();
  	     request.setAttribute("cnumber", cnumber);
  	     int bnumber = boardServiceImpl.counttotal();
  	     request.setAttribute("bnumber", bnumber);
  	  			return  "/main";
  	  		}
  	  	 
  	 //显示录入界面
 		@RequestMapping("exceldemo")
 		public  String exceldemo(HttpServletRequest request)
 		{
 			return  "/WEB-INF/jsp/user/excel";
 		}
 		//excel导用户名和密码
  	  	@RequestMapping(value = "/Importxls")
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
			return  "redirect:/user/main";  
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
					list = userService.exceluser(wb, fileName);
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
	 
	   //显示后台的修改密码页面
	  	 @RequestMapping("password")
	  	 public  String password(HttpServletRequest request)
	  	{
	  		
	  			return  "/WEB-INF/jsp/user/password";
	  		}
}


