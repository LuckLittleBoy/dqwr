package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddZCLB
 */
public class AddZCLB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddZCLB() {
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
			String addzclbmc=request.getParameter("addzclbmc");
			String addzclbqp=request.getParameter("addzclbqp");
			String addzclbjc=request.getParameter("addzclbjc");
			String addzclbbz=request.getParameter("addzclbbz");
			PrintWriter out=response.getWriter();

			String sql="insert into  ZCFLB values('"+addzclbmc+"','"+addzclbbz+"','"+addzclbqp+"','"+addzclbjc+"')";
			System.out.println(sql);
			if(Sqlcon.executeUpdate(sql)>=1){
				out.print("{'add':'success'}");
			}
			else{
				out.print("{'add':'fail'}");
			}									
		}
		catch(Exception e){
			response.getWriter().print("{'add':'fail'}");
		}
		
		
	}

}