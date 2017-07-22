package com.satp.servlet;

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
public class ZcFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZcFindServlet() {
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
		int x=1;
		String sql="select *from Policy ";
		String No = request.getParameter("pageno");
		String result=request.getParameter("result");
		System.out.println("result---->"+result);
		if(result!=null&&result.equals("2"))
			sql="select * from SEARCHRESULT ";
		if(No!=null)
		{
			pageNo=Integer.parseInt(No);
		}
		String sxzt = request.getParameter("sxzt");
		String Search = request.getParameter("Search");
		String Find = request.getParameter("find");
		String Fangshi = request.getParameter("fangshi");
		String TimeSearch = request.getParameter("timeSearch");
		String StartT = request.getParameter("startT");
		String EndT = request.getParameter("endT");
		
		if((Find!=null)&&(!Find.equals("")))
		{
			
			if(Fangshi.equals("1"))
			{
				if(Search.equals("ZTC")||Search.equals("GJZ"))
					sql+=" where ZCID in (select ZtcId from "+Search+"V where "+Search+"='"+Find+"')";
				else
				    sql+=" where "+Search+"='"+Find+"'";
			}
			if(Fangshi.equals("2"))
			{
				if(Search.equals("ZTC")||Search.equals("GJZ"))
					sql+=" where ZCID in (select ZtcId from "+Search+"V where "+Search+" like '%"+Find+"%')";
				else
				    sql+=" where "+Search+" like '%"+Find.replace("[", "_").replace("]", "_")+"%'";
			}
			x=2;
			
		}
		if((StartT!=null)&&(EndT!=null))
		{
			if((!StartT.equals(""))||(!EndT.equals("")))
			{
				if((Find!=null)&&(!Find.equals("")))
				{
					sql+=" and ";
				}
				else
				{
					sql+=" where ";
				}
				if((!StartT.equals(""))&&(!EndT.equals("")))
				{
					sql+=TimeSearch+" between '"+StartT+"' and '"+EndT+"'";
				}
				else if(!StartT.equals(""))
				{
					sql+=TimeSearch+" > '"+StartT+"'";
				}
				else if(!EndT.equals(""))
				{
					sql+=TimeSearch+" < '"+EndT+"'";
				}
				x=2;
			}
		}
		if((sxzt!=null)&&(!sxzt.equals("2")))
		{
			if(x==2)
			  sql+=" and ";
			else
			  sql+=" where ";
			sql+="sxzt='"+sxzt+"'";
		}
		sql+=" order by applytime desc,pcategories,pboundary";
		policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
		int pageCount=ZcBrowseDao.sqlpagecount(con, sql, pageNo, pageSize);
		System.out.println("sql--->"+sql);
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
		System.out.println(policylist.isEmpty());
		request.getRequestDispatcher("/satpframe/ZCSearch1.jsp").forward(request, response);
	}

}
