package com.dqwr.project.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Emp;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.project.dao.impl.ProjectDaoImpl;
import com.jspsmart.upload.SmartUpload;

public class ProcessMonitorServlet extends HttpServlet{
	
	private DataBaseDao database = null;
    private ServletConfig config;
    public String UploadPath="";
	/**
	 * 
	 */
	private static final long serialVersionUID = -1231351532286515903L;
	
	public ProcessMonitorServlet(){
		super();
        database = new DataBaseDao();
	}

	 public void init(ServletConfig config) throws ServletException {
	    	this.config = config;
	   }
	 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int operateid = 0;
		int empid=0;
		String pageno=null;
		String editpath=null;
		request.setCharacterEncoding("gbk");
		//response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		ProjectDaoImpl projectimpl=new ProjectDaoImpl();
		Connection con=database.connection();
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(config,request,response);
		Emp emp=new Emp();
		try {
			  //mySmartUpload.setAllowedFilesList("rar,htm,html,jar");//设置允许上传的文件
				mySmartUpload.setDeniedFilesList("exe,jsp,asp");// 禁止上传的文件
				mySmartUpload.setDenyPhysicalPath(false); // 拒绝物理路径
				mySmartUpload.setMaxFileSize(5000000);// 设置允许上传文件最大为50000bytes
				mySmartUpload.setTotalMaxFileSize(50000000);// 一次上传文件大小最多不超过5000000bytes
				mySmartUpload.upload();
				for (int i = 0; i <mySmartUpload.getFiles().getCount(); i++) {
				com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
				if(!myFile.isMissing()){
				Random rd = new Random();
				Calendar cd = Calendar.getInstance();
				String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
				String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile.getFileExt();
				String path = "D:/temp/";
				path += fileName;
				int item=Integer.parseInt(mySmartUpload.getRequest().getParameter("item"));
				empid=Integer.parseInt(mySmartUpload.getRequest().getParameter("empid"));
				pageno=mySmartUpload.getRequest().getParameter("pageno");
				operateid=Integer.parseInt(mySmartUpload.getRequest().getParameter("operateid"));
				emp.setId(empid);
				ResultSet rs=projectimpl.editProject(con, empid);
				rs.next();
		        if(item==0){
		        	emp.setDeclaration(path);
		        	editpath=rs.getString(17);
		        }else if(item==1){
		        	emp.setCommitments(path);
		        	editpath=rs.getString(18);
		        }else if(item==2){
		        	emp.setQuestionnaire(path);
		        	editpath=rs.getString(19);
		        }else if(item==3){
		        	emp.setAcceptance(path);
		        	editpath=rs.getString(20);
		        }
				myFile.saveAs(path,2);
				System.out.print("文件上传成功");
				} 
				}
			   }catch (Exception e) {
				   e.printStackTrace();
			   }
		if(operateid==1){
			if(projectimpl.updateProjectPdf(con, emp)){
				System.out.println(editpath);
		    	 File file=new File(editpath);
		    	 if(file.exists()){
		    		 file.delete();
		    	 }
		    	  out.print("<script language=javascript>" +"alert('修改成功');"+"</script>");
		    	  request.getRequestDispatcher("ws/editProject.jsp?empid="+empid+"&operateid="+operateid+"&pageno="+pageno+"").forward(request,response);
		    }else{
		    	  out.print("<script language=javascript>"+"alert('修改失败');"+"</script>");
		    	  request.getRequestDispatcher("ws/processMonitor.jsp").forward(request,response);
		    }
		}
		if(operateid==2){
			if(projectimpl.updateProjectPdf(con, emp)){
				  out.print("<script language=javascript>" +"alert('上传成功');"+"</script>");
		    	  request.getRequestDispatcher("ws/lookProject.jsp?empid="+empid+"&operateid="+operateid+"&pageno="+pageno+"").forward(request,response);
		    }else{
		    	out.print("<script language=javascript>"+"alert('修改失败');"+"</script>");
		    	request.getRequestDispatcher("ws/projectManage.jsp?pageno="+pageno+"").forward(request,response);
		    }
		}
      
	}
    
}
