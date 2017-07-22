package com.dqwr.entity;

import java.util.ArrayList;
/**
 * 
 ************类说明**************
 * 类名：ZC
 * 实体类：政策
 * 建类时间：2014-4-13 下午5:22:46
 * 类描述：
 */
public class ZC {
	private String zcnr;//政策内容
	private String ZCID	;
	private String BZCFL;/*政策分类*/
	private String ZCFLMC;
	private String BSXFW;/*施行范围*/
	
	private String BBBXS;/*颁布形式*/
	private String BBBXSMC;
	private String BTTZLYB;/*调整领域*/
	private String TTZLYMC;
	private String BZDJG;/*制定机关*/
	
	private String BTGRQ;/*通过日期*/
	private String BGBRQ;/*公布人气*/
	private String BFZRQ;/*废止日期*/
	private String BSXRQ;/*施行日期*/
	private String BSWZC;/*上位政策*/
	private String BQQZC;/*前驱政策*/
	private String bz;
	private String ZCWH;/*政策文号*/
	private String ZCMC;/*政策名称*/
	private String ZFBRID;/*政策发布人*/
	private String ZSHRID;/*政策审核人*/
	private String ZSXZTW;/*政策是否失效*/
	private String ZSHZT;/*政策状态*/
	private String swtag;
	private String qqtag;
	private String sxtag;
	ArrayList<GJZ> gjz;
	ArrayList<ZTC> ztc;
	private String zdjgmc;
	private String sxfwmc;
	private String lasttime;
	private String swzcmc;
	private String qqzcmc;
	private String yqqzc;
	private String yswzc;
	private String yswzcmc;
	private String yqqzcmc;
	
	public String getYswzcmc() {
		return yswzcmc;
	}
	public void setYswzcmc(String yswzcmc) {
		this.yswzcmc = yswzcmc;
	}
	public String getYqqzcmc() {
		return yqqzcmc;
	}
	public void setYqqzcmc(String yqqzcmc) {
		this.yqqzcmc = yqqzcmc;
	}
	public String getYqqzc() {
		return yqqzc;
	}
	public void setYqqzc(String yqqzc) {
		this.yqqzc = yqqzc;
	}
	public String getYswzc() {
		return yswzc;
	}
	public void setYswzc(String yswzc) {
		this.yswzc = yswzc;
	}
	public String getSwzcmc() {
		return swzcmc;
	}
	public void setSwzcmc(String swzcmc) {
		this.swzcmc = swzcmc;
	}
	public String getQqzcmc() {
		return qqzcmc;
	}
	public void setQqzcmc(String qqzcmc) {
		this.qqzcmc = qqzcmc;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public String getZdjgmc() {
		return zdjgmc;
	}
	public void setZdjgmc(String zdjgmc) {
		this.zdjgmc = zdjgmc;
	}
	public String getSxfwmc() {
		return sxfwmc;
	}
	public void setSxfwmc(String sxfwmc) {
		this.sxfwmc = sxfwmc;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSwtag() {
		return swtag;
	}
	public void setSwtag(String swtag) {
		this.swtag = swtag;
	}
	public String getQqtag() {
		return qqtag;
	}
	public void setQqtag(String qqtag) {
		this.qqtag = qqtag;
	}
	public String getSxtag() {
		return sxtag;
	}
	public void setSxtag(String sxtag) {
		this.sxtag = sxtag;
	}
	public ArrayList<GJZ> getGjz() {
		return gjz;
	}
	public void setGjz(ArrayList<GJZ> gjz) {
		this.gjz = gjz;
	}
	public ArrayList<ZTC> getZtc() {
		return ztc;
	}
	public void setZtc(ArrayList<ZTC> ztc) {
		this.ztc = ztc;
	}
	public String getZCWH() {
		return ZCWH;
	}
	public void setZCWH(String zCWH) {
		ZCWH = zCWH;
	}
	public String getZCMC() {
		return ZCMC;
	}
	public void setZCMC(String zCMC) {
		ZCMC = zCMC;
	}
	public String getZFBRID() {
		return ZFBRID;
	}
	public void setZFBRID(String zFBRID) {
		ZFBRID = zFBRID;
	}
	public String getZSHRID() {
		return ZSHRID;
	}
	public void setZSHRID(String zSHRID) {
		ZSHRID = zSHRID;
	}
	public String getZSXZTW() {
		return ZSXZTW;
	}
	public void setZSXZTW(String zSXZTW) {
		ZSXZTW = zSXZTW;
	}
	public String getZSHZT() {
		return ZSHZT;
	}
	public void setZSHZT(String zSHZT) {
		ZSHZT = zSHZT;
	}
	public String getZCFLMC() {
		return ZCFLMC;
	}
	public void setZCFLMC(String zCFLMC) {
		ZCFLMC = zCFLMC;
	}

	public String getBBBXSMC() {
		return BBBXSMC;
	}
	public void setBBBXSMC(String bBBXSMC) {
		BBBXSMC = bBBXSMC;
	}
	public String getTTZLYMC() {
		return TTZLYMC;
	}
	public void setTTZLYMC(String tTZLYMC) {
		TTZLYMC = tTZLYMC;
	}

	public String getBTTZLYB() {
		return BTTZLYB;
	}
	public void setBTTZLYB(String bTTZLYB) {
		BTTZLYB = bTTZLYB;
	}
	public String getZCID() {
		return ZCID;
	}
	public void setZCID(String zCID) {
		ZCID = zCID;
	}
	public String getBZCFL() {
		return BZCFL;
	}
	public void setBZCFL(String bZCFL) {
		BZCFL = bZCFL;
	}
	public String getBSXFW() {
		return BSXFW;
	}
	public void setBSXFW(String bSXFW) {
		BSXFW = bSXFW;
	}
	public String getBBBXS() {
		return BBBXS;
	}
	public void setBBBXS(String bBBXS) {
		BBBXS = bBBXS;
	}
	public String getBZDJG() {
		return BZDJG;
	}
	public void setBZDJG(String bZDJG) {
		BZDJG = bZDJG;
	}
	public String getBTGRQ() {
		return BTGRQ;
	}
	public void setBTGRQ(String bTGRQ) {
		BTGRQ = bTGRQ;
	}
	public String getBGBRQ() {
		return BGBRQ;
	}
	public void setBGBRQ(String bGBRQ) {
		BGBRQ = bGBRQ;
	}
	public String getBFZRQ() {
		return BFZRQ;
	}
	public void setBFZRQ(String bFZRQ) {
		BFZRQ = bFZRQ;
	}
	public String getBSXRQ() {
		return BSXRQ;
	}
	public void setBSXRQ(String bSXRQ) {
		BSXRQ = bSXRQ;
	}
	public String getBSWZC() {
		return BSWZC;
	}
	public void setBSWZC(String bSWZC) {
		BSWZC = bSWZC;
	}
	public String getBQQZC() {
		return BQQZC;
	}
	public void setBQQZC(String bQQZC) {
		BQQZC = bQQZC;
	}
	

	public String getZcnr() {
		return zcnr;
	}
	public void setZcnr(String zcnr) {
		this.zcnr = zcnr;
	}
	
}
