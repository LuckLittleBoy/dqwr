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
public class getzdjg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static DataBaseDao dataBase = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getzdjg() {
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
		 * 只能输入的zdjg 、制定机关
		 */
		ArrayList<ZDJG> zdjglist = ZhiNengShuRu.selectzdjg(con);
		dataBase.closeConnection(con);
		JSONArray msg = JSONArray.fromObject(zdjglist);
		String strmsg = msg.toString();
		strmsg="{'zdjg':"+strmsg+"}";
		System.out.println(strmsg);
		response.getWriter().print(strmsg);
	}

}
