package com.dqwr.weihu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddZDJG
 */
public class AddZDJG extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddZDJG() {
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
			String addzdjgmc=request.getParameter("addzdjgmc");
			String addzdjgqc=request.getParameter("addzdjgqc");
			String addzdjgymc=request.getParameter("addzdjgymc");
			//String addzdjgssbm=request.getParameter("addzdjgssbm");
			String addzdjgssbm="";
			String addzdjgjc=request.getParameter("addzdjgjc");
			String addzdjgpy=request.getParameter("addzdjgpy");
			String addzdjgbz=request.getParameter("addzdjgbz");	
			/*if(addzdjgssbm.equals("1")){
				addzdjgssbm="国务院组成部门";
			}
			else if(addzdjgssbm.equals("2")){
				addzdjgssbm="国务院直属特设机构";
			}
			else if(addzdjgssbm.equals("3")){
				addzdjgssbm="国务院直属机构";
			}
			else if(addzdjgssbm.equals("4")){
				addzdjgssbm="国务院办事机构";
			}
			else if(addzdjgssbm.equals("5")){
				addzdjgssbm="国务院部委管理的国家局";
			}
			*/
			//<option value='1'></option><option value='2'></option><option value='3'></option><option value='4'></option><option value='5'></option></select></td>"+
			PrintWriter out=response.getWriter();
			String sql="insert into  ZDJGB  values('"+addzdjgpy+"','"+addzdjgmc+"','"+addzdjgqc+"','"+addzdjgymc+"','"+addzdjgjc+"','"+addzdjgssbm+"','"+addzdjgbz+"')";
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