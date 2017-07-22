package com.dqwr.model;

import java.sql.*;
import java.util.ArrayList;

import com.dqwr.entity.*;
/**
 * 
 ************类说明**************
 * 类名：ZhiNengShuRu
 * 只能输入
 * 建类时间：2014-4-13 下午5:15:13
 * 类描述：
 */
public class ZhiNengShuRu {
	/**
	 * 
	 * 方法说明：查找实行范围
	 * 方法名：selectsxfw
	 * @param con
	 * @return 
	 * 返回值：ArrayList<SXFW>
	 */
	public static ArrayList<SXFW> selectsxfw(Connection con){
		String sql = "Select * from SXFWView";
		
		ArrayList<SXFW> sxfwlist = new ArrayList<SXFW>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				SXFW sxfw = new SXFW();
				sxfw.setSxfwid(rs.getString("ssxfwid"));
				sxfw.setSxfwjc(rs.getString("spyjc"));
				sxfw.setSxfwmc(rs.getString("ssxfwmc"));
				sxfw.setSxfwqp(rs.getString("ssxfwqp"));
				sxfwlist.add(sxfw);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sxfwlist;
	}
	
	public static ArrayList<ZTC> selectZtc(Connection con){
		String sql = "Select * from ztck";
		
		ArrayList<ZTC> ztclist = new ArrayList<ZTC>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				ZTC ztc = new ZTC();
				ztc.setZtcid(rs.getInt("id"));
				ztc.setZtc(rs.getString("name"));
				
				ztclist.add(ztc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ztclist;
	}
	/**
	 * 
	 * 方法说明：查找制定机关
	 * 方法名：selectzdjg
	 * @param con
	 * @return 
	 * 返回值：ArrayList<ZDJG>
	 */
	public static ArrayList<ZDJG> selectzdjg(Connection con){
		String sql = "select * from ZDJGView";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ZDJG> zdjglist = new ArrayList<ZDJG>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				ZDJG zdjg = new ZDJG();
				zdjg.setZdjgid(rs.getString("zid"));
				zdjg.setZdjgmc(rs.getString("zdjgmc"));
				zdjg.setZdjgpy(rs.getString("zdjgpy"));
				zdjg.setZdjgjc(rs.getString("zdjgjc"));
				zdjglist.add(zdjg);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return zdjglist;
	}
	
	/**
	 * 
	 * 方法说明：查找调整领域
	 * 方法名：selecttzly
	 * @param con
	 * @return 
	 * 返回值：ArrayList<TZLY>
	 */
	public static ArrayList<TZLY> selecttzly(Connection con){
		String sql = "select * from TTZLYView";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<TZLY> tzlylist = new ArrayList<TZLY>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				TZLY tzly = new TZLY();
				tzly.setTid(rs.getString("TID"));
				tzly.setTjc(rs.getString("TJC"));
				tzly.setTmc(rs.getString("TTZLYMC"));
				tzly.setTqp(rs.getString("TQP"));
				tzlylist.add(tzly);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return tzlylist;
	}
	
	
	/**
	 * 
	 * 方法说明：查找政策分类
	 * 方法名：selectzcfl
	 * @param con
	 * @return 
	 * 返回值：ArrayList<ZCFL>
	 */
	public static ArrayList<ZCFL> selectzcfl(Connection con){
		String sql = "select * from ZCFLView";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ZCFL> zcfllist = new ArrayList<ZCFL>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				ZCFL zcfl = new ZCFL();
				zcfl.setZid(rs.getString("ZCFLID"));
				zcfl.setZjc(rs.getString("ZJC"));
				zcfl.setZmc(rs.getString("ZCFLMC"));
				zcfl.setZqp(rs.getString("ZQP"));
				zcfllist.add(zcfl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return zcfllist;
	}
	
	/**
	 * 
	 * 方法说明：查询颁布形式
	 * 方法名：selectbbxs
	 * @param con
	 * @return 
	 * 返回值：ArrayList<BBXS>
	 */
	public static ArrayList<BBXS> selectbbxs(Connection con){
		String sql = "select * from bbxsview";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<BBXS> bbxslist = new ArrayList<BBXS>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				BBXS bbxs = new BBXS();
				bbxs.setBid(rs.getString("BID"));
				bbxs.setBjc(rs.getString("BJC"));
				bbxs.setBmc(rs.getString("BBBXSMC"));
				bbxs.setBqp(rs.getString("BQP"));
				bbxslist.add(bbxs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return bbxslist;
	}
	/**
	 * 
	 * 方法说明：查询政策
	 * 方法名：selectZC
	 * @param con
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> selectZC(Connection con){
		String sql = "select * from ZCView";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ZC> zclist = new ArrayList<ZC>();
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				ZC zc = new ZC();
				zc.setZCMC(rs.getString("zcmc"));
				zc.setZCID(rs.getString("zcid"));
				zc.setZCWH(rs.getString("zcwh"));
				zclist.add(zc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return zclist;
	}
	
	

}
