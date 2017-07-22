package com.dqwr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dqwr.entity.GJZ;

public class XTJS {

	public static String alterxtjs(Connection con, String content) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		String sql = "update XTJS set xtjs=?";
		int rs = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, content);
			rs = stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "更新失败";
		}
		if(rs==0){
			System.out.print("更新失败");
			return "更新失败";
		}else{
			System.out.println("更新成功");
			return "更新成功";
		}
	}

	public static String xtjsyw(Connection con) {
		// TODO Auto-generated method stub
		String sql = "Select * From xtjs";
		ResultSet rs = null;
		PreparedStatement stmt =null;
		String xtjs = "";
		try {
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			if(rs.next()){
				xtjs = rs.getString("xtjs");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return xtjs;
	}
	
}
