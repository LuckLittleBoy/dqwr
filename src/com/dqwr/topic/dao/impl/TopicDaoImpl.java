package com.dqwr.topic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.topic.dao.TopicDao;
import com.dqwr.topic.entity.Topic;
import com.dqwr.topic.entity.Topic2;
import com.dqwr.topic.entity.TopicNews;
public class TopicDaoImpl implements TopicDao{
   PreparedStatement stmt=null;
   Statement stat=null;
   ResultSet rs=null;
   Connection conn=null;
   DataBaseDao db=new DataBaseDao();
	@Override
	public boolean addTopic(Connection conn, Topic topic) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="insert into TOPIC(topicname,publisher,time,link,picpath,display) values (?,?,?,?,?,?)";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, topic.getTopicname());
			stmt.setString(2, topic.getPublisher());
			stmt.setString(3, topic.getTime());
			stmt.setString(4, topic.getLink());
			stmt.setString(5, topic.getPicpath());
			stmt.setInt(6, topic.getDisplay());
			count=stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
   
	public String insertTopicnews(Connection conn,TopicNews topicnews) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "insert into TopicNews (TopicId,Title,Content,Publisher,Time) values(?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, topicnews.getTopicId());
			stmt.setString(2, topicnews.getTitle());
			stmt.setString(3, topicnews.getContent());
			stmt.setString(4, topicnews.getPublisher());
			stmt.setString(5, topicnews.getTime());
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
	
	public boolean editTopicnews(Connection conn,TopicNews topicnews) {
		// TODO Auto-generated method stub
		PreparedStatement stmt =null;
		int rs = 0;
		String sql = "update TopicNews set Title=?,Content=?,Publisher=?,Time=? where Id=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, topicnews.getTitle());
			stmt.setString(2, topicnews.getContent());
			stmt.setString(3, topicnews.getPublisher());
			stmt.setString(4, topicnews.getTime());
			stmt.setInt(5, topicnews.getId());
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
	
	public boolean addTopic2(Connection conn, Topic2 topic) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="insert into TOPIC2(topicname,publisher,time) values (?,?,?)";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, topic.getTopicname());
			stmt.setString(2, topic.getPublisher());
			stmt.setString(3, topic.getTime());
			count=stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean editTopic(Connection conn, Topic topic) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="update TOPIC set topicName=?,publisher=?,time=?,link=?,picpath=? where TopicId=?";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, topic.getTopicname());
			stmt.setString(2, topic.getPublisher());
			stmt.setString(3, topic.getTime());
			stmt.setString(4, topic.getLink());
			stmt.setString(5, topic.getPicpath());
			stmt.setInt(6, topic.getId());
			count=stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	public String selectTopicname(Connection con,int topicid){
		ResultSet rs=null;
		String topicname=null;
		String sql="select topicname from TOPIC2 where id=?";
		
		try{
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, topicid);
			rs=stmt.executeQuery();
			while(rs.next()){
				 topicname=rs.getString(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return topicname;
	}
	
	public int selectTopicId(Connection con,String allname){
		ResultSet rs=null;
		int id=0;
		String sql="select id from TOPIC2 where topicname=?";
		try{
			stmt=con.prepareStatement(sql);
			stmt.setString(1, allname);
			rs=stmt.executeQuery();
			while(rs.next()){
				 id=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return id;
	}
	
	public ResultSet selecttopic(Connection con){
		ResultSet rs=null;
		String sql="select topicname from TOPIC2 ";
		
		try{
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet selecttopictop5(Connection con){
		ResultSet rs=null;
		String sql="select top 5 topicname,id from TOPIC2 ";
		
		try{
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean editTopic2(Connection conn, Topic2 topic) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="update TOPIC2 set topicName=?,publisher=?,time=? where id=?";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, topic.getTopicname());
			stmt.setString(2, topic.getPublisher());
			stmt.setString(3, topic.getTime());
			stmt.setInt(4, topic.getId());
			count=stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean deleteTopic(Connection conn,int topicid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from TOPIC where TopicId='"+topicid+"'";
		try {
			stat=conn.createStatement();
			count=stat.executeUpdate(sql);
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
	
	public boolean deleteTopic2(Connection conn,int topicid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from TOPIC2 where id='"+topicid+"'";
		try {
			stat=conn.createStatement();
			count=stat.executeUpdate(sql);
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
	
	public boolean deleteTopicNewsAll(Connection conn,int topicid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from TopicNews where TopicId='"+topicid+"'";
		try {
			stat=conn.createStatement();
			count=stat.executeUpdate(sql);
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
	
	public boolean deleteTopicNews(Connection conn,int topicnewsid) {
		// TODO Auto-generated method stub
		int count=0;
		String sql="delete from TopicNews where Id='"+topicnewsid+"'";
		try {
			stat=conn.createStatement();
			count=stat.executeUpdate(sql);
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
	
	
	public ResultSet SelectTopicById(Connection con,int topicid){
		ResultSet rs=null;
		String sql="select * from TOPIC where TopicId=?";
		
		try{
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, topicid);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public ResultSet SelectTopicDisplay(Connection con){
		ResultSet rs=null;
		String sql="select * from TOPIC where display=1";
		
		try{
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet SelectTopicById2(Connection con,int topicid){
		ResultSet rs=null;
		String sql="select * from TOPIC2 where id=?";
		
		try{
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, topicid);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet SelectTopicNewsById(Connection con,int topicnewsid){
		ResultSet rs=null;
		String sql="select * from TopicNews where Id=?";
		
		try{
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, topicnewsid);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public  void ResetAll(Connection conn){
		int count=0;
		String sql="update Topic set display=?";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, 0);
			count=stmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("count--"+count);
	}
	public String insertTopicNews(Connection conn,TopicNews topicnews) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "insert into TopicNews (TopicId,Title,Content,Publisher,Time) values(?,?,?,?,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, topicnews.getTopicId());
			stmt.setString(2, topicnews.getTitle());
			stmt.setString(3, topicnews.getContent());
			stmt.setString(4, topicnews.getPublisher());
			stmt.setString(5, topicnews.getTime());
			count = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count==0){
			return "信息发布失败";
		}else{
			return "信息发布成功";
		}
	}
	
	public boolean SetDisplay(Connection conn,int topicid){
		ResetAll(conn);
		int count=0;
		String sql="update TOPIC set display=? where TopicId=?";
		try{
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, 1);
			stmt.setInt(2, topicid);
			count=stmt.executeUpdate();
		}catch(SQLException e){
		  e.printStackTrace();	
		}
		if(count>0){
			return true;
		}else{
			return false;
		}
	}
	//前台查看活动     lookTopicNews.jsp
	public ResultSet SelectLookTopicNewsById(Connection con,int topicnewsid){
		ResultSet rs=null;
		String sql="select * from TopicNews_View where Id=" + topicnewsid;
		try{
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println(sql);
		return rs;
	}


}
