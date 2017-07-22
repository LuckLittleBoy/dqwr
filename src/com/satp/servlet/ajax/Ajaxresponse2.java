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

import net.sf.json.JSONArray;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZCTypeDao;
import com.satp.entity.Bbxs;
import com.satp.entity.Sxfw;
import com.satp.entity.Tzly;
import com.satp.entity.ZCType;
import com.satp.entity.Zdjg;

/**
 * Servlet implementation class Ajaxresponse2
 */
public class Ajaxresponse2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajaxresponse2() {
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
		String ZcflSelect = request.getParameter("keyword");
		StringBuffer jsonresult = new StringBuffer();
		JSONArray jsonArrayResult = new JSONArray();
		jsonresult.append("{");
        if ("field".equals(ZcflSelect))
        {
		    ArrayList<Tzly> tzlyList = zctypedao.getTZLY(con);
		    String fwresp="";
		    for (Tzly ztly : tzlyList)
			{
		    	fwresp+=ztly.getTTZLYMC()+","+ztly.getTQP()+","+ztly.getTJC()+":";
			}
		    fwresp=fwresp.substring(0, fwresp.length()-1);
			jsonArrayResult.add(fwresp);
		} 

        if ("pcategories".equals(ZcflSelect))
        {
				ArrayList<ZCType> zcflList = zctypedao.getZCFL(con);
				String resp="";
				for (ZCType zc : zcflList)
				{
					resp+=zc.getZname()+","+zc.getZQP()+","+zc.getZJC()+":";
				}
				resp=resp.substring(0, resp.length()-1);
				jsonArrayResult.add(resp);
		}
        if ("sxzt".equals(ZcflSelect))
        {
				jsonArrayResult.add("有效,YOUXIAO,YX:失效,SHIXIAO,SX");
		}
		//jsonresult.append("}");
        dataBase.closeConnection(con);
		PrintWriter out = response.getWriter();
		out.write(jsonArrayResult.toString());
		out.flush();
		out.close();
	}

}
