package com.dqwr.dbadmin;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.dqwr.history.AddLogUnity;
/**
 ************类说明**************
 * 类名：BackupDB
 * 建类时间：2013-5-28 下午2:08:14
 * 类描述：备份数据库的servlet
 */
public class BackupDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String type=request.getParameter("type");
		String path =request.getSession().getServletContext().getRealPath("\\dqwr.bak");	
		int result=0;
		if("1".equals(type))
			result=Sqlcon.backup(path);
		Sqlcon.close();
		
		if(result==-1||result==0){
			File file=new File(path);
		     Date date=new Date(file.lastModified());
		     SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日  HH点mm分ss秒");
		     DecimalFormat formatSize=new DecimalFormat("#.00");
		     String dates =format.format(date);
		     String msg="";
		     
		     if("1".equals(type))
		      msg="{'backup':'success','filename':'"+file.getName()+"','date':'"+
		    		 	dates+"','path':'"+file.getPath()+"','size':'"+formatSize.format((double)file.length()/1024/1024)+"MB'}";
		     else msg="{'backup':'ok','filename':'"+file.getName()+"','date':'"+
		    		 	dates+"','path':'"+file.getPath()+"','size':'"+formatSize.format((double)file.length()/1024/1024)+"MB'}";
			response.getWriter().println(msg);
			try{
  				YH user =(YH) request.getSession().getAttribute("user");
  				AddLogUnity.add("数据库", user.getYHID(), "备份数据库");
  	 		}
  	 		catch(Exception e){
  	 		}
		}else{
			 String msg="{'backup':'fail','filename':'no','date':'no','path':'no','size':'no'}";
			response.getWriter().println(msg);
		}
	}

}
