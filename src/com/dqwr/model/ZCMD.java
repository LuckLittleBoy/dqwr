package com.dqwr.model;

/**
 ************类说明**************
 * 类名：ZCMD 
 * 建类时间：2014-2-11 上午11:26:45
 * 类描述：ZC操作
 */

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.dqwr.entity.GJZ;
import com.dqwr.entity.ZC;
import com.dqwr.entity.ZTC;

	/**
	 * 
	 ************类说明**************
	 * 类名：Policy
	 * 建类时间：2013-11-30 下午8:35:01
	 * 类描述：
	 */
/**
 ************类说明**************
 * 类名：ZCMD
 * 建类时间：2014-2-11 下午12:08:10
 * 类描述：
 */
/**
 ************类说明**************
 * 类名：ZCMD
 * 建类时间：2014-2-11 下午12:08:12
 * 类描述：
 */
/**
 ************类说明**************
 * 类名：ZCMD
 * 建类时间：2014-2-11 下午12:08:15
 * 类描述：
 */
/**
 ************类说明**************
 * 类名：ZCMD
 * 建类时间：2014-2-11 下午12:08:20
 * 类描述：
 */
/**
 ************类说明**************
 * 类名：ZCMD
 * 建类时间：2014-2-11 下午12:08:29
 * 类描述：
 */
public class ZCMD {
	
	public static void baocun(Connection con ,String zcid,String zfbrid,String lasttime) throws SQLException{
		String sql = "{call sp_baocun_tuihui (?,?,?)}";
			CallableStatement c =con.prepareCall(sql);
			c.setString(1, zcid);
			c.setString(2, zfbrid);
			c.setString(3, lasttime);
			c.execute();
		
	}
	
	/**
	 * 
	 * 方法说明：添加政策
	 * 方法名：TJZC
	 * 返回值：int
	 * @throws SQLException 
	 */
	public static void TJZC(Connection con ,String zcid,String zcwh,String zcmc,String zcnr,String zfbrid,String sxztw,String bzcfl,String bsxfw,String bbxs,String zdjg,String bgbrq,String bsxrq,String bswzc,String bqqzc,String zshzt,String bfzrq ,String tzly,String ztc[],String gjz[],String swtag,String qqtag,String sxtag,String fj,String lasttime,String zdjgmc,String sxfwmc) throws SQLException{
		String sql = "{call sp_Insert_FBRZCBBYB (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		System.out.println("ztc:"+zcid);

		CallableStatement c =con.prepareCall(sql);
			c.setString(1, zcid);
			c.setString(2, zcwh);
			c.setString(3, zcmc);
			c.setString(4, zcnr);
			c.setString(5, zfbrid);
			c.setString(6, sxztw);
			c.setString(7, zshzt);
			c.setString(8, bzcfl);
			c.setString(9, bsxfw);
			c.setString(10, bbxs);
			c.setString(11, zdjg);
			c.setString(12, bgbrq);
			c.setString(13, bsxrq);
			c.setString(14, bswzc);
			c.setString(15, bqqzc);
			c.setString(16, bfzrq);
			c.setString(17, tzly);

			for(int i=0;i<5;i++){
				c.setString(18+i, ztc[i]);
			}
			for(int j=0;j<10;j++){
				c.setString(23+j, gjz[j]);
			}
			c.setString(33, swtag);
			c.setString(34, qqtag);
			c.setString(35, sxtag);
			c.setString(36, fj);
			c.setString(37, lasttime);
			c.setString(38, zdjgmc);
			c.setString(39, sxfwmc);
			c.execute();
		
	}
	/**
	 * 
	 * 方法说明：前期失效
	 * 方法名：QQSX
	 * @param con 
	 * 返回值：void
	 */
	public static void QQSX(Connection con,String qqzc){
		String sql = "{call qqztwsg(?)}";
		try {
			CallableStatement c = con.prepareCall(sql);
			c.setString(1,qqzc);
			c.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 方法说明：审核政策
	 * 方法名：SHZC
	 * @param con
	 * @param zcid
	 * @param shrid
	 * @param zshzt
	 * @param btgrq 
	 * 返回值：void
	 */
	public static void SHZC(Connection con ,String zcid,String shrid,String zshzt,String btgrq){
		String sql = "{call sp_updata_FBRZCBBYB (?,?,?,?)}";
		try {
			CallableStatement c =con.prepareCall(sql);
			c.setString(1, zcid);
			c.setString(2, shrid);
			c.setString(3, zshzt);
			c.setString(4, btgrq);
			
			c.execute();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			 System.out.println("query error:"+e1);
				
			e1.printStackTrace();
		
		}
	}
	/**
	 * 修订的审核政策
	 * @param con
	 * @param zcid
	 * @param shrid
	 * @param zshzt
	 * @param btgrq
	 */
	public static void xDSHZC(Connection con ,String zcid,String shrid,String zshzt,String thyy,String swtag,String qqtag,String xdtime,String swzc,String qqzc){
		String sql = "{call xdshenhe (?,?,?,?,?,?,?,?,?)}";
		try {
			CallableStatement c =con.prepareCall(sql);
			c.setInt(1, Integer.parseInt(zcid));
			c.setString(2, shrid);
			c.setString(3, swzc);
			c.setString(4, qqzc);
			c.setString(5, thyy);
			c.setInt(6, Integer.parseInt(zshzt));
			c.setInt(7, Integer.parseInt(swtag));
			c.setInt(8, Integer.parseInt(qqtag));
			c.setString(9, xdtime);
			
			c.execute();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			 System.out.println("query error:"+e1);
				
			e1.printStackTrace();
		
		}
	}
	
	/**
	 * 
	 * 方法说明：删除政策的方法
	 * 方法名：deletezc
	 * @param con
	 * @param zcid
	 * @param shrid
	 * @param zshzt
	 * @param btgrq 
	 * 返回值：void
	 */
	public static String delete(Connection con ,String zcid,String fbrid){
		String sql = "{call sp_delete_ZC (?,?,?)}";
		int back = 1;
		String str="";
		try {
			CallableStatement c =con.prepareCall(sql);
			c.setString(1, zcid);
			c.setString(2, fbrid);
			c.setInt(3, back);
			c.registerOutParameter(3,Types.INTEGER);
			c.execute();
			back = c.getInt(3);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			 System.out.println("query error:"+e1);
				
			e1.printStackTrace();
		
		}
		if(back==0){
			str="删除成功";
		}else str="删除失败";
		return str;
	}
	/**
	 * 
	 * 退回政策
	 */
	public static void SHTHZC(Connection con ,String zcid,String shrid,String zshzt,String bz){
		String sql = "{call sp_updata_SHTH (?,?,?,?)}";
		try {
			CallableStatement c =con.prepareCall(sql);
			c.setString(1, zcid);
			c.setString(2, shrid);
			c.setString(3, zshzt);
			c.setString(4, bz);
			c.execute();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			 System.out.println("query error:"+e1);
				
			e1.printStackTrace();
		
		}
	}

	/**
	 * 
	 * 方法说明：修改政策标引（目前没有用到好像）
	 * 方法名：alterplicytag
	 * @param con
	 * @param name
	 * @param no
	 * @param date
	 * @param place
	 * @param pclass
	 * @param draft
	 * @param scope
	 * @param issue
	 * @param categories
	 * @return 
	 * 返回值：int
	 */
	public static int alterplicytag(Connection con ,String name,String no,String begintime,String endtime,String place,String pclass,String draft,String scope,String issue,String categories){
		String sql = "update zc set pname=?,begintime=?,pplace=?,pclass=?,pdraft=?,pscope=?,pissue=?,pcategories=?,endtime=?,status='未审核' where pno=?";
		
		PreparedStatement c = null;
		int rs = 0;
		try {
			c = con.prepareStatement(sql);
			c.setString(1, name);
			c.setString(2, begintime);
			c.setString(3, place);
			c.setString(4, pclass);
			c.setString(5, draft);
			c.setString(6, scope);
			c.setString(7, issue);
			c.setString(8, categories);
			c.setString(9, endtime);
			c.setString(10, no);
			rs=c.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 System.out.println("query error:"+e);
		}
		return rs;
	}
	
	
	public static int alterzccontent(Connection con ,String name ,String no ,String content){
		int rs = 0;
		String sql = "update zccontent set pname=?,content=? where pno=?";
		PreparedStatement c = null;
	
		try {
			c = con.prepareStatement(sql);
			c.setString(1,name);
			c.setString(3, no);
			c.setString(2,content);
			rs = c.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 System.out.println("query error:"+e);
		}
		return rs ;
	}
	/**
	 * 
	 * 
	 * 方法说明：添加政策内容（目前也没有用到）
	 * 方法名：addzccontent
	 * @param con
	 * @param name
	 * @param no
	 * @param content
	 * @return 
	 * 返回值：int
	 */
	
	public static int addzccontent(Connection con ,String name ,String no ,String content){
		int rs = 0;
		String sql = "INSERT INTO zccontent(pname,pno,content) values(?,?,?)";
		PreparedStatement c = null;
		try {
			c = con.prepareStatement(sql);
			c.setString(1,name);
			c.setString(2, no);
			c.setString(3,content);
			rs = c.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs ;
	}
	/**
	 * 
	 * 方法说明：查找审核原文
	 * 方法名：shyw
	 * @param con
	 * @param zcid
	 * @return 
	 * 返回值：ZC
	 */
	public static ZC shyw(Connection con,String zcid){
		String sql = "";
		PreparedStatement stmt = null;
		ZC  zc = new ZC();
		ResultSet rs = null;
			sql = "select * from MyByView where zcid=?";
			try {
				stmt = con.prepareStatement(sql);

				stmt.setString(1, zcid);
				rs=stmt.executeQuery();
				if(rs.next()){

					zc.setBBBXS(rs.getString("bBBXS"));
					if(rs.getString("bBBXS")==null){
						zc.setBBBXS("");
					}
				
					zc.setZcnr(rs.getString("zcnr"));
					if(rs.getString("zcnr")==null){
						zc.setZcnr("");
					}
					
					zc.setBFZRQ(rs.getString("bFZRQ"));
					if(rs.getString("bFZRQ")==null){
						zc.setBFZRQ("");
					}
					zc.setBGBRQ(rs.getString("bGBRQ"));
					if(rs.getString("bGBRQ")==null){
						zc.setBGBRQ("");
					}
					
					zc.setBQQZC(rs.getString("bQQZC"));
					if(rs.getString("bQQZC")==null){
						zc.setBQQZC("");
					}
					zc.setBSWZC(rs.getString("bSWZC"));
					if(rs.getString("bSWZC")==null){
						zc.setBSWZC("");
					}
					zc.setBSXFW(rs.getString("bSXFW"));
					if(rs.getString("bSXFW")==null){
						zc.setBSXFW("");
					}
					zc.setBSXRQ(rs.getString("bSXRQ"));
					if(rs.getString("bSXRQ")==null){
						zc.setBSXRQ("");
					}
					zc.setBTGRQ(rs.getString("bTGRQ"));
					if(rs.getString("bTGRQ")==null){
						zc.setBTGRQ("");
					}
					zc.setBTTZLYB(rs.getString("bTTZLYB"));
					if(rs.getString("bTTZLYB")==null){
						zc.setBTTZLYB("");
					}
					zc.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						zc.setBZCFL("");
					}
					zc.setBZDJG(rs.getString("bZDJG"));
					if(rs.getString("bZDJG")==null){
						zc.setBZDJG("");
					}
					
					zc.setZCID(rs.getString("zCID"));
					if(rs.getString("zCID")==null){
						zc.setZCID("");
					}
					zc.setZCMC(rs.getString("zCMC"));
					if(rs.getString("zCMC")==null){
						zc.setZCMC("");
					}
					zc.setZFBRID(rs.getString("zFBRID"));
					if(rs.getString("zFBRID")==null){
						zc.setZFBRID("");
					}
					zc.setZCWH(rs.getString("zCWH"));
					if(rs.getString("zCWH")==null){
						zc.setZCWH("");
					}
					zc.setZSHRID(rs.getString("zSHRID"));
					if(rs.getString("zSHRID")==null){
						zc.setZSHRID("");
					}
					zc.setZSHZT(rs.getString("zSHZT"));
					if(rs.getString("zSHZT")==null){
						zc.setZSHZT("");
					}
					zc.setZSXZTW(rs.getString("zSXZTW"));
					if(rs.getString("zSXZTW")==null){
						zc.setZSXZTW("");
					}
					zc.setQqtag(rs.getString("qqtag"));
					if(rs.getString("qqtag")==null){
						zc.setQqtag("");
					}
					zc.setSwtag(rs.getString("swtag"));
					if(rs.getString("swtag")==null){
						zc.setSwtag("");
					}
					zc.setSxtag(rs.getString("sxtag"));
					if(rs.getString("sxtag")==null){
						zc.setSwtag("");
					}
					
					zc.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						zc.setBZCFL("");
					}
					zc.setTTZLYMC(rs.getString("TTZLYMC"));
					if(rs.getString("TTZLYMC")==null){
						zc.setTTZLYMC("");
					}
					zc.setBBBXSMC(rs.getString("BBBXSMC"));
					if(rs.getString("BBBXSMC")==null){
						zc.setBBBXSMC("");
					}
					zc=zcgjz(con,zc);
					zc=zcztc(con,zc);
					zc.setZdjgmc(zdjglist(con,zc.getBZDJG()));
					zc.setSxfwmc(sxfwlist(con,zc.getBSXFW()));
					zc.setSwzcmc(zcmclist(con,zc.getBSWZC()));
					zc.setQqzcmc(zcmclist(con,zc.getBQQZC()));
					
					zc.setZCFLMC(rs.getString("ZCFLMC"));
					if(rs.getString("ZCFLMC")==null){
						zc.setZCFLMC("");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	
		
		return zc;
		
	}
	/**
	 * 审核修订的原文
	 * @param con
	 * @param zcid
	 * @return
	 */
	public static ZC xdshyw(Connection con,String zcid){
		String sql = "";
		PreparedStatement stmt = null;
		ZC  zc = new ZC();
		ResultSet rs = null;
			sql = "select * from xdview where zcid=?";
			try {
				stmt = con.prepareStatement(sql);

				stmt.setString(1, zcid);
				rs=stmt.executeQuery();
				if(rs.next()){

					zc.setBBBXS(rs.getString("bBBXS"));
					if(rs.getString("bBBXS")==null){
						zc.setBBBXS("");
					}
				
					zc.setZcnr(rs.getString("zcnr"));
					if(rs.getString("zcnr")==null){
						zc.setZcnr("");
					}
					
					zc.setBFZRQ(rs.getString("bFZRQ"));
					if(rs.getString("bFZRQ")==null){
						zc.setBFZRQ("");
					}
					zc.setBGBRQ(rs.getString("bGBRQ"));
					if(rs.getString("bGBRQ")==null){
						zc.setBGBRQ("");
					}
					
					zc.setBQQZC(rs.getString("bQQZC"));
					if(rs.getString("bQQZC")==null){
						zc.setBQQZC("");
					}
					zc.setBSWZC(rs.getString("bSWZC"));
					if(rs.getString("bSWZC")==null){
						zc.setBSWZC("");
					}
					zc.setBSXFW(rs.getString("bSXFW"));
					if(rs.getString("bSXFW")==null){
						zc.setBSXFW("");
					}
					zc.setBSXRQ(rs.getString("bSXRQ"));
					if(rs.getString("bSXRQ")==null){
						zc.setBSXRQ("");
					}
					zc.setBTGRQ(rs.getString("bTGRQ"));
					if(rs.getString("bTGRQ")==null){
						zc.setBTGRQ("");
					}
					zc.setBTTZLYB(rs.getString("bTTZLYB"));
					if(rs.getString("bTTZLYB")==null){
						zc.setBTTZLYB("");
					}
					zc.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						zc.setBZCFL("");
					}
					zc.setBZDJG(rs.getString("bZDJG"));
					if(rs.getString("bZDJG")==null){
						zc.setBZDJG("");
					}
					
					zc.setZCID(rs.getString("zCID"));
					if(rs.getString("zCID")==null){
						zc.setZCID("");
					}
					zc.setZCMC(rs.getString("zCMC"));
					if(rs.getString("zCMC")==null){
						zc.setZCMC("");
					}
					zc.setZFBRID(rs.getString("zFBRID"));
					if(rs.getString("zFBRID")==null){
						zc.setZFBRID("");
					}
					zc.setZCWH(rs.getString("zCWH"));
					if(rs.getString("zCWH")==null){
						zc.setZCWH("");
					}
					zc.setZSHRID(rs.getString("zSHRID"));
					if(rs.getString("zSHRID")==null){
						zc.setZSHRID("");
					}
					zc.setZSHZT(rs.getString("zSHZT"));
					if(rs.getString("zSHZT")==null){
						zc.setZSHZT("");
					}
					zc.setZSXZTW(rs.getString("zSXZTW"));
					if(rs.getString("zSXZTW")==null){
						zc.setZSXZTW("");
					}
					zc.setQqtag(""+rs.getString("qqtag"));
					if(rs.getString("qqtag")==null){
						zc.setQqtag("");
					}
					zc.setSwtag(rs.getString("swtag"));
					if(rs.getString("swtag")==null){
						zc.setSwtag("");
					}
					zc.setSxtag(""+rs.getString("sxtag"));
					if(rs.getString("sxtag")==null){
						zc.setSxtag("");
					}
					
					zc.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						zc.setBZCFL("");
					}
					zc.setTTZLYMC(rs.getString("TTZLYMC"));
					if(rs.getString("TTZLYMC")==null){
						zc.setTTZLYMC("");
					}
					zc.setBBBXSMC(rs.getString("BBBXSMC"));
					if(rs.getString("BBBXSMC")==null){
						zc.setBBBXSMC("");
					}
					zc.setYswzc(rs.getString("yswzc"));
					if(rs.getString("yswzc")==null){
						zc.setYswzc("");
					}
					zc.setYqqzc(rs.getString("yqqzc"));
					if(rs.getString("yqqzc")==null){
						zc.setYqqzc("");
					}
					zc.setZCFLMC(rs.getString("ZCFLMC"));
					if(rs.getString("ZCFLMC")==null){
						zc.setZCFLMC("");
					}
					zc=zcgjz(con,zc);
					zc=zcztc(con,zc);
					zc.setZdjgmc(zdjglist(con,zc.getBZDJG()));
					zc.setSxfwmc(sxfwlist(con,zc.getBSXFW()));
					zc.setSwzcmc(zcmclist(con,zc.getBSWZC()));
					zc.setQqzcmc(zcmclist(con,zc.getBQQZC()));
					zc.setYqqzcmc(zcmclist(con,zc.getYqqzc()));
					zc.setYswzcmc(zcmclist(con,zc.getYswzc()));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	
		
		return zc;
		
	}
	
	/**
	 * 
	 * 方法说明：查询原文
	 * 方法名：cxyw
	 * @param con
	 * @param zcid
	 * @return 
	 * 返回值：ZC
	 */
	public static ZC cxyw(Connection con,String zcid){
		String sql = "";
		PreparedStatement stmt = null;
		ZC  zc = new ZC();
		ResultSet rs = null;
			sql = "select * from MyByView where zcid=?";
			try {
				stmt = con.prepareStatement(sql);

				stmt.setString(1, zcid);
				rs=stmt.executeQuery();
				if(rs.next()){

					zc.setBBBXS(rs.getString("bBBXS"));
					if(rs.getString("bBBXS")==null){
						zc.setBBBXS("");
					}
				
					zc.setZcnr(rs.getString("zcnr"));
					if(rs.getString("zcnr")==null){
						zc.setZcnr("");
					}
					
					zc.setBFZRQ(rs.getString("bFZRQ"));
					if(rs.getString("bFZRQ")==null){
						zc.setBFZRQ("");
					}
					zc.setBGBRQ(rs.getString("bGBRQ"));
					if(rs.getString("bGBRQ")==null){
						zc.setBGBRQ("");
					}
					
					zc.setBQQZC(rs.getString("bQQZC"));
					if(rs.getString("bQQZC")==null){
						zc.setBQQZC("");
					}
					zc.setBSWZC(rs.getString("bSWZC"));
					if(rs.getString("bSWZC")==null){
						zc.setBSWZC("");
					}
					zc.setBSXFW(rs.getString("bSXFW"));
					if(rs.getString("bSXFW")==null){
						zc.setBSXFW("");
					}
					zc.setBSXRQ(rs.getString("bSXRQ"));
					if(rs.getString("bSXRQ")==null){
						zc.setBSXRQ("");
					}
					zc.setBTGRQ(rs.getString("bTGRQ"));
					if(rs.getString("bTGRQ")==null){
						zc.setBTGRQ("");
					}
					zc.setBTTZLYB(rs.getString("bTTZLYB"));
					if(rs.getString("bTTZLYB")==null){
						zc.setBTTZLYB("");
					}
					zc.setBZCFL(rs.getString("bZCFL"));
					if(rs.getString("bZCFL")==null){
						zc.setBZCFL("");
					}
					zc.setBZDJG(rs.getString("bZDJG"));
					if(rs.getString("bZDJG")==null){
						zc.setBZDJG("");
					}
					
					zc.setZCID(rs.getString("zCID"));
					if(rs.getString("zCID")==null){
						zc.setZCID("");
					}
					zc.setZCMC(rs.getString("zCMC"));
					if(rs.getString("zCMC")==null){
						zc.setZCMC("");
					}
					zc.setZFBRID(rs.getString("zFBRID"));
					if(rs.getString("zFBRID")==null){
						zc.setZFBRID("");
					}
					zc.setZCWH(rs.getString("zCWH"));
					if(rs.getString("zCWH")==null){
						zc.setZCWH("");
					}
					zc.setZSHRID(rs.getString("zSHRID"));
					if(rs.getString("zSHRID")==null){
						zc.setZSHRID("");
					}
					zc.setZSHZT(rs.getString("zSHZT"));
					if(rs.getString("zSHZT")==null){
						zc.setZSHZT("");
					}
					zc.setZSXZTW(rs.getString("zSXZTW"));
					if(rs.getString("zSXZTW")==null){
						zc.setZSXZTW("");
					}
					zc.setQqtag(rs.getString("qqtag"));
					if(rs.getString("qqtag")==null){
						zc.setQqtag("");
					}
					zc.setSwtag(rs.getString("swtag"));
					if(rs.getString("swtag")==null){
						zc.setSwtag("");
					}
					zc.setSxtag(rs.getString("sxtag"));
					if(rs.getString("sxtag")==null){
						zc.setSwtag("");
					}
					zc.setBz(rs.getString("bbz"));
					if(rs.getString("bbz")==null){
						zc.setBz("");
					}
					zc.setZCFLMC(rs.getString("ZCFLMC"));
					if(rs.getString("ZCFLMC")==null){
						zc.setZCFLMC("");
					}
					zc.setTTZLYMC(rs.getString("TTZLYMC"));
					if(rs.getString("TTZLYMC")==null){
						zc.setTTZLYMC("");
					}
					zc.setBBBXSMC(rs.getString("BBBXSMC"));
					if(rs.getString("BBBXSMC")==null){
						zc.setBBBXSMC("");
					}
					zc=zcgjz(con,zc);
					zc=zcztc(con,zc);
					zc.setZdjgmc(zdjglist(con,zc.getBZDJG()));
					zc.setSxfwmc(sxfwlist(con,zc.getBSXFW()));
					zc.setSwzcmc(zcmclist(con,zc.getBSWZC()));
					zc.setQqzcmc(zcmclist(con,zc.getBQQZC()));
						
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
	
		
		return zc;
		
	}
	
	/**
	 * 
	 * 方法说明：查找政策关键字
	 * 方法名：zcgjz
	 * @param con
	 * @param zc
	 * @return 
	 * 返回值：ZC
	 */
	private static ZC zcgjz(Connection con,ZC zc){
		String sql = "Select * From GJZB WHERE ZCID=?";
		ResultSet rs = null;
		PreparedStatement stmt =null;
		ArrayList<GJZ> gjzlist = new ArrayList<GJZ>();
		try {
			stmt=con.prepareStatement(sql);
			stmt.setString(1, zc.getZCID());
			rs=stmt.executeQuery();
			while(rs.next()){
				GJZ gjz = new GJZ();
				gjz.setGid(rs.getString("gid"));
				gjz.setGjz(rs.getString("gjz"));
				gjz.setZcid(rs.getString("zcid"));
				gjzlist.add(gjz);
				zc.setGjz(gjzlist);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return zc;
	}
	/**
	 * 
	 * 方法说明：查找政策主题词
	 * 方法名：zcztc
	 * @param con
	 * @param zc
	 * @return 
	 * 返回值：ZC
	 */
	private static ZC zcztc(Connection con,ZC zc){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<ZTC> ztclist = new ArrayList<ZTC>();
		String sql = "Select * from ZTCVIEW where zcid=?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, zc.getZCID());
			rs=stmt.executeQuery();
			while(rs.next()){
				ZTC ztc = new ZTC();
				ztc.setZcid(rs.getString("zcid"));
				ztc.setZid(rs.getString("zid"));
				ztc.setZtc(rs.getString("name"));
				ztc.setZtcid(rs.getInt("id"));
				ztclist.add(ztc);
				zc.setZtc(ztclist);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return zc;
	}
	
	/**
	 * zcmc串
	 * @param con
	 * @param zc
	 * @return
	 */
	
	 public static String zcmclist(Connection con,String arg){
		if(!"".equals(arg)){
			String zcwhlist[]=arg.split(";");
			String zcmc = "";
			int i=0;
			for(String zcwh:zcwhlist){
				i++;
				String sql = "select * from MyByView where ZCWH = ?";
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				try {
					stmt=con.prepareStatement(sql);
					stmt.setString(1, zcwh);
					rs=stmt.executeQuery();
					if(rs.next()){
						if(i==1)
							zcmc+=i+"、"+rs.getString("zcmc");
						else
							zcmc+="<br />"+i+"、"+rs.getString("zcmc");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return zcmc;
			
		}
		else
			return "";
		
	}
	
	/**
	 * 查询制定机关的名称
	 * @param con
	 * @param arg
	 * @return
	 */
	public static String zdjglist(Connection con,String arg){
		if(!arg.equals("")){
			String zdjglist[]=arg.split(";");
			String zdjg = "";
			int i=0;
			for(String zdjgid:zdjglist){
				i++;
				String sql = "select * from ZDJGB where zid = ?";
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				try {
					stmt=con.prepareStatement(sql);
					stmt.setInt(1, Integer.parseInt(zdjgid));
					rs=stmt.executeQuery();
					if(rs.next()){
						if(i==1)
							zdjg+=rs.getString("ZDJGMC");
						else
							zdjg+=";"+rs.getString("ZDJGMC");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return zdjg;
			
			
		}
		else
			return "";
		
	}
	public static String sxfwlist(Connection con,String arg){
		if(!arg.equals("")){
			String sxfwlist[]=arg.split(";");
			String sxfw = "";
			int i=0;
			for(String sxfwid:sxfwlist){
				i++;
				String sql = "select * from sxfwb where SSXFWID = ?";
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				try {
					stmt=con.prepareStatement(sql);
					stmt.setString(1, sxfwid);
					rs=stmt.executeQuery();
					if(rs.next()){
						if(i==1)
							sxfw+=rs.getString("SSXFWMC");
						else
							sxfw+=";"+rs.getString("SSXFWMC");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return sxfw;
			
			
		}
		else
			return "";
		
	}

	/**
	 * 
	 * 方法说明：查找政策名称
	 * 方法名：zcmc
	 * @param con
	 * @param zcmc
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> checkZCMC(Connection con , String zcmc){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ZC  zc = new ZC();
		ArrayList<ZC>  zclist = new ArrayList<ZC>();
		String sql = "select * from MyByView where ZCMC = ?";
		try {
			stmt=con.prepareStatement(sql);
			stmt.setString(1, zcmc);
			rs=stmt.executeQuery();
			while(rs.next()){
				zc.setZCMC(rs.getString("zcmc"));
				zc.setZCID(rs.getString("zcid"));
				zc.setBGBRQ(rs.getString("BGBRQ"));
				zclist.add(zc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zclist;
	}
	/**
	 * 
	 * 方法说明：检查上位前驱
	 * 方法名：checkSWQQ
	 * @param con
	 * @param zcwh
	 * @return 
	 * 返回值：int
	 */
	public static int checkSWQQ(Connection con , String zcwh){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from ZCView where zcwh = ?";
		try {
			stmt=con.prepareStatement(sql);
			stmt.setString(1, zcwh);
			rs=stmt.executeQuery();
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	public static ArrayList<ZC> zcmc(Connection con , String zcmc){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ZC  zc = new ZC();
		ArrayList<ZC>  zclist = new ArrayList<ZC>();
		String sql = "select * from ZCView where ZCMC LIKE ?";
		try {
			stmt=con.prepareStatement(sql);
			stmt.setString(1, "%"+zcmc+"%");
			rs=stmt.executeQuery();
			while(rs.next()){
				zc.setZCMC(rs.getString("zcmc"));
				zc.setZCID(rs.getString("zcid"));
				zc.setBGBRQ(rs.getString("BGBRQ"));
				zclist.add(zc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zclist;
	}
	
	/**
	 * 
	 * 方法说明：查找政策ID对应的ZC
	 * 方法名：zcid
	 * @param con
	 * @param zcid
	 * @return 
	 * 返回值：ArrayList<ZC>
	 */
	public static ArrayList<ZC> zcid(Connection con , String zcid){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ZC  zc = new ZC();
		ArrayList<ZC>  zclist = new ArrayList<ZC>();
		
		String sql = "select * from MyByView where zcwh=?";
		try {
			stmt=con.prepareStatement(sql);
			stmt.setString(1, zcid);
			rs=stmt.executeQuery();
			while(rs.next()){
				zc.setZCMC(rs.getString("zcmc"));
				zc.setZCID(rs.getString("zcid"));
				zc.setBGBRQ(rs.getString("BGBRQ"));
				zclist.add(zc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zclist;
	}
	
	/**
	 * 
	 * 方法说明：修订政策
	 * 方法名：xdzc
	 * @param con
	 * @param fbrid
	 * @param zcid
	 * @param swzc
	 * @param qqzc
	 * @param sxztw
	 * @param fzrq 
	 * 返回值：void
	 */
	public static void xdzc(Connection con,String fbrid,String zcid,String swzc,String qqzc,String sxztw,String fzrq,String lasttime){
		CallableStatement c =null;
		String sql = "{call xdzc (?,?,?,?,?,?,?)} ";
		try {
			c = con.prepareCall(sql);
			c.setString(1, fbrid);
			c.setString(2, zcid);
			c.setString(3, swzc);
			c.setString(4, qqzc);
			c.setString(5, sxztw);
			c.setString(6, fzrq);
			c.setString(7, lasttime);
			c.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String tj(Connection con, String yhid) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String countth = "";
		String countdsh="";
		String countdby="";
		
		String th = "select COUNT(*) th from ZCB where ZFBRID=? and ZSHZT='退回'";
		String dsh = "select COUNT(*) dsh from ZCB where ZFBRID=? and ZSHZT='待审核'";
		String dby = "select COUNT(*) dby from ZCB where ZFBRID=? and ZSHZT='待标引'";
		try {
			stmt=con.prepareStatement(th);
			stmt.setString(1, yhid);
			rs=stmt.executeQuery();
			if(rs.next()){
				countth=rs.getString("th");
			}
			stmt=con.prepareStatement(dsh);
			stmt.setString(1, yhid);
			rs=stmt.executeQuery();
			if(rs.next()){
				countdsh=rs.getString("dsh");
			}
			stmt=con.prepareStatement(dby);
			stmt.setString(1, yhid);
			rs=stmt.executeQuery();
			if(rs.next()){
				countdby=rs.getString("dby");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("th", countth);
		params.put("dby", countdsh);
		params.put("dsh", countdby);
		JSONArray msg = JSONArray.fromObject(params);
		String strmsg = msg.toString();
		return strmsg;
	}

}
