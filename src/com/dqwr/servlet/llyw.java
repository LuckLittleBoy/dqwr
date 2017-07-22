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

public class llyw extends HttpServlet {
	private static final long serialVersionUID = 1L;
      DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public llyw() {
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
		String pno = request.getParameter("pno");
		
		ZC policy = new ZC();
		/**
		 * 查询政策的所有内容
		 */
		policy=com.dqwr.model.ZCMD.shyw(con, pno);
		database.closeConnection(con);
		request.setAttribute("policy", policy);
		request.getRequestDispatcher("/ws/llyw.jsp").forward(request, response);
		
	}

}
