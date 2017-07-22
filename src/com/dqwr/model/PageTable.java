package com.dqwr.model;
import java.sql.*;
import java.util.ArrayList;

import beans.Emp;

import com.dqwr.entity.*;
import com.dqwr.expert.entity.Expert;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;
import com.dqwr.technology.entity.Case;
import com.dqwr.technology.entity.Technology;
import com.dqwr.topic.entity.Topic;
import com.dqwr.topic.entity.Topic2;
import com.dqwr.topic.entity.TopicNews;

public class PageTable {
	 public static ArrayList<Requirement> query(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            	   Requirement policytag = new Requirement();
					
					policytag.setOrgaId(rs.getString(2));
					policytag.setRequName(rs.getString(3));
					policytag.setFillTime(rs.getString(11));
					policytaglist.add(policytag);
					i++;  
	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			
		 }
		 return policytaglist;
	 } 
	 
	 public static ArrayList<Info> infoquery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Info>  infolist = new ArrayList<Info>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Info info = new Info();
              		  info.setInfoId(rs.getInt(1));
    					info.setTitle(rs.getString(2));
    					info.setCreatorId(rs.getString(6));
    					info.setAddDate(rs.getString(7));
    					infolist.add(info);
    					i++;  
    	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			
		 }
		 return infolist;
	 } 
	 
	 public static int pagecounts(Connection con, String sql,int pageSize){ 
		 ArrayList<Info>  policytaglist = new ArrayList<Info>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int pagecounts11(Connection con, String sql,int pageSize){ 
		 ArrayList<Emp>  policytaglist = new ArrayList<Emp>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int topicpagecounts(Connection con, String sql,int pageSize){ 
		 ArrayList<Topic>  topiclist = new ArrayList<Topic>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int topicpagecounts2(Connection con, String sql,int pageSize){ 
		 ArrayList<Topic2>  topiclist = new ArrayList<Topic2>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int topicnewspagecounts(Connection con, String sql,int pageSize){ 
		 ArrayList<TopicNews>  topicnewslist = new ArrayList<TopicNews>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static ArrayList<ZC> query(Connection con, String sql,int pageNo,int pageSize,String zfbrid){ 
		 ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		ZC policytag = new ZC();
					policytag.setBBBXS(rs.getString("bBBXS"));
					if(rs.getString("bBBXS")==null){
						policytag.setBBBXS("");
					}
				
					policytag.setBFZRQ(rs.getString("bFZRQ"));
					if(rs.getString("bFZRQ")==null){
						policytag.setBFZRQ("");
					}
					policytag.setBGBRQ(rs.getString("bGBRQ"));
					if(rs.getString("bGBRQ")==null){
						policytag.setBGBRQ("");
					}
					
					policytag.setBQQZC(rs.getString("bQQZC"));
					if(rs.getString("bQQZC")==null){
						policytag.setBQQZC("");
					}
					policytag.setBSWZC(rs.getString("bSWZC"));
					if(rs.getString("bSWZC")==null){
						policytag.setBSWZC("");
					}
					policytag.setBSXFW(rs.getString("bSXFW"));
					if(rs.getString("bSXFW")==null){
						policytag.setBSXFW("");
					}
					policytag.setBSXRQ(rs.getString("bSXRQ"));
					if(rs.getString("bSXRQ")==null){
						policytag.setBSXRQ("");
					}
					policytag.setBTGRQ(rs.getString("bTGRQ"));
					if(rs.getString("bTGRQ")==null){
						policytag.setBTGRQ("");
					}
					policytag.setBTTZLYB(rs.getString("bTTZLYB"));
					if(rs.getString("bTTZLYB")==null){
						policytag.setBTTZLYB("");
					}
					
					policytag.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						policytag.setBZCFL("");
					}
					policytag.setZCFLMC(rs.getString("ZCFLMC"));
					if(rs.getString("ZCFLMC")==null){
						policytag.setZCFLMC("");
					}
					policytag.setTTZLYMC(rs.getString("TTZLYMC"));
					if(rs.getString("TTZLYMC")==null){
						policytag.setTTZLYMC("");
					}
					policytag.setBZDJG(rs.getString("bZDJG"));
					if(rs.getString("bZDJG")==null){
						policytag.setBZDJG("");
					}
					
					policytag.setZCID(rs.getString("zCID"));
					if(rs.getString("zCID")==null){
						policytag.setZCID("");
					}
					policytag.setZCMC(rs.getString("zCMC"));
					if(rs.getString("zCMC")==null){
						policytag.setZCMC("");
					}
					policytag.setZFBRID(rs.getString("zFBRID"));
					if(rs.getString("zFBRID")==null){
						policytag.setZFBRID("");
					}
					policytag.setZCWH(rs.getString("zCWH"));
					if(rs.getString("zCWH")==null){
						policytag.setZCWH("");
					}
					policytag.setZSHRID(rs.getString("zSHRID"));
					if(rs.getString("zSHRID")==null){
						policytag.setZSHRID("");
					}
					policytag.setZSHZT(rs.getString("zSHZT"));
					if(rs.getString("zSHZT")==null){
						policytag.setZSHZT("");
					}
					policytag.setZSXZTW(rs.getString("zSXZTW"));
					if(rs.getString("zSXZTW")==null){
						policytag.setZSXZTW("");
					}
					policytag.setLasttime(rs.getString("ZLasttime"));
					if(rs.getString("ZLasttime")==null){
						policytag.setLasttime("");
					}
					
					policytaglist.add(policytag);
					i++; 
	            	 
	            	 rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			
		 }
		 return policytaglist;
	 } 
	 
	 public static ArrayList<Requirement> xdquery(Connection con, String sql,int pageNo,int pageSize,String pass){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Requirement policytag = new Requirement();
            		policytag.setRequId(rs.getInt(1));
  					policytag.setOrgaId(rs.getString(2));
  					policytag.setRequName(rs.getString(3));
  					policytag.setFillTime(rs.getString(11));
  					policytaglist.add(policytag);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return policytaglist;
	 } 
	 
	 public static ArrayList<Requirement> reqquery(Connection con, String sql,int pageNo,int pageSize,int pass){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              //System.out.println(pageCount);
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Requirement policytag = new Requirement();
            		policytag.setRequId(rs.getInt(1));
  					policytag.setOrgaId(rs.getString(2));
  					policytag.setRequName(rs.getString(3));
  					policytag.setFillTime(rs.getString(12));
  					policytaglist.add(policytag);
  					i++;
  					rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return policytaglist;
	 } 
	 
	 public static ArrayList<Requirement> xdquery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Requirement policytag = new Requirement();
            		policytag.setRequId(rs.getInt(1));
  					policytag.setOrgaId(rs.getString(2));
  					policytag.setRequName(rs.getString(3));
  					policytag.setFillTime(rs.getString(12));
  					policytaglist.add(policytag);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return policytaglist;
	 } 
	 
	 public static ArrayList<Info> publicinfoquery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Info>  infolist = new ArrayList<Info>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Info info = new Info();
            		info.setInfoId(rs.getInt(1));
  					info.setTitle(rs.getString(2));
  					info.setCreatorId(rs.getString(6));
  					info.setAddDate(rs.getString(7));
  					infolist.add(info);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return infolist;
	 }
	 
	 public static ArrayList<Info> publicinfoquery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Info>  infolist = new ArrayList<Info>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Info info = new Info();
            		info.setInfoId(rs.getInt(1));
  					info.setTitle(rs.getString(2));
  					info.setCreatorId(rs.getString(6));
  					info.setAddDate(rs.getString(7));
  					infolist.add(info);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return infolist;
	 } 
	 public static ArrayList<Orga> orgaquery(Connection con, String sql,int pageNo,int pageSize,int pass){ 
		 ArrayList<Orga>  orgalist = new ArrayList<Orga>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Orga orga = new Orga();
            		orga.setOrgaId(rs.getString(1));
            		orga.setOrgaName(rs.getString(2));
            		orga.setCel(rs.getString(8));
            		orga.setIndustryID(rs.getString(4));
  					orgalist.add(orga);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return orgalist;
	 } 
	 public static ArrayList<Technology> technologyquery(Connection con, String sql,int pageNo,int pageSize,int pass){ 
		 ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Technology tech = new Technology();
            		tech.setTechId(rs.getInt(1));
  					tech.setOrgaId(rs.getString(2));
  					tech.setTechName(rs.getString(3));
  					tech.setCaseNumber(rs.getInt(20));
  					tech.setFillTime(rs.getString(21));
  					technologylist.add(tech);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return technologylist;
	 } 
	 
	 public static ArrayList<Technology> technologyquery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Technology tech = new Technology();
            		tech.setTechId(rs.getInt(1));
            		tech.setOrgaId(rs.getString(2));
  					tech.setTechName(rs.getString(3));
  					tech.setFillTime(rs.getString(21));
  					
  					technologylist.add(tech);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return technologylist;
	 } 
	 public static ArrayList<Orga> orgaquery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Orga>  orgalist = new ArrayList<Orga>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数          
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow();             
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
				while (i < pageSize) {
					Orga orga = new Orga();
					orga.setOrgaId(rs.getString(1));
					orga.setOrgaName(rs.getString(2));
					orga.setCel(rs.getString(8));
					orga.setIndustryID(rs.getString(4));
					orgalist.add(orga);				
					i++;
					rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return orgalist;
	 } 
	 public static ArrayList<Expert> expertquery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Expert>  expertlist = new ArrayList<Expert>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
				while (i < pageSize) {
					Expert expert = new Expert();
					expert.setExpertID(rs.getInt(1));
					expert.setExpertName(rs.getString(2));
					expert.setTel(rs.getString(16));
					expert.setEngageSpec(rs.getString(9));					
					expertlist.add(expert);
					i++;
					rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return expertlist;
	 } 
	 public static ArrayList<Expert> expertquery(Connection con, String sql,int pageNo,int pageSize,int pass){ 
		 ArrayList<Expert>  expertlist = new ArrayList<Expert>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Expert expert = new Expert();
            		expert.setExpertID(rs.getInt(1));
  					expert.setExpertName(rs.getString(2));
  					expert.setOrgaName(rs.getString(10));
  					expert.setOrgaId(rs.getString(11));
  					expert.setEngageSpec(rs.getString(9));
  					expert.setDegree(rs.getString(7));
  					expert.setTel(rs.getString(16));  
  					expert.setJobTitle(rs.getString(14));
  					expert.setFirstfield(rs.getString(20));
  					expertlist.add(expert);  					
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return expertlist;
	 } 
	 
	 public static int pagecounts(Connection con, String sql,int pageSize,String pass){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int expertpagecounts(Connection con, String sql,int pageSize,int pass){ 
		 ArrayList<Expert>  policytaglist = new ArrayList<Expert>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 public static int techpagecounts(Connection con, String sql,int pageSize,int pass){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 public static int orgapagecounts(Connection con, String sql,int pageSize,int pass){ 
		 ArrayList<Orga>  policytaglist = new ArrayList<Orga>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 public static int reqpagecounts(Connection con, String sql,int pageSize,int pass){ 
		 ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数        
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 } 
	 
	 public static int infopagecounts(Connection con,String sql,int pageSize){ 
		 int rowCount; //记录总数 
         int pageCount=0; //总页数 
         System.out.println("sql"+sql);
         System.out.println("pageSize"+pageSize);
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
            
			
		 }
		 catch(Exception e){ 
			 
		 }
		 System.out.println("infopagecounts--"+pageCount);
		 return pageCount;
	 } 
	 public static ArrayList<Emp> ProjectQuery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Emp>  emplist = new ArrayList<Emp>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Emp emp = new Emp();
            		emp.setId(rs.getInt(1));
            		emp.setProjectName(rs.getString(2));
            		emp.setOrgaName(rs.getString(3));
            		emp.setOrgaId(rs.getString(4));
            		emp.setAskFund(rs.getString(5));
            		emp.setCooperateOrga(rs.getString(6));
            		emp.setHead(rs.getString(7));
            		emp.setField(rs.getString(8));
            		emp.setGuideCode(rs.getString(9));
            		emp.setOrgaParent(rs.getString(10));
            		emp.setStopEndYear(rs.getString(11));
            		emp.setIsEnterprise(rs.getString(12));
            		emp.setPlanType(rs.getString(13));
            		emp.setDepartment(rs.getString(14));
            		emp.setProjectId(rs.getString(15));
            		emp.setMoney(rs.getString(16));
            		emp.setDeclaration(rs.getString(17));
            		emp.setCommitments(rs.getString(18));
            		emp.setQuestionnaire(rs.getString(19));
            		emp.setAcceptance(rs.getString(20));
  					emplist.add(emp);
  					i++;  
  	            	rs.next();
	             }          	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return emplist;
	 }
	 
	 //典型案例
	 public static ArrayList<Case> casequery(Connection con, String sql,int pageNo,int pageSize,int pass){ 
		 ArrayList<Case>  caselist = new ArrayList<Case>();
		 try{
              if(con==null){            	  
              } 
              if(sql==null){            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){            		 
            		Case cases=new Case();
            		cases.setCaseId(rs.getInt(1));
            		cases.setTechId(rs.getInt(2));            		
            		cases.setFillTime(rs.getString(21));
  					caselist.add(cases);
  					i++;  
  	            	rs.next();
	             }
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return caselist;
	 } 
	 public static ArrayList<Case> casequery11(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Case>  caselist = new ArrayList<Case>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		  Case cases = new Case();
            		  cases.setCaseId(rs.getInt(1));
            		  cases.setTechId(rs.getInt(2));
            		  cases.setCaseName(rs.getString(3));
            		  cases.setFillTime(rs.getString(14));
  					  caselist.add(cases);
  					  i++;  
  	            	  rs.next();
	             }
            	  
            	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return caselist;
	 } 
	 public static ArrayList<Topic> TopicQuery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Topic>  topiclist = new ArrayList<Topic>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Topic topic=new Topic();
            		topic.setId(rs.getInt(1));
            		topic.setTopicname(rs.getString(2));
            		topic.setPublisher(rs.getString(3));
            		topic.setTime(rs.getString(4));
            		topic.setLink(rs.getString(5));
            		topic.setPicpath(rs.getString(6));
            		topic.setDisplay(rs.getInt(7));
  					topiclist.add(topic);
  					i++;  
  	            	rs.next();
	             }          	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return topiclist;
	 }   
	 
	 public static ArrayList<Topic2> TopicQuery2(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Topic2>  topiclist = new ArrayList<Topic2>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		Topic2 topic=new Topic2();
            		topic.setId(rs.getInt(1));
            		topic.setTopicname(rs.getString(2));
            		topic.setPublisher(rs.getString(3));
            		topic.setTime(rs.getString(4));
  					topiclist.add(topic);
  					i++;  
  	            	rs.next();
	             }          	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return topiclist;
	 }   
	 
	 public static ArrayList<TopicNews> TopicNewsQuery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<TopicNews>  topicnewslist = new ArrayList<TopicNews>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              
            
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
              if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		TopicNews topicnews=new TopicNews();
            		topicnews.setId(rs.getInt(1));
            		topicnews.setTopicId(rs.getInt(2));
            		topicnews.setTitle(rs.getString(3));
            		topicnews.setContent(rs.getString(4));
            		topicnews.setPublisher(rs.getString(5));
            		topicnews.setTime(rs.getString(6));
  					topicnewslist.add(topicnews);
  					i++;  
  	            	rs.next();
	             }          	 
			} 
			
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return topicnewslist;
	 } 
	 
	 //前台   专题活动   查找时   用的   TopicNews_View  视图   
   	 public static ArrayList<TopicNews> TopicNews_ViewQuery(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<TopicNews>  topicnewslist = new ArrayList<TopicNews>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //记录总数 
              int pageCount; //总页数 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //执行查询 
              ResultSetMetaData rmeta = rs.getMetaData();//获得数据字段个数 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
               pageCount = (rowCount +pageSize-1)/pageSize; //计算总页数 
               if(pageNo> pageCount) pageNo=pageCount; //调整待显示的页码 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //将记录指针定位到待显示页的第一条记录上 
            	  int i = 0; 
            	  while(i<pageSize){
            		TopicNews topicnews=new TopicNews();
            		topicnews.setId(rs.getInt(2));
            		topicnews.setTopicId(rs.getInt(1));
            		topicnews.setTitle(rs.getString(4));
            		topicnews.setContent(rs.getString(3));
            		topicnews.setPublisher(rs.getString(5));
            		topicnews.setTime(rs.getString(6));
            		topicnews.setToipcname(rs.getString(7));
  					topicnewslist.add(topicnews);
  					i++;  
  	            	rs.next();
	             }          	 
			} 
		 }
		 catch(Exception e){ 
			 System.out.println(e);
		 }
		 return topicnewslist;
	 } 
	
}
