package com.dqwr.history;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.TZLY;
import beans.WDLS;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class GetWDLS
 */
public class GetWDLS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetWDLS() {
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
  			
  			response.setCharacterEncoding("utf-8");
  			YH user =(YH) request.getSession().getAttribute("user");
  	
  			ResultSet rs=null;
  			List<WDLS> list=new ArrayList<WDLS>();
  			String sql="SELECT * from WDLS where userid='"+user.getYHID()+"' order by riqi desc";
  			System.out.println(sql);
  			rs = Sqlcon.executeQuery(sql);
  			try {
  				while(rs.next()){
  					WDLS a= new WDLS();
  					
  					a.setId(rs.getString("id").replace(" ", ""));
  					
  					String [] rst=rs.getString("result").replace(" ", "").split(";");
  					String result=rst.length+"( ";
  					ResultSet rs2=null;
  					sql="SELECT * from ZCB where ZCWH='"+rst[0]+"'";
  					System.out.println(sql);
  					rs2 = Sqlcon.executeQuery(sql);
  					rs2.next();
  					result+="<font color='blue'>"+rs2.getString("zcmc").replace(" ", "")+"</font>等";		
  					a.setResult(result+" )");
  					System.out.println(result);
  					a.setRiqi(rs.getString("riqi"));
  					String str=rs.getString("serchstr").replace(" ", "");
  					a.setSerchstr(str.length()>30?str.substring(0,30)+"...":str);
  					a.setUserid(rs.getString("userid").replace(" ", ""));	
  					list.add(a);
  				}
  				
  			} catch (Exception e) {
  			
  				e.printStackTrace();
  			}
  			try{
				sql="insert into  log values('检索','"+user.getYHID()+"','获取我的历史记录','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
			 	System.out.println(sql);
	 			Sqlcon.executeUpdate(sql);					
	 		}
	 		catch(Exception e){
	 		}
 				
  			rs.close();
  			Sqlcon.close();
  			JSONArray msg=JSONArray.fromObject(list);	
  			String strmsg=msg.toString();
  			strmsg="{'wdls':"+strmsg+"}";	
  			System.out.println(strmsg);
  			response.getWriter().print(strmsg);
  		}
  		catch(Exception e){
  			e.printStackTrace();
  			response.getWriter().print("{'wdls':'fail'}");
  		}
  		
  	}

  }
