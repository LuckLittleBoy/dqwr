package com.qt.model;

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
		String sql = "select * from WBYH where username = ? and pwd = ?";
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			//记录用户
			if(rs.next()){
				people.setUsername(rs.getString("username"));
				people.setName(rs.getString("name"));
				people.setSex(rs.getString("sex"));
				people.setYJSID(rs.getString("jsid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回
		return people;
	}
	public static String checkwbuser(String user,Connection con){
		YH people = new YH();
		PreparedStatement stmt =null;
		ResultSet rs = null;
		//语句，用视图
		String sql = "select * from WBYH where username = ?";
		String result = "";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			rs = stmt.executeQuery();
			//记录用户
			if(rs.next()){
				result = "<font color='red'>用户名重复</font>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回
		return result;
	}
	//ip登陆
	public static YH getIPLogin(String ip,Connection con ){
		YH people = new YH();
		PreparedStatement stmt =null;
		ResultSet rs = null;
		//语句，用视图
		String sql = "select * from WBYH where yhip=?";
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, ip);
			rs = stmt.executeQuery();
			//记录用户
			if(rs.next()){
				people.setYHID(rs.getString("yhZH"));
				people.setYHMM(rs.getString("yhmm"));
				people.setYHNC(rs.getString("yhnc"));
				people.setYJSID(rs.getString("yhjb"));
				people.setYHYX(rs.getString("yhyx"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回
		return people;
	}
}
