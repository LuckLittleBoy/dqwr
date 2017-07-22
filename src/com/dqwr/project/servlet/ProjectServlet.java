package com.dqwr.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dqwr.util.ReadProjectExcelToDb;

public class ProjectServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3176851753418854751L;

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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		ServletInputStream is = request.getInputStream();
		ReadProjectExcelToDb  exceltodb=new ReadProjectExcelToDb();
		PrintWriter output=response.getWriter();
		byte[] junk = new byte[1024];
        int bytesRead = 0;
	    bytesRead = is.readLine(junk, 0, junk.length);
        bytesRead = is.readLine(junk, 0, junk.length);
        bytesRead = is.readLine(junk, 0, junk.length);
        bytesRead = is.readLine(junk, 0, junk.length);
		if(exceltodb.readexceltodb(is)){
			output.print("<script language=javascript>" + "alert('导入成功！');"+"document.location.href='ws/projectManage.jsp'"+"</script>");
		}else{
			output.print("<script language=javascript>" + "alert('导入失败！');"+"document.location.href='search/index.jsp'"+"</script>");
		}
	}
}