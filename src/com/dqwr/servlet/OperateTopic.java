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
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;


public class OperateTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateTopic() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进入operatetopic来了");
		Connection con = database.connection();
		int operateid=Integer.parseInt(request.getParameter("operateid"));
		int topicid=Integer.parseInt(request.getParameter("topicid"));
		String pageno=request.getParameter("pageno");
		TopicDaoImpl  topicimpl=new TopicDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null;
		PrintWriter output=response.getWriter();
		Topic topic=new Topic();
		res=topicimpl.SelectTopicById(con,topicid);
		try {
			res.next();
			topic.setId(res.getInt(1));
			topic.setTopicname(res.getString(2));
			topic.setPublisher(res.getString(3));
			topic.setTime(res.getString(4));
			topic.setLink(res.getString(5));
			topic.setPicpath(res.getString(6));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(operateid==0){
			request.getRequestDispatcher("ws/AddTopic.jsp").forward(request, response);
		}
		if(operateid==1){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteTopic?topicid="+topicid+"&pageno="+pageno+"';}else{ window.location.href='ws/topicManage.jsp?pageno="+pageno+"';};"+"</script>");
		}
		if(operateid==2){
			request.setAttribute("topic", topic);
			request.getRequestDispatcher("ws/edittopic.jsp").forward(request, response);
		}
		if(operateid==3){
			request.setAttribute("topic", topic);
			request.getRequestDispatcher("ws/looktopic.jsp").forward(request, response);
		}
		if(operateid==4){
			boolean flag=false;
			flag=topicimpl.SetDisplay(con,topicid);
			if(flag==true){
				output.print("<script type='text/javascript'>" + "alert('设置成功');"+"window.location.href='ws/topicManage.jsp?pageno="+pageno+"';"+"</script>");	
			}else{
				output.print("<script type='text/javascript'>" + "alert('设置失败');"+"window.location.href='ws/topicManage.jsp?pageno="+pageno+"';"+"</script>");
			}
		}
		database.closeConnection(con);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
