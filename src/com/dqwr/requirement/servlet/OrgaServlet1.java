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

public class OrgaServlet1 extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    public OrgaServlet1() {
        super();
        database = new DataBaseDao();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入OrgaServlet1:do post");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
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
        /*进入orga类*/
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
		if(username!=null){
			orga.setUsername(username);	
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
		int xssh=0;
		int jssh=0;
		int reject=0;
		String requname=request.getParameter("requname");
		String[] fieldid=request.getParameterValues("fieldid");
		String otherfield=request.getParameter("otherfield");
		String requoverview=request.getParameter("requoverview");
		String industryid1=request.getParameter("industryid1");
		String keyword=request.getParameter("keyword");
		String application=request.getParameter("application");
		String cooperationid=request.getParameter("cooperationid");
		String othercooperation=request.getParameter("othercooperation");
		String filltime=request.getParameter("filltime");
		/*进入到requirement类*/
		Requirement req=new Requirement();
		req.setOrgaId(orgaid);
		req.setRequName(requname);
		System.out.println("reqirement:"+username);
		req.setUsername(username);
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
		req.setXSSH(xssh);
		req.setJSSH(jssh);
		req.setReject(reject);
		  //将技术需求表信息插入到数据库中
		Connection con = database.connection();
		OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
		RequireDaoImpl requireimpl=new RequireDaoImpl();
		String orgareturn=orgaimpl.insertOrga11(con, orga);
		String requreturn=requireimpl.insertRequire11(con, req);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=gb2312");
		if(orgareturn.equals("success")&&requreturn.equals("success")){
			out.print("<script language=javascript>" + "if(confirm('填报成功')){window.location.href='qt/qttjfx.jsp?tag=1';}else{ window.location.href='qt/qttjfx.jsp?tag=1';};"+"</script>");
		}else{
			out.print("<scipt language=javascript> alert('填报失败')</script>");
		}
		database.closeConnection(con);
		}
	}
