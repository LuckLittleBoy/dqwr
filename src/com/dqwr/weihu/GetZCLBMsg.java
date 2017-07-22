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
import beans.ZCFL;
import beans.ZDJG;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetZCLBMsg
 */
public class GetZCLBMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetZCLBMsg() {
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
			List<ZCFL> list=new ArrayList<ZCFL>();
			String sql="SELECT * from ZCFLB";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			try {
				while(rs.next()){
					ZCFL a= new ZCFL();
					a.setZBZ(rs.getString("zBZ"));
					a.setZQP(rs.getString("zQP"));
					a.setZCFLID(rs.getString("zCFLID"));
					a.setZCFLMC(rs.getString("zCFLMC"));
					a.setZJC(rs.getString("zJC"));
				
					list.add(a);
				}
				
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			rs.close();
			Sqlcon.close();
			JSONArray msg=JSONArray.fromObject(list);	
			String strmsg=msg.toString();
			strmsg="{'zclb':"+strmsg+"}";	
			System.out.println(strmsg);
			response.getWriter().print(strmsg);
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'zdjg':'fail'}");
		}
		
	}

}
