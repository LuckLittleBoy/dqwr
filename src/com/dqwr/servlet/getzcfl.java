package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.*;
import com.dqwr.model.QX;
import com.dqwr.model.ZhiNengShuRu;

/**
 * Servlet implementation class getzdjg
 */
public class getzcfl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static DataBaseDao dataBase = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getzcfl() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = dataBase.connection();
		/**
		 * 只能输入政策分类
		 */
		ArrayList<ZCFL> zcfllist = ZhiNengShuRu.selectzcfl(con);
		dataBase.closeConnection(con);
		JSONArray msg = JSONArray.fromObject(zcfllist);
		String strmsg = msg.toString();
		strmsg="{'zcfl':"+strmsg+"}";
		response.getWriter().print(strmsg);
	}

}
