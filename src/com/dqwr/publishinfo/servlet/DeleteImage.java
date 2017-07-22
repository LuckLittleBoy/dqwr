package com.dqwr.publishinfo.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;

@SuppressWarnings("serial")
public class DeleteImage extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		
		DataBaseDao db = new DataBaseDao();
		String sql = "delete from PublicPic where id = '" + id + "'";
		String selectsql = "select Big,Small from PublicPic where id = '" + id + "'";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int index=0;
		String bigPath = null;
		String smallPath = null;
		try
		{
			stmt = db.connection().prepareStatement(selectsql);
			rs = stmt.executeQuery();
			if(rs.next())
			{
				bigPath = rs.getString(1);
				smallPath = rs.getString(2);
				File bigPathFile = new File(bigPath);
				File smallPathFile = new File(smallPath);
				if (bigPathFile.exists()&&smallPathFile.exists()) 
				{
					bigPathFile.delete();
					smallPathFile.delete();
				}
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			stmt = db.connection().prepareStatement(sql);
			index = stmt.executeUpdate();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		if(index == 1)
		{
			out.print("<script language=javascript>"+"alert('删除成功');document.location.href='ws/Public_pic.jsp';"+"</script>");
		}
		else
		{
			out.print("<script language=javascript>"+"alert('删除失败');"+"</script>");
		}
		out.flush();
		out.close();
		try
		{
			rs.close();
			stmt.close();
			db.connection().close();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}
