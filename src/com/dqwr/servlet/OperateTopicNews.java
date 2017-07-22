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
import com.dqwr.topic.entity.TopicNews;


public class OperateTopicNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateTopicNews() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = database.connection();
		int operateid=Integer.parseInt(request.getParameter("operateid"));
		int topicnewsid=Integer.parseInt(request.getParameter("topicnewsid"));
		String pageno=request.getParameter("pageno");
		TopicDaoImpl  topicimpl=new TopicDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null;
		PrintWriter output=response.getWriter();
		TopicNews topicnews=new TopicNews();
		res=topicimpl.SelectTopicNewsById(con,topicnewsid);
		try {
			res.next();
			topicnews.setId(res.getInt(1));
			topicnews.setTopicId(res.getInt(2));
			topicnews.setTitle(res.getString(3));
			topicnews.setContent(res.getString(4));
			topicnews.setPublisher(res.getString(5));
			topicnews.setTime(res.getString(6));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String topicname=topicimpl.selectTopicname(con,topicnews.getTopicId());
		if(operateid==0){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteTopicNews?topicnewsid="+topicnewsid+"&pageno="+pageno+"';}else{ window.location.href='ws/topicNewsManage.jsp?pageno="+pageno+"';};"+"</script>");
		}
		if(operateid==1){
			request.setAttribute("topicnews", topicnews);
			
			request.getRequestDispatcher("ws/editTopicNews.jsp").forward(request, response);
		}
		if(operateid==2){
			request.setAttribute("topicnews", topicnews);
			request.setAttribute("topicname", topicname);
			request.getRequestDispatcher("ws/lookTopicNews.jsp").forward(request, response);
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
