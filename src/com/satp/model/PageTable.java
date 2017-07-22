package com.satp.model;
import java.sql.*;
import java.util.ArrayList;

import com.satp.entity.Highcharts;
import com.satp.entity.Policy;


public class PageTable {
	 private static PreparedStatement pstm = null;
	 public static ArrayList<Policy> query(Connection con, String sql,int pageNo,int pageSize){ 
		 ArrayList<Policy>  policytaglist = new ArrayList<Policy>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              int rowCount; //��¼���� 
              int pageCount; //��ҳ�� 
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //ִ�в�ѯ 
              //ResultSetMetaData rmeta = rs.getMetaData();//�������ֶθ��� 
              //int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
              pageCount = (rowCount +pageSize-1)/pageSize; //������ҳ�� 
              if(pageNo> pageCount) 
            	  pageNo=pageCount; //�������ʾ��ҳ�� 
              if(pageCount >0){
            	  rs.absolute((pageNo-1)*pageSize+1); //����¼ָ�붨λ������ʾҳ�ĵ�һ����¼�� 
            	  int i = 0; 
            	  while(i<pageSize){ 
            			  Policy policytag = new Policy();
            			  policytag.setPname(rs.getString("pname"));  
            			  policytag.setPno(rs.getString("pno"));
            			  policytag.setPcategories(rs.getString("pcategories"));
            			  policytag.setPboundary(rs.getString("pBBxs"));
            			  policytag.setPoffice(rs.getString("poffice"));
            			  policytag.setPfield(rs.getString("field"));
            			  policytag.setpBBXS(rs.getString("pBBXS"));
            			  policytag.setPublishtime(rs.getString("publishtime"));
            			  policytag.setBreaktime(rs.getString("breaktime"));
            			  policytag.setApplytime(rs.getString("applytime"));
            			  policytag.setSxzt(rs.getInt("sxzt"));
            			  policytag.setZcid(rs.getString("zcid"));
            			  policytag.setPolciycontent("ZCNR");
            			  policytaglist.add(policytag);
            			  i++; 
	            	 rs.next();
	             }
            	  rs.close();
            	  stmt.close();
            	 
			} 
			
		 }
		 catch(Exception e){ 
			
		 }
		 return policytaglist;
	 } 
	 
	 
	 
	 public static int pagecounts(Connection con, String sql,int pageSize){ 
		 int rowCount; //��¼���� 
         int pageCount=0; //��ҳ�� 
		 try{
              if(con==null){
            	 
              } 
              if(sql==null){
            	  
              }
            
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //ִ�в�ѯ 
              ResultSetMetaData rmeta = rs.getMetaData();//�������ֶθ��� 
              int numColumns = rmeta.getColumnCount(); 
              rs.last(); 
              rowCount = rs.getRow(); 
            
              pageCount = (rowCount +pageSize-1)/pageSize; //������ҳ�� 
			
		 }
		 catch(Exception e){ 
			 
		 }
		 return pageCount;
	 }



	public static ArrayList<Highcharts> queryCount(Connection con, String sql,String cXZD) {
		// TODO Auto-generated method stub
		 ArrayList<Highcharts>  highchartslist = new ArrayList<Highcharts>();
		 try{
              if(con==null){
            	  
              } 
              if(sql==null){
            	 
              }
              Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
              ResultSet rs = stmt.executeQuery(sql); //ִ�в�ѯ 
             
        	  
              while(rs.next()){ 
            	  Highcharts highcharts=new Highcharts();            	            	
            	  highcharts.setName(rs.getString(cXZD)!=null?rs.getString(cXZD):"其他");
            	  highcharts.setNumber(rs.getInt("number"));
            	  highchartslist.add(highcharts);
	         }    	 
		} 
		 catch(Exception e){ 
			
		 }
		 return highchartslist;
	}



	public static Policy queryPolicy(Connection con, String sql) {
		// TODO Auto-generated method stub
		Policy policytag=new Policy();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql);
	        while(rs.next())
	        {
				  policytag.setPname(rs.getString("pname"));  
				  policytag.setBreaktime(rs.getString("breaktime"));
				  policytag.setApplytime(rs.getString("applytime"));
				  policytag.setPolciycontent(rs.getString("ZCNR"));
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return policytag;
	}
	public static boolean inserSql(Connection con,ArrayList<Policy> policys) throws SQLException{
		String sql1="delete from SEARCHRESULT";
		Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		stmt1.executeUpdate(sql1);
		String sql="insert into SEARCHRESULT(pno,pname,pcategories,pboundary,field,pBBXS,poffice,applytime,sxzt,breaktime,publishtime,ZCNR,zcid)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		for(Policy policy : policys)
		{
			pstm=con.prepareStatement(sql);
			pstm.setObject(1, policy.getPno());
			pstm.setObject(2, policy.getPname());
			pstm.setObject(3, policy.getPcategories());
			pstm.setObject(4, policy.getPboundary());
			pstm.setObject(5, policy.getPfield());
			pstm.setObject(6, policy.getpBBXS());
			pstm.setObject(7, policy.getPoffice());
			pstm.setObject(8, policy.getApplytime());
			pstm.setObject(9, policy.getSxzt());
			pstm.setObject(10, policy.getBreaktime());
			pstm.setObject(11, policy.getPublishtime());
			pstm.setObject(12, policy.getPolciycontent());
			pstm.setObject(13, policy.getZcid());
			pstm.executeUpdate(); // 执行查询操作

		}
		return false;
		
	}
}