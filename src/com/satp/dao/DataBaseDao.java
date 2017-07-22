package com.satp.dao;

import java.sql.*;

public class DataBaseDao {
	final private String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	final private String dbUrl="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=dqwr";
	final private String dbPwd="qby*%*!1713";
	final private String dbUser="sa";
	

	public DataBaseDao(){
		try {
			Class.forName(dbDriver);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}
	

	public Connection connection(){
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPwd);
			/*CallableStatement c=conn.prepareCall("{call tableView}");
			System.out.println("执行存储过程");
			c.execute(); */
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
