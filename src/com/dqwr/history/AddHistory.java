package com.dqwr.history;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class AddHistory
 */
public class AddHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHistory() {
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
 			String history=request.getParameter("history");
 			System.out.println(history);
 			String str_query=request.getParameter("str_query");
 			PrintWriter out=response.getWriter();
 			YH user =(YH) request.getSession().getAttribute("user");
 			String sql="insert into  WDLS values('"+user.getYHID()+"','"+str_query+"','"+history+"','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
 			System.out.println(sql);
 			if(Sqlcon.executeUpdate(sql)>=1){
 				try{
		 			sql="insert into  log values('检索','"+user.getYHID()+"','增加我的历史记录','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
		 			System.out.println(sql);
		 			Sqlcon.executeUpdate(sql);
		 						
		 		}
		 		catch(Exception e){
		 		}
 				out.print("{'add':'success'}");
 				
 			}
 			else{
 				out.print("{'add':'fail'}");
 			}									
 		}
 		catch(Exception e){
 			response.getWriter().print("{'add':'fail'}");
 		}
 		
 		Sqlcon.close();
 	}

 }