package com.dqwr.publishinfo.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.publishinfo.dao.PublishInfo;
import com.dqwr.publishinfo.entity.Info;

public class PublishHyInfoImpl implements PublishInfo {
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public PublishHyInfoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public String insertInfo(Connection conn,Info info) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "insert into public_publishinfo (Title,Type,Scope,Content,CreatorId,AddDate,IsPass,Reject) values(?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, info.getTitle());
			stmt.setByte(2, info.getType());
			stmt.setByte(3, info.getScope());
			stmt.setString(4, info.getContent());
			stmt.setString(5, info.getCreatorId());
			stmt.setString(6, info.getAddDate());
			stmt.setInt(7, info.getIsPass());
			stmt.setInt(8, info.getReject());
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
    
	@Override
	public boolean updateInfo(Connection conn, int infoid, int ispass,
			String yjnr) {
		// TODO Auto-generated method stub
		int count=0;
		String sql;
		if(ispass==1){
			sql="update public_publishinfo set IsPass='"+ispass+"' where InfoId='"+infoid+"'";
		}else{
		    sql="update public_publishinfo set IsPass='"+ispass+"',Reject=1,Opition='"+yjnr+"' where InfoId='"+infoid+"'";
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
	@Override
	public boolean deleteInfo(Connection conn,int InfoId) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from public_publishinfo where InfoId='"+InfoId+"'";
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
	public String alterInfo(int InfoId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ResultSet selectInfoAll(Connection conn) {
		// TODO Auto-generated method stub
		String sql ="select * from public_publishinfo";
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
	public ResultSet selectInfoById(Connection conn, int infoId) {
		String sql ="select * from public_publishinfo where InfoId='"+infoId+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
   
	public ResultSet selectWorkInfo(Connection conn){
		String sql ="select top 11 * from public_publishinfo where Type=0 ORDER BY public_publishinfo.AddDate DESC";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return res;
	}
	
	public ResultSet selectInPro(Connection conn){
		String sql ="select top 8 * from public_publishinfo where Type=1 and Scope=0 ORDER BY public_publishinfo.AddDate DESC";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public ResultSet selectOutPro(Connection conn){
		String sql ="select top 8 * from public_publishinfo where Type=1 and Scope=1 ORDER BY public_publishinfo.AddDate DESC";
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
	public boolean editInfo0(Connection conn, int infoid, String creator,
			String title,String publictime,String content) {
		 int count=0;
		 String sql;
		 sql="update public_publishinfo set CreatorId='"+creator+"',Title='"+title+"',AddDate='"+publictime+"',Content='"+content+"' where InfoId='"+infoid+"'";
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
	@Override
	public boolean editInfo1(Connection conn, int infoid, String creator,
			String title, String publictime,byte scope, String content) {
		// TODO Auto-generated method stub
		int count=0;
		String sql;
		sql="update public_publishinfo set CreatorId='"+creator+"',Title='"+title+"',AddDate='"+publictime+"',Scope='"+scope+"',Content='"+content+"' where InfoId='"+infoid+"'";
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
