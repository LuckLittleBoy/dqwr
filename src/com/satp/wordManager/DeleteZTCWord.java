package com.satp.wordManager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class DeleteZTCWord
 */
public class DeleteZTCWord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteZTCWord() {
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
  			PrintWriter out=response.getWriter();
  			String sql="Delete from ZCTK WHERE id="+id;
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
