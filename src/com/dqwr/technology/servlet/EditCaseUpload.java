package com.dqwr.technology.servlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.technology.dao.impl.CaseDaoImpl;
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;
import com.jspsmart.upload.SmartUpload;
public class EditCaseUpload extends HttpServlet{
	private static final long serialVersionUID = 7236047764000622573L;
	/**
	 * 
	 */
	private String caseid=null;
	private String techid=null;
	private String orgaid=null;
	private String paths=null;
	private String replacepath=null;
	Connection conn=null;

	public EditCaseUpload(){
		DataBaseDao db=new DataBaseDao();
        conn=db.connection();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destinationfileName=null;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String uploadPath ="D:\\temp";
	    String tempPath ="D:\\temp\\Temp";
	    
	    if(!new File(uploadPath).isDirectory()) new File(uploadPath).mkdirs();//   文件夹不存在就自动创建：
	    if(!new File(tempPath).isDirectory())new File(tempPath).mkdirs(); 
	    	
	     DiskFileItemFactory factory = new DiskFileItemFactory();
	     factory.setSizeThreshold(4*1024);
	     factory.setRepository(new File(tempPath));
	     
	     ServletFileUpload upload = new ServletFileUpload(factory);
	     upload.setSizeMax(10*1024*1024);//文件最大上限 
	     
	     try {  
	            List<FileItem> items = upload.parseRequest(request);//获取所有文件列表
	            for (int i=0;i<items.size();i++){ 
	            	FileItem item = items.get(i);
	            	if(item.isFormField()){
	            		if("caseid".equals(item.getFieldName())) 
	            	 	{
	            			caseid=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
	            	 	}
	            	 	if("techid".equals(item.getFieldName())) 
            	 		{
	            	 		techid=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		}
	            	 	if("orgaid".equals(item.getFieldName())) 
            	 		{
            	 		    orgaid=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		}
	            	 	if("paths".equals(item.getFieldName())) 
            	 		{
            	 		    paths=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		}
	            	 	if("replacepath".equals(item.getFieldName())) 
            	 		{
            	 		    replacepath=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		}
	            	}else{
	                      String fileName = item.getName().toLowerCase();
	                      char[] filename=fileName.toCharArray();
	                      int flag=0;
	                      for(int j=0;j<filename.length;j++){
	                    	  if(filename[j]=='.'){
	                    		  flag=j;
	                    	  }
	                      }
	                      String ext=null;          
	                      ext=fileName.substring(flag+1);
	                      String id=null;
	                      if(!fileName.trim().equals("")){
	                    	  
	                    	  Random rd = new Random();
		          		      Calendar time = Calendar.getInstance();
		          		      id=String.valueOf(time.get(Calendar.YEAR))
		          		           + String.valueOf(time.get(Calendar.MONTH)+1)
		          		            + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
		          		            + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
		          		            + String.valueOf(time.get(Calendar.MINUTE))
		          		                                 + String.valueOf(time.get(Calendar.SECOND))
		          		                                 + String.valueOf(rd.nextInt(100));  
	                      }
	          			 
	          		      destinationfileName=id;
	          		      String destinationpath=uploadPath+"\\"+destinationfileName+"."+ext;
	          		      File fTmp=new File(destinationpath);
	          		      item.write(fTmp);
	          		      File oldfile=new File(replacepath);
	          		      if(oldfile.exists()){
	          		    	  oldfile.delete();
	          		    	  System.out.println("删除旧文件"+replacepath+"成功！");
	          		      }
	          		      CaseDaoImpl caseimpl=new CaseDaoImpl();
	          		      String newpath=paths.replace(replacepath, destinationpath);
	          		      if(caseimpl.updatecasepath(conn,caseid,newpath)){
	          		    	 out.print("<script language=javascript>"+"alert('文件修改成功！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"';"+"</script>");
	          		      }else{
	          		    	 out.print("<script language=javascript>"+"alert('文件修改失败！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"';"+"</script>");
	          		      }
	          		}
	            }
	         }catch (Exception e) {
	                e.printStackTrace();  
	         }
	        
            }
}