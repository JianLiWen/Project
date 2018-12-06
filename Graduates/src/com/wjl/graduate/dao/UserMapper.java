package com.wjl.graduate.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wjl.graduate.pojo.User;
@Component("userMapper")
public interface UserMapper {
   public  User  findByName(String name); 
   
   public  void  deleteuser(int id);
   
   public  void  updatepawd(@Param("username")String username,@Param("password")String password);

    public void   logincount(String name);
    
    public  void   addgraduates(User user);
}
