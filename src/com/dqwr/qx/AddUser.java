package com.dqwr.qx;

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
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
 			String adduserid=request.getParameter("adduserid");
 			String addusernc=request.getParameter("addusernc");
 			String addusermm=request.getParameter("addusermm");
 			String addusersex=request.getParameter("addusersex");
 			String adduserunit=request.getParameter("adduserunit");
 			String adduserjob=request.getParameter("adduserjob");
 			String addusertitle=request.getParameter("addusertitle");
 			String addusertell=request.getParameter("addusertell");
 			PrintWriter out=response.getWriter();
 			// 	先判断是否存在此用户
 			String sql="select * from YHB where yhid='"+adduserid+"'";
 			if(Sqlcon.executeQuery(sql).next()){
 				out.print("{'add':'adderror'}");
 				return;
 			};
 			sql="insert into  YHB values('"+adduserid+"','"+addusernc+"','"+addusermm+"','1','"+addusersex+"','"+adduserunit+"','"+adduserjob+"','"+addusertitle+"','"+addusertell+"')";
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