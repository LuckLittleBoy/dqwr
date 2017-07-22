package com.dqwr.publishinfo.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.publishinfo.dao.PublishInfo;
import com.dqwr.publishinfo.entity.Info;

public class PublishInfoImpl implements PublishInfo {
	
	public PublishInfoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public String insertInfo(Connection conn,Info info) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "insert into public_publishinfo (Title,Type,Content,CreatorId,AddDate,IsPass,Reject) values(?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, info.getTitle());
			stmt.setByte(2, info.getType());
			stmt.setString(3, info.getContent());
			stmt.setString(4, info.getCreatorId());
			stmt.setString(5, info.getAddDate());
			stmt.setInt(6, info.getIsPass());
			stmt.setInt(7, info.getReject());
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
	public boolean deleteInfo(Connection conn,int InfoId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String alterInfo(int InfoId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ResultSet selectInfoAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ResultSet selectInfoById(Connection conn, int infoId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean updateInfo(Connection conn, int infoid, int ispass,
			String yjnr) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean editInfo0(Connection coon, int infoid, String creator,
			String title, String publictime, String content) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean editInfo1(Connection coon, int infoid, String creator,
			String title, String publictime, byte scope, String content) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
