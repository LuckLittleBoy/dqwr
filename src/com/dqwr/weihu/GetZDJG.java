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
import beans.ZDJG;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetZDJG
 */
public class GetZDJG extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetZDJG() {
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
			List<ZDJG> list=new ArrayList<ZDJG>();
			String sql="SELECT * from ZDJGB";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			try {
				while(rs.next()){
					ZDJG a= new ZDJG();
					a.setZBZ(rs.getString("zBZ"));
					a.setZDJGJC(rs.getString("zDJGJC").replace(" ", ""));
					a.setZDJGMC(rs.getString("zDJGMC").replace(" ", ""));
					a.setZDJGPY(rs.getString("zDJGPY").replace(" ", ""));
					a.setZDJGQC(rs.getString("zDJGQC"));
					a.setZDJGYMC(rs.getString("zDJGYMC"));
					a.setZID(rs.getString("zID").replace(" ", ""));
					a.setZSSBM(rs.getString("zSSBM").replace(" ", ""));
					list.add(a);
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			rs.close();
			Sqlcon.close();
			JSONArray msg=JSONArray.fromObject(list);	
			String strmsg=msg.toString();
			strmsg="{'zdjg':"+strmsg+"}";	
			System.out.println(strmsg);
			response.getWriter().print(strmsg);
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'zdjg':'fail'}");
		}
		
	}

}
