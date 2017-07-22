package com.satp.servlet.ajax;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;

/**
 * Servlet implementation class ZCTypeServlet
 */
public class ZCTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZCTypeServlet() {
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
		Connection con = dataBase.connection();
		ArrayList<Policy>  policylist = new ArrayList<Policy>();
		policylist=null;
		String sql=null;
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		if(keyword!=null)
		   keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"utf-8");
		String No = request.getParameter("pageno");
		System.out.println(type);
		if(No!=null)
		{
			pageNo=Integer.parseInt(No);
		}
		String Size = request.getParameter("pageSize");
		if(Size!=null)
		{
			pageSize=Integer.parseInt(Size);
		}
		if(type==null||type.equals("null"))
		{
			
			sql="select * from Policy";
			policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
			
		}
		if("ZCLB".equals(type))
		{
			
			sql="select * from Policy where pcategories='"+keyword+"'";
			System.out.println(sql);
			policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
			
		}
		if("SXFW".equals(type))
		{
			try{
				sql="select * from sxfwB where ssxfwmc='"+keyword+"'";
				ResultSet rs=Sqlcon.executeQuery(sql);
				rs.next();
				keyword="%"+rs.getString("ssxfwid")+"%";
			}
			catch(Exception e){
				
			}
			
			sql="select * from Policy where pboundary LIKE '"+keyword+"'";
			policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
		}
		if("TZLY".equals(type))
		{
			sql="select * from Policy where field='"+keyword+"'";
			policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
			
		}
		sql+=" order by applytime desc,pcategories,pboundary";
		System.out.println(sql);
		int pageCount=ZcBrowseDao.sqlpagecount(con, sql, pageNo, pageSize);
		dataBase.closeConnection(con);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageno", pageNo);
		System.out.println(policylist.isEmpty());
		request.setAttribute("policytaglist", policylist);
		request.getRequestDispatcher("/satpframe/browser.jsp").forward(request, response);

	}

}
