package com.dqwr.requirement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 



import com.dqwr.dao.DataBaseDao;
import com.dqwr.requirement.dao1.OrgaDao;
import com.dqwr.requirement.dao1.RequireDao;
import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;

public class OrgaDaoImpl implements OrgaDao {
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public OrgaDaoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public ResultSet selectOrgaById(Connection conn, int OrgaId) {
		// TODO Auto-generated method stub
		String sql ="select * from PUBLIC_ORGA where OrgaId='"+OrgaId+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public ResultSet selectOrgaById(Connection conn, String OrgaId) {
		// TODO Auto-generated method stub
		String sql ="select * from PUBLIC_ORGA where OrgaId='"+OrgaId+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	//前台插入用户信息时的insert语句
	public String insertOrga11(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "insert into PUBLIC_ORGA(OrgaId,OrgaName,OrgaParentId,IndustryID,LegalPerson,Contacts,Tel,Cel,Address,Email,Web,NatureID,OtherNature,Introduction,Username) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaId());
			stmt.setString(2, orga.getOrgaName());
			//System.out.println(orga.getOrgaParentId());
			stmt.setString(3, orga.getOrgaParentId());			
			stmt.setString(4, orga.getIndustryID());
			stmt.setString(5, orga.getLegalPerson());
			stmt.setString(6, orga.getContacts());
			stmt.setString(7, orga.getTel());
			stmt.setString(8, orga.getCel());
			stmt.setString(9, orga.getAddress());
			stmt.setString(10, orga.getEmail());
			stmt.setString(11, orga.getWeb());
			stmt.setBytes(12, orga.getNatureID());
			stmt.setString(13, orga.getOtherNature());
			stmt.setString(14, orga.getIntroduction());
			stmt.setString(15, orga.getUsername());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "fail";
		}else{
			return "success";
		}
	}
	//后台插入不含用户信息的insert语句
	public String insertOrga(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "insert into PUBLIC_ORGA(OrgaId,OrgaName,OrgaParentId,IndustryID,LegalPerson,Contacts,Tel,Cel,Address,Email,Web,NatureID,OtherNature,Introduction) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaId());
			stmt.setString(2, orga.getOrgaName());
			//System.out.println(orga.getOrgaParentId());
			stmt.setString(3, orga.getOrgaParentId());
			
			stmt.setString(4, orga.getIndustryID());
			stmt.setString(5, orga.getLegalPerson());
			stmt.setString(6, orga.getContacts());
			stmt.setString(7, orga.getTel());
			stmt.setString(8, orga.getCel());
			stmt.setString(9, orga.getAddress());
			stmt.setString(10, orga.getEmail());
			stmt.setString(11, orga.getWeb());
			stmt.setBytes(12, orga.getNatureID());
			stmt.setString(13, orga.getOtherNature());
			stmt.setString(14, orga.getIntroduction());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "fail";
		}else{
			return "success";
		}
	}

	public boolean editOrga(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "update PUBLIC_ORGA set OrgaName=?,OrgaParentId=?,IndustryID=?,LegalPerson=?,Contacts=?,Tel=?,Cel=?,Address=?,Email=?,Web=?,NatureID=?,OtherNature=?,Introduction=?,Username=? where OrgaId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaName());
			stmt.setString(2, orga.getOrgaParentId());
			stmt.setString(3, orga.getIndustryID());
			stmt.setString(4, orga.getLegalPerson());
			stmt.setString(5, orga.getContacts());
			stmt.setString(6, orga.getTel());
			stmt.setString(7, orga.getCel());
			stmt.setString(8, orga.getAddress());
			stmt.setString(9, orga.getEmail());
			stmt.setString(10, orga.getWeb());
			stmt.setBytes(11, orga.getNatureID());
			stmt.setString(12, orga.getOtherNature());
			stmt.setString(13, orga.getIntroduction());
			stmt.setString(14, orga.getUsername());
			stmt.setString(15, orga.getOrgaId());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return false;
		}else{
			return true;
		}
	}
	
	public boolean edittechOrga(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "update PUBLIC_ORGA set OrgaName=?,LegalPerson=?,Contacts=?,Tel=?,Cel=?,Address=?,Email=?,NatureID=?,OtherNature=?,Introduction=? where OrgaId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaName());
			stmt.setString(2, orga.getLegalPerson());
			stmt.setString(3, orga.getContacts());
			stmt.setString(4, orga.getTel());
			stmt.setString(5, orga.getCel());
			stmt.setString(6, orga.getAddress());
			stmt.setString(7, orga.getEmail());
			stmt.setBytes(8, orga.getNatureID());
			stmt.setString(9, orga.getOtherNature());
			stmt.setString(10, orga.getIntroduction());
			stmt.setString(11, orga.getOrgaId());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return false;
		}else{
			return true;
		}
	}
	public String insertOrga1(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		PreparedStatement stmt=null;
		int rs = 0;
		String sql = "insert into PUBLIC_ORGA(OrgaId,OrgaName,LegalPerson,Contacts,Tel,Cel,Address,Email,NatureID,OtherNature,Introduction) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaId());
			stmt.setString(2, orga.getOrgaName());
			
			stmt.setString(3, orga.getLegalPerson());
			stmt.setString(4, orga.getContacts());
			stmt.setString(5, orga.getTel());
			stmt.setString(6, orga.getCel());
			stmt.setString(7, orga.getAddress());
			stmt.setString(8, orga.getEmail());
			
			stmt.setBytes(9, orga.getNatureID());
			stmt.setString(10, orga.getOtherNature());
			stmt.setString(11, orga.getIntroduction());
			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}
	//插入成熟技术信息
	public String insertOrga111(Connection conn,Orga orga) {
		// TODO Auto-generated method stub
		PreparedStatement stmt=null;
		int rs = 0;
		String sql = "insert into PUBLIC_ORGA(OrgaId,OrgaName,LegalPerson,Contacts,Tel,Cel,Address,Email,NatureID,OtherNature,Introduction,Username) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, orga.getOrgaId());
			stmt.setString(2, orga.getOrgaName());			
			stmt.setString(3, orga.getLegalPerson());
			stmt.setString(4, orga.getContacts());
			stmt.setString(5, orga.getTel());
			stmt.setString(6, orga.getCel());
			stmt.setString(7, orga.getAddress());
			stmt.setString(8, orga.getEmail());			
			stmt.setBytes(9, orga.getNatureID());
			stmt.setString(10, orga.getOtherNature());
			stmt.setString(11, orga.getIntroduction());
			stmt.setString(12, orga.getUsername());

			rs = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}
	@Override
	public ResultSet SelectOrgaById(Connection conn,String OrgaId) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String sql ="select * from public_orga where OrgaId='"+OrgaId+"'";
				System.out.println(sql);
				try {
					sta = conn.createStatement();
					res=sta.executeQuery(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return res;
			}
	
	public boolean IfOrgaidExist(Connection conn,String OrgaId){
		   String sql ="select * from public_orga where OrgaId='"+OrgaId+"'";
		   boolean flag=false;
				try {
					sta = conn.createStatement();
					res=sta.executeQuery(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					if(res.next()){
						flag=true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return flag;
			}
	
	     public ResultSet AllOrga(Connection conn) {
			String sql ="select top 8 * from PUBLIC_ORGA";
			try {
				sta = conn.createStatement();
				res=sta.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;
	}
}
	
