package com.satp.wordManager;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
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

import net.sf.json.JSONArray;
import net.sourceforge.pinyin4j.PinyinHelper;
import beans.Word;

/**
 * Servlet implementation class DeleteKeysWord
 */
public class DeleteNoKeysWord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoKeysWord() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
  			request.setCharacterEncoding("utf-8");
  			String id=request.getParameter("id");
  			PrintWriter out=response.getWriter();
  			String sql="Delete from WYGJCK WHERE id="+id;
  			System.out.println(sql);
  			if(Sqlcon.executeUpdate(sql)>=1){
  				out.print("{'del':'success'}");
  				
  			}
  			else{
  				out.print("{'del':'fail'}");
  			}									
  		}
  		catch(Exception e){
  			response.getWriter().print("{'del':'fail'}");
  		}
  		
  		
		
	}

}
