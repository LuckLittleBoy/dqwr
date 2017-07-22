package com.dqwr.weihu;

import indexdir.Index;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import beans.SXFW;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetSXFWMsg
 */
public class GetSXFWMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSXFWMsg() {
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
			List<SXFW> list=new ArrayList<SXFW>();
			String sql="SELECT * from SXFWB";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			try {
				while(rs.next()){
					SXFW a= new SXFW();
					a.setId(rs.getString("id"));
					a.setSsxfwid(rs.getString("ssxfwid"));
					a.setSpyjc(rs.getString("spyjc").replace(" ", ""));
					a.setSsxfwmc(rs.getString("ssxfwmc").replace(" ", ""));
					a.setSsxfwqp(rs.getString("ssxfwqp").replace(" ", ""));					
					list.add(a);
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			rs.close();
			Sqlcon.close();
			JSONArray msg=JSONArray.fromObject(list);	
			String strmsg=msg.toString();
			strmsg="{'sxfw':"+strmsg+"}";	
			System.out.println(strmsg);
			response.getWriter().print(strmsg);
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'mans':'fail'}");
		}
		
	}

}
