package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dqwr.dao.DataBaseDao;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.entity.Orga;


public class OperateOrga extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateOrga() {
        super();
        database = new com.dqwr.dao.DataBaseDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = database.connection();
		int operateid=Integer.parseInt(request.getParameter("operateid"));
		String orgaid=request.getParameter("orgaid");
		String pageno=request.getParameter("pageno");
		OrgaDaoImpl  orgaimpl=new OrgaDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null;
		PrintWriter output=response.getWriter();
		Orga orga=new Orga();
		if(operateid==0)
		{
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteOrga?orgaid="+orgaid+"&pageno="+pageno+"';}else{ window.location.href='ws/orga.jsp?pageno="+pageno+"';};"+"</script>");
		}
		else if(operateid==1)
		{
			
			res=orgaimpl.SelectOrgaById(con, orgaid);
			try {
				if(res.next()){
					orga.setOrgaId(res.getString(1));
					orga.setOrgaName(res.getString(2));
					orga.setOrgaParentId(res.getString(3));
					orga.setIndustryID(res.getString(4));
					orga.setLegalPerson(res.getString(5));
					orga.setContacts(res.getString(6));
					orga.setTel(res.getString(7));
					orga.setCel(res.getString(8));
					orga.setAddress(res.getString(9));
					orga.setEmail(res.getString(10));
					orga.setWeb(res.getString(11));
					orga.setNatureID(res.getBytes(12));
					orga.setOtherNature(res.getString(13));
					orga.setIntroduction(res.getString(14));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("orga",orga);
			request.getRequestDispatcher("ws/editOrga.jsp").forward(request,response);
		}
		database.closeConnection(con);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}