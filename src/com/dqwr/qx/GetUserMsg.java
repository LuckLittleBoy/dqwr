package com.dqwr.qx;

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
import beans.User;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetUserMsg
 */
public class GetUserMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			response.setCharacterEncoding("utf-8");
			ResultSet rs=null;
			//admin为超级用户不允许修改权限
			String sql="select  * from users,JSB where yhid!='admin' and YJSID=JSID";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			List<User> list=new ArrayList<User>();
			try {
				while(rs.next()){
					User i=new User();
					i.setYhid(rs.getString("yhid"));
					i.setYhnc(rs.getString("yhnc"));
					i.setYhsex(rs.getString("yhsex"));
					i.setYhunit(rs.getString("yhunit"));
					i.setYhjob(rs.getString("yhjob"));
					i.setYhtitle(rs.getString("yhjobtitle"));
					i.setYhtell(rs.getString("yhtell"));
					i.setJsmc(rs.getString("JSMC"));
					list.add(i);
				}
				rs.close();
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			Sqlcon.close();
		
			JSONArray msg=JSONArray.fromObject(list);
			String strmsg=msg.toString();
			strmsg="{'users':"+strmsg+"}";
			//strmsg="{'inform':"+strmsg+"}";
			System.out.print(strmsg);
			response.getWriter().print(strmsg);	
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'users':'fail'}");
		}
		
		
	}

}