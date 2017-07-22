package com.dqwr.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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

public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
		YH user = (YH) request.getSession().getAttribute("user");
		
		String zcid = request.getParameter("zcid");//ZCID
		String back = ZCMD.delete(con, zcid,user.getYHID());
		/**
		 * 审核
		 */
		
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("back", back);
		database.closeConnection(con);
		response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('"+back+"'); window.location.href='ws/syzc.jsp';</script>");

	
		
	}
}
