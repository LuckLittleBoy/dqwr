package com.dqwr.topic.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.publishinfo.dao.impl.PublishInfoImpl;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.TopicNews;

public class PublishTopicNews extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishTopicNews() {
        super();
        database = new DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=gbk");
		PrintWriter out=response.getWriter();
		int topicid=Integer.parseInt(request.getParameter("topicid"));
		System.out.println(topicid);
		String creator=request.getParameter("creator");
		String title=request.getParameter("title");
		String content=request.getParameter("content1");
		String time=request.getParameter("time");
		
		TopicNews  topicnew=new TopicNews();
		topicnew.setTopicId(topicid);
		topicnew.setPublisher(creator);
		topicnew.setTitle(title);
		topicnew.setContent(content);
		topicnew.setTime(time);
		String result="";
		Connection con = database.connection();
		TopicDaoImpl topic=new TopicDaoImpl();
		result=topic.insertTopicNews(con, topicnew);
		database.closeConnection(con);
		if(result.equals("信息发布成功")){
			out.print("<script language=javascript>"+"alert('新闻发布成功！');"+"document.location.href='ws/topicManage.jsp'"+"</script>");
		}	
	}


}
