package com.dqwr.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;

public class JDBCUtil {
  public boolean insertEmp(String[] str){
	DataBaseDao db=new DataBaseDao();
	Connection conn=db.connection();
	int count=0;
	String sql="insert into emp(ProjectName,OrgaName,OrgaId,AskFund,CooperateOrga,Head,Field,GuideCode,OrgaParent,StopEndYear,IsEnterprise,PlanType,Department,ProjectId,Money) values('"+str[0]+"','"+str[1]+"','"+str[2]+"','"+str[3]+"','"+str[4]+"','"+str[5]+"','"+str[6]+"','"+str[7]+"','"+str[8]+"','"+str[9]+"','"+str[10]+"','"+str[11]+"','"+str[12]+"','"+str[13]+"','"+str[14]+"')";
	try{
		Statement statement=conn.createStatement();
		count=statement.executeUpdate(sql);
	}catch(SQLException e){
		e.printStackTrace();
	}
	if(count>0){
		return true;
	}else{
		return false;
	}
  }
}
