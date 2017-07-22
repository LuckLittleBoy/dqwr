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

public class thyw extends HttpServlet {
	private static final long serialVersionUID = 1L;
      DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thyw() {
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
		/**
		 * 创建ZC对象
		 */
		ZC policy = new ZC();
		/**
		 * 查询对应政策的所有信息CX 查询的意思
		 */
		policy=com.dqwr.model.ZCMD.cxyw(con, pno);
		request.setAttribute("policy", policy);
		database.closeConnection(con);
		request.getRequestDispatcher("/ws/thyw.jsp").forward(request, response);
		
	}

}
