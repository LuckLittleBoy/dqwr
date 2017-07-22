package com.satp.servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;

/**
 * Servlet implementation class ZCLookServlet
 */
public class ZCLookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
	private static ZcBrowseDao zcbrowseDao=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZCLookServlet() {
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
		Connection con = dataBase.connection();
		String pno = request.getParameter("pno").trim();
		if(pno!=null)
			pno = new String(pno.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(pno);
        if (!pno.equals(""))
        {
        	String sql="select pname,applytime,breaktime,ZCNR from Policy where pno='"+pno+"'";
		    Policy policyList = new Policy();
			policyList = ZcBrowseDao.policyLook(con, sql);
			System.out.println(sql);
			request.setAttribute("policyList", policyList);
           dataBase.closeConnection(con);
            request.getRequestDispatcher("satpframe/ZCLook.jsp").forward(request, response);
        }
        
	}

}
