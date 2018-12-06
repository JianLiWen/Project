package cn.wjl.store.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import cn.wjl.store.domain.User;
import cn.wjl.store.utils.DataSourceUtils;

public class UserDao {

	
	 public  int regist(User user) throws SQLException
	 {
		//第一步：创建QueryRunner对象，传入连接池对象
	   //在创建QueryRunner对象的时候，如果传入数据对象dataSource，
      //那么在使用QueryRunner对象的方法时候，就不需要传入连接对象
		 QueryRunner  runner = new QueryRunner(DataSourceUtils.getDataSource());
	     String sql  = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
	      int update =  runner.update(sql, user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode());
	     return update;
	 }
	 
	//激活
	public void active(String activeCode) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set state=? where code=?";
		runner.update(sql, 1,activeCode);
	}
	//校验用户名是否存在
		public Long checkUsername(String username) throws SQLException {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select count(*) from user where username=?";
			Long query = (Long) runner.query(sql, new ScalarHandler(), username);
			return query;
		}
		//用户登录的方法
		public User login(String username, String password) throws SQLException {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select * from user where username=? and password=?";
			return runner.query(sql, new BeanHandler<User>(User.class), username,password);
		}

}
