package com.qt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.qt.model.LoginCheck;

public class qtlogin extends HttpServlet {
	private com.dqwr.dao.DataBaseDao dataBase = null;
    public qtlogin() {
    }
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dataBase = new com.dqwr.dao.DataBaseDao();
	}
/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进入到登录Servlet:doget");
		doPost(request, response);
	}*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("aaaa");
		System.out.println("进入到登录Servlet:doget");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//获取用户名密码和验证码
		String user = request.getParameter("user"); 
		String pwd = request.getParameter("pwd");
		System.out.println("user"+ user);
		System.out.println("pwd"+ pwd);

		if(user!=null){
			String randcode = request.getParameter("randcode");
			String rand = (String) session.getAttribute("randCode");
			System.out.println("rand"+rand);

			YH yh = new YH();
			Connection con = dataBase.connection();
			if(rand.equals(randcode)){
				//登录验证
				System.out.println(user+pwd);
				yh = LoginCheck.getLogin(user, pwd, con);
				if(yh.getName()==null){
					response.getWriter().print("用户名或密码错误");
				}else{
					System.out.println(yh.getUsername());
					session.setAttribute("wbuser", yh);
					response.getWriter().print("true");
					
				}
			}else{
				response.getWriter().print("验证码错误");
			}
			dataBase.closeConnection(con);
		}else{
			Connection con = dataBase.connection();
			YH yh = new YH();
			yh = LoginCheck.getIPLogin(getIpAddr(request),con);
			if(yh.getYHMM()==null){
				response.getWriter().print("该IP不能直接登陆");
			}else{
				session.setAttribute("wbuser", yh);
				response.getWriter().print("true");
				
			}
			dataBase.closeConnection(con);
		}
		
		
	}
	public String getIpAddr(HttpServletRequest request) {  
	    String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    }  
	    System.out.println("ip"+ip);
	    return ip;  
	}  
}
	