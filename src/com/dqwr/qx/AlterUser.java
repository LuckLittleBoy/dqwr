package com.dqwr.qx;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class AlterUser
 */
public class AlterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");
			String alterid=request.getParameter("alterid");
			String altername=request.getParameter("altername");
			String altertitle=request.getParameter("altertitle");
			String alterunit=request.getParameter("alterunit");
			String alterjob=request.getParameter("alterjob");
			String altertell=request.getParameter("altertell");
			String altersex=request.getParameter("altersex");
			
			PrintWriter out=response.getWriter();
			String	sql="update  yhb   SET yhnc = '"+altername+"',yhsex = '"+altersex+"',yhunit = '"+alterunit+"',yhjob= '"+alterjob+"',yhjobtitle= '"+altertitle+"',yhtell= '"+altertell+"' WHERE yhid='"+alterid+"'";	
			System.out.println(sql);
			if(Sqlcon.executeUpdate(sql)>=1){
				out.print("{'update':'success'}");
				
			}
			else{
				out.print("{'update':'fail'}");
			}									
		}
		catch(Exception e){
			response.getWriter().print("{'update':'fail'}");
		}
		
		
	}

}
