package com.dqwr.history;

import java.util.Date;

import com.dqwr.db.Sqlcon;

public class AddLogUnity {
	public static void add(String type,String user,String thing){
		try{
			String sql="insert into  log values('"+type+"','"+user+"','"+thing+"','"+(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"')";
			System.out.println(sql);
 			Sqlcon.executeUpdate(sql);					
 		}
 		catch(Exception e){
 		}
		Sqlcon.close();
	}
}
