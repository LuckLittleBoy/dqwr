package com.dqwr.expert.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Emp;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.expert.daoimpl.ExpertDaoImpl;
import com.dqwr.project.dao.impl.ProjectDaoImpl;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.technology.dao.impl.CaseDaoImpl;
import com.dqwr.technology.dao.impl.TechnologyDaoImpl;

public class DeleteExpertServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8551913218389687423L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进Get来了");
		DataBaseDao db=new DataBaseDao();
		Connection con=db.connection();
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out=response.getWriter();
		int expertid=Integer.parseInt(request.getParameter("expertid"));
		String pageno=request.getParameter("pageno");
		ExpertDaoImpl expertimpl=new ExpertDaoImpl();
		boolean isdelete=expertimpl.deleteExpert(con, expertid);
		if(isdelete){
		out.print("<script language=javascript>"+"document.location.href='ws/expert1.jsp?exppass=2&pageno="+pageno+"';"+"</script>");
		}else{
		out.print("<script language=javascript>"+"alert('删除失败！');"+"</script>");
			
		}
		db.closeConnection(con);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进post来了");
	}
    
	
	
}
