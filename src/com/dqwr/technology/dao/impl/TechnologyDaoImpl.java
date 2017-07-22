package com.dqwr.technology.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.technology.dao.TechnologyDao;
import com.dqwr.technology.entity.Technology;

public class TechnologyDaoImpl implements TechnologyDao {
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public TechnologyDaoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public String insertInfo(Connection conn, Technology tech) {
		PreparedStatement stmt=null;
		int rs = 0;
		String sql = "insert into technology (OrgaId,TechName,SourceID,TechOwner,OtherSource,FieldId,OtherField,TechOverview,Scope,ProgressId,StateId,EconIndicator,Result,TransID,OtherTransfrom,FinaNeedId,OtherNeed,Money,CaseNumber,FillTime,XSSH,JSSH,Reject) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tech.getOrgaId());
			stmt.setString(2, tech.getTechName());
			stmt.setBytes(3, tech.getSourceID());
			stmt.setString(4, tech.getTechOwner());
			stmt.setString(5, tech.getOtherSource());
			stmt.setString(6, tech.getFieldId());			
			stmt.setString(7, tech.getOtherField());
			stmt.setString(8, tech.getTechOverview());
			stmt.setString(9, tech.getScope());
			stmt.setBytes(10, tech.getProgessId());
			stmt.setBytes(11, tech.getStateId());
			stmt.setString(12, tech.getEconIndicator());
			stmt.setString(13, tech.getResult());
			stmt.setBytes(14, tech.getTransID());
			stmt.setString(15, tech.getOtherTransfrom());
			stmt.setBytes(16, tech.getFinaNeedId());
			stmt.setString(17, tech.getOtherNeed());
			stmt.setFloat(18, tech.getMoney());
			stmt.setInt(19, tech.getCaseNumber());
			stmt.setString(20, tech.getFillTime());
			stmt.setInt(21, tech.getXSSH());
			stmt.setInt(22, tech.getJSSH());
			stmt.setInt(23, tech.getReject());
 			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}
//前台成熟技术 信息插入技术表中
	public String insertInfo1(Connection conn, Technology tech) {
		PreparedStatement stmt=null;
		int rs = 0;
		String sql = "insert into technology (OrgaId,TechName,SourceID,TechOwner,OtherSource,FieldId,OtherField,TechOverview,Scope,ProgressId,StateId,EconIndicator,Result,TransID,OtherTransfrom,FinaNeedId,OtherNeed,Money,CaseNumber,FillTime,XSSH,JSSH,Reject,Username) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tech.getOrgaId());
			stmt.setString(2, tech.getTechName());
			stmt.setBytes(3, tech.getSourceID());
			stmt.setString(4, tech.getTechOwner());
			stmt.setString(5, tech.getOtherSource());
			stmt.setString(6, tech.getFieldId());			
			stmt.setString(7, tech.getOtherField());
			stmt.setString(8, tech.getTechOverview());
			stmt.setString(9, tech.getScope());
			stmt.setBytes(10, tech.getProgessId());
			stmt.setBytes(11, tech.getStateId());
			stmt.setString(12, tech.getEconIndicator());
			stmt.setString(13, tech.getResult());
			stmt.setBytes(14, tech.getTransID());
			stmt.setString(15, tech.getOtherTransfrom());
			stmt.setBytes(16, tech.getFinaNeedId());
			stmt.setString(17, tech.getOtherNeed());
			stmt.setFloat(18, tech.getMoney());
			stmt.setInt(19, tech.getCaseNumber());
			stmt.setString(20, tech.getFillTime());
			stmt.setInt(21, tech.getXSSH());
			stmt.setInt(22, tech.getJSSH());
			stmt.setInt(23, tech.getReject());
			stmt.setString(24, tech.getUsername());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}

	public String updatetech(Connection conn, Technology tech,int techid) {
		PreparedStatement stmt=null;
		int rs = 0;
		String sql = "update technology set TechName=?,SourceID=?,TechOwner=?,OtherSource=?,FieldId=?,OtherField=?,TechOverview=?,Scope=?,ProgressId=?,StateId=?,EconIndicator=?,Result=?,TransID=?,OtherTransfrom=?,FinaNeedId=?,OtherNeed=?,Money=?,CaseNumber=?,FillTime=? where TechId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tech.getTechName());
			stmt.setBytes(2, tech.getSourceID());
			stmt.setString(3, tech.getTechOwner());
			stmt.setString(4, tech.getOtherSource());
			stmt.setString(5, tech.getFieldId());
			stmt.setString(6, tech.getOtherField());
			stmt.setString(7, tech.getTechOverview());
			stmt.setString(8, tech.getScope());
			stmt.setBytes(9, tech.getProgessId());
			stmt.setBytes(10, tech.getStateId());
			stmt.setString(11, tech.getEconIndicator());
			stmt.setString(12, tech.getResult());
			stmt.setBytes(13, tech.getTransID());
			stmt.setString(14, tech.getOtherTransfrom());
			stmt.setBytes(15, tech.getFinaNeedId());
			stmt.setString(16, tech.getOtherNeed());
			stmt.setFloat(17, tech.getMoney());
			stmt.setInt(18, tech.getCaseNumber());
			stmt.setString(19, tech.getFillTime());
			stmt.setInt(20, techid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "fail";
		}else{
			return "success";
		}
	}

	@Override
	public boolean deleteTech(Connection conn,int Techid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from TECHNOLOGY where TechId='"+Techid+"'";
		try {
			sta=conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean alterTech(Connection conn,String InfoId) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public ResultSet selectTechAll(Connection conn) {
		String sql ="select top 8 * from TECHNOLOGY ORDER BY TECHNOLOGY.FillTime DESC";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ResultSet selectTechById(Connection conn, int techid) {
		// TODO Auto-generated method stub
		String sql ="select * from TECHNOLOGY where TechId='"+techid+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public ResultSet selectTechById1(Connection conn, int TechId) {
		// TODO Auto-generated method stub
		String sql ="select * from TECHNOLOGY where TechId='"+TechId+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public int selectTech(Connection conn,String orgaid,String techname){
		String sql ="select * from TECHNOLOGY where OrgaId='"+orgaid+"' and TechName='"+techname+"'";
		int techid = 0;
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
			while(res.next()){
				techid=res.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return techid;
	}
	
	public boolean updateTech(Connection conn, int techid, int ispass,
			String yjnr,String SH) {
		// TODO Auto-generated method stub
		int count=0;
		String sql = null;
		if(ispass==1){
			if(SH.equals("0")){
				sql="update TECHNOLOGY set XSSH='"+ispass+"' where TechId='"+techid+"'";	
			}else if(SH.equals("1")){
				sql="update TECHNOLOGY set JSSH='"+ispass+"' where TechId='"+techid+"'";
			}
			
		}else{
			if(SH.equals("0")){
			    sql="update TECHNOLOGY set XSSH='"+ispass+"',XSSHYJ='"+yjnr+"',Reject='1' where TechId='"+techid+"'";
			}else if(SH.equals("1")){
			    sql="update TECHNOLOGY set JSSH='"+ispass+"',JSSHYJ='"+yjnr+"',Reject='1' where TechId='"+techid+"'";
			}
	
		}
		try {
			sta = conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
		
	}
}
