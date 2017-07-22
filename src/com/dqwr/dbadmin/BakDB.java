package com.dqwr.dbadmin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;


/**
 ************类说明**************
 * 类名：BakBD
 * 建类时间：2013-5-28 下午5:06:53
 * 类描述：还原数据库
 */
public class BakDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	//还原数据库
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Sqlcon.close();
		int result=Sqlcon.getBak();
		Sqlcon.close();
		if(result==-1)
		{
			try{
				YH user =(YH) request.getSession().getAttribute("user");
				String sql="insert into  log values('数据库','"+user.getYHID()+"','还原数据库','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
				System.out.println(sql);
	 			Sqlcon.executeUpdate(sql);					
	 		}
	 		catch(Exception e){
	 		}
			response.getWriter().println("{'bak':'success'}");
		}else
			response.getWriter().println("fail");
	}

}
