package com.satp.wordManager;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sourceforge.pinyin4j.PinyinHelper;
import beans.Word;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class KeySeachStatus
 */
public class KeySeachStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeySeachStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");	//设置编码
			response.setCharacterEncoding("utf-8");	//设置编码
			Boolean isztc=false,gjc=false,wygjc=false;
			String keyseach=request.getParameter("keyseach");
			ResultSet rs=null;
			String sql="SELECT * from WYGJCK where name='"+keyseach+"'";
			//System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			if(rs.next()){
				wygjc=true;
			}	
			sql="SELECT * from GJCK where name='"+keyseach+"'";
			//System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			if(rs.next()){
				gjc=true;
			}		
			sql="SELECT * from ztcK where name='"+keyseach+"'";
			//System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			if(rs.next()){
				isztc=true;
			}		
			
			rs.close();
			Sqlcon.close();
			response.getWriter().print("{'isztc':"+isztc+",'wygjc':"+wygjc+",'gjc':"+gjc+"}");
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'isztc':'fail'}");
		}
	
	
	
		
	}

}
