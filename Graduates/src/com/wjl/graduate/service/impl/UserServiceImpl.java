package com.wjl.graduate.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.wjl.graduate.dao.UserMapper;
import com.wjl.graduate.pojo.Student;
import com.wjl.graduate.pojo.User;
import com.wjl.graduate.service.IUserService;

@Service("UserService")
public class UserServiceImpl implements IUserService{


	@Resource(name="userMapper")
	private  UserMapper userMapper;
	@Override
	public User checkLogin(String username, String password) {
		// TODO Auto-generated method stub	
		User user =  userMapper.findByName(username); 
		if(user!=null&&user.getPassword().equals(password))
		{
			return user;
		}
		return null;
	}
	@Override
	public void deleteuser(int id) {
		// TODO Auto-generated method stub
		userMapper.deleteuser(id);
	}
	@Override
	public User findUserByName(String name) {
		// TODO Auto-generated method stub
		User user = userMapper.findByName(name);
		return user;
	}
	@Override
	public void updatepawd(String username,String password) {
		// TODO Auto-generated method stub
		userMapper.updatepawd(username,password);
	}
	@Override
	public void logincount(String name) {
		// TODO Auto-generated method stub
		userMapper.logincount(name);
	}
	@Override
	public List<Integer> exceluser(Workbook wb, String fileName)
			throws Exception {
		// TODO Auto-generated method stub
				// 得到第一个sheet
				Sheet sheet = wb.getSheetAt(0);
				// 得到Excel的行数
				int totalRows = sheet.getPhysicalNumberOfRows();

				// 得到Excel的列数(前提是有行数)
				int totalCells = 0;
				if (totalRows >= 1 && sheet.getRow(0) != null) {
					totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
				}
				List<User> userList = new ArrayList<User>();
				// 循环Excel行数,从第二行开始。标题不入库
				for (Row row : sheet) {
					int rowNum = row.getRowNum();
					if (rowNum == 0) {
						continue;
					}
					// 获取cell(0)值，赋值给user_id，空报错，跳过此条数据，进行下一条数据
					String username = null;
					if (row.getCell(0) != null && !("".equals(row.getCell(0).toString()))) {
						row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
						username = row.getCell(0).getStringCellValue();
					}
					// 获取cell(1)值，赋值给user_name，空报错，跳过此条数据，进行下一条数据
					String password = null;
					if (row.getCell(1) != null && !("".equals(row.getCell(1).toString()))) {
						row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
						password = row.getCell(1).getStringCellValue();
					}
					
					User user=new User(username,password);
					// 将teacher对象存到teacherList中
					userList.add(user);
				}
				// 导入正确个数
				int flagT = 0;
				// 导入错误个数
				int flagF = 0;
				// 创建list集合，用来存储flagT和flagF
				List<Integer> list = new ArrayList<Integer>();
				// 对teacherList进行循环，将其传入Dao层
				for (int i = 0; i < userList.size(); i++) {
					try {
						userMapper.addgraduates(userList.get(i));
						// 正确个数++
						flagT++;
					}
					// 捕获异常，对失败个数进行++
					catch (Exception e) {
						e.printStackTrace();
						// 失败列
						Integer false_i = i + 2;
						list.add(false_i);
						flagF++;

					}
				}
				list.add(flagT);// 添加入list中
				list.add(flagF);// 添加入list中
				return list;
	}

}
