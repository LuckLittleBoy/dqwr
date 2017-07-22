package com.dqwr.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自动补全
 * 向客服端返XML数据的servlet
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class AutomaticSXFW extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//获得页面传过来的字符串
		request.setCharacterEncoding("utf-8");
		
		String sxfw = request.getParameter("sxfw");
		sxfw = java.net.URLDecoder.decode(sxfw, "UTF-8");//一次解码
		System.out.print(sxfw);
		//将字符串保存在request对象中
		request.setAttribute("sxfw",sxfw);
		
		//将请求转发给视图层（注意Ajax中，这个所谓的视图层不返回页面，只返回数据,所以也可以称作是一个数据层）
		//将"wordxml.jsp"处理后的数据发给 "JqueryAutoComplete.html"页面
		request.getRequestDispatcher("/ws/jquery/biaoyinsxfw.jsp").forward(request, response);
	}

	public void init() throws ServletException
	{
		
	}
	public void destroy()
	{
		super.destroy(); 
	}
}
