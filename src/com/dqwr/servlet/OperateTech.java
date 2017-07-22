package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;


public class OperateTech extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null; 
    public OperateTech() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到OperateTech中来了");
		Connection con = database.connection();
		int operateid=Integer.parseInt(request.getParameter("operateid"));
		System.out.println("operateid:"+operateid);
		int techid=Integer.parseInt(request.getParameter("techid"));
		int casenumber=Integer.parseInt(request.getParameter("casenumber"));
		System.out.println("casenumber:"+casenumber);
		String orgaid=request.getParameter("orgaid");
		String pageno=request.getParameter("pageno");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		if(operateid==0){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteTech?techid="+techid+"&casenumber="+casenumber+"&pageno="+pageno+"';}else{ window.location.href='ws/technology.jsp?techpass=2&pageno="+pageno+"';};"+"</script>");
		}else if(operateid==1){	
			output.print("<script language=javascript>"+"document.location.href='ws/edittechnology.jsp?techid="+techid+"&orgaid="+orgaid+"&casenumber="+casenumber+"&pageno="+pageno+"';"+"</script>");
			request.getRequestDispatcher("ws/edittechnology.jsp").forward(request,response);
		}
		if(operateid==2){
			request.getRequestDispatcher("ws/TechBack.jsp").forward(request,response);
		}
		database.closeConnection(con);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
