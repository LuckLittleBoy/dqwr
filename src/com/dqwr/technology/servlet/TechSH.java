package com.dqwr.technology.servlet;


import indexdir.Index;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.dqwr.requirement.dao.impl.RequireDaoImpl;
import com.dqwr.technology.dao.impl.TechnologyDaoImpl;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

/**
 * Servlet implementation class submitpolicy
 */

public class TechSH extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TechSH() {
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

		
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		int requid=Integer.parseInt(request.getParameter("techid"));
		int ispass=Integer.parseInt(request.getParameter("shenhe"));
		String SH=request.getParameter("SH");
		String pageno=request.getParameter("pageno");
		String yjnr=request.getParameter("yjnr");
		
		TechnologyDaoImpl  techimpl=new TechnologyDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		if(techimpl.updateTech(con, requid, ispass, yjnr,SH)){
			if(SH.equals("0")){
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/technology.jsp?techpass=1&pageno="+pageno+"';"+"</script>");
			}else{
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/technology.jsp?techpass=3&pageno="+pageno+"';"+"</script>");
			}	
		  //response.sendRedirect("ws/public_info.jsp?ispass=0"); 
		}else{
			output.print("<script language=jvascript>" + "alert('审核失败');"+"</script>");
		}
		database.closeConnection(con);
		//request.setAttribute("policy", policy);
	}
	}
