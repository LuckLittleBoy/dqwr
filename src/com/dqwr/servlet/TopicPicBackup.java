package com.dqwr.servlet;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContextEvent;

import com.dqwr.dao.DataBaseDao;

public class TopicPicBackup
{
	public static void imageDifferentBackup(ServletContextEvent sce)
	{
		DataBaseDao database = new DataBaseDao();
		PreparedStatement ps = null;
		ResultSet rs1 = null,rs2 = null;
		String path=sce.getServletContext().getRealPath("/")+"images\\TopicUpload";
		File file = new File(path);
		String []fileName = file.list();
		
		String sql = "select picpath from TOPIC";
		boolean imgIsExit=true;
		try
		{
			ps = database.connection().prepareStatement(sql);
			rs1 = ps.executeQuery();
			database.connection().commit();
			
			while(rs1.next())
			{
				String picpath = rs1.getString(1);
				for(int i=0;i<fileName.length;i++)
				{
					String fullpath = fileName[i];
					if(picpath.equals(fullpath))
					{
						imgIsExit=true;
						break;
					}
					else
					{
						imgIsExit=false;
					}
				}
				
				if(!imgIsExit||fileName.length==0)
				{
					String deletesql = "delete from TOPIC where picpath = '" + picpath + "'";
					ps = database.connection().prepareStatement(deletesql);
					ps.executeUpdate();
					database.connection().commit();
				}
			}
			
			String insertsql = "insert into TOPIC (topicName,publisher,time,link,picpath,display) values(?,?,?,?,?,?)";
			
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String datetime = dateFormat.format(date);
			
			String selectsql = "select COUNT(*) from TOPIC where picpath = '2015111222235783.jpg'";
			ps = database.connection().prepareStatement(selectsql);
			rs2 = ps.executeQuery();
			database.connection().commit();
			if(rs2.next()&&rs2.getInt(1)==0)
			{
				ps = database.connection().prepareStatement(insertsql);
				ps.setString(1,"默认初始链接");
				ps.setString(2,"admin");
				ps.setString(3,datetime);
				ps.setString(4,"http://127.0.0.1:8080/dqwr/qt/index.jsp");
				ps.setString(5,"2015111222235783.jpg");
				ps.setBoolean(6, true);
				ps.executeUpdate();
				database.connection().commit();
			}
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		try
		{
			rs1.close();
			rs2.close();
			ps.close();
			database.connection().close();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
