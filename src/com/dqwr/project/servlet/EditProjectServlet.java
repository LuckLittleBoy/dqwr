package com.dqwr.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Emp;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.project.dao.impl.ProjectDaoImpl;

public class EditProjectServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8551913218389687423L;
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
		DataBaseDao db=new DataBaseDao();
		Connection con=db.connection();
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter out=response.getWriter();
		int empid=Integer.parseInt(request.getParameter("empid"));
		String pageno=request.getParameter("pageno");
		String projectname=request.getParameter("projectname");
		String organame=request.getParameter("organame");
		String orgaid=request.getParameter("orgaid");
		String askfund=request.getParameter("askfund");
		String cooperateorga=request.getParameter("cooperateorga");
		String head=request.getParameter("head");
		String field=request.getParameter("field");
		String guidecode=request.getParameter("guidecode");
		String orgaparent=request.getParameter("orgaparent");
		String stopendyear=request.getParameter("stopendyear");
		String isenterprise=request.getParameter("isenterprise");
		String plantype=request.getParameter("plantype");
		String department=request.getParameter("department");
		String projectid=request.getParameter("projectid");
		String money=request.getParameter("money");
		Emp emp=new Emp();
		emp.setId(empid);
		emp.setProjectName(projectname);
		emp.setOrgaName(organame);
		emp.setOrgaId(orgaid);
		emp.setAskFund(askfund);
		emp.setCooperateOrga(cooperateorga);
		emp.setHead(head);
		emp.setField(field);
		emp.setGuideCode(guidecode);
		emp.setOrgaParent(orgaparent);
		emp.setStopEndYear(stopendyear);
		emp.setIsEnterprise(isenterprise);
		emp.setPlanType(plantype);
		emp.setDepartment(department);
		emp.setProjectId(projectid);
		emp.setMoney(money);
		ProjectDaoImpl projectimpl=new ProjectDaoImpl();
		if(projectimpl.updateProject(con, emp)){
			out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/projectManage.jsp?pageno="+pageno+"';"+"</script>");
		}else{
			out.print("<script language=javascript>"+"alert('修改失败！');"+"document.location.href='ws/projectManage.jsp?pageno="+pageno+"';"+"</script>");
		}
		db.closeConnection(con);
	}
    
	
	
}
