package com.dqwr.requirement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.requirement.dao1.RequireDao;
import com.dqwr.requirement.entity.Requirement;

public class RequireDaoImpl implements RequireDao {
	public static PreparedStatement stmt=null;
	public static Statement sta=null;
	public static ResultSet res=null;
	public RequireDaoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override//前台插入用户信息时的insert语句
	public String insertRequire11(Connection conn,Requirement req) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "insert into requirement (OrgaId,RequName,FieldId,OtherFiled,IndustryID,RequOverview,Keyword,Application,CooperationID,OtherCooperation,FillTime,XSSH,JSSH,Reject,Username) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";		 
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, req.getOrgaId());
			stmt.setString(2, req.getRequName());
			stmt.setString(3, req.getFieldId());
			stmt.setString(4, req.getOtherField());
			stmt.setString(5, req.getIndustryID());
			stmt.setString(6, req.getRequOverview());
			stmt.setString(7, req.getKeyword());
			stmt.setString(8, req.getApplication());
			stmt.setBytes(9, req.getCooperationID());
			stmt.setString(10, req.getOtherCooperation());
			stmt.setString(11, req.getFillTime());
			stmt.setInt(12, req.getXSSH());
			stmt.setInt(13, req.getJSSH());
			stmt.setInt(14, req.getReject());
			stmt.setString(15, req.getUsername());
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
//后台插入用户信息时的insert语句
	public String insertRequire(Connection conn,Requirement req) {
		int rs = 0;
		String sql = "insert into requirement (OrgaId,RequName,FieldId,OtherFiled,IndustryID,RequOverview,Keyword,Application,CooperationID,OtherCooperation,FillTime,XSSH,JSSH,Reject) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, req.getOrgaId());
			stmt.setString(2, req.getRequName());
			stmt.setString(3, req.getFieldId());
			stmt.setString(4, req.getOtherField());
			stmt.setString(5, req.getIndustryID());
			stmt.setString(6, req.getRequOverview());
			stmt.setString(7, req.getKeyword());
			stmt.setString(8, req.getApplication());
			stmt.setBytes(9, req.getCooperationID());
			stmt.setString(10, req.getOtherCooperation());
			stmt.setString(11, req.getFillTime());
			stmt.setInt(12, req.getXSSH());
			stmt.setInt(13, req.getJSSH());
			stmt.setInt(14, req.getReject());
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

	public boolean editRequire(Connection conn,Requirement req,int requid) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "update requirement set OrgaId=?,RequName=?,FieldId=?,OtherFiled=?,IndustryID=?,RequOverview=?,Keyword=?,Application=?,CooperationID=?,OtherCooperation=?,FillTime=? where RequID=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, req.getOrgaId());
			stmt.setString(2, req.getRequName());
			stmt.setString(3, req.getFieldId());
			stmt.setString(4, req.getOtherField());
			stmt.setString(5, req.getIndustryID());
			stmt.setString(6, req.getRequOverview());
			stmt.setString(7, req.getKeyword());
			stmt.setString(8, req.getApplication());
			stmt.setBytes(9, req.getCooperationID());
			stmt.setString(10, req.getOtherCooperation());
			stmt.setString(11, req.getFillTime());
			stmt.setInt(12, requid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return false;
		}else{
			return true;
		}
	}
	@Override
	public ResultSet AllReuqire(Connection conn) {
		// TODO Auto-generated method stub
		String sql ="select top 8 * from requirement ORDER BY requirement.FillTime DESC";
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
	public ResultSet SelectRequireById(Connection conn, int requid) {
		String sql ="select * from requirement where RequID='"+requid+"'";
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
	public boolean requirementIsExistById(Connection conn, String orgaid) {
		String sql ="select COUNT(*) totalCount from requirement where OrgaID='"+orgaid+"'";
		int rowCount = 0;
		try 
		{
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
			if(res.next()) 
			{
				rowCount=res.getInt("totalCount");
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		if(rowCount>0)
			return false;
		return true;
	}
	
	public static List<Requirement> AllReuqireNameTimeList(Connection conn) {
		// TODO Auto-generated method stub
		ArrayList<Requirement> list=new ArrayList<Requirement>();
		Requirement require=new Requirement();
		String sql ="select * from requirement";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(res.next()){
				require.setOrgaId(res.getString(2));
				require.setRequName(res.getString(3));
				require.setFillTime(res.getString(11));
				list.add(require);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean updateRequire(Connection conn, int requid, int ispass,
			String yjnr,String SH) {
		// TODO Auto-generated method stub
		int count=0;
		String sql = null;
		if(ispass==1){
			if(SH.equals("0")){
				sql="update requirement set XSSH='"+ispass+"' where RequID='"+requid+"'";	
			}else if(SH.equals("1")){
				sql="update requirement set JSSH='"+ispass+"' where RequID='"+requid+"'";
			}
			
		}else{
			if(SH.equals("0")){
			    sql="update requirement set XSSH='"+ispass+"',XSSHYJ='"+yjnr+"',Reject='1' where RequID='"+requid+"'";
			}else if(SH.equals("1")){
			    sql="update requirement set JSSH='"+ispass+"',JSSHYJ='"+yjnr+"',Reject='1' where RequID='"+requid+"'";
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
	
	public boolean deleterequ(Connection conn,int requid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from requirement where requid='"+requid+"'";
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
	
	public boolean deleteorga(Connection conn,String orgaid) {

		int count=0;
		String sql="delete from public_orga where OrgaID='"+orgaid+"'";
		try {
			sta=conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
}
