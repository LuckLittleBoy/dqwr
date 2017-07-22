package com.dqwr.publishinfo.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
 import com.dqwr.publishinfo.dao.PublishMzsm;
import com.dqwr.publishinfo.entity.mzsm;

public class PublishMzsmImpl implements PublishMzsm{
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public PublishMzsmImpl(){
		DataBaseDao db=new DataBaseDao();
	}

	public ResultSet selectMzsmContent(Connection conn){
			String sql="select * from MZSM where MzsmId =(select max(MzsmId) from [MZSM])";
			try{
				sta = conn.createStatement();
				res=sta.executeQuery(sql);
			}
			catch (SQLException e) {
 				e.printStackTrace();
			}
			return res;
	}
	public String insertMzsm(Connection conn,mzsm mzsm) {
 		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "insert into MZSM (MzsmContent,CreatorName,AddDate) values(?,?,?)";
 		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, mzsm.getMzsmContent());
			stmt.setString(2, mzsm.getCreatorName());
			stmt.setString(3, mzsm.getAddDate());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
 			e.printStackTrace();
		}
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}

}
