package com.dqwr.requirement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Emp;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.project.dao.impl.ProjectDaoImpl;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;

public class DeleteRequServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8551913218389687423L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("进Get来了");
		DataBaseDao db=new DataBaseDao();
		Connection con=db.connection();
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out=response.getWriter();
		int requid=Integer.parseInt(request.getParameter("requid"));
		String pageno=request.getParameter("pageno");
		//String orgaid=request.getParameter("orgaid");
		RequireDaoImpl  requimpl=new RequireDaoImpl();
		requimpl.deleterequ(con, requid);
		//requimpl.deleteorga(con,orgaid);
		db.closeConnection(con);
		out.print("<script language=javascript>"+"document.location.href='ws/xdsh.jsp?reqpass=2&pageno="+pageno+"';"+"</script>");	
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进post来了");
	}
    
	
	
}
