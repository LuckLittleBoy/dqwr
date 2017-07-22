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
public class DeleteUser extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
 			String userid=request.getParameter("userid");
 			PrintWriter out=response.getWriter();
            //删除该用户
 			String sql="delete from YHB where yhid='"+userid+"'";
 			if(Sqlcon.executeUpdate(sql)>=1){
 				out.print("{'deleteuser':'success'}");
 			}
 			else{
 				out.print("{'deleteuser':'fail'}");
 			}									
 		}
 		catch(Exception e){
 			response.getWriter().print("{'deleteuser':'fail'}");
 		}	
 	}

 }