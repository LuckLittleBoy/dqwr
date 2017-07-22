package com.satp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.satp.entity.Bbxs;
import com.satp.entity.Sxfw;
import com.satp.entity.Tzly;
import com.satp.entity.ZCType;
import com.satp.entity.Zdjg;

public class ZCTypeDao {
	public ArrayList<Sxfw> getSxfw(Connection con) {
		ArrayList<Sxfw> list = new ArrayList<Sxfw>();

		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select * from SXFWB";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Sxfw sxfw = new Sxfw();
				sxfw.setSXFWID(rs.getString("SSXFWID"));
				sxfw.setPYJC(rs.getString("SPYJC"));
				sxfw.setSXFWMC(rs.getString("SSXFWMC"));
				list.add(sxfw);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ZCType> getZCFL(Connection con) {
		ArrayList<ZCType> list2 = new ArrayList<ZCType>();

		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select * from ZCFLB";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ZCType zctype = new ZCType();
				zctype.setZCFLID(rs.getInt("ZCFLID"));
				zctype.setZname(rs.getString("ZCFLMC"));
				zctype.setZQP(rs.getString("ZQP"));
				zctype.setZJC(rs.getString("ZJC"));
				list2.add(zctype);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list2;
	}
	public ArrayList<Tzly> getTZLY(Connection con) {
		ArrayList<Tzly> list3 = new ArrayList<Tzly>();

		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select * from TTZLYB";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Tzly tzly = new Tzly();
				tzly.setTTZLYMC(rs.getString("TTZLYMC"));
				tzly.setTQP(rs.getString("TQP"));
				tzly.setTJC(rs.getString("TJC"));
				list3.add(tzly);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list3;
	}
	public ArrayList<Zdjg> getZdjg(Connection con) {
		ArrayList<Zdjg> list4 = new ArrayList<Zdjg>();

		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select * from ZDJGB";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Zdjg zd = new Zdjg();
				zd.setId(rs.getInt("ZID"));
				zd.setJgname(rs.getString("ZDJGMC"));
				list4.add(zd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list4;
	}
	public ArrayList<Bbxs> getZctype(Connection con) {
		ArrayList<Bbxs> list5 = new ArrayList<Bbxs>();

		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select * from BBXSB";

		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Bbxs zd = new Bbxs();
				zd.setPubform(rs.getString("BBBXSMC"));
				zd.setBJC(rs.getString("BJC"));
				zd.setBQP(rs.getString("BQP"));
				list5.add(zd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list5 ;
	}
}
