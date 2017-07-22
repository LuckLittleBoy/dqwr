package com.dqwr.dbadmin;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.Log;
import beans.Page;
import beans.User;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetLogINITMsg
 */
public class GetLogINITMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLogINITMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		try{
			
			ResultSet rs=null;
			//admin为超级用户不允许修改权限
			String sql="select  * from users ";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			List<User> list=new ArrayList<User>();
			try {
				while(rs.next()){
					User i=new User();
					i.setYhid(rs.getString("yhid").replace(" ", ""));
					i.setYhnc(rs.getString("yhnc").replace(" ", ""));
					list.add(i);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			sql="select distinct type from LOG";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			List<String> list2=new ArrayList<String>();
			try {
				while(rs.next()){
					String i=new String();			
					i=rs.getString("type").replace(" ", "");
					list2.add(i);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Sqlcon.close();
		
			JSONArray msg=JSONArray.fromObject(list);
			String strmsg=msg.toString();
			msg=JSONArray.fromObject(list2);
			String strmsg2=msg.toString();
			strmsg="{'loginit':"+strmsg+",'type':"+strmsg2+"}";
			//strmsg="{'inform':"+strmsg+"}";
			System.out.print(strmsg);
			response.getWriter().print(strmsg);	
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'loginit':'fail'}");
		}
		
		
	}

}