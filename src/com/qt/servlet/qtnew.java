package com.qt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.model.ZCMD;
import com.qt.model.qtselect;

/**
 * Servlet implementation class qtnew
 */
public class qtnew extends HttpServlet {

	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qtnew() {
        super();
		database = new DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @return 
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		Connection con = database.connection();
		ArrayList<ZC> zcList = qtselect.indexqtnews(con);
		database.closeConnection(con);
		JSONObject json=new JSONObject();  
	    JSONArray jsonMembers = new JSONArray();  
		if (zcList!=null){
			for(ZC zc :zcList){
				JSONObject  map2 = new JSONObject();  
		        map2.put("zcid", zc.getZCID());
		        map2.put("zcmc",zc.getZCMC() );
		        map2.put("lasttime", zc.getLasttime());
		        map2.put("gbrq",zc.getBGBRQ());
		        map2.put("zcwh", zc.getZCWH());
		        jsonMembers.add(map2);
			}
		}

	    json.put("news", jsonMembers); 

	    out.print(json.toString());
		
	}

}
