package com.dqwr.model;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import beans.Emp;

import com.dqwr.entity.*;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.entity.Requirement;
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;
import com.dqwr.topic.entity.Topic2;
import com.dqwr.topic.entity.TopicNews;

public class Topicmodel {
	
	public static ArrayList<Info> shenhePolicy(Connection con,int pageNo,int pageSize,String fbrid,String search){
		ArrayList<Info>  infolist = new ArrayList<Info>();
		
		
		String sql = "select * from MyByView where ZSHZT='待审核' ";
		
		return infolist;
	}
	public static int shenhepagecount(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		int pageCount=0;
	
		String sql = "select * from MyByView where ZSHZT='待审核' ";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}

		sql+=" order by  ZLastTime desc";
		
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		
		return pageCount;
	}

	/**
	 * 
	 * 方法说明：个人待审核
	 * 方法名：dshPolicy
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> dshPolicy(Connection con,int pageNo,int pageSize,String fbrid){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='待审核' order by  zlasttime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int dshpagecount(Connection con,int pageNo,int pageSize,String fbrid){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='待审核' order by  zlasttime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	
/**
 * 
 * 方法说明：退回
 * 方法名：dshPolicy
 * @param con
 * @param pageNo
 * @param pageSize
 * @param fbrid
 * @return 
 * 返回值：ArrayList<ZC>
 */
	
	
	/**
	 * 
	 * 方法说明：个人通过被的政策
	 * 方法名：tgPolicy
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @param fbrid
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> tgPolicy(Connection con,int pageNo,int pageSize,String fbrid){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='通过' order by  zlasttime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int tgpagecount(Connection con,int pageNo,int pageSize,String fbrid){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='通过' order by  zlasttime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}

	
	/**
	 * 
	 * 方法说明：待标引
	 * 方法名：dbyPolicy
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @param fbrid
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> dbyPolicy(Connection con,int pageNo,int pageSize,String fbrid){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='待标引' order by  zlasttime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int dbypagecount(Connection con,int pageNo,int pageSize,String fbrid){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='待标引' order by  zlasttime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	/**
	 * 
	 * 方法说明：删除政策
	 * 方法名：dlPolicy
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @param fbrid
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> dlPolicy(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();

		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and (ZSHZT='待标引' or ZSHZT='退回')";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}
		sql+=" order by  ZLastTime desc";
		
		
		
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int dlpagecount(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and (ZSHZT='待标引' or ZSHZT='退回')";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}
		sql+=" order by  ZLastTime desc";
		
		
		
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	
	/**
	 * 
	 * 方法说明：
	 * 方法名：我的政策
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 * 返回值：ArrayList<PolicyTag>
	 */
	
	public static ArrayList<ZC> myPolicy(Connection con,int pageNo,int pageSize,String fbrid){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' order by  zlasttime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int mypagecount(Connection con,int pageNo,int pageSize,String fbrid){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' order by  zlasttime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	/**
	 * 
	 * 方法说明：修订
	 * 方法名：xdPolicy
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @param fbrid
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> xdPolicy(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		

		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"'  and (sxtag=0 or QQtag=0 or SWTAG=0) and zshzt='通过'";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}
		
		sql+=" order by  ZLastTime desc";
		
		
		
		
		
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int xdpagecount(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		int pageCount=0;
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"'  and (sxtag=0 or QQtag=0 or SWTAG=0) and zshzt='通过'";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}

		sql+=" order by  ZLastTime desc";
		
		
		
		
		
		System.out.println(sql);
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	/**
	 * 所有政策的查询
	 */
	public static int syzcchPagecount(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		int pageCount=0;
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' ";
		if((find!=null)&&(!find.equals(""))){
			find=StringFilter(find);
			
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}
		if(shzt!=null&&!shzt.equals("")&&!shzt.equals("undefined")){
			sql+="and zshzt='"+shzt+"'";
		}
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}
	public static ArrayList<ZC> syzcchPolicy(Connection con,int pageNo,int pageSize,String fbrid,String search,String find,String sxzt,String timesearch,String startT,String endT,String shzt){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' ";
		if((find!=null)&&(!find.equals(""))){
		
			find=StringFilter(find);
			sql+=" and "+search+" like '%"+find+"%'";
		}
		if((sxzt!=null)&&(!sxzt.equals("2"))){
			sql+=" and zsxztw='"+sxzt+"'";
		}
		if((startT!=null)&&(endT!=null)){
			if((!startT.equals(""))||(!endT.equals("")))
			{
				if((!startT.equals(""))&&(!endT.equals("")))
				{
					sql+=" and "+timesearch+" between '"+startT+"' and '"+endT+"'";
				}
				
				else if(!startT.equals(""))
				{
					sql+=" and "+timesearch+" >= '"+startT+"'";
				}
				else if(!endT.equals(""))
				{
					sql+=" and "+timesearch+" <= '"+endT+"'";
				}
			}
		}
		if(shzt!=null&&!shzt.equals("")&&!shzt.equals("undefined")){
			sql+="and zshzt='"+shzt+"'";
		}
		sql+=" order by  ZLastTime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	
	public static String StringFilter(String   str)   throws   PatternSyntaxException   {      
		str=str.replace("[", "%");
		str=str.replace("]", "%");  
		str=str.replace(" ", "%");
		String regEx="[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";   
		Pattern   p   =   Pattern.compile(regEx);      
		Matcher   m   =   p.matcher(str);      
		
		return   m.replaceAll("%").trim();      
	}      
	
	
	/**
	 * 所有需要审核的修订
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @param fbrid
	 * @param search
	 * @param find
	 * @param sxzt
	 * @param timesearch
	 * @param startT
	 * @param endT
	 * @param shzt
	 * @return
	 */
	
	public static int public_infoPagecount(Connection con,int pageNo,int pageSize,String search,String find,int ispass){
		int pageCount=0;
		String sql = "select * from PUBLIC_PUBLISHINFO ";
		if(ispass==0){
			if((find!=null)&&(!find.equals(""))){
				
				find=StringFilter(find);
				sql+=" where IsPass=0 and "+search+" like '%"+find+"%'";
			}else{
				sql+=" where IsPass=0";
			}
		}else{
             if((find!=null)&&(!find.equals(""))){
				
				find=StringFilter(find);
				sql+=" where IsPass=1 and "+search+" like '%"+find+"%'";
			}else{
				sql+=" where IsPass=1";
			}
		}
		pageCount=PageTable.infopagecounts(con, sql, pageSize);
		System.out.println("public_infoPagecount--"+pageCount);
		return pageCount;
	}
	public static ArrayList<Info> public_info(Connection con,int pageNo,int pageSize,String search,String find,int ispass){
		ArrayList<Info>  infolist = new ArrayList<Info>();
		String sql = "select * from PUBLIC_PUBLISHINFO ";
		if(ispass==0){
			if((find!=null)&&(!find.equals(""))){
				
				//find=StringFilter(find);
				sql+=" where IsPass=0 and "+search+" like '%"+find+"%'";
			}else{
				sql+=" where IsPass=0";
			}
		}else{
             if((find!=null)&&(!find.equals(""))){
				
				//find=StringFilter(find);
				sql+=" where IsPass=1 and "+search+" like '%"+find+"%'";
			}else{
				sql+=" where IsPass=1";
			}
		}
		infolist = PageTable.publicinfoquery(con, sql, pageNo, pageSize);
		
		return infolist;
	}
	
	public static int infopage1(Connection con,int pageNo,int pageSize,int Type,int Scope){
		int pageCount=0;
		String sql = "select * from PUBLIC_PUBLISHINFO ";		
		if(Type==0)
		{
			sql+=" where Type=0 ";
//			if(search!=null&&context!=null){
//				sql+=" where Type=0 and "+search+" like '%"+context+"%'";
//			}else{
//				sql+=" where Type=0";
//			}
			
		}
		if(Type==1)
		{
			if(Scope==0)
			{
				sql+=" where Type=1 and Scope=0 ";
//				if(search!=null&&context!=null){
//				sql+=" where Type=1 and Scope=0 and "+search+" like '%"+context+"%'";
//				}else{
//				sql+="where Type=1 and Scope=0";
//				}
			}else if(Scope==1)
			{
				sql+=" where Type=1 and Scope=1 ";
//				if(search!=null&&context!=null){
//				sql+=" where Type=1 and Scope=1 and "+search+" like '%"+context+"%'";
//				}else{
//				sql+="where Type=1 and Scope=1";
//				}
			}	
		}
		pageCount=PageTable.pagecounts11(con, sql, pageSize);
		return pageCount;
	}
	
	public static int xdshPagecount12(Connection con,int pageNo,int pageSize,int Type,int Scope,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2){
		int pageCount=0;
		String sql = "select * from PUBLIC_PUBLISHINFO ";
		
		if(Type==0)
		{
			sql+=" where Type=0 ";
            if(num.equals("1")){
              sql+="and "+sType0+" like '%"+q0+"%' ";
            }
            if(num.equals("2")){
              if(logic1.equals("AND")){
            	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
              }
              if(logic1.equals("OR")){
            	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
              }
              if(logic1.equals("NOT")){
            	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
              }
            }
            if(num.equals("3")){
            	
            	if(logic2.equals("AND")){
            		if(logic1.equals("AND")){
                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                      }
            		if(logic1.equals("OR")){
                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                    }
                    if(logic1.equals("NOT")){
                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                    }
                  }
            	
                   if(logic2.equals("OR")){
                	  if(logic1.equals("AND")){
                      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                        }
              		if(logic1.equals("OR")){
                    	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                      }
                      if(logic1.equals("NOT")){
                    	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                      }
                  }
                   
                  if(logic2.equals("NOT")){
                	  
                	  if(logic1.equals("AND")){
                      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                        }
              		if(logic1.equals("OR")){
                    	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                      }
                      if(logic1.equals("NOT")){
                    	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                      }
                  }
                  
            }
		}else if(Type==1)
		{
			if(Scope==0)
			{
				sql+=" where Type=1 and Scope=0 ";
				   if(num.equals("1")){
	                  sql+="and "+sType0+" like '%"+q0+"%' ";
	                }
	                if(num.equals("2")){
	                  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	                  }
	                  if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	                  }
	                }
	                if(num.equals("3")){
	                	
	                	if(logic2.equals("AND")){
	                		if(logic1.equals("AND")){
	                        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
	                          }
	                		if(logic1.equals("OR")){
	                      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                        }
	                        if(logic1.equals("NOT")){
	                      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                        }
	                      }
	                	
	                       if(logic2.equals("OR")){
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
	                          }
	                      }
	                       
	                      if(logic2.equals("NOT")){
	                    	  
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                          }
	                      }
	                      
	                }
			}else if(Scope==1)
			{
				sql+=" where Type=1 and Scope=1 ";
				if(num.equals("1")){
	                  sql+="and "+sType0+" like '%"+q0+"%' ";
	                }
	                if(num.equals("2")){
	                  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	                  }
	                  if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	                  }
	                }
                       if(num.equals("3")){
	                	
	                	if(logic2.equals("AND")){
	                		if(logic1.equals("AND")){
	                        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
	                          }
	                		if(logic1.equals("OR")){
	                      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                        }
	                        if(logic1.equals("NOT")){
	                      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                        }
	                      }
	                	
	                       if(logic2.equals("OR")){
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
	                          }
	                      }
	                       
	                      if(logic2.equals("NOT")){
	                    	  
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                          }
	                      }
	                      
	                }
			}	
		}else{
			if(num.equals("1")){
	              sql+="where "+sType0+" like '%"+q0+"%' ";
	            }
	            if(num.equals("2")){
	              if(logic1.equals("AND")){
	            	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	              }
	              if(logic1.equals("OR")){
	            	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	              }
	              if(logic1.equals("NOT")){
	            	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	              }
	            }
	            if(num.equals("3")){
                	
                	if(logic2.equals("AND")){
                		if(logic1.equals("AND")){
                        	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                          }
                		if(logic1.equals("OR")){
                      	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                        }
                        if(logic1.equals("NOT")){
                      	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                        }
                      }
                	
                       if(logic2.equals("OR")){
                    	  if(logic1.equals("AND")){
                          	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                            }
                  		if(logic1.equals("OR")){
                        	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                          }
                          if(logic1.equals("NOT")){
                        	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                          }
                      }
                       
                      if(logic2.equals("NOT")){
                    	  
                    	  if(logic1.equals("AND")){
                          	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                            }
                  		if(logic1.equals("OR")){
                        	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                          }
                          if(logic1.equals("NOT")){
                        	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                          }
                      }
                      
                }
		}
		System.out.println(sql);
		pageCount=PageTable.pagecounts11(con, sql, pageSize);
		return pageCount;
	}
	
	public static ArrayList<Info> infolist1(Connection con,int pageNo,int pageSize,int Type,int Scope){
		ArrayList<Info>  infolist = new ArrayList<Info>();
		
		String sql = "select * from PUBLIC_PUBLISHINFO ";
		
			if(Type==0)
			{
				sql+=" where Type=0 ";
				
			}
			if(Type==1)
			{
				if(Scope==0)
				{
					sql+=" where Type=1 and Scope=0 ";
				}else if(Scope==1)
				{
					sql+=" where Type=1 and Scope=1 ";
				}	
			}
		infolist = PageTable.publicinfoquery11(con, sql, pageNo, pageSize);
		return infolist;
	}
	
	public static ArrayList<Info> xdshPolicy12(Connection con,int pageNo,int pageSize,int Type,int Scope,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
		ArrayList<Info>  infolist = new ArrayList<Info>();
		
		String sql = "select * from PUBLIC_PUBLISHINFO ";
		if(Type==0)
		{
			sql+=" where Type=0 ";
            if(num.equals("1")){
              sql+="and "+sType0+" like '%"+q0+"%' ";
            }
            if(num.equals("2")){
              if(logic1.equals("AND")){
            	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
              }
              if(logic1.equals("OR")){
            	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
              }
              if(logic1.equals("NOT")){
            	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
              }
            }
            if(num.equals("3")){
            	
            	if(logic2.equals("AND")){
            		if(logic1.equals("AND")){
                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                      }
            		if(logic1.equals("OR")){
                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                    }
                    if(logic1.equals("NOT")){
                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                    }
                  }
            	
                   if(logic2.equals("OR")){
                	  if(logic1.equals("AND")){
                      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                        }
              		if(logic1.equals("OR")){
                    	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                      }
                      if(logic1.equals("NOT")){
                    	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                      }
                  }
                   
                  if(logic2.equals("NOT")){
                	  
                	  if(logic1.equals("AND")){
                      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                        }
              		if(logic1.equals("OR")){
                    	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                      }
                      if(logic1.equals("NOT")){
                    	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                      }
                  }
                  
            }
		}else if(Type==1)
		{
			if(Scope==0)
			{
				sql+=" where Type=1 and Scope=0 ";
				   if(num.equals("1")){
	                  sql+="and "+sType0+" like '%"+q0+"%' ";
	                }
	                if(num.equals("2")){
	                  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	                  }
	                  if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	                  }
	                }
	                if(num.equals("3")){
	                	
	                	if(logic2.equals("AND")){
	                		if(logic1.equals("AND")){
	                        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
	                          }
	                		if(logic1.equals("OR")){
	                      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                        }
	                        if(logic1.equals("NOT")){
	                      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                        }
	                      }
	                	
	                       if(logic2.equals("OR")){
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
	                          }
	                      }
	                       
	                      if(logic2.equals("NOT")){
	                    	  
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                          }
	                      }
	                      
	                }
			}else if(Scope==1)
			{
				sql+=" where Type=1 and Scope=1 ";
				if(num.equals("1")){
	                  sql+="and "+sType0+" like '%"+q0+"%' ";
	                }
	                if(num.equals("2")){
	                  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	                  }
	                  if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	                  }
	                }
                       if(num.equals("3")){
	                	
	                	if(logic2.equals("AND")){
	                		if(logic1.equals("AND")){
	                        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
	                          }
	                		if(logic1.equals("OR")){
	                      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                        }
	                        if(logic1.equals("NOT")){
	                      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                        }
	                      }
	                	
	                       if(logic2.equals("OR")){
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
	                          }
	                      }
	                       
	                      if(logic2.equals("NOT")){
	                    	  
	                    	  if(logic1.equals("AND")){
	                          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
	                            }
	                  		if(logic1.equals("OR")){
	                        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
	                          }
	                          if(logic1.equals("NOT")){
	                        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
	                          }
	                      }
	                      
	                }
			}	
		}else{
			if(num.equals("1")){
	              sql+="where "+sType0+" like '%"+q0+"%' ";
	            }
	            if(num.equals("2")){
	              if(logic1.equals("AND")){
	            	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
	              }
	              if(logic1.equals("OR")){
	            	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
	              }
	              if(logic1.equals("NOT")){
	            	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
	              }
	            }
	            if(num.equals("3")){
                	
                	if(logic2.equals("AND")){
                		if(logic1.equals("AND")){
                        	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                          }
                		if(logic1.equals("OR")){
                      	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                        }
                        if(logic1.equals("NOT")){
                      	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                        }
                      }
                	
                       if(logic2.equals("OR")){
                    	  if(logic1.equals("AND")){
                          	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                            }
                  		if(logic1.equals("OR")){
                        	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                          }
                          if(logic1.equals("NOT")){
                        	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                          }
                      }
                       
                      if(logic2.equals("NOT")){
                    	  
                    	  if(logic1.equals("AND")){
                          	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                            }
                  		if(logic1.equals("OR")){
                        	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                          }
                          if(logic1.equals("NOT")){
                        	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                          }
                      }
                      
                }
		}
		infolist = PageTable.publicinfoquery11(con, sql, pageNo, pageSize);
		return infolist;
	}
	
	
	
	public static int topicPagecount(Connection con,int pageNo,int pageSize,String search,String find){
		int pageCount=0;
		String sql = "select * from TOPIC ";
		if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
			
		}
		pageCount=PageTable.topicpagecounts(con, sql, pageSize);
		return pageCount;
	}
	
	public static int topicPagecount2(Connection con,int pageNo,int pageSize,String search,String find){
		int pageCount=0;
		String sql = "select * from TOPIC2 ";
		if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
			
		}
		pageCount=PageTable.topicpagecounts2(con, sql, pageSize);
		return pageCount;
	}
	
	public static int topicnewsPagecount(Connection con,int pageNo,int pageSize,String search,String allname,String find){
		int pageCount=0;
		String sql = "select * from TopicNews ";
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		if(search.equals("topicname")){
			int id=topicimpl.selectTopicId(con,allname);
			sql+=" where TopicId='"+id+"'";
		}else{
		if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
			
		}
		}
		pageCount=PageTable.topicpagecounts(con, sql, pageSize);
		return pageCount;
	}
	
	public static ArrayList<Topic> topicList(Connection con,int pageNo,int pageSize,String search,String find){
		ArrayList<Topic>  topiclist = new ArrayList<Topic>();
		String sql = "select * from TOPIC ";
		if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
			
		}
		topiclist = PageTable.TopicQuery(con, sql, pageNo, pageSize);
		return topiclist;
	}
	
	public static ArrayList<Topic2> topicList2(Connection con,int pageNo,int pageSize,String search,String find){
		ArrayList<Topic2>  topiclist = new ArrayList<Topic2>();
		String sql = "select * from TOPIC2 ";
		if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
			
		}
		topiclist = PageTable.TopicQuery2(con, sql, pageNo, pageSize);
		return topiclist;
	}
	
	public static ArrayList<TopicNews> topicnewsList(Connection con,int pageNo,int pageSize,String search,String allname,String find){
		ArrayList<TopicNews>  topicnewslist = new ArrayList<TopicNews>();
		TopicDaoImpl topicimpl=new TopicDaoImpl();
		String sql = "select * from TopicNews ";
		if(search.equals("topicname")){
			int id=topicimpl.selectTopicId(con,allname);
			sql+=" where TopicId='"+id+"'";
		}else{
		 if(find!=null){
			sql+=" where "+search+" like '%"+find+"%'";
		}else{
	
		}
		}
		topicnewslist = PageTable.TopicNewsQuery(con, sql, pageNo, pageSize);
		return topicnewslist;
	}
	
	
	//专题活动
	public static int topicnewspage1(Connection con,int pageNo,int pageSize){
		int pageCount=0;
		String sql = "select * from TopicNews_View";
	
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	public static ArrayList<TopicNews> topicnewslist1(Connection con,int pageNo,int pageSize){
		ArrayList<TopicNews>  topiclist = new ArrayList<TopicNews>();
		
		String sql = "select * from TopicNews_View";
		topiclist = PageTable.TopicNews_ViewQuery(con, sql, pageNo, pageSize);
		return topiclist;
	}
	

public static int topicnewspage2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2){
	
	try
	{
		q0 =  java.net.URLDecoder.decode(q0,"utf-8");
	} 
	catch (UnsupportedEncodingException e)
	{
		e.printStackTrace();
	}
	
	int pageCount=0;
    String sql = "select * from TopicNews_View ";
	
	if(num.equals("1")){
        sql+="where "+sType0+" like '%"+q0+"%' ";
      }
      if(num.equals("2")){
        if(logic1.equals("AND")){
      	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
        }
        if(logic1.equals("OR")){
      	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
        }
        if(logic1.equals("NOT")){
      	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
        }
      }
      if(num.equals("3")){
      	if(logic2.equals("AND")){
      		if(logic1.equals("AND")){
              	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                }
      		if(logic1.equals("OR")){
            	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
              }
              if(logic1.equals("NOT")){
            	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
              }
            }
             if(logic2.equals("OR")){
          	  if(logic1.equals("AND")){
                	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                }
                if(logic1.equals("NOT")){
              	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                }
            }
            if(logic2.equals("NOT")){
          	  
          	  if(logic1.equals("AND")){
                	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                }
                if(logic1.equals("NOT")){
              	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                }
            }   
      }
      System.out.println("topicnewspage2    "+sql);
	pageCount=PageTable.pagecounts(con, sql, pageSize);
	return pageCount;
}
public static ArrayList<TopicNews> topicnewslist2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
	ArrayList<TopicNews>  topiclist = new ArrayList<TopicNews>();
	try
	{
		q0 =  java.net.URLDecoder.decode(q0,"utf-8");
	} 
	catch (UnsupportedEncodingException e)
	{
		e.printStackTrace();
	}
	String sql = "select * from TopicNews_View ";
	if(num.equals("1")){
        sql+="where "+sType0+" like '%"+q0+"%' ";
      }
      if(num.equals("2")){
        if(logic1.equals("AND")){
      	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%'";  
        }
        if(logic1.equals("OR")){
      	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%')";  
        }
        if(logic1.equals("NOT")){
      	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"; 
        }
      }
      if(num.equals("3")){
      	if(logic2.equals("AND")){
      		if(logic1.equals("AND")){
              	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ";  
                }
      		if(logic1.equals("OR")){
            	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
              }
              if(logic1.equals("NOT")){
            	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
              }
            }
             if(logic2.equals("OR")){
          	  if(logic1.equals("AND")){
                	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' )";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%')";  
                }
                if(logic1.equals("NOT")){
              	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' "; 
                }
            }
            if(logic2.equals("NOT")){
          	  
          	  if(logic1.equals("AND")){
                	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%'";  
                }
                if(logic1.equals("NOT")){
              	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%'"; 
                }
            }   
      }
      System.out.println("topicnewslist2    "+sql);
      topiclist = PageTable.TopicNews_ViewQuery(con, sql, pageNo, pageSize);
	  return topiclist;
}

	
}
