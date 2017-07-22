package com.dqwr.requirement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dqwr.dao.DataBaseDao;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.entity.Orga;

public class EditOrga extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOrga() {
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

		Connection con = database.connection();
		OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
		boolean editorga=orgaimpl.editOrga(con, orga);
	
		database.closeConnection(con);
		PrintWriter out=response.getWriter();
		if(editorga){
			response.setContentType("text/html;charset=gb2312");
			out.print("<script>alert('修改成功!');document.location.href='ws/orga.jsp?pageno="+pageno+"';</script>");
			
		}
	}
}