package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AlterZCLB
 */
public class AlterZCLB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterZCLB() {
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
			String alterzclbmc=request.getParameter("alterzclbmc");
			String id=request.getParameter("id");
			String alterzclbqp=request.getParameter("alterzclbqp");
			String alterzclbjc=request.getParameter("alterzclbjc");
			String alterzclbbz=request.getParameter("alterzclbbz");
			PrintWriter out=response.getWriter();

			String sql="update  ZCFLB   SET zjc = '"+alterzclbjc+"', ZCFLMC='"+alterzclbmc+"', Zbz='"+alterzclbbz+"', ZQP='"+alterzclbqp+"' WHERE ZCFLID='"+id+"'";
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
