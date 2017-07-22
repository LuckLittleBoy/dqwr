package com.dqwr.topic.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic2;
public class TopicAddServlet2 extends HttpServlet{
	private static final long serialVersionUID = -5227583106288285378L;
	Connection conn=null;

	public TopicAddServlet2(){
		DataBaseDao db=new DataBaseDao();
        conn=db.connection();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		Topic2 topic2=new Topic2();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
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
		
		if(topicimpl.addTopic2(conn, topic2)){
			out.print("<script language=javascript>"+"alert('添加成功');"+"document.location.href='ws/topicManage2.jsp';"+"</script>");
		}else{
			out.print("<script language=javascript>"+"alert('添加失败');"+"</script>");
		}
	}
}