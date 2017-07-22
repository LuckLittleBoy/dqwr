package com.dqwr.topic.servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;
import com.dqwr.topic.entity.Topic2;
public class TopicEditServlet2 extends HttpServlet{
	Connection conn=null;
	public TopicEditServlet2(){
		DataBaseDao db=new DataBaseDao();
        conn=db.connection();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		Topic2 topic2=new Topic2();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String pageno=request.getParameter("pageno");
		topic2.setId(id);
		String topicname=request.getParameter("topicname");
		if(topicname!=null){
			topic2.setTopicname(topicname);
		}
		String publisher=request.getParameter("publisher");
		if(publisher!=null){
			topic2.setPublisher(publisher);
		}
		String time=request.getParameter("time");
		if(time!=null){
			topic2.setTime(time);
		}
		
		if(topicimpl.editTopic2(conn, topic2)){
			out.print("<script language=javascript>"+"alert('修改成功');"+"document.location.href='ws/topicManage2.jsp?pageno="+pageno+"';"+"</script>");
		}else{
			out.print("<script language=javascript>"+"alert('修改失败');"+"document.location.href='ws/topicManage2.jsp?pageno="+pageno+"';"+"</script>");
		}
	        
            }
}