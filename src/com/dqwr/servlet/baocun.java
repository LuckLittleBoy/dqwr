package com.dqwr.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import com.dqwr.dao.*;
import com.dqwr.entity.YH;
import com.dqwr.model.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class submitpolicy
 */

public class baocun extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public baocun() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		database = new com.dqwr.dao.DataBaseDao();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		try{
			String zcid =request.getParameter("zcid");//zcid;
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			
			YH user = (YH) request.getSession().getAttribute("user");
			ZCMD.baocun(con,zcid, user.getYHID(),df.format(new Date()));
			database.closeConnection(con);
			response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('保存成功！'); window.location.href='ws/dbyzc.jsp';</script>");
		}catch(Exception e){
			System.out.println("query error:"+e);	
			e.printStackTrace();
			response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('保存异常！'); window.location.href='ws/thzc.jsp';</script>");
		}
		
	}

}
