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
import beans.QX2;
import beans.User;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetUserQX
 */
public class GetUserQX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserQX() {
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
		
		try{
			
			response.setCharacterEncoding("utf-8");
			ResultSet rs=null;
			String userid=request.getParameter("userid");
			String sql="select  * from yhqx where yhid='"+userid+"'";
			rs = Sqlcon.executeQuery(sql);
			List<QX2> list=new ArrayList<QX2>();
			try {
				while(rs.next()){
					QX2 i=new QX2();
					i.setCdid(rs.getString("cdid").replace(" ", ""));
					i.setId(rs.getString("id").replace(" ", ""));
					i.setYhid(rs.getString("yhid").replace(" ", ""));
					list.add(i);
				}
				rs.close();
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			Sqlcon.close();
		
			JSONArray msg=JSONArray.fromObject(list);
			String strmsg=msg.toString();
			strmsg="{'userqx':"+strmsg+"}";
			//strmsg="{'inform':"+strmsg+"}";
			System.out.print(strmsg);
			response.getWriter().print(strmsg);	
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'userqx':'fail'}");
		}
		
		
	}

}