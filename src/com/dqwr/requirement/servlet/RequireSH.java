package com.dqwr.requirement.servlet;


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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

/**
 * Servlet implementation class submitpolicy
 */

public class RequireSH extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequireSH() {
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
		System.out.println("进来了");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		int requid=Integer.parseInt(request.getParameter("requid"));
		int ispass=Integer.parseInt(request.getParameter("shenhe"));
		String pageno=request.getParameter("pageno");
		String SH=request.getParameter("SH");
		String yjnr=request.getParameter("yjnr");
		
		RequireDaoImpl  requimpl=new RequireDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		if(requimpl.updateRequire(con, requid, ispass, yjnr,SH)){
			if(SH.equals("0")){
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/xdsh.jsp?reqpass=1&pageno="+pageno+"';"+"</script>");	
			}else if(SH.equals("1")){
				  output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/xdsh.jsp?reqpass=3&pageno="+pageno+"';"+"</script>");
			}
		}else{
			output.print("<script language=jvascript>" + "alert('审核失败');"+"</script>");
		}
		database.closeConnection(con);
 	}
	}
