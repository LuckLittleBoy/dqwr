package com.dqwr.topic.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class GetSmallPath extends HttpServlet
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
		String text=request.getParameter("text");
		
		String smallpath = request.getSession().getServletContext().getRealPath("/")+"images\\Publicpic\\"+text;
		File file = new File(smallpath);
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
		    int index = smallpath.lastIndexOf(".");
		    String imgType = smallpath.substring(index);
		    response.setContentType(imgType);
		    outputStream.write(data);
		}
        outputStream.flush();
        outputStream.close();
	}
}
