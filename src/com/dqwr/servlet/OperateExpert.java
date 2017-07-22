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
import com.dqwr.expert.daoimpl.ExpertDaoImpl;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;


public class OperateExpert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateExpert() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = database.connection();
		int operateid=Integer.parseInt(request.getParameter("operateid"));
		int expertid=Integer.parseInt(request.getParameter("expertid"));
		String pageno=request.getParameter("pageno");
		String flag=request.getParameter("flag");
		ExpertDaoImpl expertimpl=new ExpertDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null;
		PrintWriter output=response.getWriter();
		if(operateid==0){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteExpert?expertid="+expertid+"&pageno="+pageno+"';}else{ window.location.href='ws/expert.jsp?exppass=2&pageno="+pageno+"';};"+"</script>");
		}else if(operateid==1){		
			request.setAttribute("expertid",expertid);
			request.setAttribute("flag", flag);
			request.getRequestDispatcher("ws/EditExpert.jsp").forward(request,response);
		}
		if(operateid==2){
			request.getRequestDispatcher("ws/ExpertBack.jsp").forward(request,response);
		}
		database.closeConnection(con);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
