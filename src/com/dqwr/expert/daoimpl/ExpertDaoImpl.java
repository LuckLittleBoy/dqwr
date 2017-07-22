package com.dqwr.expert.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.expert.dao.ExpertDao;
import com.dqwr.expert.entity.Expert;

public class ExpertDaoImpl implements ExpertDao{
	public PreparedStatement stmt=null;
	public Statement sta=null;
	public ResultSet res=null;
	public ExpertDaoImpl(){
		DataBaseDao db=new DataBaseDao();
	}
	@Override
	public String insertExpert(Connection conn, Expert expert) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "insert into expertinfo (ExpertName,Sex,Birthday,IDCard,Educational,Degree,StudySpec,EngageSpec,OrgaName,OrgaId,Area,Position,JobTitle,Address,Tel,Mobile,Email,ZipCode,Firstfield,FirstOtherfield,Secondfield,SecondOtherfield,Thirdfield,ThirdOtherfield,Overview,Pluralism,Honor,XSSH,JSSH,Reject) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, expert.getExpertName());
			stmt.setInt(2, expert.getSex());
			stmt.setString(3, expert.getBirthday());
			stmt.setString(4, expert.getIDCard());
			stmt.setString(5, expert.getEducational());
			stmt.setString(6, expert.getDegree());
			stmt.setString(7, expert.getStudySpec());
			stmt.setString(8, expert.getEngageSpec());
			stmt.setString(9, expert.getOrgaName());
			stmt.setString(10, expert.getOrgaId());
			stmt.setString(11, expert.getArea());
			stmt.setString(12, expert.getPosition());
			stmt.setString(13, expert.getJobTitle());
			stmt.setString(14, expert.getAddress());
			stmt.setString(15, expert.getTel());
			stmt.setString(16, expert.getMobile());
			stmt.setString(17, expert.getEmail());
			stmt.setString(18, expert.getZipCode());
			stmt.setString(19, expert.getFirstfield());
			stmt.setString(20, expert.getFirstOtherfield());
			stmt.setString(21, expert.getSecondfield());
			stmt.setString(22, expert.getSecondOtherfield());
			stmt.setString(23, expert.getThirdfield());
			stmt.setString(24, expert.getThirdOtherfield());
			stmt.setString(25, expert.getOverview());
			stmt.setString(26, expert.getPluralism());
			stmt.setString(27, expert.getHonor());
			stmt.setInt(28,expert.getXSSH());
			stmt.setInt(29,expert.getJSSH());
			stmt.setInt(30, expert.getReject());
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
  
	public String updateExpert(Connection conn, Expert expert,String expertid) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "update expertinfo set ExpertName=?,Sex=?,Birthday=?,IDCard=?,Educational=?,Degree=?,StudySpec=?,EngageSpec=?,OrgaName=?,OrgaId=?,Area=?,Position=?,JobTitle=?,Address=?,Tel=?,Mobile=?,Email=?,ZipCode=?,Firstfield=?,FirstOtherfield=?,Secondfield=?,SecondOtherfield=?,Thirdfield=?,ThirdOtherfield=?,Overview=?,Pluralism=?,Honor=? where ExpertID=?";
		try {
			stmt =conn.prepareStatement(sql);
			stmt.setString(1, expert.getExpertName());
			stmt.setInt(2, expert.getSex());
			stmt.setString(3, expert.getBirthday());
			stmt.setString(4, expert.getIDCard());
			stmt.setString(5, expert.getEducational());
			stmt.setString(6, expert.getDegree());
			stmt.setString(7, expert.getStudySpec());
			stmt.setString(8, expert.getEngageSpec());
			stmt.setString(9, expert.getOrgaName());
			stmt.setString(10, expert.getOrgaId());
			stmt.setString(11, expert.getArea());
			stmt.setString(12, expert.getPosition());
			stmt.setString(13, expert.getJobTitle());
			stmt.setString(14, expert.getAddress());
			stmt.setString(15, expert.getTel());
			stmt.setString(16, expert.getMobile());
			stmt.setString(17, expert.getEmail());
			stmt.setString(18, expert.getZipCode());
			stmt.setString(19, expert.getFirstfield());
			stmt.setString(20, expert.getFirstOtherfield());
			stmt.setString(21, expert.getSecondfield());
			stmt.setString(22, expert.getSecondOtherfield());
			stmt.setString(23, expert.getThirdfield());
			stmt.setString(24, expert.getThirdOtherfield());
			stmt.setString(25, expert.getOverview());
			stmt.setString(26, expert.getPluralism());
			stmt.setString(27, expert.getHonor());
			stmt.setInt(28,Integer.parseInt(expertid));
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
	
	@Override
	public boolean deleteExpert(Connection conn,int ExpertId) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from expertinfo where ExpertID='"+ExpertId+"'";
		try {
			sta=conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public String alterExpert(String ExpertId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet selectExpertAll(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet selectExpertById(Connection conn, int expertId) {
		// TODO Auto-generated method stub
		System.out.println(expertId);
		String sql ="select * from expertinfo where ExpertID='"+expertId+"'";
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
	
	public boolean shenheExpert(Connection conn, int expertid, int ispass,
			String yjnr,String SH) {
		// TODO Auto-generated method stub
		int count=0;
		String sql = null;
		if(ispass==1){
			if(SH.equals("0")){
				sql="update expertinfo set XSSH='"+ispass+"' where ExpertID='"+expertid+"'";	
			}else if(SH.equals("1")){
				sql="update expertinfo set JSSH='"+ispass+"' where ExpertID='"+expertid+"'";
			}
			
		}else{
			if(SH.equals("0")){
			    sql="update expertinfo set XSSH='"+ispass+"',XSSHYJ='"+yjnr+"',Reject='1' where ExpertID='"+expertid+"'";
			}else if(SH.equals("1")){
			    sql="update expertinfo set JSSH='"+ispass+"',JSSHYJ='"+yjnr+"',Reject='1' where ExpertID='"+expertid+"'";
			}
	
		}
		try {
			sta = conn.createStatement();
			count=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
		
	}
	
	
	public ResultSet AllExpert(Connection conn) {
		String sql ="select top 8 * from EXPERTINFO where JSSH = 1";
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
