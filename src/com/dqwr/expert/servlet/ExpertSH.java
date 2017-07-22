package com.dqwr.expert.servlet;


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
import com.dqwr.expert.daoimpl.ExpertDaoImpl;
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

public class ExpertSH extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertSH() {
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
//				request.setCharacterEncoding("utf-8");
//				response.setCharacterEncoding("utf-8");
//				Connection con = database.connection();
//				String infoid=request.getParameter("requid");
//				ResultSet rs=null;
//		        PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
//		        Info info=new Info();
//				rs=infoimpl.selectInfoById(con, Integer.parseInt(infoid));
//				try {
//					if(rs.next()){
//						info.setInfoId(rs.getInt(1));
//						info.setTitle(rs.getString(2));
//						info.setType(rs.getByte(3));
//						info.setScope(rs.getByte(4));
//						info.setContent(rs.getString(5));
//						info.setCreatorId(rs.getString(6));
//						info.setAddDate(rs.getString(7));
//					}
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				request.setAttribute("Info", info);
//				database.closeConnection(con);
//				request.getRequestDispatcher("ws/infoshenhe.jsp").forward(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		int ExpertID=Integer.parseInt(request.getParameter("ExpertID"));
		int ispass=Integer.parseInt(request.getParameter("shenhe"));
		String SH=request.getParameter("SH");
		String pageno=request.getParameter("pageno");
		String yjnr=request.getParameter("yjnr");
		
		ExpertDaoImpl  expertimpl=new ExpertDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		if(expertimpl.shenheExpert(con, ExpertID, ispass, yjnr,SH)){
			if(SH.equals("0")){
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/expert1.jsp?exppass=1&pageno="+pageno+"';"+"</script>");
			}else{
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/expert1.jsp?exppass=3&pageno="+pageno+"';"+"</script>");
			}	
		  //response.sendRedirect("ws/public_info.jsp?ispass=0"); 
		}else{
			output.print("<script language=jvascript>" + "alert('审核失败');"+"</script>");
		}
		database.closeConnection(con);
		//request.setAttribute("policy", policy);
	}
	}
