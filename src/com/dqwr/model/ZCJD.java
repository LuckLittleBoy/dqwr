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

import com.dqwr.entity.ZCJDEntity;

public class ZCJD {
	/**
	 * 政策解读录入
	 * @param con
	 * @param format
	 * @param title
	 * @param yhid
	 * @param content
	 * @return
	 */
	public static String ZCJDluru(Connection con, String format, String title,
			String yhid, String content) {
		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "insert into zcjdb (jdcontent,title,whos,times) values(?,?,?,?)";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setString(2, title);
			stmt.setString(3, yhid);
			stmt.setString(4, format);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "政策解读发布失败";
		}else{
			return "政策解读发布成功";
		}
		// TODO Auto-generated method stub
	}
	public static String ZCJDUpdate(Connection con, String title, String jdid,
			 String content) {
		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "update zcjdb set title=?,jdcontent=? where id=?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, jdid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "更新失败";
		}else{
			return "更新成功";
		}
		// TODO Auto-generated method stub
	}
	/**
	 * 所有政策解读浏览，分页处理
	 * @param con
	 * @param pagesize
	 * @param currentpage
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "null" })
	public static String ZCJDLL(Connection con ,String pagesize ,String currentpage){
		String sql = "select * from zcjdb";
		String call = "{call Fenye (?,?,?)}";
		String result = "";
		String allpage = "";
		
		List<ZCJDEntity> zcjdlist = new ArrayList<ZCJDEntity>();
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
					ZCJDEntity zcjd = new ZCJDEntity();
					zcjd.setJdcontent(rs.getString("jdcontent"));
					zcjd.setJdid(rs.getString("id"));
					zcjd.setJdtimes(rs.getString("times"));
					zcjd.setJdtitle(rs.getString("title"));
					zcjd.setJdwhos(rs.getString("whos"));
					zcjd.setClick(rs.getString("click"));
					zcjdlist.add(zcjd);
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
		if(zcjdlist.size()!=0){
			JSONObject json=new JSONObject();  
		    JSONArray jsonMembers = new JSONArray();  
		    json.put("allpage", allpage); 
		    if(zcjdlist.size()!=0){
		    	for(ZCJDEntity zcjd : zcjdlist){
		    		JSONObject  map2 = new JSONObject(); 
		    		map2.put("jdcontent", zcjd.getJdcontent());
			        map2.put("jdid",zcjd.getJdid() );
			        map2.put("jdtimes",zcjd.getJdtimes() );
			        map2.put("jdtitle", zcjd.getJdtitle());
			        map2.put("jdwhos", zcjd.getJdwhos());
			        map2.put("click", zcjd.getClick());
			        
			        jsonMembers.add(map2);
		    	}
		    }
		    json.put("zcjdlist", jsonMembers); 
		    return json.toString();
		}
		else{
			return "超出范围";
		}
		
	}
	/**
	 * 查找政策解读原文
	 * @param con
	 * @param jdid
	 * @return
	 */
	public static ZCJDEntity ZCJDyw(Connection con, String jdid) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		ResultSet rs = null;
		ZCJDEntity zcjd = null;
		String sql = "select * from zcjdb where id=?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, jdid);
			rs = stmt.executeQuery();
			if(rs.next()){
				zcjd = new ZCJDEntity();
				zcjd.setJdcontent(rs.getString("jdcontent"));
				zcjd.setJdid(rs.getString("id"));
				zcjd.setJdtimes(rs.getString("times"));
				zcjd.setJdtitle(rs.getString("title"));
				zcjd.setJdwhos(rs.getString("whos"));
				zcjd.setClick(rs.getString("click"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zcjd;
	}
	/**
	 * 删除政策解读  通过id
	 * @param con
	 * @param jdid
	 * @return
	 */
	public static int ZCJDdelete(Connection con, String jdid) {
		PreparedStatement stmt =null;
		String sql = "delete from zcjdb where id=?";
		int rs = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, jdid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return rs;
	}
	@SuppressWarnings("unchecked")
	public static String ZCJDLL(Connection con, String pagesize,
			String currentpage, String searchnr) {
		// TODO Auto-generated method stub
		String sql = "select * from zcjdb where title like '%"+searchnr+"%'";
		String call = "{call Fenye (?,?,?)}";
		String result = "";
		String allpage = "";
		
		List<ZCJDEntity> zcjdlist = new ArrayList<ZCJDEntity>();
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
					ZCJDEntity zcjd = new ZCJDEntity();
					zcjd.setJdcontent(rs.getString("jdcontent"));
					zcjd.setJdid(rs.getString("id"));
					zcjd.setJdtimes(rs.getString("times"));
					zcjd.setJdtitle(rs.getString("title"));
					zcjd.setJdwhos(rs.getString("whos"));
					zcjd.setClick(rs.getString("click"));
					zcjdlist.add(zcjd);
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
		if(zcjdlist.size()!=0){
			JSONObject json=new JSONObject();  
		    JSONArray jsonMembers = new JSONArray();  
		    json.put("allpage", allpage); 
		    if(zcjdlist.size()!=0){
		    	for(ZCJDEntity zcjd : zcjdlist){
		    		JSONObject  map2 = new JSONObject(); 
		    		map2.put("jdcontent", zcjd.getJdcontent());
			        map2.put("jdid",zcjd.getJdid() );
			        map2.put("jdtimes",zcjd.getJdtimes() );
			        map2.put("jdtitle", zcjd.getJdtitle());
			        map2.put("jdwhos", zcjd.getJdwhos());
			        map2.put("click", zcjd.getClick());
			        
			        jsonMembers.add(map2);
		    	}
		    }
		    json.put("zcjdlist", jsonMembers); 
		    return json.toString();
		}
		else{
			return "超出范围";
		}
		
	}
	public static int ZCJDcount(Connection con, String jdid,int count) {
		PreparedStatement stmt =null;
		String sql = "update zcjdb set click=?  where id=?";
		int rs = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, count);
			stmt.setString(2, jdid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return rs;
	}
}
