package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.dqwr.entity.SXFW;
import com.dqwr.entity.ZTC;
import com.dqwr.model.ZhiNengShuRu;

/**
 * Servlet implementation class getztc
 */
public class getztc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static com.dqwr.dao.DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getztc() {
        super();
        dataBase = new com.dqwr.dao.DataBaseDao();
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = dataBase.connection();
		/**
		 * 智能输入主题词
		 */
		ArrayList<ZTC> ztclist = new ArrayList<ZTC>();
		ztclist = ZhiNengShuRu.selectZtc(con);
		dataBase.closeConnection(con);
		JSONArray msg = JSONArray.fromObject(ztclist);
		
		String strmsg=msg.toString();
		strmsg="{'ztc':"+strmsg+"}";
		System.out.println("ztc"+strmsg);
		response.getWriter().print(strmsg);
		

	}

}
