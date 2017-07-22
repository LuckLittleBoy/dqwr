package com.dqwr.dbadmin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;
import com.dqwr.history.AddLogUnity;

/**
 * Servlet implementation class DownLogTxt
 */
public class DownLogTxt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownLogTxt() {
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
		String path =request.getSession().getServletContext().getRealPath("\\log.txt");	
		try{
			File file=new File(path);
	        if(file.exists()){
	        	file.delete();
	            file.createNewFile();
	        }else{
	        	file.createNewFile();
	        }
	        	
	        FileOutputStream out=new FileOutputStream(file,true);
	        ResultSet rs=null;   
	        String sql="SELECT  * FROM LOG order by tdate desc";
	        StringBuffer sb=new StringBuffer();
            sb.append("日志ID\t 类型\t用户\t事件\t时间\t\r\n ");
            out.write(sb.toString().getBytes("utf-8"));
			rs = Sqlcon.executeQuery(sql);
			try {
				while(rs.next()){
					sb=new StringBuffer();
		            sb.append(rs.getString("ID").replace(" ", "")+"\t"+rs.getString("Type").replace(" ", "")+"\t"+rs.getString("username").replace(" ", "")+"\t"+rs.getString("thing").replace(" ", "")+"\t"+rs.getString("tdate")+"\r\n ");
		            out.write(sb.toString().getBytes("utf-8"));
				}
				rs.close();
				out.close();
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			YH user =(YH) request.getSession().getAttribute("user");
 			sql="insert into  log values('日志','"+user.getYHID()+"','下载日志记录','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
 			System.out.println(sql);
 			Sqlcon.executeUpdate(sql);
			Sqlcon.close();
			
		}
  		catch(Exception e){
  			
  		}
		response.reset();//可以加也可以不加  
		response.setContentType("application/x-download");  	  
		String filedownload = path;  
		String filedisplay = "河北省科技政策管理系统日志.txt";  
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
