package com.qt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.model.ZCMD;
import com.qt.model.LoginCheck;

/**
 * 检查ZCMC是否重复
 * Servlet implementation class CheckZCMC
 */
public class checkwbuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkwbuser() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Connection con = database.connection();
		String user = request.getParameter("user");
		String result = LoginCheck.checkwbuser(user, con);
		database.closeConnection(con);
		
		
		out.print(result);
		
	}
}
