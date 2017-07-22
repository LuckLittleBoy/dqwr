package com.satp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.satp.entity.Highcharts;
import com.satp.entity.Policy;
import com.satp.model.PageTable;

public class ZcBrowseDao {
	public static ArrayList<Policy> sqlPolicy(Connection con ,String sql,int pageNo,int pageSize){
		ArrayList<Policy>  policytaglist = new ArrayList<Policy>();

		policytaglist = PageTable.query(con, sql, pageNo, pageSize);
		return policytaglist;
	}
	public static Policy policyLook(Connection con ,String sql){
		Policy policytag = new Policy();

		policytag = PageTable.queryPolicy(con, sql);
		return policytag;
	}
	public static int sqlpagecount(Connection con,String sql,int pageNo,int pageSize){
		int pageCount=0;
	
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		
		return pageCount;
	}
	public static void sqlInsert(Connection con,ArrayList policys) throws SQLException{
	
		boolean n=PageTable.inserSql(con, policys);
	}
	public static ArrayList<Highcharts> sqlPolicyConut(Connection con, String sql,String cXZD) {
		// TODO Auto-generated method stub
	ArrayList<Highcharts>  highchartslist = new ArrayList<Highcharts>();
	highchartslist = PageTable.queryCount(con, sql,cXZD);
		
		return highchartslist;
	}

}
