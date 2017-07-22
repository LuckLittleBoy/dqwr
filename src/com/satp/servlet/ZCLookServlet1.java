package com.satp.servlet;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;

/**
 * Servlet implementation class ZCLookServlet
 */
public class ZCLookServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
	private static ZcBrowseDao zcbrowseDao=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZCLookServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
  		// TODO Auto-generated method stub
  		super.init(config);
  		dataBase = new DataBaseDao();
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
		request.setCharacterEncoding("UTF-8");
		String pno = new String(request.getParameter("pno").getBytes("ISO-8859-1"),"utf-8");
		Connection con = dataBase.connection();
		//String pno = request.getParameter("pno").trim();
		System.out.println(pno);
        if (!pno.equals(""))
        {
        	String sql="select pname,applytime,breaktime,ZCNR from Policyybc where pno='"+pno+"'";
		    Policy policyList = new Policy();
			policyList = ZcBrowseDao.policyLook(con, sql);
			System.out.println(sql);
			request.setAttribute("policyList", policyList);
           dataBase.closeConnection(con);
            request.getRequestDispatcher("policyfamily/ZCLook.jsp").forward(request, response);
        }
        
	}

}
