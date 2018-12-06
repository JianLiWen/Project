package com.wjl.graduate.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.Message;
@Component("messagemapper")
public interface MessageMapper {
   
	public void addmessage(Message message);
	
	public List<Message> findmessage(String sname);
	
	public  void  review(Message message);
	
	public  Message findreview(int id);
	
	public List<Message> mymessage(String author);
}
