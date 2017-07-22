package com.dqwr.db;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import beans.WDLS;

import com.dqwr.entity.YH;
import com.dqwr.history.AddLogUnity;

/**
 * Servlet implementation class LoginOut
 */
public class LoginOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOut() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		doPost(request,response);
  	}

  	/**
  	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  	 */
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		
  		try{
  			response.setCharacterEncoding("utf-8");
  			try{
  				YH user =(YH) request.getSession().getAttribute("user");
  				AddLogUnity.add("登陆", user.getYHID(), "退出登陆");
  	 		}
  	 		catch(Exception e){
  	 		}
  			request.getSession().removeAttribute("user");
  			
  			
  		}
  		catch(Exception e){
  			e.printStackTrace();
  			response.getWriter().print("{'wdls':'fail'}");
  		}
  		
  	}

  }
