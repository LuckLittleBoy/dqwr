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
import javax.servlet.http.HttpSession;

import com.satp.dao.DataBaseDao;
import com.satp.dao.ZcBrowseDao;
import com.satp.entity.Policy;
import com.satp.model.Sqlconvert;

/**
 * Servlet implementation class ZcSearch
 */
public class ZcSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZcSearchServlet() {
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
		String sql="select *from Policy";
		String result=request.getParameter("result");
		if(result!=null&&result.equals("2"))
			sql="select *from SEARCHRESULT ";
		String No = request.getParameter("pageno");
		String res = request.getParameter("res");
		if(No!=null)
		{
			pageNo=Integer.parseInt(No);
		}
		String sql2 = (String)session.getAttribute("sql2");
		if(res!=null)
		{
			if(res.equals("1"))
			{
				sql2=null;
			}
		}
		System.out.println(sql2);
		String sxzt=request.getParameter("sxzt");
		String pboundary=request.getParameter("pboundary");
		String poffice=request.getParameter("poffice");
		String[] Condition=request.getParameterValues("condition");
		String[] Ttype = request.getParameterValues("timeSearch");
		String[] StartT = request.getParameterValues("startT");
		String[] EndT = request.getParameterValues("endT");
		String[] Demo = request.getParameterValues("demo");
		String[] Find = request.getParameterValues("find");
		String[] Fangshi = request.getParameterValues("fangshi");
		if(res!=null&&res.equals("1"))
		{
			if(Ttype!=null)
			{
				int len=Ttype.length;
				System.out.println("len"+len);
            	int len2=Find.length;		
				sql+=" where ";
				int sqlLen1=sql.length();
				int sqlLen2=0;
				for(int j=0;j<len2;j++)
				 {
					 sqlLen2=sql.length();
					 Find[j]=Find[j].trim();
					 if(Fangshi[j].equals("1"))
					 {
						 if(!Find[j].trim().equals(""))
						 {
							 if(!Condition[j].equals(""))
							 {
								 System.out.println(sqlLen2==sqlLen1);
								 System.out.println(sqlLen1);
								 System.out.println(sqlLen2);
								 if(sqlLen2==sqlLen1)
								 {
									
									 if(Condition[j].equals("and")||Condition[j].equals("or"))
									 {
										 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
											 sql+="ZCID"+" in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+"='"+Find[j]+"')";
										 else
										     sql+=Demo[j]+" = '"+Find[j]+"'"; 
									 }	 
									 else
									 {
										 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
											 sql+="ZCID"+" not in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+"='"+Find[j]+"')";
										 else
										 sql+=Demo[j]+" != '"+Find[j]+"'";  
									 }	
										 
								 }
								 else
								 {
									 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
										 sql+=Condition[j]+"ZCID "+" in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+"='"+Find[j]+"')";
									 else
									     sql+=Condition[j]+" "+Demo[j]+" = '"+Find[j]+"'"; 
								 }
								
							 }
							 keys=2;
						 }
						 
					 }
					 if(Fangshi[j].equals("2"))
					 {
						 if(!Find[j].equals(""))
						 {
								 System.out.println(sqlLen2==sqlLen1);
								 if(sqlLen2==sqlLen1)
								 {
									 if(Condition[j].equals("and")||Condition[j].equals("or"))
									 {
										 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
											 sql+="ZCID"+" in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+" like '%"+Find[j]+"%')";
										 else
											 sql+=Demo[j]+" like '%"+Find[j]+"%'";
									 } 
									 else 
									 {
										 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
											 sql+="ZCID"+" not in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+" like '%"+Find[j]+"%')"; 
										 else
											 sql+=Demo[j]+" not like '%"+Find[j]+"%'"; 
									 }
										 		 
								 }
								 else
								 {
									 if(Demo[j].equals("ZTC")||Demo[j].equals("GJZ"))
										 sql+=Condition[j]+"ZCID "+" in (select ZtcId from "+Demo[j]+"V  where "+Demo[j]+" like '%"+Find[j]+"%')";
									 else
									     sql+=Condition[j]+" "+Demo[j]+" like '%"+Find[j]+"%'";
								 }
								 keys=2;
							 }						 
					 }
					 if(sqlLen2!=sqlLen1)
					       sql+=" ";
					 column=j+3;
					 k=j;
				 }
				 for(int i=0;i<len;i++)
			        {
					    sqlLen2=sql.length();
					    StartT[i]=StartT[i].trim();
					    EndT[i]=EndT[i].trim();
			        	if(!(StartT[i].equals(""))&&(!EndT[i].equals("")))
			        	{
			        		if(sqlLen2==sqlLen1)
			        		{
			        			if(Condition[i+column].equals("and")||Condition[i+column].equals("or"))
			        				sql+=Ttype[i]+" between '"+StartT[i]+"' and '"+EndT[i]+"'";
			        			else
			        				sql+=Ttype[i]+" not between '"+StartT[i]+"' and '"+EndT[i]+"'";
			        		}
			        		else
			        		sql+=Condition[i+column]+" "+Ttype[i]+" between '"+StartT[i]+"' and '"+EndT[i]+"'";	
			        		keys=2;
			        		
			        	}
			        	else if(!StartT[i].equals(""))
			        	{
			        		if(sqlLen2==sqlLen1)
			        		{
			        			
			        			if(Condition[i+column].equals("and")||Condition[i+column].equals("or"))
			        				sql+=Ttype[i]+">'"+StartT[i]+"'";
			        			else
			        				sql+=Ttype[i]+"!>'"+StartT[i]+"'";
			        		}
			        		else
			        		sql+=Condition[i+column]+" "+Ttype[i]+">'"+StartT[i]+"'";
			        		keys=2;
			        		
			        	}
			        	else if(!EndT[i].equals(""))
			        	{
			        		if(sqlLen2==sqlLen1)
			        		{
			        			if(Condition[i+column].equals("and")||Condition[i+column].equals("or"))
			        				sql+=Ttype[i]+"<'"+EndT[i]+"'";
			        			else
			        				sql+=Ttype[i]+"!<'"+EndT[i]+"'";
			        		}
			        		else
			        		sql+=Condition[i+column]+" "+Ttype[i]+"<'"+EndT[i]+"'";
			        		keys=2;
			        	}
			        }
			}
		}
		if(keys==1)
		{
			sql="select *from Policy";
			if(pboundary!=null&&poffice!=null)
			{
				if((!pboundary.equals(""))&&(!poffice.equals("")))
				{
					sql+=" where ";
					sql=Sqlconvert.convert(sql,"pboundary",pboundary,Fangshi[k+1],Condition[k+1]);
					sql+=" and ";
					sql=Sqlconvert.convert(sql,"poffice",poffice,Fangshi[k+2],Condition[k+1]);
					keys=2;
				}
				else if(!pboundary.equals(""))
				{
					sql+=" where ";
					sql=Sqlconvert.convert(sql,"pboundary",pboundary,Fangshi[k+1],Condition[k+1]);
					keys=2;
				}
				else if(!poffice.equals(""))
				{
					
					sql+=" where ";
					sql=Sqlconvert.convert(sql,"poffice",poffice,Fangshi[k+2],Condition[k+1]);
					keys=2;
				}
				
			}
			
		}
		else 
		{
			if((!pboundary.equals(""))&&(!poffice.equals("")))
			{
				sql+=" and ";
				sql=Sqlconvert.convert(sql,"pboundary",pboundary,Fangshi[k+1],Condition[k+1]);
				sql+=" and ";
				sql=Sqlconvert.convert(sql,"poffice",poffice,Fangshi[k+2],Condition[k+1]);
			}
			else if(!pboundary.equals(""))
			{
				sql+=" and ";
				sql=Sqlconvert.convert(sql,"pboundary",pboundary,Fangshi[k+1],Condition[k+1]);
			}
			else if(!poffice.equals(""))
			{
				
				sql+=" and ";
				sql=Sqlconvert.convert(sql,"poffice",poffice,Fangshi[k+2],Condition[k+1]);
			}
		}
		if((sxzt!=null)&&(!sxzt.equals("2")))
		{
			if(keys==1)
			{
				sql+=" where ";
			}
			else
			{
				sql+=" and ";
			}
			sql+="sxzt='"+sxzt+"'";
		}
		
		sql+=" order by applytime desc,pcategories,pboundary";
		System.out.println("sql  :"+sql);
		if(res==null||res.equals("1"))
		{
			policylist=ZcBrowseDao.sqlPolicy(con, sql, pageNo, pageSize);
			pageCount=ZcBrowseDao.sqlpagecount(con, sql, pageNo, pageSize);
			session.setAttribute("sql2", sql);
		}
		else
		{
			policylist=ZcBrowseDao.sqlPolicy(con, sql2, pageNo, pageSize);
		    pageCount=ZcBrowseDao.sqlpagecount(con, sql2, pageNo, pageSize);
		}
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
		request.getRequestDispatcher("satpframe/ZCAllSearch.jsp").forward(request, response);
       
	}

}