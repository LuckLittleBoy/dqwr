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
import com.dqwr.topic.entity.Topic2;


public class OperateTopic2 extends HttpServlet {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 4571374769995044162L;
	DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateTopic2() {
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
		Topic2 topic=new Topic2();
		res=topicimpl.SelectTopicById2(con,topicid);
		try {
			res.next();
			topic.setId(res.getInt(1));
			topic.setTopicname(res.getString(2));
			topic.setPublisher(res.getString(3));
			topic.setTime(res.getString(4));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(operateid==0){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteTopic2?topicid="+topicid+"&pageno="+pageno+"';}else{ window.location.href='ws/topicManage2.jsp?pageno="+pageno+"';};"+"</script>");
		}
		if(operateid==1){
			request.setAttribute("topic", topic);
			request.getRequestDispatcher("ws/edittopic2.jsp").forward(request, response);
		}
		if(operateid==2){
			request.setAttribute("topic", topic);
			request.getRequestDispatcher("ws/looktopic2.jsp").forward(request, response);
		}
		if(operateid==3){
		request.setAttribute("topicid", topicid);
		request.getRequestDispatcher("ws/addTopicNews.jsp").forward(request, response);
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
