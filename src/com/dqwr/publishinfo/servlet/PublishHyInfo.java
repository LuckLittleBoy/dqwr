package com.dqwr.publishinfo.servlet;

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
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;

public class PublishHyInfo extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    public static final String infoId="";
    public static final byte type=1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishHyInfo() {
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
	    int ispass=0; 
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String creator=request.getParameter("creator");
		String title=request.getParameter("title");
		String scope=request.getParameter("scope");
		String content=request.getParameter("content1");
		String publictime=request.getParameter("publictime");

		Info info=new Info();
		info.setCreatorId(creator);
		info.setTitle(title);
		info.setScope(Byte.parseByte(scope));
		info.setContent(content);
		info.setIsPass(ispass);
		
		String result="";
		if(info.getTitle()==null||info.getContent()==null||info.getTitle().equals("请写入标题名...")||info.getContent().equals("")){
			result="信息发布失败，发布人、标题或内容为空";
		}else{
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//			YH user = (YH) request.getSession().getAttribute("user");
//			String date=df.format(new Date());
			info.setAddDate(publictime);
			info.setReject(0);
			info.setType(type);
			
			
			Connection con = database.connection();
			PublishHyInfoImpl publishinfo=new PublishHyInfoImpl();
			result=publishinfo.insertInfo(con, info);
			database.closeConnection(con);
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("ws/hyinfo.jsp").forward(request, response);
	}


}
