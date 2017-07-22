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


public class OperateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateInfo() {
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
		int infoid=Integer.parseInt(request.getParameter("infoid"));
		int pagesize=Integer.parseInt(request.getParameter("pagesize"));
		int pageno=Integer.parseInt(request.getParameter("pageno"));
		PublishHyInfoImpl  infoimpl=new PublishHyInfoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null;
		PrintWriter output=response.getWriter();
		Info info=new Info();
		if(operateid==0){
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteInfo?infoid="+infoid+"&pagesize="+pagesize+"&pageno="+pageno+"';}else{ window.location.href='ws/public_info.jsp?ispass=1&pagesize="+pagesize+"&pageno="+pageno+"';};"+"</script>");
		}else if(operateid==1){
			res=infoimpl.selectInfoById(con, infoid);
			try {
				if(res.next()){
					try {
						info.setInfoId(res.getInt(1));
						info.setTitle(res.getString(2));
						info.setType(res.getByte(3));
						info.setScope(res.getByte(4));
						info.setContent(res.getString(5));
						info.setCreatorId(res.getString(6));
						info.setAddDate(res.getString(7));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("info",info);
			request.getRequestDispatcher("ws/editinfo.jsp").forward(request,response);
		}else if(operateid==2){
			res=infoimpl.selectInfoById(con, infoid);
			try {
				if(res.next()){
					try {
						info.setInfoId(res.getInt(1));
						info.setTitle(res.getString(2));
						info.setType(res.getByte(3));
						info.setScope(res.getByte(4));
						info.setContent(res.getString(5));
						info.setCreatorId(res.getString(6));
						info.setAddDate(res.getString(7));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("info",info);
			request.getRequestDispatcher("ws/lookinfo.jsp").forward(request,response);
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
