package com.dqwr.topic.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.topic.dao.impl.TopicDaoImpl;

@SuppressWarnings("serial")
public class GetTopicPath extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String TopicPath="";
		String uploadPath =request.getSession().getServletContext().getRealPath("/")+"images\\TopicUpload\\";//图片上传路径   
	    String tempPath = request.getSession().getServletContext().getRealPath("/")+"images\\TopicUpload\\temp\\";//图片临时上传路径
	    if(!new File(uploadPath).isDirectory()) new File(uploadPath).mkdirs();//   文件夹不存在就自动创建：
	    if(!new File(tempPath).isDirectory())new File(tempPath).mkdirs(); 
	    ResultSet rs;
	    DataBaseDao db = new DataBaseDao();
		Connection conn = db.connection();
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		rs=topicimpl.SelectTopicDisplay(conn);
		try
		{
			if(rs.next())
			{
				TopicPath=uploadPath+rs.getString(6);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	    File file = new File(TopicPath);
        // 获取输出流
        OutputStream outputStream = response.getOutputStream();
        if(file.exists())
        {
	        FileInputStream fileInputStream = new FileInputStream(file);
	        // 读数据
	        byte[] data = new byte[fileInputStream.available()];
	        fileInputStream.read(data);
	        fileInputStream.close();
	        // 回写
	        int index = TopicPath.lastIndexOf(".");
	        String imgType = TopicPath.substring(index);
	        response.setContentType(imgType);
	        outputStream.write(data);
        }
        outputStream.flush();
        outputStream.close();
	}
}
