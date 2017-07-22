package com.qt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import com.satp.entity.Highcharts;
import com.satp.model.Sqlconvert;
/**
 * Servlet implementation class ZcTjServlet
 */
public class qttjfx extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao dataBase = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qttjfx() {
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
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		int keys=1;
		int k=0;
		int column=0;
		Connection con = dataBase.connection();
		ArrayList<Highcharts>  highchartslist = new ArrayList<Highcharts>();
		highchartslist=null;
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
		String CXZD=request.getParameter("Tsziduan");
		String sql="select "+CXZD+",Count(*) as number from Policy";
		String sqldetail="";
		
		if(Ttype!=null)
		{
			int len=Ttype.length;
        	int len2=Find.length;		
			sql+=" where ";
			int sqlLen1=sql.length();
			int sqlLen2=0;
			for(int j=0;j<len2;j++)
			 {
				 sqlLen2=sql.length();
				 System.out.println(sqlLen2);
				 Find[j]=Find[j].trim();
				 if(Fangshi[j].equals("1"))
				 {
					 if(!Find[j].equals(""))
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
		if(keys==1)
		{
			sql="select "+CXZD+",Count(*) as number from Policy";
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
		if(!sxzt.equals("2"))
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
		sqldetail=sql.replace(CXZD+",Count(*) as number", "*");
		if(keys==1)
			sqldetail+=" where "+CXZD;
		else
			sqldetail+=" and "+CXZD;
		sql+=" group by "+CXZD;
		System.out.println(sql);
        highchartslist=ZcBrowseDao.sqlPolicyConut(con, sql,CXZD);
        dataBase.closeConnection(con);
		request.setAttribute("highchartslist", highchartslist);
		System.out.println(CXZD);
		if(CXZD.equals("pcategories"))
		{
			request.setAttribute("CXZD1", "政策类别");
			session.setAttribute("CXZD1", "政策类别");
		}
		else if(CXZD.equals("pboundary"))
		{
			request.setAttribute("CXZD1", "施行范围");
			session.setAttribute("CXZD1", "施行范围");
		}
		else if(CXZD.equals("field"))
		{
			request.setAttribute("CXZD1", "调整领域");
			session.setAttribute("CXZD1", "调整领域");
		} 
		request.setAttribute("sql", sqldetail);
		session.setAttribute("highchartslist1", highchartslist);
		session.setAttribute("sql1", sqldetail);
		request.getRequestDispatcher("/qt/qttjfx2.jsp").forward(request, response);
	}

}
