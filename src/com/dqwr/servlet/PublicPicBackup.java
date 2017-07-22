package com.dqwr.servlet;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletContextEvent;
import com.dqwr.dao.DataBaseDao;

public class PublicPicBackup
{
	public static void imageDifferentBackup(ServletContextEvent sce)
	{
		DataBaseDao database = new DataBaseDao();
		PreparedStatement ps = null;
		ResultSet rs1 = null,rs2 = null;
		String path=sce.getServletContext().getRealPath("/")+"images\\Publicpic";
		File file = new File(path);
		String []fileName = file.list();
		
		String sql = "select Big from PublicPic";
		boolean imgIsExit=true;
		try
		{
			ps = database.connection().prepareStatement(sql);
			rs1 = ps.executeQuery();
			database.connection().commit();
			
			while(rs1.next())
			{
				String bigname = rs1.getString(1);
				for(int i=0;i<fileName.length;i=i+2)
				{
					String bigpath = path + "\\" + fileName[i];
					if(bigname.equals(bigpath))
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
					String deletesql = "delete from PublicPic where Big = '" + bigname + "'";
					ps = database.connection().prepareStatement(deletesql);
					ps.executeUpdate();
					database.connection().commit();
				}
			}
			
			String insertsql = "insert into PublicPic (Big,Small,Time) values(?,?,?)";
			
			for(int i=0;i<fileName.length;i=i+2)
			{
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String datetime = dateFormat.format(date);
				String bigpath = path + "\\" + fileName[i];
				String smallpath = path + "\\" + fileName[i+1];
				String selectsql = "select COUNT(*) from PublicPic where Big = '" + bigpath +"'";
				ps = database.connection().prepareStatement(selectsql);
				rs2 = ps.executeQuery();
				database.connection().commit();
				if(rs2.next()&&rs2.getInt(1)==0)
				{
					ps = database.connection().prepareStatement(insertsql);
					ps.setString(1,bigpath);
					ps.setString(2,smallpath);
					ps.setString(3,datetime);
					ps.executeUpdate();
					database.connection().commit();
				}
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
