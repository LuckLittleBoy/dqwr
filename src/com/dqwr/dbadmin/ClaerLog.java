package com.dqwr.dbadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.dqwr.history.AddLogUnity;

/**
 * Servlet implementation class ClaerLog
 */
public class ClaerLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClaerLog() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		// TODO Auto-generated method stub
 		doPost(request,response);
 	}

 	/**
 	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 	 */
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		try{
 			request.setCharacterEncoding("utf-8");	
 			String sql="delete from log";
 			PrintWriter out=response.getWriter();
 			System.out.println(sql);
 			if(Sqlcon.executeUpdate(sql)>=1){
 				out.print("{'delete':'success'}");
 			}
 			else{
 				out.print("{'delete':'fail'}");
 			}
 			Sqlcon.close();
 			try{
  				YH user =(YH) request.getSession().getAttribute("user");
  				AddLogUnity.add("日志", user.getYHID(), "清除日志");
  	 		}
  	 		catch(Exception e){
  	 		}
 		}
 		catch(Exception e){
 			response.getWriter().print("{'delete':'fail'}");
 		}
 		
 		
 	}

}
