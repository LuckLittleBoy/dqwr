package com.qt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;

/**
 * Servlet implementation class ZcFindServlet
 */
public class qtfenye extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qtfenye() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int pageNo=1;
		int pageSize=15;
		int pageCount=0;
		Connection con = dataBase.connection();
		ArrayList<Policy>  policylist = new ArrayList<Policy>();
		policylist=null;
		int x=1;
		String pageCount1 = request.getParameter("pageCount");
		String No = request.getParameter("pageno");
		String result=request.getParameter("result");
		System.out.println("result---->"+result);		
		String sql="select * from SEARCHRESULT ";
		if(No!=null||pageCount1!=null)
		{
			pageCount=Integer.parseInt(pageCount1);
			pageNo=Integer.parseInt(No);
		}
		
		sql+=" order by applytime desc,pcategories,pboundary";
		policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
		System.out.println("sql--->"+sql);		
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageno", pageNo);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("policytaglist", policylist);
		dataBase.closeConnection(con);
		System.out.println(policylist.isEmpty());
		request.getRequestDispatcher("/qt/qtcx2.jsp").forward(request, response);
	}

}
