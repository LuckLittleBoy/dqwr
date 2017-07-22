package com.dqwr.publishinfo.servlet;

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

public class DeleteInfoServlet extends HttpServlet{
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
		int infoid=Integer.parseInt(request.getParameter("infoid"));
		int pagesize=Integer.parseInt(request.getParameter("pagesize"));
		int pageno=Integer.parseInt(request.getParameter("pageno"));
		PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
		infoimpl.deleteInfo(con, infoid);
		db.closeConnection(con);
		out.print("<script language=javascript>"+"document.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");	
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("进post来了");
	}
    
	
	
}
