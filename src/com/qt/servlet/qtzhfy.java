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
import javax.servlet.http.HttpSession;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;
import com.satp.model.Sqlconvert;

/**
 * Servlet implementation class ZcSearch
 */
public class qtzhfy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qtzhfy() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
  		// TODO Auto-generated method stub
  		super.init(config); 	 
  		dataBase = new DataBaseDao();
  	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		int keys=1;
		int column=0;
		int k=0;
		int pageCount=1;
		int pageNo=1;
		int pageSize=15;
		Connection con = dataBase.connection();
		ArrayList<Policy>  policylist = new ArrayList<Policy>();
		policylist=null;
		String sql="select *from SEARCHRESULT";
		String result=request.getParameter("result");		
		String No = request.getParameter("pageno");
		String res = request.getParameter("res");
		String pageCount1 = request.getParameter("pageCount");
		if(No!=null||pageCount1!=null)
		{
			pageNo=Integer.parseInt(No);
			pageCount=Integer.parseInt(pageCount1);
		}
		
		
		sql+=" order by applytime desc,pcategories,pboundary";
		policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);	
		if(result!=null&&result.equals("1"))
		{
			try {
				ZcBrowseDao.sqlInsert(con, policylist);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageno", pageNo);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("policytaglist", policylist);
		dataBase.closeConnection(con);
		request.getRequestDispatcher("qt/qtzhjs2.jsp").forward(request, response);
       
	}

}