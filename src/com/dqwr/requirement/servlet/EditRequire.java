package com.dqwr.requirement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;
import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;

public class EditRequire extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRequire() {
        super();
        database = new DataBaseDao();
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
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String flag=request.getParameter("flag");
		String pageno=request.getParameter("pageno");
		byte[] nature=new byte[4];
		for(int i=0;i<4;i++){
			nature[i]=0;
		}
		//获取、设置组织结构相关提交信息
		String orgaid=request.getParameter("orgaid");

		String organame=request.getParameter("organame");
        
		String orgaparentid=request.getParameter("orgaparentid");

		String industryid=request.getParameter("industryid");

		String legalperson=request.getParameter("legalperson");

		String contacts=request.getParameter("contacts");

		String tel=request.getParameter("tel");

		String cel=request.getParameter("cel");

		String address=request.getParameter("address");

		String email=request.getParameter("email");

		String web=request.getParameter("web");

		String natureid=request.getParameter("natureid");

		String othernature=request.getParameter("othernature");

		String introduction=request.getParameter("introduction");
		String username=request.getParameter("username");
		Orga orga=new Orga();
		orga.setOrgaId(orgaid);
		orga.setOrgaName(organame);
		if(orgaparentid!=null){
			orga.setOrgaParentId(orgaparentid);	
		}
        if(industryid!=null){
        	orga.setIndustryID(industryid);	
        }
		if(legalperson!=null){
			orga.setLegalPerson(legalperson);	
		}
		if(contacts!=null){
			orga.setContacts(contacts);
		}
		if(tel!=null){
			orga.setTel(tel);	
		}
		if(username!=null){
			orga.setUsername(username);	
		}
		if(cel!=null){
			orga.setCel(cel);
		}
		if(address!=null){
			orga.setAddress(address);	
		}
		if(email!=null){
			orga.setEmail(email);	
		}
		if(web!=null){
			orga.setWeb(web);	
		}
		
        if(introduction!=null){
    		orga.setIntroduction(introduction);	
        }
        if(natureid!=null){
		if(natureid.equals("企业")){
			nature[0]=1;
		}else if(natureid.equals("高等院校")){
			nature[1]=1;
		}else if(natureid.equals("研究机构")){
			nature[2]=1;
		}else if(natureid.equals("其他")){
			nature[3]=1;
			orga.setOtherNature(othernature);
		}
		orga.setNatureID(nature);
        }

		//获取、设置技术需求信息
		byte[] cooperation=new byte[4];
		for(int i=0;i<4;i++){
			cooperation[i]=0;
		}
		String field="";
		String requname=request.getParameter("requname");
		String[] fieldid=request.getParameterValues("fieldid");
		String otherfield=request.getParameter("otherfield");
		String requoverview=request.getParameter("requoverview");
		String keyword=request.getParameter("keyword");
		String industryid1=request.getParameter("industryid1");
		String application=request.getParameter("application");
		String cooperationid=request.getParameter("cooperationid");
		String othercooperation=request.getParameter("othercooperation");
		String filltime=request.getParameter("filltime");
 		Requirement req=new Requirement();
		req.setOrgaId(orgaid);
		req.setRequName(requname);
		if(industryid1!=null){
		 req.setIndustryID(industryid1);
		}
	    if(requoverview!=null){
			req.setRequOverview(requoverview);	
	    }
        if(keyword!=null){
    		req.setKeyword(keyword);	
        }
        if(application!=null){
    	    req.setApplication(application);	
        }

		
		if(cooperationid!=null){
		if(cooperationid.equals("技术引进")){
			cooperation[0]=1;
		}else if(cooperationid.equals("委托研发")){
			cooperation[1]=1;
		}else if(cooperationid.equals("合作研发")){
			cooperation[2]=1;
		}else if(cooperationid.equals("其他")){
			cooperation[3]=1;
			if(othercooperation!=null){
			req.setOtherCooperation(othercooperation);
			}
		}
		req.setCooperationID(cooperation);
		}
		if(fieldid!=null){
		for(int i=0;i<fieldid.length;i++){
			if(fieldid[i].equals("其他")){
			  req.setOtherField(otherfield);
			  field+=fieldid[i]+";";
			}else if(i==(fieldid.length-1))
			{
				field+=fieldid[i];
				
			}else{
				field+=fieldid[i]+";";
			}
		}
		req.setFieldId(field);
		}
		req.setFillTime(filltime);
		req.setUsername(username);
		  //将技术需求表信息插入到数据库中
		int requid=Integer.parseInt(request.getParameter("requid"));
		Connection con = database.connection();
		OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
		RequireDaoImpl requireimpl=new RequireDaoImpl();
		boolean editorga=orgaimpl.editOrga(con, orga);
		System.out.println("editorga="+editorga);
		boolean editrequire=requireimpl.editRequire(con, req,requid);
		System.out.println("editrequire="+editrequire);
		database.closeConnection(con);
		PrintWriter out=response.getWriter();
		if(editorga&&editrequire){
			response.setContentType("text/html;charset=gb2312");
			if(flag.equals("2")){
				out.print("<script>alert('修改成功!');document.location.href='ws/xdsh.jsp?reqpass=2&pageno="+pageno+"';</script>");	
			}else if(flag.equals("4")){
				out.print("<script>alert('修改成功!');document.location.href='ws/xdsh.jsp?reqpass=4&pageno="+pageno+"';</script>");
			}
		}
		}
	}
