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

import tools.DELHTML;

import net.sf.json.JSONArray;
import beans.Article;
import beans.WDLS;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class LookHistory
 */
public class LookHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LookHistory() {
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
  			String id=request.getParameter("id");
  			ResultSet rs=null;
  			String sql="SELECT * from WDLS where userid='"+user.getYHID()+"' and id="+id;
  			System.out.println(sql);
  			List<Article> list=new ArrayList<Article>();
  			rs = Sqlcon.executeQuery(sql);
  			try {
  				rs.next();
				String [] rst=rs.getString("result").split(";");
				String result="";
				ResultSet rs2=null;
				for(int i=0;i<rst.length;i++){
					sql="SELECT * from ZCSY where ZCWH='"+rst[i]+"'";
  					System.out.println(sql);
  					rs2 = Sqlcon.executeQuery(sql);
  					rs2.next();
  	  				Article a= new Article();
					a.setId(rs2.getString("ZCWH"));
					a.setTitle(rs2.getString("ZCMC").replace(" ", ""));					
					a.setClasstify(rs2.getString("ZCFLMC"));
					a.setDate(rs2.getString("BSXRQ"));
					list.add(a);	
	
				}	
				rs2.close();
  			} catch (Exception e) {
  			
  				e.printStackTrace();
  			}
 
 			
 			try{
				sql="insert into  log values('检索','"+user.getYHID()+"','查看我的历史记录','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";				System.out.println(sql);
	 			Sqlcon.executeUpdate(sql);					
	 		}
	 		catch(Exception e){
	 		}
  			Sqlcon.close();
  			JSONArray msg=JSONArray.fromObject(list);	
  			String strmsg=msg.toString();
  			strmsg="{'zc':"+strmsg+",'searchstr':'"+ rs.getString("serchstr").replace(" ", "")+"','searchdate':'"+rs.getString("riqi")+"'}";	
  			System.out.println(strmsg);
  			rs.close();
  			
  			response.getWriter().print(strmsg);
  		}
  		catch(Exception e){
  			e.printStackTrace();
  			response.getWriter().print("{'zc':'fail'}");
  		}
  		
  	}

  }
