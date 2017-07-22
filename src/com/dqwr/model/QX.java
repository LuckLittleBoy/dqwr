package com.dqwr.model;

import java.sql.*;
import java.util.*;

import com.dqwr.entity.*;
/**
 * 
 ************类说明**************
 * 类名：QX
 * 建类时间：2014-1-25 下午11:09:01
 * 类描述：权限类
 */
public class QX {
	public static List<CDGJD> getTreeI(Connection con,String rolesid){

		List<CDGJD> cd1list= new ArrayList<CDGJD>();
		List<CD> cdlist = new ArrayList<CD>();
		String sql="select CDID,CDNC,CDJB,CURL from yhcdqxView where yhID=? order by CDJB";
		
		PreparedStatement stmt =null;
		ResultSet rs = null;
		try {
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, rolesid);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				CD cd = new CD();
				cd.setCdid(rs.getString("cdid"));
				cd.setCdjb(rs.getString("cdjb"));
				cd.setCdnc(rs.getString("cdnc"));
				cd.setCurl(rs.getString("CURL"));

				cdlist.add(cd);
			}
			int tag = -1;
			
			
			
			
			
			
			
			for(CD cd:cdlist){
				
				
				if(tag==cd.getCdjb().indexOf(".")){//批一个.，找出根，创建根
					CDGJD cd1 = new CDGJD();
					cd1.setCdid(cd.getCdid());
					cd1.setCdjb(cd.getCdjb());
					cd1.setCdnc(cd.getCdnc());
					cd1.setUrl(cd.getCurl());
					List<CD21> CD21list = new ArrayList<CD21>();
					List<CD> cd22list = new ArrayList<CD>();
					for(CD cdx2:cdlist){
							if(!cdx2.getCdjb().equals(cd1.getCdjb())){
								if(tag==cdx2.getCdjb().indexOf(":") && tag!=cdx2.getCdjb().indexOf(".")){
								if(cd1.getCdjb().equals(cdx2.getCdjb().substring(0, cdx2.getCdjb().indexOf(".")))){//L21
									
									CD21 CD21 = new CD21();
									CD21.setCdid(cdx2.getCdid());
									CD21.setCdjb(cdx2.getCdjb());
									CD21.setCdnc(cdx2.getCdnc());
									List<CD> cd3list = new ArrayList<CD>();
									
									
									for(CD cdx3:cdlist){//为3级菜单

								
									if(tag!=cdx3.getCdjb().indexOf(":"))//L21判断是否为2级菜单是否有子菜单，如果有则执行下面的步骤
										if(cdx2.getCdjb().equals(cdx3.getCdjb().substring(0, cdx3.getCdjb().indexOf(":")))){
											
											CD cd3 = new CD();
											cd3.setCdid(cdx3.getCdid());
											cd3.setCdjb(cdx3.getCdjb());
											cd3.setCdnc(cdx3.getCdnc());
											cd3.setCurl(cdx3.getCurl());
											cd3list.add(cd3);
										}
									}
									CD21.setCd3(cd3list);
									CD21list.add(CD21);
								}
								
								}else if (tag!=cdx2.getCdjb().indexOf(":") && tag!=cdx2.getCdjb().indexOf(".")){//如果没有则执行下面步骤。l22
									if(cd1.getCdjb().equals(cdx2.getCdjb().substring(0, cdx2.getCdjb().indexOf("."))) 
											&& tag!=cdx2.getCdjb().indexOf("0")){
										CD cd22 = new CD();
										cd22.setCdid(cdx2.getCdid());
										cd22.setCdjb(cdx2.getCdjb());
										cd22.setCdnc(cdx2.getCdnc());
										cd22.setCurl(cdx2.getCurl());
										cd22list.add(cd22);
									}
									
								}
							}

						}
					cd1.setCd21(CD21list);
					cd1.setCd22(cd22list);
					cd1list.add(cd1);
				}
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cd1list;
	}
	
	
	public static List<CDGJD> allCD(Connection con){//所有菜单的方法。
		List<CDGJD> cd1list= new ArrayList<CDGJD>();
		List<CD> cdlist = new ArrayList<CD>();
		String sql="select CDID,CDNC,CDJB,CURL from CDView ";
		
		PreparedStatement stmt =null;
		ResultSet rs = null;
		try {
			
			stmt = con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				CD cd = new CD();
				cd.setCdid(rs.getString("cdid"));
				cd.setCdjb(rs.getString("cdjb"));
				cd.setCdnc(rs.getString("cdnc"));
				cd.setCurl(rs.getString("CURL"));
				cdlist.add(cd);
			}
			int tag = -1;

			for(CD cd:cdlist){
				if(tag==cd.getCdjb().indexOf(".")){
					CDGJD cd1 = new CDGJD();
					cd1.setCdid(cd.getCdid());
					cd1.setCdnc(cd.getCdnc());
					cd1.setCdjb(cd.getCdjb());
					cd1.setUrl(cd.getCurl());
					List<CD21> CD21list = new ArrayList<CD21>();
					List<CD> cd22list = new ArrayList<CD>();
					for(CD cdx2:cdlist){
							if(!cdx2.getCdjb().equals(cd1.getCdjb())){
								if(tag==cdx2.getCdjb().indexOf(":") && tag!=cdx2.getCdjb().indexOf(".")){
								if(cd1.getCdjb().equals(cdx2.getCdjb().substring(0, cdx2.getCdjb().indexOf(".")))){//L21
									
									CD21 CD21 = new CD21();
									CD21.setCdid(cdx2.getCdid());
									CD21.setCdjb(cdx2.getCdjb());
									CD21.setCdnc(cdx2.getCdnc());
									List<CD> cd3list = new ArrayList<CD>();
									
									
									for(CD cdx3:cdlist){//l3

								
									if(tag!=cdx3.getCdjb().indexOf(":"))
										if(cdx2.getCdjb().equals(cdx3.getCdjb().substring(0, cdx3.getCdjb().indexOf(":")))){
											
											CD cd3 = new CD();
											cd3.setCdid(cdx3.getCdid());
											cd3.setCdjb(cdx3.getCdjb());
											cd3.setCdnc(cdx3.getCdnc());
											cd3.setCurl(cdx3.getCurl());
											cd3list.add(cd3);
											}
									}
									CD21.setCd3(cd3list);
									CD21list.add(CD21);
								}
								
								}else if (tag!=cdx2.getCdjb().indexOf(":") && tag!=cdx2.getCdjb().indexOf(".")){//l22
									if(cd1.getCdjb().equals(cdx2.getCdjb().substring(0, cdx2.getCdjb().indexOf("."))) 
											&& tag!=cdx2.getCdjb().indexOf("0")){
										CD cd22 = new CD();
										cd22.setCdid(cdx2.getCdid());
										cd22.setCdjb(cdx2.getCdjb());
										cd22.setCdnc(cdx2.getCdnc());
										cd22.setCurl(cdx2.getCurl());
										cd22list.add(cd22);
									}
									
								}
							}

						}
					cd1.setCd21(CD21list);
					cd1.setCd22(cd22list);
					cd1list.add(cd1);
				}
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cd1list;
	}
	/**
	 * 下面都是权限的管理
	 * 方法说明：添加权限
	 * 方法名：addQX
	 * @param con
	 * @param qxbid
	 * @param rolesid
	 * @return 
	 * 返回值：int
	 */

	public static int addQX(Connection con,String qjsid,String qcdid){
		String sql = "INSERT INTO qxb(qjsid,qcdid) VALUES(?,?)";

		PreparedStatement stmt = null;
		int rs=0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, qjsid);
			stmt.setString(2, qcdid);
			rs=stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	/**
	 * 待修改
	 * 方法说明：删除权限
	 * 方法名：deleteQX
	 * @param con
	 * @param rolesid
	 * @return 
	 * 返回值：int
	 */
	public static int deleteQX(Connection con,String rolesid){
		String sql = "DELETE FROM qxb where rolesid=?";
		PreparedStatement stmt = null;
		int rs = 0 ;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, rolesid);
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	
	public static ArrayList<YH> searchwbuser(Connection con,String username){
		String sql = "select * from wbyh where username like '%"+username+"%'";
		ArrayList<YH> yhlist = new ArrayList<YH>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(sql);
			
			rs=stmt.executeQuery();
			while(rs.next()){
				YH people = new YH();
				people.setUsername(rs.getString("username"));
				people.setName(rs.getString("name"));
				people.setYJSID(rs.getString("jsid"));
				people.setId(rs.getString("id"));
				people.setGzdw(rs.getString("gzdw"));
				people.setSzhy(rs.getString("szhy"));
				people.setSj(rs.getString("sj"));
				people.setYx(rs.getString("yx"));
				yhlist.add(people);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return yhlist;
	}
	
	public static int upwbyhjb(Connection con,String change,String yhid){
		String sql = "update  wbyh set jsid=? where id=?";
		PreparedStatement stmt = null;
		int rs = 0;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, change);
			stmt.setString(2, yhid);
			rs=stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
}
