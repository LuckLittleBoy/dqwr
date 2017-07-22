package com.dqwr.requirement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dqwr.dao.DataBaseDao;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;

public class DeleteOrgaServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8551913218389687423L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DataBaseDao db=new DataBaseDao();
		Connection con=db.connection();
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out=response.getWriter();
		String pageno=request.getParameter("pageno");
		String orgaid=request.getParameter("orgaid");
		RequireDaoImpl requimpl=new RequireDaoImpl();
		if(requimpl.requirementIsExistById(con, orgaid))
		{
			requimpl.deleteorga(con,orgaid);
			out.print("<script language=javascript>alert('删除成功');");
			out.print("document.location.href='ws/orga.jsp?pageno="+pageno+"';"+"</script>");
		}
		else
		{
			out.print("<script language=javascript>");
			out.print("alert('该机构下已有技术需求，无法删除！')");
			out.print("document.location.href='ws/orga.jsp?pageno="+pageno+"';"+"</script>");
			out.print("</script>");
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