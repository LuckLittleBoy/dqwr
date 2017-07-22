package com.qt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.qt.model.LoginCheck;
import com.qt.model.qtselect;

/**
 * Servlet implementation class zhuce
 */
public class zhuce extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private com.dqwr.dao.DataBaseDao dataBase = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zhuce() {
        super();
        dataBase = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
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
		
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String city = request.getParameter("city");
		String gzdw = request.getParameter("gzdw");
		String zyfx = request.getParameter("zyfx");
		String szhy = request.getParameter("szhy");
		String jycd = request.getParameter("jycd");
		String zc = request.getParameter("zc");
		String txdz = request.getParameter("txdz");
		String yzbm = request.getParameter("yzbm");
		String sj = request.getParameter("sj");
		String gddh = request.getParameter("gddh");
		String yx = request.getParameter("yx");
		String qq = request.getParameter("qq");
		String msn = request.getParameter("msn");
		String randcode = request.getParameter("randcode");
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("randCode");
		if(rand.equals(randcode)){
			//登录验证
			Connection con = dataBase.connection();
			String result = qtselect.zhuce(con, username, pwd, name, sex,city,gzdw,szhy,jycd,zc,txdz,yzbm,sj,gddh,yx,qq,msn,zyfx);
			dataBase.closeConnection(con);
			PrintWriter out = response.getWriter();
			out.print(result);
		}else{
			response.getWriter().print("验证码错误");
		}

		
	}

}
