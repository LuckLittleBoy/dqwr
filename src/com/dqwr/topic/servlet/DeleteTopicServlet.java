package com.dqwr.topic.servlet;

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
import com.dqwr.topic.dao.impl.TopicDaoImpl;

public class DeleteTopicServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8551913218389687423L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进deleteTopicGet来了");
		boolean delete;
		DataBaseDao db=new DataBaseDao();
		Connection con=db.connection();
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out=response.getWriter();
		int topicid=Integer.parseInt(request.getParameter("topicid"));
		String pageno=request.getParameter("pageno");
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		delete=topicimpl.deleteTopic(con, topicid);
		db.closeConnection(con);
		if(delete){
		out.print("<script language=javascript>"+"document.location.href='ws/topicManage.jsp?pageno="+pageno+"';"+"</script>");
		}else{
		out.print("<script language=javascript>"+"document.location.href='ws/topicManage.jsp?pageno="+pageno+"';"+"</script>");
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进post来了");
	}
    
	
	
}
