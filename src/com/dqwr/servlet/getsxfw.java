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

import com.dqwr.entity.*;
import com.dqwr.model.QX;
import com.dqwr.model.ZhiNengShuRu;

/**
 * Servlet implementation class gettree
 */
public class getsxfw extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static com.dqwr.dao.DataBaseDao dataBase = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getsxfw() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		dataBase = new com.dqwr.dao.DataBaseDao();
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
		 * 只能输入实行范围
		 */
		ArrayList<SXFW> sxfwlist = new ArrayList<SXFW>();
		sxfwlist = ZhiNengShuRu.selectsxfw(con);
		dataBase.closeConnection(con);
		JSONArray msg = JSONArray.fromObject(sxfwlist);
		
		String strmsg=msg.toString();
		strmsg="{'sxfw':"+strmsg+"}";
		response.getWriter().print(strmsg);
		
		/**
		HttpSession session = request.getSession();
		
		YH user = (YH) session.getAttribute("user");
		Connection con = dataBase.connection();
		List<CDGJD> menul1list = new ArrayList<CDGJD>();
		menul1list = QX.getTreeI(con, user.getYJSID());
		
		JSONArray msg=JSONArray.fromObject(menul1list);
		String strmsg=msg.toString();
		strmsg="{'menu':"+strmsg+"}";	
		System.out.print(strmsg);
		response.getWriter().print(strmsg);
		**/
	}

}
