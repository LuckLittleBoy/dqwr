package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YJFK;
import com.dqwr.entity.ZCJDEntity;
import com.dqwr.model.Yjfkmodel;
import com.dqwr.model.ZCJD;
import com.qt.model.qtselect;

/**
 * Servlet implementation class zcjdservlet
 */
public class YjfkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static DataBaseDao	database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YjfkServlet() {
        super();
        database = new DataBaseDao();
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
		String actionUrl = request.getServletPath();
		if(actionUrl.equals("/add.YjfkServlet")){
			String fs = request.getParameter("fs");
			String yzm =request.getParameter("yzm");
			String lxfs = request.getParameter("lxfs");
			String xw = request.getParameter("xw");
			String xq = request.getParameter("xq");
			String jyyq = request.getParameter("jyyq");
			String ljxx = request.getParameter("ljxx");
			String user = request.getParameter("user");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			HttpSession session = request.getSession();
			String rand = (String) session.getAttribute("randCode");
			if(rand.equals(yzm)){
				//登录验证
				Connection con = database.connection();
				
				/**
				 * pagesize 页大小
				 * currentpage 页码
				 */
				String result = Yjfkmodel.addyjfk(con,fs,lxfs,xw,xq,jyyq,ljxx,user,df.format(new Date()));
				PrintWriter out = response.getWriter();
				out.print(result);

				database.closeConnection(con);
				out.print(result);
			}else{
				response.getWriter().print("验证码错误");
			}
			
		}else if(actionUrl.equals("/all.YjfkServlet")){
			Connection con = database.connection();
			/**
			 * pagesize 页大小
			 * currentpage 页码
			 */
			String pagesize = request.getParameter("pagesize");
			String currentpage = request.getParameter("currentpage");
			String searchnr = request.getParameter("searchnr");
			String result;
			if(searchnr!=null&&!searchnr.equals("")){
				result = Yjfkmodel.YJFKLL(con, pagesize, currentpage,searchnr);
			}else{
				result = Yjfkmodel.YJFKLL(con, pagesize, currentpage);
			}
			PrintWriter out = response.getWriter();
			database.closeConnection(con);

			out.print(result);
		}else if(actionUrl.equals("/yjfkyw.YjfkServlet")){
			Connection con = database.connection();
			String yjfkid = request.getParameter("yjfkid");
			YJFK yjfk = Yjfkmodel.YJFKyw(con,yjfkid);
			request.setAttribute("yjfk", yjfk);
			database.closeConnection(con);

			request.getRequestDispatcher("/ws/yjfkyw.jsp").forward(request, response);
		}else if(actionUrl.equals("/delete.YjfkServlet")){
			Connection con = database.connection();
			PrintWriter out = response.getWriter();
			String id = request.getParameter("id");
			int rs = Yjfkmodel.YJFKdelete(con,id);
			database.closeConnection(con);

			if(rs==0){
				out.print("删除失败");
			}else{
				out.print("删除成功");
			}
		}
	}

}
