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
import com.dqwr.entity.YH;
import com.dqwr.entity.ZCJDEntity;
import com.dqwr.model.XTJS;
import com.dqwr.model.ZCJD;

/**
 * Servlet implementation class zcjdservlet
 */
public class xtjsgl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static DataBaseDao	database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xtjsgl() {
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
		if(actionUrl.equals("/baocun.xtjsgl")){
			String content =  request.getParameter("content1");
			String result="";
			content = content.replace("	", "");
			content = content.replace("<br />", "");
			content = content.replace("<p></p>", "");
			
			
			
			System.out.println(content);
			Connection con = database.connection();
			result = XTJS.alterxtjs(con,content);
			database.closeConnection(con);
			HttpSession session = request.getSession();
			session.setAttribute("content1", result);
			request.getRequestDispatcher("xtjsll.xtjsgl").forward(request, response);
		}else if(actionUrl.equals("/xtjsll.xtjsgl")){
			Connection con = database.connection();
			String jdid = request.getParameter("jdid");
			String xtjs = XTJS.xtjsyw(con);
			HttpSession session = request.getSession();
			session.setAttribute("content1", xtjs);
			request.getRequestDispatcher("/ws/kindeditor-4.1.7/jsp/xtjs.jsp").forward(request, response);
		}else if(actionUrl.equals("/delete.zcjd")){
			Connection con = database.connection();
			PrintWriter out = response.getWriter();
			String jdid = request.getParameter("jdid");
			int rs = ZCJD.ZCJDdelete(con,jdid);
			if(rs==0){
				out.print("删除失败");
			}else{
				out.print("删除成功");
			}
		}else if(actionUrl.equals("/jdywqt.zcjd")){
			Connection con = database.connection();
			String jdid = request.getParameter("jdid");
			ZCJDEntity zcjd = ZCJD.ZCJDyw(con,jdid);
			int count = Integer.parseInt(zcjd.getClick())+1;
			ZCJD.ZCJDcount(con, jdid, count);
			zcjd.setClick(count+"");
			request.setAttribute("zcjd", zcjd);
			request.getRequestDispatcher("/qt/zcjdyw.jsp").forward(request, response);
		}
	}

}
