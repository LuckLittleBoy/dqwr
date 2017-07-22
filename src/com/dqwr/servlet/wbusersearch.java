package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.entity.ZC;
import com.dqwr.model.QX;
import com.dqwr.model.ZCMD;

/**
 * Servlet implementation class wbusersearch
 */
public class wbusersearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wbusersearch() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
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
		System.out.println("修改");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		String username =null;
		if(request.getParameter("username")==null){
			if(((String)request.getAttribute("username")).equals("0")){
				request.setAttribute("success", "修改成功");
				System.out.println("修改成功");
			}else{
				username = (String)request.getAttribute("username");
				request.setAttribute("success", "修改失败");
				System.out.println("修改失败");
			}
		}else{
			username = request.getParameter("username");
			
		}
		ArrayList<YH> yhlist = new ArrayList<YH>();
		/**
		 * 查询政策的所有内容
		 */
		yhlist=QX.searchwbuser(con, username);
		database.closeConnection(con);
		request.setAttribute("yhlist", yhlist);
		request.setAttribute("username", username);
		
		request.getRequestDispatcher("/qxmanager/wb2.jsp").forward(request, response);
	}

}
