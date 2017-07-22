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

public class gettree extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static com.dqwr.dao.DataBaseDao dataBase = null;
   
    public gettree() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dataBase = new com.dqwr.dao.DataBaseDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		YH user = (YH) session.getAttribute("user");
		Connection con = dataBase.connection();
		/**
		 * 对权限树的遍历
		 */
		List<CDGJD> menul1list = new ArrayList<CDGJD>();
		menul1list = QX.getTreeI(con, user.getYHID());
		dataBase.closeConnection(con);
		JSONArray msg=JSONArray.fromObject(menul1list);
		String strmsg=msg.toString();
		strmsg="{'menu':"+strmsg+"}";	
		response.getWriter().print(strmsg);
	}

}
