package com.qt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.dqwr.entity.TZLY;
import com.dqwr.entity.ZC;
//news select
public class qtselect {
	public static ArrayList<ZC> indexqtnews(Connection con){
		String sql = "select top 20 ZCID,ZCMC,BGBRQ,ZCWH,ZLastTime from MyByView where ZSHZT='通过' order by  BGBRQ desc";
		ArrayList<ZC> zcList = new ArrayList<ZC>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql); //执行查询 
		    ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
		    while(rs.next()){
		    	ZC zc = new ZC();
		    	zc.setZCID(rs.getString("ZCID"));
		    	zc.setZCMC(rs.getString("ZCMC"));
		    	zc.setBGBRQ(rs.getString("BGBRQ"));
		    	zc.setZCWH(rs.getString("ZCWH"));
		    	zc.setLasttime(rs.getString("ZLastTime"));
		    	zcList.add(zc);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return zcList;
	}
	/**
	 * 政策专题更多
	 * @param con
	 * @return
	 */
	public static ArrayList<TZLY> zcztgengduo(Connection con){
		String sql = "select * from TTZLYB";
		ArrayList<TZLY> tzlyList = new ArrayList<TZLY>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql); //执行查询 
		    while(rs.next()){
		    	TZLY tzly = new TZLY();
		    	tzly.setTid(rs.getString("TID"));
		    	tzly.setTmc(rs.getString("TTZLYMC"));
		    	tzlyList.add(tzly);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tzlyList;
	}
	//zcfllist
	public static ArrayList<ZC> zcfl(Connection con){
		String sql = "select ZCID,ZCMC,BGBRQ,ZCFLMC,BZCFL,ZCWH,Zlasttime,zsxztw from MyByView where ZSHZT='通过' order by  BZCFL ASC,BGBRQ DESC";
		ArrayList<ZC> zcList = new ArrayList<ZC>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql); //执行查询 
		    ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
		    while(rs.next()){
		    	ZC zc = new ZC();
		    	zc.setZCID(rs.getString("ZCID"));
		    	zc.setZCMC(rs.getString("ZCMC"));
		    	zc.setBGBRQ(rs.getString("BGBRQ"));
		    	zc.setZCWH(rs.getString("zcwh"));
		    	if(rs.getString("BGBRQ")==null){
					zc.setZCFLMC("");
				}
		    	zc.setBZCFL(rs.getString("bzcfl"));
		    	if(rs.getString("bzcfl")==null){
					zc.setZCFLMC("");
				}
		    	zc.setZCFLMC(rs.getString("ZCFLMC"));
				if(rs.getString("ZCFLMC")==null){
					zc.setZCFLMC("");
				}
				if(rs.getString("zsxztw").equals("1")){
					zc.setZSXZTW("有效");
				}
				else zc.setZSXZTW("失效");
				zc.setLasttime(rs.getString("ZLastTime"));
		    	zcList.add(zc);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return zcList;
	}
	public static ArrayList<ZC> lbfl(Connection con,String lb,String fl){
		String sql = "select ZCID,ZCMC,BGBRQ,ZCFLMC,BZCFL,ZCWH,Zlasttime,zsxztw from MyByView where ZSHZT='通过' and "+lb+"='"+fl+"' order by BGBRQ DESC";
		ArrayList<ZC> zcList = new ArrayList<ZC>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			ResultSet rs = stmt.executeQuery(sql); //执行查询 
		    ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
		    while(rs.next()){
		    	ZC zc = new ZC();
		    	zc.setZCID(rs.getString("ZCID"));
		    	zc.setZCMC(rs.getString("ZCMC"));
		    	zc.setBGBRQ(rs.getString("BGBRQ"));
		    	zc.setZCWH(rs.getString("zcwh"));
		    	if(rs.getString("BGBRQ")==null){
					zc.setZCFLMC("");
				}
		    	zc.setBZCFL(rs.getString("bzcfl"));
		    	if(rs.getString("bzcfl")==null){
					zc.setZCFLMC("");
				}
		    	zc.setZCFLMC(rs.getString("ZCFLMC"));
				if(rs.getString("ZCFLMC")==null){
					zc.setZCFLMC("");
				}
				if(rs.getString("zsxztw").equals("1")){
					zc.setZSXZTW("有效");
				}
				else zc.setZSXZTW("失效");
				zc.setLasttime(rs.getString("ZLastTime"));
		    	zcList.add(zc);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return zcList;
	}
	public static String zhuce(Connection con,String user,String pwd,String yhnc,String yhyx){
		String sql = "insert into wbyh (yhzh,yhmm,yhnc,yhyx) values(?,?,?,?)";
		PreparedStatement stmt = null;
		int rs=0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, pwd);
			stmt.setString(3, yhnc);
			stmt.setString(4, yhyx);
			rs = stmt.executeUpdate();//执行查询 
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (rs==0){
			return "注册失败";
		}else{
			return "注册成功";
		}
	}
	
	/**
	 * 注册用户
	 * @param con
	 * @param username
	 * @param pwd
	 * @param name
	 * @param sex
	 * @param city
	 * @param gzdw
	 * @param szhy
	 * @param jycd
	 * @param zc
	 * @param txdz
	 * @param yzbm
	 * @param sj
	 * @param gddh
	 * @param yx
	 * @param qq
	 * @param msn
	 * @return
	 */
	public static String zhuce(Connection con, String username, String pwd,
			String name, String sex, String city, String gzdw, String szhy,
			String jycd, String zc, String txdz, String yzbm, String sj,
			String gddh, String yx, String qq, String msn,String zyfx) {
		// TODO Auto-generated method stub
		String sql = "insert into wbyh " +
				"(username,pwd,name,sex,city,gzdw,szhy,jycd,zc,txdz,yzbm,sj,gddh,yx,qq,msn,zyfx) " +
				"values" +
				"(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = null;
		int rs=0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, pwd);
			stmt.setString(3, name);
			stmt.setString(4, sex);
			stmt.setString(5, city);
			stmt.setString(6, gzdw);
			stmt.setString(7, szhy);
			stmt.setString(8, jycd);
			stmt.setString(9, zc);
			stmt.setString(10, txdz);
			stmt.setString(11, yzbm);
			stmt.setString(12, sj);
			stmt.setString(13, gddh);
			stmt.setString(14, yx);
			stmt.setString(15, qq);
			stmt.setString(16, msn);
			stmt.setString(17, zyfx);
			rs = stmt.executeUpdate();//执行查询 
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "注册失败";
		}
		if (rs==0){
			return "注册失败";
		}else{
			return "注册成功";
		}
	}
}
