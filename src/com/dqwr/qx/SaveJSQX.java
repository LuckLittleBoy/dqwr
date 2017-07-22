package com.dqwr.qx;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.QX2;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class SaveNewQX
 */
public class SaveJSQX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveJSQX() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			PrintWriter out=response.getWriter();
			response.setCharacterEncoding("utf-8");
			String jsid=request.getParameter("jsid");
			if(jsid.equals("-1")){
				out.print("{'set':'saveerror'}");
				return;
			}
			String newqxmsg=request.getParameter("newqxmsg");	
			String sql="Delete from QXB WHERE QJSID='"+jsid+"'";
			System.out.println(sql);
			
			//rs = Sqlcon.executeQuery(sql);
			ResultSet rs=null;
			if(Sqlcon.executeUpdate(sql)>=0){
				String[] qx=newqxmsg.split(",");
				String count="";//插入权限时要插入它的父权限如：0.0：1 要插入 0
				String allcount="";
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
						sql="insert into qxb values('"+jsid+"','"+cdid+"')";
						System.out.println(sql);
						Sqlcon.executeUpdate(sql);	
					}
					System.out.println(fu);
					sql="insert into qxb values('"+jsid+"','"+qx[i]+"')";
					System.out.println(sql);
					Sqlcon.executeUpdate(sql);	
				}
				
			}		
			out.print("{'set':'success'}");
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'set':'fail'}");
		}
		Sqlcon.close();
		
	}

}