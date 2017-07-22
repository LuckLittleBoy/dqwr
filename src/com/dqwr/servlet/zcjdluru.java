package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.publishinfo.entity.Info;

/**
 * Servlet implementation class zcjdluru
 */
public class zcjdluru extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zcjdluru() {
        super();
        database = new DataBaseDao();
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		Info info=new Info();
		String content =  request.getParameter("content1");
		
		String title = request.getParameter("title");
		String result="";
		if(title==null||content==null||title.equals("请写入标题名...")||content.equals("")){
			result="政策解读录入失败，标题或内容为空";
			
		}else{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			YH user = (YH) request.getSession().getAttribute("user");
			df.format(new Date());
			Connection con = database.connection();
			result = com.dqwr.model.ZCJD.ZCJDluru(con,df.format(new Date()),title,user.getYHID(),content);
			database.closeConnection(con);
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/ws/zcjdll.jsp").forward(request, response);
	}

}
