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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

/**
 * Servlet implementation class submitpolicy
 */

public class xdshenhe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xdshenhe() {
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
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		String zcid = request.getParameter("zcid");//提交状态
		String shzt = request.getParameter("shenhe");//提交状态
		String qqzc = request.getParameter("qqzc");
		String swzc = request.getParameter("swzc");
		String swtag = request.getParameter("swtag");
		String qqtag = request.getParameter("qqtag");
		String thyy = request.getParameter("yjnr");
		System.out.println("swtag"+swtag+qqtag+thyy+swzc+qqzc+shzt);
		YH user = (YH) request.getSession().getAttribute("user");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		ZCMD.xDSHZC(con, zcid,user.getYHID(),shzt ,thyy , swtag , qqtag , df.format(new Date()), swzc, qqzc);
		
		/**
		 * 审核
		 */
		if("1".equals(shzt)){
				String qqzclist[] = qqzc.split(";");
				for(int j = 0 ;j<qqzclist.length;j++){
					ZCMD.QQSX(con, qqzclist[j]);
				}
		}
		database.closeConnection(con);
			response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('审核成功！'); window.location.href='ws/syzc.jsp';</script>");
	}
}
