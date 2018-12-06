package cn.wjl.store.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import cn.wjl.store.domain.User;
import cn.wjl.store.service.impl.UserService;
import cn.wjl.store.utils.CommonsUtils;
import cn.wjl.store.utils.MailUtils;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   request.setCharacterEncoding("UTF-8");
		//获得表单数据
		Map<String,String[]> properties = request.getParameterMap();
	     User  user = new User();
	     try {
	    	//自己指定一个类型转换器（将String转成Date）
				ConvertUtils.register(new Converter() {
					@Override
					public Object convert(Class clazz, Object value) {
						//将string转成date
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						Date parse = null;
						try {
							parse = format.parse(value.toString());
						} catch (ParseException e) {
							e.printStackTrace();
						}
						return parse;
					}
				}, Date.class);
				//把前台传过来的数据封装进Javabean
			BeanUtils.populate(user,properties);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     
	     user.setUid(CommonsUtils.getUUID());
	     user.setTelephone(null);
	     user.setState(0);
	     String activeCode = CommonsUtils.getUUID();
		 user.setCode(activeCode);
	     
	     UserService service = new UserService();
	     boolean isRegisterService =  service.regist(user);
	     if(isRegisterService)
	     {
	    	 //发送激活邮件
	    	 String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
						+ "<a href='http://localhost:8080/Store/active?activeCode="+activeCode+"'>"
								+ "http://localhost:8080/Store/active?activeCode="+activeCode+"</a>";
				try {
					MailUtils.sendMail(user.getEmail(), emailMsg);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
	    	//跳转到注册成功页面
				response.sendRedirect(request.getContextPath()+"/registerSuccess.jsp");
	     }
	     else
	     {
	    	//跳转到失败的提示页面
				response.sendRedirect(request.getContextPath()+"/registerFail.jsp");
	     }
	     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
