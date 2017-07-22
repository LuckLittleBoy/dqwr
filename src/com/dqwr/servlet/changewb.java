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
public class changewb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changewb() {
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
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		String username = request.getParameter("username");
		String change = request.getParameter("change");
		String yhid = request.getParameter("yhid");
		/**
		 * 查询政策的所有内容
		 */
		int rs =QX.upwbyhjb(con,change,yhid);
		if(rs!=0){
			request.setAttribute("success", "修改成功");
		}else{
			request.setAttribute("success", "修改失败");
		}
		database.closeConnection(con);
		request.setAttribute("username", username);
		
		request.getRequestDispatcher("wbusersearch").forward(request, response);
	}

}
