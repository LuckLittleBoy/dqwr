package com.dqwr.dbadmin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class GetDBMsg
 */
public class GetDBMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDBMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String linknum="0";
		String jinchengnum="0";
		//String hudongnum="0";
		r1=Sqlcon.executeQuery(sql);
		try {
			r1.next();
			linknum=r1.getString(1);
			System.err.println(r1.getString(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql="sp_who active;";
		r1=null;
		int n=0;
		r1=Sqlcon.executeQuery(sql);
		try {
			while(r1.next()){
				n++;
			}
			jinchengnum=""+n;	
			System.err.println(n);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try{
			YH user =(YH) request.getSession().getAttribute("user");
			sql="insert into  log values('数据库','"+user.getYHID()+"','获取数据库优化信息','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
			System.out.println(sql);
 			Sqlcon.executeUpdate(sql);					
 		}
 		catch(Exception e){
 		}
		Sqlcon.close();
		response.getWriter().print("{'links':'"+linknum+"','jincheng':'"+jinchengnum+"'}");
	}

}