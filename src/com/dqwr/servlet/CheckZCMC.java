package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.ZC;
import com.dqwr.model.ZCMD;

/**
 * 检查ZCMC是否重复
 * Servlet implementation class CheckZCMC
 */
public class CheckZCMC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckZCMC() {
        super();
		database = new DataBaseDao();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Connection con = database.connection();
		String zcmc = request.getParameter("zcmc");
		ArrayList<ZC>  zclist = new ArrayList<ZC>();
		zclist = ZCMD.checkZCMC(con, zcmc);
		database.closeConnection(con);
		if(zclist.size()>0){
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>");
			out.print("政策名称");
			out.println("</th>");
			out.println("<th>");
			out.print("公布日期");
			out.println("</th>");
			for(ZC zc : zclist){ 
				out.println("<tr>");
				out.println("<td>");
				out.print(zc.getZCMC());
				out.println("</td><td>");
				out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				
				if(zc.getBGBRQ()!=null){
					out.print(zc.getBGBRQ());
				}
				out.println("</td></tr>");
			}
			out.println("</table>");
		}
		else out.print("");
	}
}
