package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;

/**
 * Servlet implementation class shenhetuihui
 */
public class IsPassInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IsPassInfo() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
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
		Connection con = database.connection();
		int infoid=Integer.parseInt(request.getParameter("infoid"));
		int ispass=Integer.parseInt(request.getParameter("shenhe"));
		int pagesize=Integer.parseInt(request.getParameter("pagesize"));
		int pageno=Integer.parseInt(request.getParameter("pageno"));
		String yjnr=request.getParameter("yjnr");
		
		PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		if(infoimpl.updateInfo(con, infoid, ispass, yjnr)){
			output.print("<script language=javascript>" + "alert('审核成功');"+ "document.location.href='ws/public_info.jsp?ispass=0&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");
		}else{
			output.print("<script language=jvascript>" + "alert('审核失败');"+"</script>");
		}
		database.closeConnection(con);
	}

}
