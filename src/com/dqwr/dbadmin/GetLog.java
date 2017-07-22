package com.dqwr.dbadmin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import beans.Log;
import beans.Page;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetLog
 */
public class GetLog extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 181819455020465803L;
	private static Boolean isfirst=true;
	private static String userid;
	private static String logtype;
	private static String startT;
	private static String endT;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetLog() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String currentPage=request.getParameter("currentPage");
			if(currentPage==null){
				currentPage="1";
				isfirst=true;
				userid=request.getParameter("userid");
				logtype=request.getParameter("logtype");
				startT=request.getParameter("startT");
				endT=request.getParameter("endT");
			}else{
				isfirst=false;
			}
			
			ResultSet rs=null;
			Page p=new Page();
			String sql="select  count(*) from Log where 1=1 ";
			//获取第一次搜索时的分页数据
			if(userid!=null){
				if(userid.equals("all"));
				else{
					sql+="and username='"+userid+"' ";
				}
			}
			if(logtype!=null){
				if(logtype.equals("all"));
				else{
					sql+="and type='"+logtype+"'";
				}
			}
			if(endT!=null&&!endT.equals("")){
				sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
			}
			if(startT!=null&&!startT.equals("")){
				sql+=" and datediff(day,'"+startT+"',tdate)>=0";
			}
			//获取搜索时的分页数据
			if(!isfirst){
				if(userid!=null){
					if(userid.equals("all"));
					else{
						sql+="and username='"+userid+"' ";
					}
				}
				if(logtype!=null){
					if(logtype.equals("all"));
					else{
						sql+="and type='"+logtype+"'";
					}
				}
				if(endT!=null&&!endT.equals("")){
					sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
				}
				if(startT!=null&&!startT.equals("")){
					sql+=" and datediff(day,'"+startT+"',tdate)>=0";
				}
			}
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			rs.next();
			p.setAlldata(rs.getInt(1));
			p.initpage();
			p.setCurrentPage(Integer.parseInt(currentPage));
			sql="SELECT TOP "+p.getRecorderPage()+" * FROM LOG WHERE ID NOT IN(SELECT TOP "+p.getRecorderPage()*(p.getCurrentPage()-1)+" ID FROM LOG where 1=1 ";
			if(userid!=null){
				if(userid.equals("all"));
				else{
					sql+="and username='"+userid+"' ";
				}
			}
			if(logtype!=null){
				if(logtype.equals("all"));
				else{
					sql+="and type='"+logtype+"'";
				}
			}
			if(endT!=null&&!endT.equals("")){
				sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
			}
			if(startT!=null&&!startT.equals("")){
				sql+=" and datediff(day,'"+startT+"',tdate)>=0";
			}
			//获取搜索时的分页数据
			if(!isfirst){
				if(userid!=null){
					if(userid.equals("all"));
					else{
						sql+="and username='"+userid+"' ";
					}
				}
				if(logtype!=null){
					if(logtype.equals("all"));
					else{
						sql+="and type='"+logtype+"'";
					}
				}
				if(endT!=null&&!endT.equals("")){
					sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
				}
				if(startT!=null&&!endT.equals("")){
					sql+=" and datediff(day,'"+startT+"',tdate)>=0";
				}
			}
			sql+="order by tdate desc)";
			if(userid!=null){
				if(userid.equals("all"));
				else{
					sql+="and username='"+userid+"' ";
				}
			}
			if(logtype!=null){
				if(logtype.equals("all"));
				else{
					sql+="and type='"+logtype+"'";
				}
			}
			if(endT!=null&&!endT.equals("")){
				sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
			}
			if(startT!=null&&!startT.equals("")){
				sql+=" and datediff(day,'"+startT+"',tdate)>=0";
			}
			//获取搜索时的分页数据
			if(!isfirst){
				if(userid!=null){
					if(userid.equals("all"));
					else{
						sql+="and username='"+userid+"' ";
					}
				}
				if(logtype!=null){
					if(logtype.equals("all"));
					else{
						sql+="and type='"+logtype+"'";
					}
				}
				if(endT!=null&&!endT.equals("")){
					sql+=" and  datediff(day,'"+endT+"',tdate)<=0";
				}
				if(startT!=null&&!endT.equals("")){
					sql+=" and datediff(day,'"+startT+"',tdate)>=0";
				}
			}
			sql+=" order by tdate desc";
			System.out.println(sql);
			
			rs = Sqlcon.executeQuery(sql);
			List<Log> list=new ArrayList<Log>();
			try {
				while(rs.next()){
					Log i=new Log();
					i.setId(rs.getString("ID").replace(" ", ""));
					i.setType(rs.getString("Type").replace(" ", ""));
					i.setUser(rs.getString("username").replace(" ", ""));
					i.setThing(rs.getString("thing").replace(" ", ""));	
					i.setTdate(rs.getString("tdate"));
					list.add(i);
				}
				rs.close();
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			Sqlcon.close();
		
			JSONArray msg=JSONArray.fromObject(list);
			String strmsg=msg.toString();
	
			
			strmsg="{'Log':"+strmsg+",'alldata':'"+p.getAlldata()+"','currentPage':'"+p.getCurrentPage()+"','recorderPage':'"+p.getRecorderPage()+"','pages':'"+p.getPages()+"'}";
			//strmsg="{'inform':"+strmsg+"}";
			System.out.print(strmsg);
			response.getWriter().print(strmsg);	
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'Log':'fail'}");
		}
		
		
	}

}