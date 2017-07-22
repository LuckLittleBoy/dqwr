package com.satp.wordManager;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddKeysWord
 */
public class AddNoKeysWord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNoKeysWord() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			request.setCharacterEncoding("utf-8");
			String addkeymc=request.getParameter("addkeymc");
			PrintWriter out=response.getWriter();
			String sql="insert into  WYGJCK  values('"+addkeymc+"')";
			System.out.println(sql);
			if(Sqlcon.executeUpdate(sql)>=1){
				out.print("{'add':'success'}");
			}
			else{
				out.print("{'add':'fail'}");
			}									
		}
		catch(Exception e){
			response.getWriter().print("{'add':'fail'}");
		}
		
	}

}