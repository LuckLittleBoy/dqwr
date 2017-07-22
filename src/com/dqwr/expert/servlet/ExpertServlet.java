package com.dqwr.expert.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.expert.daoimpl.ExpertDaoImpl;
import com.dqwr.expert.entity.Expert;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;
import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;

public class ExpertServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpertServlet() {
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
		//获取、设置专家信息提交信息
		String expertname=request.getParameter("expertname");
		String sex=request.getParameter("sex");
		String birthday=request.getParameter("birthday");
		String idcard=request.getParameter("idcard");
		String educational=request.getParameter("educational");
		String degree=request.getParameter("degree");
		String studyspec=request.getParameter("studyspec");
		String engagespec=request.getParameter("engagespec");
		String organame=request.getParameter("organame");
		String orgaid=request.getParameter("orgaid");
		String area=request.getParameter("area");
		String position=request.getParameter("position");
		String jobtitle=request.getParameter("jobtitle");
		String address=request.getParameter("address");
		String tel=request.getParameter("tel");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String zipcode=request.getParameter("zipcode");
		String firstfield=request.getParameter("Firstfield");
		String firstotherfield=request.getParameter("FirstOtherfield");
		
		String secondfield=request.getParameter("Secondfield");
		String secondotherfield=request.getParameter("SecondOtherfield");
		
		String thirdfield=request.getParameter("Thirdfield");
		String thirdotherfield=request.getParameter("ThirdOtherfield");
		
		String overview=request.getParameter("overview");
		String pluralism=request.getParameter("pluralism");
		String honor=request.getParameter("honor");
		
		Expert expert=new Expert();
		if(expertname!=null){
			expert.setExpertName(expertname);	
		}
        if(sex!=null){
    		expert.setSex(Integer.parseInt(sex));
        }
        if(birthday!=null){
    		expert.setBirthday(birthday);  	
        }
        if(idcard!=null){
    		expert.setIDCard(idcard);
        }
        if(educational!=null){
     		expert.setEducational(educational);    	 
         }
        if(degree!=null){
    		expert.setDegree(degree);
        }
        if(studyspec!=null){
    		expert.setStudySpec(studyspec);
        }
        if(engagespec!=null){
        	expert.setEngageSpec(engagespec);
        }
		if(organame!=null){
			expert.setOrgaName(organame);	
		}
		if(orgaid!=null){
			expert.setOrgaId(orgaid);
		}
		if(area!=null){
			expert.setArea(area);
		}
        if(position!=null){
        	expert.setPosition(position);	
        }
		if(jobtitle!=null){
			expert.setJobTitle(jobtitle);	
		}
        if(address!=null){
    		expert.setAddress(address);	
        }
        if(tel!=null){
    		expert.setTel(tel);   
        }
        if(mobile!=null){
    		expert.setMobile(mobile);	
        }
        if(email!=null){
    		expert.setEmail(email);	
        }
        if(zipcode!=null){
    		expert.setZipCode(zipcode);	
        }
        if(firstfield!=null){
    		expert.setFirstfield(firstfield);
    		if(firstfield.equals("其他")){
    			expert.setFirstOtherfield(firstotherfield);
    		}
        }
        if(secondfield!=null){
            expert.setSecondfield(secondfield);
            if(secondfield.equals("其他")){
    			expert.setSecondOtherfield(secondotherfield);
    		}
        }
        if(thirdfield!=null){
    	    expert.setThirdfield(thirdfield);
    	    if(thirdfield.equals("其他")){
    	    	expert.setThirdOtherfield(thirdotherfield);
    	    }
        }
	    if(overview!=null){
			expert.setOverview(overview);	
	    }
        if(pluralism!=null){
    		expert.setPluralism(pluralism);	
        }
        if(honor!=null){
    		expert.setHonor(honor);	
        }
		expert.setXSSH(0);
		expert.setJSSH(0);
		expert.setReject(0);
		
		
		//将技术需求表信息插入到数据库中
		Connection con = database.connection();
		ExpertDaoImpl expertimpl=new ExpertDaoImpl();
		String result=expertimpl.insertExpert(con, expert);
		database.closeConnection(con);
		PrintWriter out=response.getWriter();
		if(result.equals("fail")){
			out.print("<script>alert('填写失败！');document.location.href='qt/expertinfo.jsp';</script>");	
		}else{
			out.print("<script>alert('填写成功！');document.location.href='ws/expert1.jsp?exppass=1';</script>");
		}
		}
}
