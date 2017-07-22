package com.dqwr.dbadmin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class DByouhua
 */
public class DByouhua extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DByouhua() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		String type=request.getParameter("type");
		String sql="select count(*) from Master.dbo.SysProcesses where dbid=db_id();";
		ResultSet r1=null;
		r1=Sqlcon.executeQuery(sql);
		try {
			r1.next();
			System.err.println(r1.getString(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(type.equals("1")||type.equals("3")){
			//关闭数据库空连接
			sql="select 'kill '+ rtrim(spid) from master.dbo.sysprocesses where spid> 50 and waittype = 0x0000 and waittime = 0 and status = 'sleeping' and last_batch < dateadd(minute, -60, getdate()) and login_time < dateadd(minute, -60, getdate())";
			Sqlcon.executeQuery(sql);
			System.err.println("关闭数据库空连接");
		}
		if(type.equals("2")||type.equals("3")){
			//清除数据库缓存
			sql="DBCC DROPCLEANBUFFERS  DBCC FREEPROCCACHE SET STATISTICS IO ON SET STATISTICS TIME ON";
			
			Sqlcon.executeUpdate(sql);
			System.err.println("清除数据库缓存");
		}	
		Sqlcon.close();
	}

}
