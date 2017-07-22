package com.dqwr.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import com.dqwr.entity.*;
import com.dqwr.requirement.entity.Requirement;

public class Brose {
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
	
	public static ArrayList<Requirement> shenhePolicy(Connection con,int pageNo,int pageSize,String fbrid,String search){
		ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		
		
		String sql = "select * from MyByView where ZSHZT='待审核' ";
		return policytaglist;
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
	
	public static int xdshPagecount(Connection con,int pageNo,int pageSize,String pass,String search,String find){
		int pageCount=0;
		String sql = "select * from requirement";
		if((find!=null)&&(!find.equals(""))){
			
			find=StringFilter(find);
			sql+=" where "+search+" like '%"+find+"%'";
		}
		pageCount=PageTable.pagecounts(con, sql, pageSize,pass);
		return pageCount;
	}
	public static int requirePagecount(Connection con,int pageNo,int pageSize,int pass,String search,String find){
		System.out.println(pass);
		int pageCount=0;
		String sql = "select * from requirement ";
		switch(pass){
		/*XSSH代表形式审核，jssh代表技术审核，reject表示审核拒绝*/
		/* 形式审核*/
    case 1:
		sql+="where XSSH=0 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*形式管理*/
    case 2:
		sql+="where XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*技术审核*/
	case 3:
		sql+="where XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

		}
		break;
		/*技术管理*/
	case 4:
		sql+="where XSSH=1 and JSSH=1 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*已退回*/
	case 5:
		sql+="where Reject=1 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Reject=1 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

		}
		break;
		}
		pageCount=PageTable.reqpagecounts(con, sql, pageSize,pass);
		return pageCount;
	}
	//技术需求前台退回列表
	public static int requirePagecount1(Connection con,int pageNo,int pageSize,int pass,String search,String find,String username){
		int pageCount=0;
		String sql = "select * from requirement where Username like '%"+username+"%'";
		switch(pass){
		/*XSSH代表形式审核，jssh代表技术审核，reject表示审核拒绝*/
		/* 形式审核*/
    case 1:
		sql+=" and XSSH=0 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Username like '%"+username+"%' and XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*形式管理*/
    case 2:
		sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*技术审核*/
	case 3:
		sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

		}
		break;
		/*技术管理*/
	case 4:
		sql+=" and XSSH=1 and JSSH=1 and Reject=0 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
		}
		break;
		/*已退回*/
	case 5:
		sql+=" and Reject=1 ORDER BY requirement.FillTime desc";
		if((find!=null)&&(!find.equals(""))){
			/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
			sql="select * from requirement where Username like '%"+username+"%' and Reject=1 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

		}
		break;
	}
		pageCount=PageTable.reqpagecounts(con, sql, pageSize,pass);
		return pageCount;
	}
	public static ArrayList<Requirement> xdshPolicy(Connection con,int pageNo,int pageSize,String pass,String search,String find){
		ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		
		String sql = "select * from requirement";
		if((find!=null)&&(!find.equals(""))){
			
			find=StringFilter(find);
			sql+=" where "+search+" like '%"+find+"%'";
		}
		policytaglist = PageTable.xdquery(con, sql, pageNo, pageSize,pass);
		
		return policytaglist;
	}
	//技术需求退回列表
	public static ArrayList<Requirement> Requirelist(Connection con,int pageNo,int pageSize,int pass,String search,String find){
		ArrayList<Requirement>  requirelist = new ArrayList<Requirement>();
		String sql = "select * from requirement ";
		switch(pass){
			/*XSSH代表形式审核，jssh代表技术审核，reject表示审核拒绝*/
			/* 形式审核*/
	    case 1:
			sql+=" where XSSH=0 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
				sql="select * from requirement where XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
			}
			break;
			/*形式管理*/
	    case 2:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
				sql="select * from requirement where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
			}
			break;
			/*技术审核*/
		case 3:
			sql+=" where XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
				sql="select * from requirement where XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

			}
			break;
			/*技术管理*/
		case 4:
			sql+=" where XSSH=1 and JSSH=1 and Reject=0 ORDER BY requirement.FillTime desc";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
				sql="select * from requirement where XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
			}
			break;
			/*已退回*/
		case 5:
			sql+=" where Reject=1 ORDER BY requirement.FillTime desc";
			if((find!=null)&&(!find.equals(""))){
				/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
				sql="select * from requirement where Reject=1 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

			}
			break;
		}
		requirelist = PageTable.reqquery(con, sql, pageNo, pageSize,pass);
		
		return requirelist;
	}
	//技术需求前台 退回列表
		public static ArrayList<Requirement> Requirelist1(Connection con,int pageNo,int pageSize,int pass,String search,String find,String username){
			ArrayList<Requirement>  requirelist = new ArrayList<Requirement>();
			String sql = "select * from requirement where Username like '%"+username+"%'";
			switch(pass){
				/*XSSH代表形式审核，jssh代表技术审核，reject表示审核拒绝*/
				/* 形式审核*/
		    case 1:
				sql+=" and XSSH=0 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
				if((find!=null)&&(!find.equals(""))){
					/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
					sql="select * from requirement where Username like '%"+username+"%' and XSSH=0 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
				}
				break;
				/*形式管理*/
		    case 2:
				sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
				if((find!=null)&&(!find.equals(""))){
					/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
					sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
				}
				break;
				/*技术审核*/
			case 3:
				sql+=" and XSSH=1 and JSSH=0 and Reject=0 ORDER BY requirement.FillTime desc";
				if((find!=null)&&(!find.equals(""))){
					/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
					sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=0 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

				}
				break;
				/*技术管理*/
			case 4:
				sql+=" and XSSH=1 and JSSH=1 and Reject=0 ORDER BY requirement.FillTime desc";
				if((find!=null)&&(!find.equals(""))){
					/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
					sql="select * from requirement where Username like '%"+username+"%' and XSSH=1 and JSSH=1 and Reject=0 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";
				}
				break;
				/*已退回*/
			case 5:
				sql+=" and Reject=1 ORDER BY requirement.FillTime desc";
				if((find!=null)&&(!find.equals(""))){
					/*sql+=" and "+search+" like '%"+find+"%'"+" ORDER BY requirement.FillTime desc";*/
					sql="select * from requirement where Username like '%"+username+"%' and Reject=1 and "+search+" like '%"+find+"%' ORDER BY requirement.FillTime desc";

				}
				break;
			}
			requirelist = PageTable.reqquery(con, sql, pageNo, pageSize,pass);
			
			return requirelist;
		}
	//技术需求 我已发布列表1
	public static int RequirePagecount1(Connection con,int pageNo,int pageSize){
		int pageCount=0;
		String sql = "select * from requirement ORDER BY requirement.FillTime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	public static ArrayList<Requirement> ReuireList1(Connection con,int pageNo,int pageSize){
		ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		String sql = "select * from requirement ORDER BY requirement.FillTime desc";
		policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
		return policytaglist;
	}
	//创新技术+找合作列表+无查询1
	public static ArrayList<Requirement> ReuireListcx1(Connection con,int pageNo,int pageSize){
		ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		String sql = "select * from requirement where JSSH ='True' ORDER BY requirement.FillTime desc";
		policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
		return policytaglist;
	}
	public static int RequirePagecountcx1(Connection con,int pageNo,int pageSize){
		int pageCount=0;
		String sql = "select * from requirement where JSSH ='True' ORDER BY requirement.FillTime desc";
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
	//技术需求 我已发布前台列表1+ 用户名
	public static int RequirePagecount11(Connection con, int pageNo,
			int pageSize, String username) {
		int pageCount = 0;
		String sql = "select * from requirement where Username like '%"+username+"%' ORDER BY requirement.FillTime desc";
		pageCount = PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}

	public static ArrayList<Requirement> ReuireList11(Connection con,
			int pageNo, int pageSize, String username) {
		ArrayList<Requirement> policytaglist = new ArrayList<Requirement>();
		String sql = "select * from requirement where Username like '%"+username+"%' ORDER BY requirement.FillTime desc";	
			

		policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
		return policytaglist;
	}
	//技术需求下已征集前台列表1
		public static int RequirePagecount111(Connection con, int pageNo,
				int pageSize, String username) {
			int pageCount = 0;
			String sql = "select * from requirement where Username like '%"+username+"%' and JSSH = 'True' ORDER BY requirement.FillTime desc";
			System.out.println("sql语句为:"+sql);
			pageCount = PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
		}

		public static ArrayList<Requirement> ReuireList111(Connection con,
				int pageNo, int pageSize, String username) {
			ArrayList<Requirement> policytaglist = new ArrayList<Requirement>();
			String sql = "select * from requirement where Username like '%"+username+"%' and JSSH = 'True' ORDER BY requirement.FillTime desc";	
				

			policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
			return policytaglist;
		}
		//前台+技术需求+已征集列表2
		public static ArrayList<Requirement> RequireList211(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username){
			ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
			String sql = "select * from requirement where Username like '%"+username+"%' and JSSH = 'True'";	
			if(num.equals("1")){
		        sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
		      }
		      if(num.equals("2")){
		        if(logic1.equals("AND")){
		      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
		        }
		        if(logic1.equals("OR")){
		      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
		        }
		        if(logic1.equals("NOT")){
		      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
		        }
		      }
		      if(num.equals("3")){
		      	
		      	if(logic2.equals("AND")){
		      		if(logic1.equals("AND")){
		              	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
		                }
		      		if(logic1.equals("OR")){
		            	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
		              }
		              if(logic1.equals("NOT")){
		            	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
		              }
		            }
		      	
		             if(logic2.equals("OR")){
		          	  if(logic1.equals("AND")){
		                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
		                  }
		        		if(logic1.equals("OR")){
		              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
		                }
		                if(logic1.equals("NOT")){
		              	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
		                }
		            }
		             
		            if(logic2.equals("NOT")){
		          	  
		          	  if(logic1.equals("AND")){
		                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
		                  }
		        		if(logic1.equals("OR")){
		              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
		                }
		                if(logic1.equals("NOT")){
		              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
		                }
		            }   
		      }
				System.out.println(sql);

			policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
			return policytaglist;
		}
		public static int RequirePagecount211(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username){
			int pageCount=0;
			String sql = "select * from requirement where Username like '%"+username+"%'";	
			if(num.equals("1")){
	          sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
	        }
	        if(num.equals("2")){
	          if(logic1.equals("AND")){
	        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("OR")){
	        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("NOT")){
	        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
	          }
	        }
	        if(num.equals("3")){
	        	
	        	if(logic2.equals("AND")){
	        		if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	        		if(logic1.equals("OR")){
	              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                }
	                if(logic1.equals("NOT")){
	              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                }
	              }
	        	
	               if(logic2.equals("OR")){
	            	  if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }
	               
	              if(logic2.equals("NOT")){
	            	  
	            	  if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }   
	        }
			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
		}
	
	//技术需求下我已发布列表2	
	public static int RequirePagecount2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2){
		int pageCount=0;
        String sql = "select * from requirement ";		
        if(num.equals("1")){
	          sql+="where "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
	        }
	        if(num.equals("2")){
	          if(logic1.equals("AND")){
	        	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("OR")){
	        	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("NOT")){
	        	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
	          }
	        }
	        if(num.equals("3")){
	        	
	        	if(logic2.equals("AND")){
	        		if(logic1.equals("AND")){
	                	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	        		if(logic1.equals("OR")){
	              	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                }
	                if(logic1.equals("NOT")){
	              	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                }
	              }
	        	
	               if(logic2.equals("OR")){
	            	  if(logic1.equals("AND")){
	                  	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="where ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }
	               
	              if(logic2.equals("NOT")){
	            	  
	            	  if(logic1.equals("AND")){
	                  	sql+="where "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="where ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="where "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }   
	        }
			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
	}
 //创新要素+找合作+有查询
	public static ArrayList<Requirement> RequireListcx2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2 ){
		ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
		String sql = "select * from requirement where JSSH ='True' ";
		
		if(num.equals("1")){
	        sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
	      }
	      if(num.equals("2")){
	        if(logic1.equals("AND")){
	      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
	        }
	        if(logic1.equals("OR")){
	      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
	        }
	        if(logic1.equals("NOT")){
	      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
	        }
	      }
	      if(num.equals("3")){
	      	
	      	if(logic2.equals("AND")){
	      		if(logic1.equals("AND")){
	              	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                }
	      		if(logic1.equals("OR")){
	            	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	              }
	              if(logic1.equals("NOT")){
	            	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	              }
	            }
	      	
	             if(logic2.equals("OR")){
	          	  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
	                  }
	        		if(logic1.equals("OR")){
	              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                }
	                if(logic1.equals("NOT")){
	              	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                }
	            }
	             
	            if(logic2.equals("NOT")){
	          	  
	          	  if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	        		if(logic1.equals("OR")){
	              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                }
	                if(logic1.equals("NOT")){
	              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                }
	            }   
	      }
			System.out.println(sql);

		policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
		return policytaglist;
	}
	public static int RequirePagecountcx2(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2){
		int pageCount=0;
        String sql = "select * from requirement where JSSH ='True' ";		
        if(num.equals("1")){
	          sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
	        }
	        if(num.equals("2")){
	          if(logic1.equals("AND")){
	        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("OR")){
	        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
	          }
	          if(logic1.equals("NOT")){
	        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
	          }
	        }
	        if(num.equals("3")){
	        	
	        	if(logic2.equals("AND")){
	        		if(logic1.equals("AND")){
	                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	        		if(logic1.equals("OR")){
	              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                }
	                if(logic1.equals("NOT")){
	              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                }
	              }
	        	
	               if(logic2.equals("OR")){
	            	  if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }
	               
	              if(logic2.equals("NOT")){
	            	  
	            	  if(logic1.equals("AND")){
	                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                    }
	          		if(logic1.equals("OR")){
	                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
	                  }
	                  if(logic1.equals("NOT")){
	                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
	                  }
	              }   
	        }
			pageCount=PageTable.pagecounts(con, sql, pageSize);
			return pageCount;
	}
//前台+技术需求+我已发布列表2
public static ArrayList<Requirement> RequireList21(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username){
	ArrayList<Requirement>  policytaglist = new ArrayList<Requirement>();
	String sql = "select * from requirement where Username like '%"+username+"%'";	
	if(num.equals("1")){
        sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
      }
      if(num.equals("2")){
        if(logic1.equals("AND")){
      	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
        }
        if(logic1.equals("OR")){
      	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
        }
        if(logic1.equals("NOT")){
      	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
        }
      }
      if(num.equals("3")){
      	
      	if(logic2.equals("AND")){
      		if(logic1.equals("AND")){
              	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                }
      		if(logic1.equals("OR")){
            	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
              }
              if(logic1.equals("NOT")){
            	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
              }
            }
      	
             if(logic2.equals("OR")){
          	  if(logic1.equals("AND")){
                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
                }
                if(logic1.equals("NOT")){
              	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
                }
            }
             
            if(logic2.equals("NOT")){
          	  
          	  if(logic1.equals("AND")){
                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                }
                if(logic1.equals("NOT")){
              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
                }
            }   
      }
		System.out.println(sql);

	policytaglist = PageTable.xdquery11(con, sql, pageNo, pageSize);
	return policytaglist;
}
//技术需求下我已发布列表2	
	public static int RequirePagecount21(Connection con,int pageNo,int pageSize,String num,String sType0,String q0,String logic1,String sType1,String q1,String logic2,String sType2,String q2,String username){
		int pageCount=0;
		String sql = "select * from requirement where Username like '%"+username+"%'";	
		if(num.equals("1")){
          sql+="and "+sType0+" like '%"+q0+"%' ORDER BY requirement.FillTime desc";
        }
        if(num.equals("2")){
          if(logic1.equals("AND")){
        	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' ORDER BY requirement.FillTime desc";  
          }
          if(logic1.equals("OR")){
        	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') ORDER BY requirement.FillTime desc";  
          }
          if(logic1.equals("NOT")){
        	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%' ORDER BY requirement.FillTime desc"; 
          }
        }
        if(num.equals("3")){
        	
        	if(logic2.equals("AND")){
        		if(logic1.equals("AND")){
                	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                  }
        		if(logic1.equals("OR")){
              	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
                }
                if(logic1.equals("NOT")){
              	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
                }
              }
        	
               if(logic2.equals("OR")){
            	  if(logic1.equals("AND")){
                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" ("+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%' ) ORDER BY requirement.FillTime desc";  
                    }
          		if(logic1.equals("OR")){
                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+logic2+" "+sType2+" like '%"+q2+"%') ORDER BY requirement.FillTime desc";  
                  }
                  if(logic1.equals("NOT")){
                	 sql+="and ("+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%') "+logic2+" "+sType2+" like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
                  }
              }
               
              if(logic2.equals("NOT")){
            	  
            	  if(logic1.equals("AND")){
                  	sql+="and "+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%' "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                    }
          		if(logic1.equals("OR")){
                	  sql+="and ("+sType0+" like '%"+q0+"%' "+logic1+" "+sType1+" like '%"+q1+"%') "+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc";  
                  }
                  if(logic1.equals("NOT")){
                	 sql+="and "+sType0+" like '%"+q0+"%' "+"and "+sType1+" not like '%"+q1+"%'"+" and "+sType2+" not like '%"+q2+"%' ORDER BY requirement.FillTime desc"; 
                  }
              }   
        }
		pageCount=PageTable.pagecounts(con, sql, pageSize);
		return pageCount;
	}
}
