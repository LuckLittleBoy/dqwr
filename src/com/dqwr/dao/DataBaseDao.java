package com.dqwr.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class DataBaseDao {
	final private String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	final private String dbUrl="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=dqwrtest";
	//final private String dbPwd="qby*%*!1713";
	final private String dbPwd="meng19950628";
	final private String dbUser="sa";
	

	public DataBaseDao(){
		try {
			Class.forName(dbDriver);
			
		} catch (ClassNotFoundException e) {
 			
			e.printStackTrace();
		}
	}
	

	public Connection connection(){
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPwd);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public void closeConnection(Connection con){
		if(con!=null)
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
}
