package com.dqwr.qx;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
public class AddJS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJS() {
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
 			
 			String jsname=request.getParameter("jsname");
 			PrintWriter out=response.getWriter();
 			// 	先判断是否存在此用户
 			String sql="select * from jsb where jsmc='"+jsname+"'";
 			if(Sqlcon.executeQuery(sql).next()){
 				out.print("{'add':'adderror'}");
 				return;
 			};
 			sql="insert into  JSB(jsmc) values('"+jsname+"')";
 			System.out.println(sql);
 			if(Sqlcon.executeUpdate(sql)>=1){
 				out.print("{'add':'success'}");
 				String newqxmsg=request.getParameter("newqxmsg");
 				String[] qx=newqxmsg.split(",");
				String count="";//插入权限时要插入它的父权限如：0.0：1 要插入 0
				String allcount="";
				ResultSet rs=null;
				ResultSet rs2=null;
				sql="select * from jsb where jsmc='"+jsname+"'";
				rs2=Sqlcon.executeQuery(sql);
				rs2.next();
				String jsid = rs2.getString("jsid");
				for(int i=0;i<qx.length;i++){			
					sql="select * from cdb where cdid='"+qx[i]+"'";
					
					rs=Sqlcon.executeQuery(sql);
					rs.next();
					String s=rs.getString("cdjb").replace(" ", "");
					String fu=s.split("[.]")[0];
					if(!count.equals(fu)){
						count=fu;		
						//allcount+=fu+",";
						//查询出父菜单的cdid
						sql="select * from cdb where cdjb='"+fu+"'";
						rs=Sqlcon.executeQuery(sql);
						rs.next();
						String cdid=rs.getString("cdid").replace(" ", "");
						//插入父权限的cdid
						sql="insert into QXB(QJSID,QCDID) values('"+jsid+"','"+cdid+"')";
						System.out.println(sql);
						Sqlcon.executeUpdate(sql);	
					}
					System.out.println(fu);
					sql="insert into QXB(QJSID,QCDID) values('"+jsid+"','"+qx[i]+"')";
					System.out.println(sql);
					Sqlcon.executeUpdate(sql);	
				}
				
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