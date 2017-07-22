package com.dqwr.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import com.dqwr.entity.*;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.entity.Requirement;
import com.dqwr.technology.entity.Technology;

public class Technologymodel {
	/**
	 * 
	 * 方法说明：
	 * 方法名：没审核
	 * @param con
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 * 返回值：ArrayList<PolicyTag>
	 */
	
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
	public static ArrayList<ZC> thPolicy(Connection con,int pageNo,int pageSize,String fbrid){
		ArrayList<ZC>  policytaglist = new ArrayList<ZC>();
		
		
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='退回' order by  zlasttime desc";
		policytaglist = PageTable.query(con, sql, pageNo, pageSize,fbrid);
		
		return policytaglist;
	}
	public static int thpagecount(Connection con,int pageNo,int pageSize,String fbrid){
		int pageCount=0;
	
		String sql = "select * from MyByView where zfbrid='"+fbrid+"' and ZSHZT='退回' order by  zlasttime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize,fbrid);
		
		return pageCount;
	}


	
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
	
	public static int xdshPagecount(Connection con,int pageNo,int pageSize,int pass,String search,String find){
		int pageCount=0;
		String sql = "select * from TECHNOLOGY ";
		switch(pass){
		case 1:
			sql+=" where XSSH=0 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				sql="select * from TECHNOLOGY where XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 2:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 3:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 4:
			sql+=" where XSSH=1 and JSSH=1 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 5:
			sql+=" where Reject=1 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Reject=1 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		}
		pageCount=PageTable.techpagecounts(con, sql, pageSize,pass);
		return pageCount;
	}
	//前台成熟技术退回列表
	public static int xdshPagecount1(Connection con,int pageNo,int pageSize,int pass,String search,String find,String username){
		int pageCount=0;
		String sql = "select * from TECHNOLOGY where Username like '%"+username+"%'";
		switch(pass){
		case 1:
			sql+=" and XSSH=0 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 2:
			sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 3:
			sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 4:
			sql+=" and XSSH=1 and JSSH=1 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 5:
			sql+=" and Reject=1 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and Reject=1 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		}
		pageCount=PageTable.techpagecounts(con, sql, pageSize,pass);
		return pageCount;
	}
	public static ArrayList<Technology> xdshPolicy(Connection con,int pageNo,int pageSize,int pass,String search,String find){
		ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		
		String sql = "select * from TECHNOLOGY";
		switch(pass){
		case 1:
			sql+=" where XSSH=0 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				sql="select * from TECHNOLOGY where XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 2:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 3:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 4:
			sql+=" where XSSH=1 and JSSH=1 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 5:
			sql+=" where Reject=1 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Reject=1 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		}
		technologylist = PageTable.technologyquery(con, sql, pageNo, pageSize,pass);
		
		return technologylist;
	}
	//前台成熟技术退回
	public static ArrayList<Technology> xdshPolicy1(Connection con,int pageNo,int pageSize,int pass,String search,String find){
		ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		
		String sql = "select * from TECHNOLOGY";
		switch(pass){
		case 1:
			sql+=" where XSSH=0 and JSSH=0 and Reject=0";
			if((find!=null)&&(!find.equals(""))){
				sql+=" and "+search+" like '%"+find+"%'"+"ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 2:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0";
			if((find!=null)&&(!find.equals(""))){
				sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 3:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0";
			if((find!=null)&&(!find.equals(""))){
				sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 4:
			sql+=" where XSSH=1 and JSSH=1 and Reject=0";
			if((find!=null)&&(!find.equals(""))){
				sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 5:
			sql+=" where Reject=1";
			if((find!=null)&&(!find.equals(""))){
				sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		}
		technologylist = PageTable.technologyquery(con, sql, pageNo, pageSize,pass);
		
		return technologylist;
	}
	
	//前台成熟技术退回列表2
	public static ArrayList<Technology> xdshPolicy1(Connection con,int pageNo,int pageSize,int pass,String search,String find,String username ){
		ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		
		String sql = "select * from TECHNOLOGY where Username like '%"+username+"%'";
		switch(pass){
		case 1:
			sql+=" and XSSH=0 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
			}
			break;
		case 2:
			sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 3:
			sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 4:
			sql+=" and XSSH=1 and JSSH=1 and Reject=0 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		case 5:
			sql+=" and Reject=1 ORDER BY TECHNOLOGY.FillTime DESC";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY TECHNOLOGY.FillTime DESC ";*/
				sql="select * from TECHNOLOGY where Username like '%"+username+"%' and Reject=1 and "+search+" like '%"+find+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			}
			break;
		}
		technologylist = PageTable.technologyquery(con, sql, pageNo, pageSize,pass);
		
		return technologylist;
	}
	
	//成熟技术列表2
	public static int techpage(Connection con,int pageNo,int pageSize){
		int pageCount=0;
		String sql = "select * from TECHNOLOGY ORDER BY TECHNOLOGY.FillTime DESC ";

		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	//成熟技术列表1
	public static ArrayList<Technology> techlist(Connection con,int pageNo,int pageSize){
		ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		
		String sql = "select * from TECHNOLOGY ORDER BY TECHNOLOGY.FillTime DESC ";
		
		technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
		
		return technologylist;
	}
	//创新要素+找技术列表1
		public static ArrayList<Technology> techlistcx(Connection con,int pageNo,int pageSize){
			ArrayList<Technology>  technologylist = new ArrayList<Technology>();
			
			String sql = "select * from TECHNOLOGY where JSSH ='True' ORDER BY TECHNOLOGY.FillTime DESC ";
			
			technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
			
			return technologylist;
		}
	//创新要素+找技术列表1
		public static int techpagecx(Connection con,int pageNo,int pageSize){
			int pageCount=0;
			String sql = "select * from TECHNOLOGY where JSSH ='True' ORDER BY TECHNOLOGY.FillTime DESC ";

			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
		}
	//成熟技术前台已征集列表1
			public static ArrayList<Technology> techlist11(Connection con,int pageNo,int pageSize,String username){
				ArrayList<Technology>  technologylist = new ArrayList<Technology>();
				
				String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' and JSSH ='True' ORDER BY TECHNOLOGY.FillTime DESC ";
				
				technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
				
				return technologylist;
			}
			public static int techpage11(Connection con,int pageNo,int pageSize,String username){
				int pageCount=0;
	 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' and JSSH ='True' ORDER BY TECHNOLOGY.FillTime DESC ";

				pageCount=PageTable.pagecounts(con, sql, pageSize);
				return pageCount;
			}
			//成熟技术前台列表2
			public static ArrayList<Technology> techlist211(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username ){
				ArrayList<Technology>  technologylist = new ArrayList<Technology>();
	 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' and JSSH ='True' ";
		
	/*			String sql = "select * from TECHNOLOGY ";ORDER BY TECHNOLOGY.FillTime DESC 
	*/			if(num.equals("1")){
		            sql+="and "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
		          }
		          if(num.equals("2")){
		            if(logic1.equals("AND")){
		          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		            }
		            if(logic1.equals("OR")){
		          	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		            }
		            if(logic1.equals("NOT")){
		          	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		            }
		          }
		          if(num.equals("3")){
		          	
		          	if(logic2.equals("AND")){
		          		if(logic1.equals("AND")){
		                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		          		if(logic1.equals("OR")){
		                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		                  }
		                  if(logic1.equals("NOT")){
		                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                  }
		                }
		          	
		                 if(logic2.equals("OR")){
		              	  if(logic1.equals("AND")){
		                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
		                      }
		            		if(logic1.equals("OR")){
		                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		                    if(logic1.equals("NOT")){
		                  	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                    }
		                }
		                 
		                if(logic2.equals("NOT")){
		              	  
		              	  if(logic1.equals("AND")){
		                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                      }
		            		if(logic1.equals("OR")){
		                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		                    if(logic1.equals("NOT")){
		                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                    }
		                }   
		          }
				
				technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
				
				return technologylist;
			}	
		 //
			public static int techpage211(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username ){
				int pageCount=0;
	 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' and JSSH ='True' ";
			
				if(num.equals("1")){
		            sql+="and "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC";
		          }
		          if(num.equals("2")){
		            if(logic1.equals("AND")){
		          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		            }
		            if(logic1.equals("OR")){
		          	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		            }
		            if(logic1.equals("NOT")){
		          	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		            }
		          }
		          if(num.equals("3")){
		          	
		          	if(logic2.equals("AND")){
		          		if(logic1.equals("AND")){
		                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		          		if(logic1.equals("OR")){
		                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		                  }
		                  if(logic1.equals("NOT")){
		                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                  }
		                }
		          	
		                 if(logic2.equals("OR")){
		              	  if(logic1.equals("AND")){
		                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
		                      }
		            		if(logic1.equals("OR")){
		                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		                    if(logic1.equals("NOT")){
		                  	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                    }
		                }
		                 
		                if(logic2.equals("NOT")){
		              	  
		              	  if(logic1.equals("AND")){
		                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                      }
		            		if(logic1.equals("OR")){
		                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
		                    }
		                    if(logic1.equals("NOT")){
		                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
		                    }
		                }   
		          }
				
				pageCount=PageTable.pagecounts(con, sql, pageSize);
				return pageCount;
			}
/*已征集部分结束*/
	//成熟技术前台已发布列表1
		public static ArrayList<Technology> techlist1(Connection con,int pageNo,int pageSize,String username){
			ArrayList<Technology>  technologylist = new ArrayList<Technology>();
			
			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
			
			technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
			
			return technologylist;
		}
		//成熟技术前台列表2
		public static int techpage1(Connection con,int pageNo,int pageSize,String username){
			int pageCount=0;
 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' ORDER BY TECHNOLOGY.FillTime DESC ";

			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
		}
	public static int techpage2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
		int pageCount=0;
		String sql = "select * from TECHNOLOGY  ";/* ORDER BY TECHNOLOGY.FillTime DESC*/
	
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
		
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	//创新要素找技术列表techpage2
	public static int techpagecx(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
		int pageCount=0;
		String sql = "select * from TECHNOLOGY where JSSH ='True' ";/* ORDER BY TECHNOLOGY.FillTime DESC*/
	
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
		
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	//创新要素找技术列表 2 
		public static ArrayList<Technology> techlistcx(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
			ArrayList<Technology>  technologylist = new ArrayList<Technology>();
			
			String sql = "select * from TECHNOLOGY where JSSH ='True' ";/*ORDER BY TECHNOLOGY.FillTime DESC */
			if(num.equals("1")){
	            sql+="and "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC";
	          }
	          if(num.equals("2")){
	            if(logic1.equals("AND")){
	          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("OR")){
	          	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("NOT")){
	          	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	            }
	          }
	          if(num.equals("3")){
	          	
	          	if(logic2.equals("AND")){
	          		if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                  }
	                }
	          	
	                 if(logic2.equals("OR")){
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC "; 
	                    }
	                }
	                 
	                if(logic2.equals("NOT")){
	              	  
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC ";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                    }
	                }   
	          }
			
			technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
			
			return technologylist;
		}	
	//成熟技术列表3
	public static ArrayList<Technology> techlist2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
		ArrayList<Technology>  technologylist = new ArrayList<Technology>();
		
		String sql = "select * from TECHNOLOGY  ";/*ORDER BY TECHNOLOGY.FillTime DESC */
		if(num.equals("1")){
            sql+="where "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC";
          }
          if(num.equals("2")){
            if(logic1.equals("AND")){
          	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
            }
            if(logic1.equals("OR")){
          	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
            }
            if(logic1.equals("NOT")){
          	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
            }
          }
          if(num.equals("3")){
          	
          	if(logic2.equals("AND")){
          		if(logic1.equals("AND")){
                  	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
                    }
          		if(logic1.equals("OR")){
                	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
                  }
                  if(logic1.equals("NOT")){
                	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
                  }
                }
          	
                 if(logic2.equals("OR")){
              	  if(logic1.equals("AND")){
                    	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
                      }
            		if(logic1.equals("OR")){
                  	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
                    }
                    if(logic1.equals("NOT")){
                  	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC "; 
                    }
                }
                 
                if(logic2.equals("NOT")){
              	  
              	  if(logic1.equals("AND")){
                    	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC ";  
                      }
            		if(logic1.equals("OR")){
                  	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
                    }
                    if(logic1.equals("NOT")){
                  	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
                    }
                }   
          }
		
		technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
		
		return technologylist;
	}	
	//成熟技术前台列表3
		public static ArrayList<Technology> techlist21(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username ){
			ArrayList<Technology>  technologylist = new ArrayList<Technology>();
 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' ";
	
/*			String sql = "select * from TECHNOLOGY ";ORDER BY TECHNOLOGY.FillTime DESC 
*/			if(num.equals("1")){
	            sql+="and "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC ";
	          }
	          if(num.equals("2")){
	            if(logic1.equals("AND")){
	          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("OR")){
	          	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("NOT")){
	          	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	            }
	          }
	          if(num.equals("3")){
	          	
	          	if(logic2.equals("AND")){
	          		if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                  }
	                }
	          	
	                 if(logic2.equals("OR")){
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                    }
	                }
	                 
	                if(logic2.equals("NOT")){
	              	  
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                    }
	                }   
	          }
			
			technologylist = PageTable.technologyquery11(con, sql, pageNo, pageSize);
			
			return technologylist;
		}	
	//成熟技术前台列表4
		public static int techpage21(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username ){
			int pageCount=0;
 			String sql = "select * from TECHNOLOGY where Username like '%"+username+"%' ";
		
			if(num.equals("1")){
	            sql+="and "+sType0+" like '%"+q0+"%' ORDER BY TECHNOLOGY.FillTime DESC";
	          }
	          if(num.equals("2")){
	            if(logic1.equals("AND")){
	          	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("OR")){
	          	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	            }
	            if(logic1.equals("NOT")){
	          	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	            }
	          }
	          if(num.equals("3")){
	          	
	          	if(logic2.equals("AND")){
	          		if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                  }
	                }
	          	
	                 if(logic2.equals("OR")){
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY TECHNOLOGY.FillTime DESC";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                    }
	                }
	                 
	                if(logic2.equals("NOT")){
	              	  
	              	  if(logic1.equals("AND")){
	                    	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                      }
	            		if(logic1.equals("OR")){
	                  	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC";  
	                    }
	                    if(logic1.equals("NOT")){
	                  	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY TECHNOLOGY.FillTime DESC"; 
	                    }
	                }   
	          }
			
			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
		}
	}
