package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AlterDZJG
 */
public class AlterZDJG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterZDJG() {
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
			String alterzdjgmc=request.getParameter("alterzdjgmc");
			String alterzdjgqc=request.getParameter("alterzdjgqc");
			String alterzdjgymc=request.getParameter("alterzdjgymc");
			String alterzdjgjc=request.getParameter("alterzdjgjc");
			String alterzdjgpy=request.getParameter("alterzdjgpy");
			String alterzdjgbz=request.getParameter("alterzdjgbz");
			//String alterzdjgssbm=request.getParameter("alterzdjgssbm");
			String alterzdjgssbm="";
			String id=request.getParameter("id");
			/*if(alterzdjgssbm.equals("1")){
				alterzdjgssbm="国务院组成部门";
			}
			else if(alterzdjgssbm.equals("2")){
				alterzdjgssbm="国务院直属特设机构";
			}
			else if(alterzdjgssbm.equals("3")){
				alterzdjgssbm="国务院直属机构";
			}
			else if(alterzdjgssbm.equals("4")){
				alterzdjgssbm="国务院办事机构";
			}
			else if(alterzdjgssbm.equals("5")){
				alterzdjgssbm="国务院部委管理的国家局";
			}
			*/
			PrintWriter out=response.getWriter();
			String sql="update  ZDJGB   SET zdjgpy = '"+alterzdjgpy+"', zdjgjc='"+alterzdjgjc+"', zdjgmc='"+alterzdjgmc+"', zdjgqc='"+alterzdjgqc+"', zdjgymc='"+alterzdjgymc+"', zssbm='"+alterzdjgssbm+"', zbz='"+alterzdjgbz+"' WHERE zid='"+id+"'";
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