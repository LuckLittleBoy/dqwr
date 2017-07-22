package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddTZYL
 */
public class AddTZYL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTZYL() {
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
			String addtzlybz=request.getParameter("addtzlybz");
			String addtzlyjc=request.getParameter("addtzlyjc");
			String addtzlymc=request.getParameter("addtzlymc");
			String addtzlyqp=request.getParameter("addtzlyqp");
			PrintWriter out=response.getWriter();

			String sql="insert into  TTZLYB(tbz,tjc,tTZLYMC,tqp)  values('"+addtzlybz+"','"+addtzlyjc+"','"+addtzlymc+"','"+addtzlyqp+"')";
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