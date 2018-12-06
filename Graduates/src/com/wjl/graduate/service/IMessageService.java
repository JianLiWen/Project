package com.wjl.graduate.service;

import java.util.List;

import com.wjl.graduate.pojo.Message;

public interface IMessageService {

	 public void  addmessage(Message message);
	 
	 public List<Message> findmessage(String sname);
	 
	 public List<Message> mymessage(String author);
	 
	 public  void  review(Message message);
	 
	 public  Message findreview(int id);
}
