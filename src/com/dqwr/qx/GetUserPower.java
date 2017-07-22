package com.dqwr.qx;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.Power;
import beans.QX;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetUserPower
 */
public class GetUserPower extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserPower() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		doPost(request,response);
  	}

  	/**
  	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  	 */
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		
  		try{
  			
  			response.setCharacterEncoding("utf-8");
  			ResultSet rs=null;
  			List<Power> list=new ArrayList<Power>();
  			String sql="SELECT * from cdb order by CDJB";
  			System.out.println(sql);
  			rs = Sqlcon.executeQuery(sql);
  			List<QX> qxlist=new ArrayList<QX>();
  			
  			try {
  				while(rs.next()){
  					Power a= new Power();
  					//将一级菜单加入qxlist中
  					if(rs.getString("cdjb").replace(" ", "").length()<3){
  						QX qx=new QX();
  						qx.setId(rs.getString("cdid").replace(" ", ""));
  						qx.setNc(rs.getString("cdnc").replace(" ", ""));
  						qx.setJb(rs.getString("cdjb").replace(" ", ""));
  						qxlist.add(qx);
  					}else{
  						System.out.println("获取菜单级别"+rs.getString("cdjb").replace(" ", ""));
  						//获取菜单级别
  						System.out.println(rs.getString("cdjb").replace(" ", "").split("\\.").length);
  						String jb=rs.getString("cdjb").replace(" ", "").split("\\.")[0];
  						
  						for(int i=0;i<qxlist.size();i++){
  							if(qxlist.get(i).getJb().equals(jb)){
  								QX qx=new QX();
  								qx.setId(rs.getString("cdid").replace(" ", ""));
  		  						qx.setNc(rs.getString("cdnc").replace(" ", ""));
  		  						qx.setJb(rs.getString("cdjb").replace(" ", ""));
  		  						qx.setSm(addExplain(rs.getString("cdnc").replace(" ", "")));
  		  						qxlist.get(i).xp.add(qx);
  								break;
  							}
  							
  						}
  						
  					}
  					
  					a.setCdid(rs.getString("cdid").replace(" ", ""));
  					a.setCdjb(rs.getString("cdjb").replace(" ", ""));
  					a.setCdnc(rs.getString("cdnc").replace(" ", ""));
  					a.setCurl(rs.getString("curl").replace(" ", ""));
  					list.add(a);
  				}
  				
  			} catch (Exception e) {
  			
  				e.printStackTrace();
  			}
  			rs.close();
  			Sqlcon.close();
  			
  			
  			
  			JSONArray msg=JSONArray.fromObject(qxlist);	
  			String strmsg=msg.toString();
  			strmsg="{'Power':"+strmsg+"}";	
  			System.out.println(strmsg);
  			response.getWriter().print(strmsg);
  		}
  		catch(Exception e){
  			e.printStackTrace();
  			response.getWriter().print("{'Power':'fail'}");
  		}
  		
  	}
  	private String addExplain(String str){
  		String newstr="";
  		if("政策录入".equals(str))newstr="";
  		else if("待审核".equals(str))newstr="";
  		else if("修订政策".equals(str))newstr="";
  		else if("政策审核".equals(str))newstr="";
  		else if("已通过政策".equals(str))newstr="";
  		else if("退回政策".equals(str))newstr="";
  		else if("分类检索".equals(str))newstr="";
  		else if("综合检索".equals(str))newstr="";
  		else if("分类浏览".equals(str))newstr="";
  		else if("统计分析".equals(str))newstr="";
  		else if("族谱分析".equals(str))newstr="";
  		else if("时效分析".equals(str))newstr="";
  		else if("关键词维护".equals(str))newstr="";
  		else if("无用关键词维护".equals(str))newstr="";
  		else if("全文检索".equals(str))newstr="";
  		else if("主题词维护".equals(str))newstr="";
  		else if("我的检索历史".equals(str))newstr="";
  		else if("关键词检索".equals(str))newstr="";
  		else if("日志维护".equals(str))newstr="";
  		else if("数据库备份".equals(str))newstr="";
  		else if("数据库优化".equals(str))newstr="";
  		else if("基本信息维护".equals(str))newstr="";
  		else if("用户权限管理".equals(str))newstr="";
  		return newstr;
  		
  	}

  }
