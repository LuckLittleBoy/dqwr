package com.dqwr.servlet;


import indexdir.Index;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import beans.Article;

import com.dqwr.dao.*;
import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.dqwr.model.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

/**
 * Servlet implementation class submitpolicy
 */

public class shenhetuihui1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shenhetuihui1() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		database = new com.dqwr.dao.DataBaseDao();
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		String zcid = request.getParameter("zcid");//提交状态
		String shzt = request.getParameter("shenhe");//提交状态
		String qqzc = request.getParameter("qqzc");
		YH user = (YH) request.getSession().getAttribute("user");
		/**
		 * 审核
		 */
		if("1".equals(shzt)){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			ZCMD.SHZC(con, zcid,user.getYHID(), "通过", df.format(new Date()));
			if(qqzc!=null&&qqzc!=""){
				String qqzclist[] = qqzc.split(";");
				for(int j = 0 ;j<qqzclist.length;j++){
					ZCMD.QQSX(con, qqzclist[j]);
				}
			}
try{
				
				response.setCharacterEncoding("utf-8");
				ResultSet rs=null;

				String sql="SELECT * from ZCSY2 where zcid='"+zcid+"'";
				System.out.println(sql);
				rs = Sqlcon.executeQuery(sql);
				try {
					while(rs.next()){
						Article a= new Article();
						a.setId(rs.getString("ZCWH"));
						a.setTitle(rs.getString("ZCMC").replace(" ", ""));
						a.setContent(DELHTML.delHTMLTag(rs.getString("zcnr").replace(" ", "").replace("\r","").replace("\n","").replace("\t","").replace("&nbsp;", "")));
						a.setClasstify(rs.getString("ZCFLMC")==null?"无":rs.getString("ZCFLMC"));
						a.setDate(rs.getString("BSXRQ")==null?"无":rs.getString("BSXRQ"));
						Index index=new Index();
						String path =request.getSession().getServletContext().getRealPath("\\index") ;
						try {
							index.CreateIndex(path);
										
							System.out.println("date:"+a.getDate());
							System.out.println("date:"+a.getContent());
							System.out.println("type:"+a.getClasstify());
							index.addDocIndex(a);
							System.out.println("添加成功");	
							
						} catch (Exception e) {
							System.out.println("添加出错");
							e.printStackTrace();
						}
						
					}
					rs.close();
				} catch (Exception e) {
				
					e.printStackTrace();
				}
				//Sqlcon.close();
			}
			catch(Exception e){
				e.printStackTrace();
				response.getWriter().print("{'mans':'fail'}");
			}
			
		}
		if("2".equals(shzt)){
			String bz = request.getParameter("yjnr");
			System.out.println(bz);
			ZCMD.SHTHZC(con, zcid,user.getYHID(), "退回", bz);
		}
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		database.closeConnection(con);
		response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('退回完成'); window.location.href='ws/tgzc.jsp';</script>");
	}
}
