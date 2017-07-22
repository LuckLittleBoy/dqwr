package com.satp.servlet.ajax;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class DownloadServlet
 */
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String CXZD1=(String) session.getAttribute("CXZD1");// TODO Auto-generated method stub
		String path =request.getSession().getServletContext().getRealPath("//"+CXZD1+".xls");	
		response.reset();//可以加也可以不加  
		response.setContentType("application/x-download");  	  
		String filedownload = path;  
		String filedisplay =CXZD1+".xls";  
		filedisplay = URLEncoder.encode(filedisplay,"UTF-8");  
		response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);  	  
		java.io.OutputStream outp = null;  
		java.io.FileInputStream in = null;  
		try  
		{  
			outp = response.getOutputStream();  
			in = new FileInputStream(filedownload);  		  
			byte[] b = new byte[1024];  
			int i = 0;  	  
			while((i = in.read(b)) > 0)  
			{  
				outp.write(b, 0, i);  
			}     
			outp.flush(); 
			
		}  
		catch(Exception e)  
		{  
			System.out.println("Error!");  
			e.printStackTrace();  
		}  
		finally  
		{  
			if(in != null)  
			{  
				in.close();  
				in = null;  
			}  

		}  
	}

}
