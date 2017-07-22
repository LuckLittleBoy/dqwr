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
public class SaveNewQX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNewQX() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			String userid=request.getParameter("userid");
			System.out.println(userid);
			if(userid.equals("-11")){
				out.print("{'set':'error'}");
				return;
			}
			String jsid = request.getParameter("jsid");
			String newqxmsg=request.getParameter("newqxmsg");	
			String sql="Delete from yhqx WHERE yhid='"+userid+"'";
			String sql2="update YHB set YJSID ='"+jsid+"' where yhid='"+userid+"'";
			//rs = Sqlcon.executeQuery(sql);
			ResultSet rs=null;
			if(Sqlcon.executeUpdate(sql)>=0&&Sqlcon.executeUpdate(sql2)>=0){
				System.out.println("删除权限和修改用户角色成功");
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
						sql="insert into yhqx values('"+userid+"','"+cdid+"')";
						Sqlcon.executeUpdate(sql);	
					}
					sql="insert into yhqx values('"+userid+"','"+qx[i]+"')";
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