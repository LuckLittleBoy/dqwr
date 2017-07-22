package com.dqwr.topic.servlet;
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
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;
public class TopicEditServlet extends HttpServlet{
	/**
	 * 
	 */
	private String topicname=null;
	private String publisher=null;
	private String time=null;
	private String link=null;
	private String path=null;
	private String picpath=null;
	private String id=null;
	private String pageno=null;
	 Connection conn=null;
	private String[] fileType = new String[]{".jpg",".gif",".bmp",".png",".jpeg",".ico"};

	public TopicEditServlet(){
		DataBaseDao db=new DataBaseDao();
        conn=db.connection();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Topic topic=new Topic();
		String destinationfileName=null; 
		int flag=0;
		String uploadPath =request.getSession().getServletContext().getRealPath("/")+"images\\TopicUpload\\";//图片上传路径   
	    String tempPath = request.getSession().getServletContext().getRealPath("/")+"images\\TopicUpload\\temp\\";//图片临时上传路径
	    
	    if(!new File(uploadPath).isDirectory()) new File(uploadPath).mkdirs();//   文件夹不存在就自动创建：
	    if(!new File(tempPath).isDirectory())new File(tempPath).mkdirs(); 
	    	
	     DiskFileItemFactory factory = new DiskFileItemFactory();
	     factory.setSizeThreshold(4*1024);
	     factory.setRepository(new File(tempPath));
	     
	     ServletFileUpload upload = new ServletFileUpload(factory);
	     upload.setSizeMax(4*1024*1024);//文件最大上限 
	     
	     try {  
	            List<FileItem> items = upload.parseRequest(request);//获取所有文件列表
	            for (int i=0;i<items.size();i++) { 
	            	FileItem item = items.get(i);
	            	if(!item.isFormField()){
	            		String fileName = item.getName().toLowerCase();
	            		if(fileName.length()>0){
	            			flag=1;
	            		}
	            		if(fileName.endsWith(fileType[0])||fileName.endsWith(fileType[1])||fileName.endsWith(fileType[2])||fileName.endsWith(fileType[3])||fileName.endsWith(fileType[4])||fileName.endsWith(fileType[5])){
	            			 Random rd = new Random();
	            		      Calendar time = Calendar.getInstance();
	            		      String id=String.valueOf(time.get(Calendar.YEAR))
	            		           + String.valueOf(time.get(Calendar.MONTH)+1)
	            		            + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
	            		            + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
	            		            + String.valueOf(time.get(Calendar.MINUTE))
	            		                                 + String.valueOf(time.get(Calendar.SECOND))
	            		                                 + String.valueOf(rd.nextInt(100));
	            		      destinationfileName=id+".jpg";
	            		      File fTmp=new File(uploadPath+destinationfileName);
	            		      item.write(fTmp);
	            		}
	            	}else{
	            	 	if("topicname".equals(item.getFieldName())) 
	            	 	{
	            	 	topicname=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
	            	 	topic.setTopicname(topicname);
	            	 	}
	            	 	if("publisher".equals(item.getFieldName())) 
            	 		{
	            	 		publisher=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		topic.setPublisher(publisher);
            	 		}
	            	 	if("time".equals(item.getFieldName())) 
            	 		{
            	 		time=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		topic.setTime(time);
            	 		}
	            	 	if("link".equals(item.getFieldName())) 
            	 		{
            	 		link=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		topic.setLink(link);
            	 		}
	            	 	if("picpath".equals(item.getFieldName())) 
            	 		{
            	 		picpath=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		}
	            	 	if("id".equals(item.getFieldName())) 
            	 		{
            	 		id=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
            	 		topic.setId(Integer.parseInt(id));
            	 		}
	            	 	if("pageno".equals(item.getFieldName())) 
	            	 	{
	            	 	 pageno=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
	            	 	}
	            	}
	            	if(flag==1){
	            		topic.setPicpath(destinationfileName);	
	            	}else{
	            		topic.setPicpath(picpath);
	            	}
	            	
	            }
	         }catch (Exception e) {
	                e.printStackTrace();  
	         }
	         
	        TopicDaoImpl topicimpl=new TopicDaoImpl();
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=gb2312");
	        PrintWriter out=response.getWriter();
	        if(topicimpl.editTopic(conn, topic)){
	        	if(picpath!=null&&flag==1){
	        	   File file=new File(uploadPath+picpath);
	        	   if(file.exists()){
	        		   file.delete();
	        	   }
	        	}
	        	out.print("<script>alert('修改成功!');document.location.href='ws/topicManage.jsp?pageno="+pageno+"';</script>");		
	        }else{
	        	out.print("<script>alert('修改失败!');document.location.href='ws/topicManage.jsp?pageno="+pageno+"';</script>");	
	        }
	        
            }
}