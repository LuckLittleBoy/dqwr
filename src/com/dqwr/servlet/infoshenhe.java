package com.dqwr.servlet;


import indexdir.Index;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import beans.Article;

import com.dqwr.dao.*;
import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.dqwr.model.*;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

/**
 * Servlet implementation class submitpolicy
 */

public class infoshenhe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoshenhe() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		database = new com.dqwr.dao.DataBaseDao();
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				Connection con = database.connection();
				String infoid=request.getParameter("requid");
				ResultSet rs=null;
		        PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
		        Info info=new Info();
				rs=infoimpl.selectInfoById(con, Integer.parseInt(infoid));
				try {
					if(rs.next()){
						info.setInfoId(rs.getInt(1));
						info.setTitle(rs.getString(2));
						info.setType(rs.getByte(3));
						info.setScope(rs.getByte(4));
						info.setContent(rs.getString(5));
						info.setCreatorId(rs.getString(6));
						info.setAddDate(rs.getString(7));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("Info", info);
				database.closeConnection(con);
				request.getRequestDispatcher("ws/infoshenhe.jsp").forward(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
