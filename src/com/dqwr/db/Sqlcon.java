/**
 * 系统项目名称: CRMIS
 * 所在包：admin.login
 * 文件名称：Test.java
 * 建立时间：2013-5-26-下午6:49:59
 * 创建人：蔡金贝
 * 修改人：
 * 修改时间：
 * 修改备注：
 * 版本信息：@version 1.0.0
 * Copyright (c)-石家庄铁道大学-版权所有
 */
package com.dqwr.db;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 ************类说明**************
 * 类名：Sqlcon
 * 建类时间：2013-5-26 下午7:00:48
 * 类描述：数据库连接类
 */

public class Sqlcon {
	private static String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=dqwrtest";
	private static Connection connection=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	private static String user="sa";
	//private static String password="qby*%*!1713";
	private static String password="meng19950628";
	private static void init(){
		try {
			Class.forName(JDriver);
			System.out.println("数据库驱动加载成功");
		} catch (ClassNotFoundException e) {
			System.out.println("数据库驱动加载失败");
			//e.printStackTrace();
		}
		try {
			connection=DriverManager.getConnection(url,user,password);
			System.out.println("数据库连接成功");
		} catch (SQLException e) {
			System.out.println("数据库连接失败");
			//e.printStackTrace();
		}
		try {
			stmt=connection.createStatement();
			System.out.println("获取执行对象成功");
		} catch (SQLException e) {
			System.out.println("获取执行对象失败");
			//e.printStackTrace();
		}
		
	}
	

	/**
	 * 方法说明：
	 * 方法名：close 
	 * 返回值：void
	*/
	public static void close(){
		try {
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(connection!=null)
				connection.close();
			System.out.println("关闭成功");
		} catch (SQLException e) {
			System.out.println("关闭失败");
			e.printStackTrace();
		}
	}
	
	/**
	 * 方法说明：
	 * 方法名：executeQuery
	 * @param sql
	 * @return 
	 * 返回值：ResultSet
	*/
	public static ResultSet executeQuery(String sql){
			init();
			try {
				rs=stmt.executeQuery(sql);
				System.out.println("查询成功");
			} catch (SQLException e) {
				System.out.println("查询失败");
				e.printStackTrace();
			}
			return rs;
		}

	/**
	 * 方法说明：用于执行删除、增加、修改
	 * 方法名：executeUpdate
	 * @param sql
	 * @return 
	 * 返回值：int
	*/
	public static int executeUpdate(String sql){
		int result=0;
		init();
		try {
			result=stmt.executeUpdate(sql);
			System.out.println("删改增成功");
		} catch (SQLException e) {
			System.out.println("删改增失败");
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 方法说明：备份数据库
	 * 方法名：backup
	 * @return 
	 * 返回值：int
	*/
	public static int backup(String pathx){
		int result=0;
		init();
		try {
			String path = new String(pathx);	
//			File   f1 = new File(path);
			boolean flag = (new File(path)).delete();
			System.out.println(flag);
			result=stmt.executeUpdate("backup database dqwr to disk='"+pathx+"' ");
			System.out.println("数据库备份成功");
		} catch (SQLException e) {
			System.out.println("数据库备份失败");
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
	/**
	 * 方法说明：还原数据库,//RESTORE 无法处理数据库 'dqwr'，因为它正由此会话使用。建议在执行此操作时使用 master 数据库。
	 * 方法名：getBak
	 * @return 
	 * 返回值：int
	*/
	//RESTORE 无法处理数据库 'dqwr'，因为它正由此会话使用。建议在执行此操作时使用 master 数据库。
	//所以不能还原当前数据库，只能借助master来还原dqwr
	public static int getBak(){
		int result=0;
		url="jdbc:sqlserver://10.1.0.243:1433;DatabaseName=master";
		init();
		try 
		{
			//with resplace 强制还原
		
			result=stmt.executeUpdate("ALTER DATABASE dqwr SET OFFLINE WITH ROLLBACK IMMEDIATE");
			result=stmt.executeUpdate("restore database dqwr from disk='C:\\dqwr.dat' WITH REPLACE  ");
			System.out.println("数据库还原成功");
		} catch (SQLException e) {
			System.out.println("数据库还原失败");
			e.printStackTrace();
		}
		url="jdbc:sqlserver://10.1.0.243:1433;DatabaseName=dqwr";
		System.out.println(result);
		return result;
	}
		
	}
