package com.dqwr.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dqwr.entity.YJFK;
import com.dqwr.entity.ZCJDEntity;

public class Yjfkmodel {

	public static String addyjfk(Connection con, String fs, String lxfs,
			String xw, String xq, String jyyq, String ljxx, String user, String time) {
		// TODO Auto-generated method stub
		PreparedStatement stmt = null;
		String sql = "insert into yjfk(yjr,time,fs,ljxx,jyyq,xq,xw,lxfs) values(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, time);
			stmt.setString(3, fs);
			stmt.setString(4, ljxx);
			stmt.setString(5, jyyq);
			stmt.setString(6, xq);
			stmt.setString(7, xw);
			stmt.setString(8, lxfs);
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==0){
			return "意见发送失败";
		}else{
			return "意见已发送";
		}
	}

	@SuppressWarnings("unchecked")
	public static String YJFKLL(Connection con, String pagesize,
			String currentpage, String searchnr) {
		// TODO Auto-generated method stub
		
		String sql = "select * from YJFK where yjr like '%"+searchnr+"%' Order By time Desc";
		String call = "{call Fenye (?,?,?)}";
		String result = "";
		String allpage = "";
		
		List<YJFK> yjfklist = new ArrayList<YJFK>();
		ResultSet rs = null;
		try {
			CallableStatement c =con.prepareCall(call);
			c.setString(1, sql);
			c.setString(2, currentpage);
			c.setString(3, pagesize);
			c.execute();
			/**
			 * java 处理 存储过程的多个返回值
			 */
			c.getMoreResults();
			rs=c.getResultSet();
			if(rs.next()){
				allpage = rs.getString("allpage");
			}
			/**
			 * 判断是否还有下一个结果集。
			 */
			if(c.getMoreResults()){
				rs=c.getResultSet();
				while(rs.next()){
					YJFK yjfk = new YJFK();
					yjfk.setFs(rs.getString("fs"));
					yjfk.setId(rs.getString("id"));
					yjfk.setJyyq(rs.getString("jyyq"));
					yjfk.setLjxx(rs.getString("ljxx"));
					yjfk.setLxfs(rs.getString("lxfs"));
					yjfk.setTime(rs.getString("time"));
					yjfk.setXq(rs.getString("xq"));
					yjfk.setXw(rs.getString("xw"));
					yjfk.setYjr(rs.getString("yjr"));
					yjfklist.add(yjfk);
				}
			}
			if(c.getMoreResults()){
				rs=c.getResultSet();
				System.out.println("rs:"+rs.getString(1));
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/**
		 * 处理查询结果
		 * result = 0 存储过程执行成功。
		 * 返回json
		 */
		if(yjfklist.size()!=0){
			JSONObject json=new JSONObject();  
		    JSONArray jsonMembers = new JSONArray();  
		    json.put("allpage", allpage); 
		    if(yjfklist.size()!=0){
		    	for(YJFK yjfk : yjfklist){
		    		JSONObject  map2 = new JSONObject(); 
		    		map2.put("fs", yjfk.getFs());
			        map2.put("id",yjfk.getId() );
			        map2.put("jyyq",yjfk.getJyyq() );
			        map2.put("ljxx",yjfk.getLjxx() );
			        map2.put("lxfs",yjfk.getLxfs() );
			        map2.put("time",yjfk.getTime() );
			        map2.put("xq",yjfk.getXq() );
			        map2.put("xw",yjfk.getXw() );
			        map2.put("yjr",yjfk.getYjr() );

			        jsonMembers.add(map2);
		    	}
		    }
		    json.put("yjfklist", jsonMembers); 
		    return json.toString();
		}
		else{
			return "超出范围";
		}
		
	}

	@SuppressWarnings("unchecked")
	public static String YJFKLL(Connection con, String pagesize,
			String currentpage) {
		// TODO Auto-generated method stub
		String sql = "select * from YJFK Order By time Desc";
		String call = "{call Fenye (?,?,?)}";
		String result = "";
		String allpage = "";
		
		List<YJFK> yjfklist = new ArrayList<YJFK>();
		ResultSet rs = null;
		try {
			CallableStatement c =con.prepareCall(call);
			c.setString(1, sql);
			c.setString(2, currentpage);
			c.setString(3, pagesize);
			c.execute();
			/**
			 * java 处理 存储过程的多个返回值
			 */
			c.getMoreResults();
			rs=c.getResultSet();
			if(rs.next()){
				allpage = rs.getString("allpage");
			}
			/**
			 * 判断是否还有下一个结果集。
			 */
			if(c.getMoreResults()){
				rs=c.getResultSet();
				while(rs.next()){
					YJFK yjfk = new YJFK();
					yjfk.setFs(rs.getString("fs"));
					yjfk.setId(rs.getString("id"));
					yjfk.setJyyq(rs.getString("jyyq"));
					yjfk.setLjxx(rs.getString("ljxx"));
					yjfk.setLxfs(rs.getString("lxfs"));
					yjfk.setTime(rs.getString("time"));
					yjfk.setXq(rs.getString("xq"));
					yjfk.setXw(rs.getString("xw"));
					yjfk.setYjr(rs.getString("yjr"));
					yjfklist.add(yjfk);
				}
			}
			if(c.getMoreResults()){
				rs=c.getResultSet();
				System.out.println("rs:"+rs.getString(1));
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/**
		 * 处理查询结果
		 * result = 0 存储过程执行成功。
		 * 返回json
		 */
		if(yjfklist.size()!=0){
			JSONObject json=new JSONObject();  
		    JSONArray jsonMembers = new JSONArray();  
		    json.put("allpage", allpage); 
		    if(yjfklist.size()!=0){
		    	for(YJFK yjfk : yjfklist){
		    		JSONObject  map2 = new JSONObject(); 
		    		map2.put("fs", yjfk.getFs());
			        map2.put("id",yjfk.getId() );
			        map2.put("jyyq",yjfk.getJyyq() );
			        map2.put("ljxx",yjfk.getLjxx() );
			        map2.put("lxfs",yjfk.getLxfs() );
			        map2.put("time",yjfk.getTime() );
			        map2.put("xq",yjfk.getXq() );
			        map2.put("xw",yjfk.getXw() );
			        map2.put("yjr",yjfk.getYjr() );

			        jsonMembers.add(map2);
		    	}
		    }
		    json.put("yjfklist", jsonMembers); 
		    return json.toString();
		}
		else{
			return "超出范围";
		}
		
	}
	
	
	public static YJFK YJFKyw(Connection con, String yjfkid) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		ResultSet rs = null;
		YJFK yjfk = null;
		String sql = "select * from yjfk where id=?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, yjfkid);
			rs = stmt.executeQuery();
			if(rs.next()){
				yjfk = new YJFK();
				yjfk.setFs(rs.getString("fs"));
				yjfk.setId(rs.getString("id"));
				yjfk.setJyyq(rs.getString("jyyq"));
				yjfk.setLjxx(rs.getString("ljxx"));
				yjfk.setLxfs(rs.getString("lxfs"));
				yjfk.setTime(rs.getString("time"));
				yjfk.setXq(rs.getString("xq"));
				yjfk.setXw(rs.getString("xw"));
				yjfk.setYjr(rs.getString("yjr"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return yjfk;
	}

	public static int YJFKdelete(Connection con, String id) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		String sql = "delete from yjfk where id=?";
		int rs = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return rs;
	}
}
