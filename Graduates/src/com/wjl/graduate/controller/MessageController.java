package com.wjl.graduate.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wjl.graduate.pojo.Message;
import com.wjl.graduate.service.IMessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private IMessageService messageServiceImpl;
	
		@RequestMapping("sendmessage")
		public String addmessage(HttpServletRequest request,HttpSession  session,Message model) throws UnsupportedEncodingException{
			System.out.println("进来啦。。。");
  			String sname =new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
			model.setSname(sname);
			String  author = (String)session.getAttribute("name");
			model.setAuthor(author);
			messageServiceImpl.addmessage(model);
			return  "redirect:/message/messagedemo"; 
		}
       
	    @RequestMapping("messagedemo")
		public String messagedemo(HttpServletRequest request,HttpSession  session,String sname){
		     sname= (String)session.getAttribute("name");
			List<Message>  list = messageServiceImpl.findmessage(sname);
			request.setAttribute("messages", list);
			return  "/WEB-INF/jsp/message/message"; 
		}
		@RequestMapping("review")
		public String review(HttpServletRequest request,Message model){
		     System.out.println("可以回复东西了。。。");
			String id = request.getParameter("rid");
			model.setId(Integer.valueOf(id));
			messageServiceImpl.review(model);
			return  "redirect:/message/messagedemo"; 
		}
		
}
