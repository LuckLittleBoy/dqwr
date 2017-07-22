package com.satp.servlet;

import java.io.IOException;
import java.sql.Connection;
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

/**
 * Servlet implementation class ZcDetailed
 */
public class ZcDetailed extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZcDetailed() {
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
		HttpSession session = request.getSession(); 
		int pageNo=1;
		int pageSize=15;
		Connection con = dataBase.connection();
		ArrayList<Policy>  policylist = new ArrayList<Policy>();
		policylist=null;
		String No = request.getParameter("pageno");
		if(No!=null)
		{
			pageNo=Integer.parseInt(No);
		}
		String sql = (String) session.getAttribute("sql1");
		System.out.println(sql);
		if(sql==null)
		{
			sql=(String)session.getAttribute("sql3");
		}
		else
		{
			//String Cname=request.getParameter("Cname");
			if(request.getParameter("Cname")==null){
				sql+=" is null ";
			}else{
				String Cname = new String(request.getParameter("Cname").getBytes("ISO-8859-1"),"utf-8");
				sql+="='"+Cname+"'";
			}
			
		}
		sql+=" order by applytime desc,pcategories,pboundary";
		System.out.println(sql);
		sql=sql.replace("='其他'", " is null ");
		System.out.println(sql);
		policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
		int pageCount=ZcBrowseDao.sqlpagecount(con, sql, pageNo, pageSize);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageno", pageNo);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("policytaglist", policylist);
		session.setAttribute("sql3", sql);
		dataBase.closeConnection(con);
		System.out.println(No);
		System.out.println(policylist.isEmpty());
		request.getRequestDispatcher("satpframe/detailedPage.jsp").forward(request, response);
	}

}
