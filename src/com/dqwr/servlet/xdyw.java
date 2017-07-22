package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import com.dqwr.dao.*;
import com.dqwr.entity.*;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search
 */

public class xdyw extends HttpServlet {
	private static final long serialVersionUID = 1L;
      DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xdyw() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		database = new com.dqwr.dao.DataBaseDao();//创建数据库对象
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
		String pno = request.getParameter("pno");
		
		ZC policy = new ZC();
		/**
		 * 查询政策原文
		 */
		policy=com.dqwr.model.ZCMD.shyw(con, pno);
		request.setAttribute("policy", policy);
		database.closeConnection(con);
		/**
		 * 跳转
		 */
		request.getRequestDispatcher("/ws/xdyw.jsp").forward(request, response);
		
	}

}
