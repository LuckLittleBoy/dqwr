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

public class EditTopicNews extends HttpServlet{

	private static final long serialVersionUID = -7674241556205169506L;
	private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTopicNews() {
        super();
        database = new DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		int topicnewsid=Integer.parseInt(request.getParameter("topicnewsid"));
		String pageno=request.getParameter("pageno");
		String creator=request.getParameter("creator");
		String title=request.getParameter("title");
		String content=request.getParameter("content1");
		String time=request.getParameter("publictime");
		
		TopicNews topicnews=new TopicNews();
		topicnews.setId(topicnewsid);
		topicnews.setTitle(title);
		topicnews.setPublisher(creator);
		topicnews.setTime(time);
		topicnews.setContent(content);
		
		boolean result=false;
	    Connection con = database.connection();
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		result=topicimpl.editTopicnews(con, topicnews);
		database.closeConnection(con);
		if(result){
			out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/topicNewsManage.jsp?pageno="+pageno+"';"+"</script>");
		}else{
			out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/topicNewsManage.jsp?pageno="+pageno+"';"+"</script>");
		}
	}
}
