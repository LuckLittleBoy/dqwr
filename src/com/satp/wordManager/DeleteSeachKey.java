package com.satp.wordManager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class DeleteSeachKey
 */
public class DeleteSeachKey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSeachKey() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
  			request.setCharacterEncoding("utf-8");
  			String id=request.getParameter("id");
  			String name=request.getParameter("name");
  			PrintWriter out=response.getWriter();
  			String sql="";
  			if(id.equals("3"))sql="Delete from gjck WHERE name='"+name+"'";
  			else if(id.equals("2"))sql="Delete from wygjck WHERE name='"+name+"'";
  			System.out.println(sql);
  			if(Sqlcon.executeUpdate(sql)>=1){
  				out.print("{'del':'success'}");
  				
  			}
  			else{
  				out.print("{'del':'fail'}");
  			}									
  		}
  		catch(Exception e){
  			response.getWriter().print("{'del':'fail'}");
  		}
  		
  		
		
	}

}
