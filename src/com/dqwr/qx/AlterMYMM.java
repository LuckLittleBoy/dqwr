package com.dqwr.qx;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class AlterMYMM
 */
public class AlterMYMM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterMYMM() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");
			String newmm=request.getParameter("newmm");
			String oldmm=request.getParameter("oldmm");
			YH user =(YH) request.getSession().getAttribute("user");
			PrintWriter out=response.getWriter();
			ResultSet rs=null;
			//admin为超级用户不允许修改权限
			String sql="select  * from YH where YHID='"+user.getYHID()+"'";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			rs.next();
			if(rs.getString("YHMM").replace(" ", "").equals(oldmm)){
				sql="update  yhb   SET yhmm = '"+newmm+"' WHERE yhid='"+user.getYHID()+"'";
				
				System.out.println(sql);
				if(Sqlcon.executeUpdate(sql)>=1){
					out.print("{'update':'success'}");
					
				}
				else{
					out.print("{'update':'fail'}");
				}				
			}else{
				out.print("{'update':'fail'}");
			}	
			
								
		}
		catch(Exception e){
			response.getWriter().print("{'update':'fail'}");
		}
		
		
	}

}
