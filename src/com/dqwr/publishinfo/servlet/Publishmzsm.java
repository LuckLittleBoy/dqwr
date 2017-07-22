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
 import com.dqwr.publishinfo.dao.impl.PublishMzsmImpl;
import com.dqwr.publishinfo.entity.mzsm;

public class Publishmzsm extends HttpServlet{

	

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    public Publishmzsm() {
        super();
        database = new DataBaseDao();
     } 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		System.out.println("进入到doget");

		doPost(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		System.out.println("进入到dopost");

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String creatorname=request.getParameter("creator");
 		String mzsmcontent=request.getParameter("content1");
		String adddate=request.getParameter("publictime");
		mzsm mzsm=new mzsm();
		mzsm.setCreatorName(creatorname);
 		mzsm.setMzsmContent(mzsmcontent);
  	     
		String result="";
		if(mzsm.getCreatorName()==null||mzsm.getMzsmContent().equals("")){
			result="信息发布失败，发布人或内容为空";
		}else{

			mzsm.setAddDate(adddate);				
			Connection con = database.connection();
			PublishMzsmImpl publishmzsm=new PublishMzsmImpl();
			result=publishmzsm.insertMzsm(con, mzsm);
			database.closeConnection(con);
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/ws/bjmzsm.jsp").forward(request, response);
	}


}
