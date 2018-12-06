package cn.wjl.store.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.wjl.store.dao.impl.AdminDao;
import cn.wjl.store.domain.Category;
import cn.wjl.store.domain.Order;
import cn.wjl.store.domain.Product;

public class AdminService {

	public List<Category> findAllCategory() {
	   AdminDao dao = new AdminDao();
	   try {
		return  dao.findAllCategory();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
		
	}
	public void saveProduct(Product product) throws SQLException {
		AdminDao dao = new AdminDao();
		dao.saveProduct(product);
	}

	public List<Order> findAllOrders() {
		AdminDao dao = new AdminDao();
		List<Order> ordersList = null;
		try {
			ordersList = dao.findAllOrders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ordersList;
	}

	public List<Map<String, Object>> findOrderInfoByOid(String oid) {
		AdminDao dao = new AdminDao();
		List<Map<String, Object>> mapList = null;
		try {
			mapList = dao.findOrderInfoByOid(oid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mapList;
	}
}
