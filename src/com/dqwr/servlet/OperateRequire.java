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
import com.dqwr.entity.ZC;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.entity.Requirement;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;
import com.dqwr.requirement.entity.Orga;


public class OperateRequire extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DataBaseDao database = null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperateRequire() {
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
		int requid=Integer.parseInt(request.getParameter("requid"));
		String flag=request.getParameter("flag");
		String orgaid=request.getParameter("orgaid");
		String pageno=request.getParameter("pageno");
		RequireDaoImpl  requimpl=new RequireDaoImpl();
		OrgaDaoImpl  orgaimpl=new OrgaDaoImpl();
		response.setContentType("text/html;charset=UTF-8");
		ResultSet res=null,res2=null;
		PrintWriter output=response.getWriter();
		Requirement require=new Requirement();
		Orga orga=new Orga();
		if(operateid==0)
		{
			String reqpass = request.getParameter("reqpass");
			output.print("<script language=javascript>" + "if(confirm('确认删除？')){window.location.href='/dqwr/DeleteRequ?requid="+requid+"&orgaid="+orgaid+"&pageno="+pageno+"';}else{ window.location.href='ws/xdsh.jsp?reqpass="+reqpass+"&pageno="+pageno+"';};"+"</script>");
		}
		else if(operateid==1)
		{
			res=requimpl.SelectRequireById(con, requid);
			res2=orgaimpl.SelectOrgaById(con, orgaid);
			try {
				if(res.next()){
					try {
					require.setRequId(res.getInt(1));
					require.setOrgaId(res.getString(2));
					require.setRequName(res.getString(3));
					require.setFieldId(res.getString(4));
					require.setOtherField(res.getString(5));
					require.setIndustryID(res.getString(6));
					require.setRequOverview(res.getString(7));
					require.setKeyword(res.getString(8));
					require.setApplication(res.getString(9));
					require.setCooperationID(res.getBytes(10));
					require.setOtherCooperation(res.getString(11));
					require.setFillTime(res.getString(12));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(res2.next()){
					orga.setOrgaId(res2.getString(1));
					orga.setOrgaName(res2.getString(2));
					orga.setOrgaParentId(res2.getString(3));
					orga.setIndustryID(res2.getString(4));
					orga.setLegalPerson(res2.getString(5));
					orga.setContacts(res2.getString(6));
					orga.setTel(res2.getString(7));
					orga.setCel(res2.getString(8));
					orga.setAddress(res2.getString(9));
					orga.setEmail(res2.getString(10));
					orga.setWeb(res2.getString(11));
					orga.setNatureID(res2.getBytes(12));
					orga.setOtherNature(res2.getString(13));
					orga.setIntroduction(res2.getString(14));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("require",require);
			request.setAttribute("orga",orga);
			request.setAttribute("flag", flag);
			request.getRequestDispatcher("ws/editRequire.jsp").forward(request,response);
		}else if(operateid==2){
			request.getRequestDispatcher("ws/RequireBack.jsp").forward(request,response);
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
