package com.dqwr.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.model.PdfTool;
import com.dqwr.model.Word;

/**
 * Servlet implementation class PdfToText
 */
public class FJinput extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FJinput() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		
		
		
		String a = (String)session.getAttribute("a") != null ? (String)session.getAttribute("a") : "";
		System.out.println("a:"+a);
		String content = request.getParameter("content1");
		

		System.out.println("content:"+content);
		if(!a.equals("")){
			if(!content.equals(""))
				content+="<br /><br />"+a;
			else
				content+=a;
		}
		
		
		session.setAttribute("content1", content);
		session.setAttribute("a", "");
		response.getWriter().print(content);
	}

}
