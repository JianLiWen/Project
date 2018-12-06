package cn.wjl.store.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.wjl.store.domain.Category;
import cn.wjl.store.service.impl.AdminService;


public class AdminServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void findAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 提供一个List<Category>转正json字符串
		AdminService  service = new AdminService();
		List<Category> categorylist  = service.findAllCategory();
		System.out.println("......"+categorylist);
		Gson gson = new Gson();
		String json = gson.toJson(categorylist);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
		
		
	}

}
