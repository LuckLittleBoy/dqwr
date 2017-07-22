package com.dqwr.qx;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AlterUser
 */
public class DelWuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelWuser() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String username=request.getParameter("username");
			System.out.println(username);
			String sql="delete from WBYH where username='"+username+"' ";
			PrintWriter out=response.getWriter();
			System.out.println(sql);
			if(Sqlcon.executeUpdate(sql)>=1){
				out.print(" <script language='javascript' type='text/javascript'>alert('删除成功');history.go(-2); </script>");
				
			}
			else{
				out.print(" <script language='javascript' type='text/javascript'>alert('删除失败');history.go(-1);</script>");
			}									
		}
		catch(Exception e){
			response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('删除失败');history.go(-1);</script>");
		}
		
		
	}

}
