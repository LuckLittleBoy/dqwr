package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddSXFW
 */
public class AddSXFW extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSXFW() {
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
			String addsxfwid=request.getParameter("addsxfwid");
			String addsxfwjc=request.getParameter("addsxfwjc");
			String addsxfwmc=request.getParameter("addsxfwmc");
			String addsxfwqp=request.getParameter("addsxfwqp");
			PrintWriter out=response.getWriter();

			String sql="insert into  SXFWB(ssxfwid,spyjc,ssxfwmc,ssxfwqp)  values('"+addsxfwid+"','"+addsxfwjc+"','"+addsxfwmc+"','"+addsxfwqp+"')";
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