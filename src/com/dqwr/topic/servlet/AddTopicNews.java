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

public class AddTopicNews extends HttpServlet{
	private static final long serialVersionUID = -5196129793819107883L;
	private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTopicNews() {
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
		System.out.println("topicid------"+request.getParameter("topicid"));
		String pageno=request.getParameter("pageno");
		int topicid=Integer.parseInt(request.getParameter("topicid"));
		String creator=request.getParameter("creator");
		String title=request.getParameter("title");
		String content=request.getParameter("content1");
		String time=request.getParameter("publictime");
		
		TopicNews topicnews=new TopicNews();
		topicnews.setTopicId(topicid);
		topicnews.setTitle(title);
		topicnews.setPublisher(creator);
		topicnews.setTime(time);
		topicnews.setContent(content);
		
		String result="";
	    Connection con = database.connection();
	    response.setContentType("text/html;charset=utf-8");
	    PrintWriter out=response.getWriter();
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		result=topicimpl.insertTopicnews(con, topicnews);
		database.closeConnection(con);
		if(result.equals("success")){
			out.print("<script language=javascript>");
			out.print("if(confirm('添加成功,是否继续发布专题活动')){document.location.href='/dqwr/operatetopic2?operateid=3&topicid="+topicid+"&pageno="+pageno+"'}");
			out.print("else{document.location.href='ws/topicManage2.jsp?pageno="+pageno+"'}");
			out.print("</script>");
		}else{
			out.print("<script language=javascript>"+"alert('添加失败！');"+"</script>");
		}
	}
}
