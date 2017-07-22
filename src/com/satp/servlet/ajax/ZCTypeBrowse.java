package com.satp.servlet.ajax;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.satp.dao.DataBaseDao;
import com.satp.dao.ZCTypeDao;
import com.satp.entity.Sxfw;
import com.satp.entity.Tzly;
import com.satp.entity.ZCType;

import net.sf.json.JSONArray;


/**
 * Servlet implementation class ZCTypeBrowse
 */
public class ZCTypeBrowse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZCTypeBrowse() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
  		// TODO Auto-generated method stub
  		super.init(config);
  		dataBase = new DataBaseDao();
  	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");

		Connection con = dataBase.connection();
		ZCTypeDao zctypedao=new ZCTypeDao();
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		StringBuffer jsonresult = new StringBuffer();
		JSONArray jsonArrayResult = new JSONArray();
		jsonresult.append("[");
		if ("top".equals(type)) {
			if ("ZCLB".equals(keyword)) {
				ArrayList<ZCType> zctypeList = zctypedao.getZCFL(con);
				for (ZCType zctype : zctypeList)
				{
					jsonArrayResult.add(zctype.getZname());
				}
				
			} else if ("SXFW".equals(keyword)) {
				ArrayList<Sxfw> sxfwList = zctypedao.getSxfw(con);
				for (Sxfw sxfw : sxfwList)
				{
					jsonArrayResult.add(sxfw.getSXFWMC());
				}
			} else if ("TZLY".equals(keyword)) {
				ArrayList<Tzly> tzlyList = zctypedao.getTZLY(con);
				for (Tzly tzly : tzlyList)
				{
					jsonArrayResult.add(tzly.getTTZLYMC());
				}
			}
		}
		//jsonresult.append("]");
		dataBase.closeConnection(con);
		PrintWriter out = response.getWriter();
		out.write(jsonArrayResult.toString());
		out.flush();
		out.close();

	}
}
