package com.wjl.graduate.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.MessageMapper;
import com.wjl.graduate.pojo.Message;
import com.wjl.graduate.service.IMessageService;

@Service("MessageService")
public class MessageServiceImpl implements IMessageService {
       @Resource(name="messagemapper")
       private  MessageMapper  messagemapper;

	@Override
	public void addmessage(Message message) {
		// TODO Auto-generated method stub
		messagemapper.addmessage(message);
	}

	@Override
	public List<Message> findmessage(String sname) {
		// TODO Auto-generated method stub
		List<Message>  list = messagemapper.findmessage(sname);
		return list;
	}

	@Override
	public void review(Message message) {
		// TODO Auto-generated method stub
		messagemapper.review(message);
	}

	@Override
	public Message findreview(int id) {
		// TODO Auto-generated method stub
		Message message = messagemapper.findreview(id);
		return message;
	}

	@Override
	public List<Message> mymessage(String author) {
		// TODO Auto-generated method stub
		List<Message>  list = messagemapper.mymessage(author);
		return list;
	}
      
}
