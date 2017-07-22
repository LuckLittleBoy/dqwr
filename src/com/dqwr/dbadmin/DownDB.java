package com.dqwr.dbadmin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class DownDB
 */
public class DownDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownDB() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path =request.getSession().getServletContext().getRealPath("\\dqwr.bak");	
		try{
		
	        
			response.reset();//可以加也可以不加  
			response.setContentType("application/x-download");  	  
			String filedownload = path;  
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			String filedisplay = "河北省科技情报研究院数据库备份"+df.format(new Date())+".bak";  
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
		catch(Exception e)  
		{  
			System.out.println("Error!");  
			e.printStackTrace();  
		}  
	}
}
