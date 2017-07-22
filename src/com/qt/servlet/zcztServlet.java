package com.qt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.TZLY;
import com.dqwr.entity.ZC;
import com.qt.model.qtselect;

public class zcztServlet extends HttpServlet {
	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zcztServlet() {
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
		ArrayList<TZLY> tzlyList=null;
		tzlyList = qtselect.zcztgengduo(con);
		
		database.closeConnection(con);
		JSONObject json=new JSONObject();  
	    JSONArray jsonMembers = new JSONArray();  
		if (tzlyList!=null){
			for(TZLY tzly :tzlyList){
				JSONObject  map2 = new JSONObject();  
		        map2.put("TID", tzly.getTid());
		        map2.put("TMC", tzly.getTmc());
		        jsonMembers.add(map2);
			}
		}
		
	    json.put("tzly", jsonMembers); 
	    out.print(json.toString());
		
	}

}
