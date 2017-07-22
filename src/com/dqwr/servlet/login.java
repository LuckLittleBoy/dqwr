package com.dqwr.servlet;

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
import com.dqwr.model.LoginCheck;

/**
 * Servlet implementation class login
 */

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private com.dqwr.dao.DataBaseDao dataBase = null;
    /**
     * Default constructor. 
     */
    public login() {
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		dataBase = new com.dqwr.dao.DataBaseDao();
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//获取用户名密码和验证码
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		session.setAttribute("user", "true");
		String randcode = request.getParameter("randcode");
		String rand = (String) session.getAttribute("randCode");
		YH yh = new YH();
		Connection con = dataBase.connection();
		if(rand.equals(randcode)){
			//登录验证
			yh = LoginCheck.getLogin(user, pwd, con);
			if(yh.getYHMM()==null){
				response.getWriter().print("用户名或密码错误");
			}else{
				session.setAttribute("user", yh);
				response.getWriter().print("true");
				try{
		 			String sql="insert into  log values('登陆','"+yh.getYHID()+"','用户登陆','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
		 			System.out.println(sql);
		 			Sqlcon.executeUpdate(sql);
		 			Sqlcon.close();
		 						
		 		}
		 		catch(Exception e){
		 		}
				
			}
		}else{
			response.getWriter().print("验证码错误");
		}
		dataBase.closeConnection(con);
	}

}
	