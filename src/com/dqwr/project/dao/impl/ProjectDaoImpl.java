package com.dqwr.project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Emp;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.project.dao.ProjectDao;

public class ProjectDaoImpl implements ProjectDao{
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public ProjectDaoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public boolean deleteProject(Connection con,int projectid) {
		// TODO Auto-generated method stub
	 int count=0;
	 String sql="delete from emp where id='"+projectid+"'";
	 try{
		 sta=con.createStatement();
		 count=sta.executeUpdate(sql);
	 }catch(SQLException e){
		 e.printStackTrace();
	 }
	 if(count>0){
		 return true;
	 }else{
		 return false;
	 }
	}

	@Override
	public ResultSet editProject(Connection con,int projectid) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from emp where id='"+projectid+"'";
		 try{
			 sta=con.createStatement();
			 rs=sta.executeQuery(sql);
		 }catch(SQLException e){
			 e.printStackTrace();
		 }
		return rs;
	}

	@Override
	public ResultSet lookProject(Connection con,int projectid) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				ResultSet rs=null;
				String sql="select * from emp where id='"+projectid+"'";
				 try{
					 sta=con.createStatement();
					 rs=sta.executeQuery(sql);
				 }catch(SQLException e){
					 e.printStackTrace();
				 }
				return rs;
	}

	@Override
	public void processMonitor() {
		// TODO Auto-generated method stub
	}
	@Override
	public boolean updateProject(Connection con, Emp emp) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="update emp set ProjectName='"+emp.getProjectName()+"',OrgaName='"+emp.getOrgaName()+"',OrgaId='"+emp.getOrgaId()+"',AskFund='"+emp.getAskFund()+"',CooperateOrga='"+emp.getCooperateOrga()+"',Head='"+emp.getHead()+"',Field='"+emp.getField()+"',GuideCode='"+emp.getGuideCode()+"',OrgaParent='"+emp.getOrgaParent()+"',StopEndYear='"+emp.getStopEndYear()+"',IsEnterprise='"+emp.getIsEnterprise()+"',PlanType='"+emp.getPlanType()+"',Department='"+emp.getDepartment()+"',ProjectId='"+emp.getProjectId()+"',Money='"+emp.getMoney()+"' where id='"+emp.getId()+"'";
		try{
			sta=con.createStatement();
			count=sta.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean updateProjectPdf(Connection con, Emp emp) {
		// TODO Auto-generated method stub
		int count=0;
		String sql=null;
		if(emp.getDeclaration()!=null){
			sql="update emp set declaration='"+emp.getDeclaration()+"' where id='"+emp.getId()+"'";
		}else if(emp.getCommitments()!=null){
			sql="update emp set commitments='"+emp.getCommitments()+"' where id='"+emp.getId()+"'";
		}else if(emp.getQuestionnaire()!=null){
			sql="update emp set questionnaire='"+emp.getQuestionnaire()+"' where id='"+emp.getId()+"'";
		}else if(emp.getAcceptance()!=null){
			sql="update emp set acceptance='"+emp.getAcceptance()+"' where id='"+emp.getId()+"'";
		}
		
		try{
			sta=con.createStatement();
			count=sta.executeUpdate(sql);
		}catch(SQLException e){
		   e.printStackTrace();
	     }
		if(count>0){
			return true;
		}else{
			return false;
		}
}
}
