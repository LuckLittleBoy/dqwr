package com.dqwr.technology.dao.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.technology.dao.CaseDao;
import com.dqwr.technology.dao.TechnologyDao;
import com.dqwr.technology.entity.Case;
import com.dqwr.technology.entity.Technology;

public class CaseDaoImpl implements CaseDao {
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
   public CaseDaoImpl(){
	   DataBaseDao db=new DataBaseDao();
   }
	@Override
	public String insertInfo(Connection conn, Case cases) {
		int rs = 0;
		String sql = "insert into typical_case (TechId,CaseName,StartTime,Implement,Cooperation,Contact,Tel,CaseOverview,Effect,Benefit,Appraisal,EvidencePath01,FillTime) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cases.getTechId());
			stmt.setString(2, cases.getCaseName());
			stmt.setString(3, cases.getStartTime());
			stmt.setString(4, cases.getImplement());
			stmt.setString(5, cases.getCooperation());
			stmt.setString(6, cases.getContact());
			stmt.setString(7, cases.getTel());
			stmt.setString(8, cases.getCaseOverview());
			stmt.setString(9, cases.getEffect());
			stmt.setString(10, cases.getBenefit());
			stmt.setString(11, cases.getAppraisal());
			stmt.setString(12, cases.getEvidencePath01());
			stmt.setString(13, cases.getFillTime());
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
	
	public String updatecase(Connection conn, Case cases,int techid) {
		int rs = 0;
		if(cases.getEvidencePath01()!=""){
			String sql = "update typical_case set CaseName=?,StartTime=?,Implement=?,Cooperation=?,Contact=?,Tel=?,CaseOverview=?,Effect=?,Benefit=?,Appraisal=?,EvidencePath01=?,FillTime=? where TechId=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cases.getCaseName());
				stmt.setString(2, cases.getStartTime());
				stmt.setString(3, cases.getImplement());
				stmt.setString(4, cases.getCooperation());
				stmt.setString(5, cases.getContact());
				stmt.setString(6, cases.getTel());
				stmt.setString(7, cases.getCaseOverview());
				stmt.setString(8, cases.getEffect());
				stmt.setString(9, cases.getBenefit());
				stmt.setString(10, cases.getAppraisal());
				stmt.setString(11, cases.getEvidencePath01());
				stmt.setString(12, cases.getFillTime());
				stmt.setInt(13, techid);
				rs = stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			String sql = "update typical_case set CaseName=?,StartTime=?,Implement=?,Cooperation=?,Contact=?,Tel=?,CaseOverview=?,Effect=?,Benefit=?,Appraisal=?,FillTime=? where TechId=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cases.getCaseName());
				stmt.setString(2, cases.getStartTime());
				stmt.setString(3, cases.getImplement());
				stmt.setString(4, cases.getCooperation());
				stmt.setString(5, cases.getContact());
				stmt.setString(6, cases.getTel());
				stmt.setString(7, cases.getCaseOverview());
				stmt.setString(8, cases.getEffect());
				stmt.setString(9, cases.getBenefit());
				stmt.setString(10, cases.getAppraisal());
				stmt.setString(11, cases.getFillTime());
				stmt.setInt(12, techid);
				rs = stmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}	
		if(rs==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}
	//修改成熟技术中的典型案例
	public String updatecase1(Connection conn, Case cases,int techid) {
		int rs = 0;
		System.out.println(cases.getCaseId());
		if(cases.getEvidencePath01() != "" || cases.getEvidencePath01() != null || cases.getEvidencePath01() != "null"){
			String sql = "update typical_case set CaseName=?,StartTime=?,Implement=?,Cooperation=?,Contact=?,Tel=?,CaseOverview=?,Effect=?,Benefit=?,Appraisal=?,EvidencePath01=?,FillTime=? where CaseId=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cases.getCaseName());
				stmt.setString(2, cases.getStartTime());
				stmt.setString(3, cases.getImplement());
				stmt.setString(4, cases.getCooperation());
				stmt.setString(5, cases.getContact());
				stmt.setString(6, cases.getTel());
				stmt.setString(7, cases.getCaseOverview());
				stmt.setString(8, cases.getEffect());
				stmt.setString(9, cases.getBenefit());
				stmt.setString(10, cases.getAppraisal());
				stmt.setString(11, cases.getEvidencePath01());
				stmt.setString(12, cases.getFillTime());
				stmt.setInt(13, cases.getCaseId());
				rs = stmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			String sql = "update typical_case set CaseName=?,StartTime=?,Implement=?,Cooperation=?,Contact=?,Tel=?,CaseOverview=?,Effect=?,Benefit=?,Appraisal=?,FillTime=? where CaseId=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cases.getCaseName());
				stmt.setString(2, cases.getStartTime());
				stmt.setString(3, cases.getImplement());
				stmt.setString(4, cases.getCooperation());
				stmt.setString(5, cases.getContact());
				stmt.setString(6, cases.getTel());
				stmt.setString(7, cases.getCaseOverview());
				stmt.setString(8, cases.getEffect());
				stmt.setString(9, cases.getBenefit());
				stmt.setString(10, cases.getAppraisal());
				stmt.setString(11, cases.getFillTime());
				stmt.setInt(12, cases.getCaseId());
				rs = stmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}	
		if(rs==0){
			return "fail";
		}else{
			return "success";
		}
	}
	//不考虑上传文件之前的上传典型案例函数
	public String updatetechcase(Connection conn, Case cases, int techid) {
		    int rs = 0;
			String sql = "update typical_case set CaseName=?,StartTime=?,Implement=?,Cooperation=?,Contact=?,Tel=?,CaseOverview=?,Effect=?,Benefit=?,Appraisal=?,FillTime=? where CaseId=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cases.getCaseName());
				stmt.setString(2, cases.getStartTime());
				stmt.setString(3, cases.getImplement());
				stmt.setString(4, cases.getCooperation());
				stmt.setString(5, cases.getContact());
				stmt.setString(6, cases.getTel());
				stmt.setString(7, cases.getCaseOverview());
				stmt.setString(8, cases.getEffect());
				stmt.setString(9, cases.getBenefit());
				stmt.setString(10, cases.getAppraisal());
				stmt.setString(11, cases.getFillTime());
				stmt.setInt(12, cases.getCaseId());
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
	
	public boolean updatecasepath(Connection conn, String caseid,String newpath) {
	    int rs = 0;
		String sql = "update typical_case set EvidencePath01=? where CaseId=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, newpath);
			stmt.setString(2, caseid);
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
	
	@Override
	public boolean deleteCase(Connection conn,int techid) {
		// TODO Auto-generated method stub
		int count=0;
		deleteCaseUpload(conn,techid);
		String sql="delete from TYPICAL_CASE where TechId='"+techid+"'";
		try {
			sta=conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
 			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	public void deleteCaseUpload(Connection con,int techid){
		String loadFile=null;
		String[] path=null;
		String sql="select EvidencePath01 from typical_case where TechId=?";
		try{
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, techid);
			res=stmt.executeQuery();
			while(res.next()){
				loadFile=res.getString(1);
				System.out.println("loadFile--"+loadFile);
				path=loadFile.split(";");
				for(int i=0;i<path.length;i++){
					System.out.println("path--"+path[i]);
					File file=new File(path[i]);
					if(file.exists()){
						if(file.delete()){
							System.out.println("成功删除一个上传文件--"+path[i]);
						}
					}
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	@Override
	public String alterInfo(String InfoId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet selectInfoAll(Connection conn) {
		// TODO Auto-generated method stub
		String sql ="select top 10 * from TYPICAL_CASE ORDER BY TYPICAL_CASE.FillTime DESC";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
		return res;
	}
	public ResultSet selectCaseById1(Connection conn, int caseid) {
		// TODO Auto-generated method stub
		String sql ="select * from TYPICAL_CASE where CaseId='"+caseid+"'";
		try {
			sta = conn.createStatement();
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ResultSet selectCaseById(Connection conn, int techid) {
		// TODO Auto-generated method stub
		String sql ="select * from TYPICAL_CASE where TechId = " + techid;
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

	

}
