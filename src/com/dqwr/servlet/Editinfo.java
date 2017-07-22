package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;


public class Editinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editinfo() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
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
		Connection con = database.connection();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int infoid=Integer.parseInt(request.getParameter("infoid"));
		 int pagesize=Integer.parseInt(request.getParameter("pagesize"));
		 int pageno=Integer.parseInt(request.getParameter("pageno"));
		byte type=Byte.parseByte(request.getParameter("type"));
		String creator=request.getParameter("creator");
		String title=request.getParameter("title");
		String publictime=request.getParameter("publictime");
		String content=request.getParameter("content1");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter output=response.getWriter();
		PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
		if(type==0){
			if(infoimpl.editInfo0(con, infoid, creator, title,publictime,content)){
				output.print("<script language=javascript>" + "alert('修改成功');"+ "document.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");
			}else{
				output.print("<script language=javascript>" + "alert('修改失败');"+ "document.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");
			}
		}else if(type==1){
			byte scope=Byte.parseByte(request.getParameter("scope"));
			if(infoimpl.editInfo1(con, infoid, creator, title,publictime,scope, content)){
				output.print("<script language=javascript>" + "alert('修改成功');"+ "document.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");
			}else{
				output.print("<script language=javascript>" + "alert('修改失败');"+ "document.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';"+"</script>");
			}
		}
		
		database.closeConnection(con);
	}
}
