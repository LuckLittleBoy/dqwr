package com.qt.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;

/**
 * Servlet implementation class qtzclook
 */
public class qtzclook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qtzclook() {
        super();
        dataBase = new DataBaseDao();
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
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		Connection con = dataBase.connection();
		
		String pno = request.getParameter("pno").trim();
		if(pno!=null)
			pno = new String(pno.getBytes("ISO-8859-1"),"utf-8");
        if (!pno.equals(""))
        {
        	String sql="select pname,applytime,breaktime,ZCNR from Policy where pno='"+pno+"'";
		    Policy policyList = new Policy();
			policyList = ZcBrowseDao.policyLook(con, sql);
			request.setAttribute("policyList", policyList);
			dataBase.closeConnection(con);
			String actionUrl = request.getServletPath();
			if(actionUrl.equals("/qt/qtzclook.do")){
				request.getRequestDispatcher("/qt/index2.jsp").forward(request, response);
			}
			if(actionUrl.equals("/qt/zcflzclook.do")){
				request.getRequestDispatcher("/qt/zcfl2.jsp").forward(request, response);
			}if(actionUrl.equals("/qt/zccxzclook.do")){
				request.getRequestDispatcher("/qt/zccx2.jsp").forward(request, response);
			}if(actionUrl.equals("/qt/zcfxzclook.do")){
				request.getRequestDispatcher("/qt/zcfx2.jsp").forward(request, response);
			}if(actionUrl.equals("/qt/zcztzclook.do")){
				request.getRequestDispatcher("/qt/gengduo2.jsp").forward(request, response);
			}
            
        }
	}

}
