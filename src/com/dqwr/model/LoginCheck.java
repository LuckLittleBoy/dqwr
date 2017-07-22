package com.dqwr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dqwr.entity.*;
/**
 * 
 ************类说明**************
 * 类名：LoginCheck
 * 建类时间：2014-1-25 下午11:09:48
 * 类描述：登陆检验类
 */
public class LoginCheck {
	public static YH getLogin(String user ,String pwd , Connection con){
		YH people = new YH();
		PreparedStatement stmt =null;
		ResultSet rs = null;
		//语句，用视图
		String sql = "select yhid,yhmm,yhnc,yjsid from YH where YHID = ? and YHMM = ?";
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			//记录用户
			if(rs.next()){
				people.setYHID(rs.getString("yhid"));
				people.setYHMM(rs.getString("yhmm"));
				people.setYHNC(rs.getString("yhnc"));
				people.setYJSID(rs.getString("yjsid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回
		return people;
	}
}
