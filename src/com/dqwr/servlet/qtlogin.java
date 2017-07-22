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

public class qtlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private com.dqwr.dao.DataBaseDao dataBase = null;
    /**
     * Default constructor. 
     */
    public qtlogin() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//获取用户名密码和验证码
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		String ip1=request.getParameter("ip");
		System.out.println(ip1);
		System.out.println("user"+user);
		if(user!=null){
			String randcode = request.getParameter("randcode");
			String rand = (String) session.getAttribute("randCode");
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
			String ip2=ip1.substring(0,7);
			System.out.println(ip2);
			if(ip2.equals("120.1.2")){
				response.getWriter().print("true");
				session.setAttribute("ipdl", "内部员工");
			}else{
				response.getWriter().print("该IP不能直接登陆");
			}

		}
		
		
	}
}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//获取用户名密码和验证码
		String ip1=request.getParameter("ip");
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		System.out.println("user"+user);

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
				session.setAttribute("qtuser", yh);
				//request.getRequestDispatcher("qt/index.jsp").forward(request, response);
				response.sendRedirect("qt/index.jsp");
			}
		}else{
			response.getWriter().print("验证码错误");
		}
		dataBase.closeConnection(con);
	}

}
	*/