package com.dqwr.technology.servlet;

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
import com.dqwr.technology.dao.impl.CaseDaoImpl;
import com.dqwr.technology.dao.impl.TechnologyDaoImpl;

public class DeleteTechServlet extends HttpServlet{
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
		int techid=Integer.parseInt(request.getParameter("techid"));
		int casenumber=Integer.parseInt(request.getParameter("casenumber"));
		System.out.println("casenumber"+casenumber);
		String pageno=request.getParameter("pageno");
		TechnologyDaoImpl  techimpl=new TechnologyDaoImpl();
		CaseDaoImpl caseimpl=new CaseDaoImpl();
		if(casenumber==0){
		if(techimpl.deleteTech(con, techid)){
		out.print("<script language=javascript>"+"document.location.href='ws/technology.jsp?techpass=2&pageno="+pageno+"';"+"</script>");
		}else{
		out.print("<script language=javascript>"+"alert('删除失败');"+"</script>");	
		}
		}
		else {
		if(techimpl.deleteTech(con, techid)&&caseimpl.deleteCase(con,techid)){
		out.print("<script language=javascript>"+"document.location.href='ws/technology.jsp?techpass=2&pageno="+pageno+"';"+"</script>");
		}else{
		out.print("<script language=javascript>"+"alert('删除失败');"+"</script>");
		}
		db.closeConnection(con);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进post来了");
	}
    
	
	
}
