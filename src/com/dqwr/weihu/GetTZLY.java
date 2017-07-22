package com.dqwr.weihu;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.TZLY;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetTZLY
 */
public class GetTZLY extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTZLY() {
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
			List<TZLY> list=new ArrayList<TZLY>();
			String sql="SELECT * from TTZLYB";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			try {
				while(rs.next()){
					TZLY a= new TZLY();
					a.setId(rs.getString("tid").replace(" ", ""));
					a.setTBZ(rs.getString("tBZ"));
					a.setTJC(rs.getString("tJC").replace(" ", ""));
					a.setTQP(rs.getString("tQP").replace(" ", ""));
					a.setTTZLYMC(rs.getString("tTZLYMC").replace(" ", ""));	
					list.add(a);
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			rs.close();
			Sqlcon.close();
			JSONArray msg=JSONArray.fromObject(list);	
			String strmsg=msg.toString();
			strmsg="{'tzly':"+strmsg+"}";	
			System.out.println(strmsg);
			response.getWriter().print(strmsg);
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'tzly':'fail'}");
		}
		
	}

}
