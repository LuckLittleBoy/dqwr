 package com.satp.entity;

public class Policy {
	private String pno;
	private String pname;
	private String pcategories;
	private String pboundary;
	private String poffice;
	private String zcid;
	private String breaktime;
	private String publishtime;
	private String applytime;
	
	private int sxzt;
	private String pfield;
	private String pBBXS;
	
	public String getZcid() {
		return zcid;
	}
	public void setZcid(String zcid) {
		this.zcid = zcid;
	}
	private String polciycontent;
	
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcategories() {
		return pcategories;
	}
	public void setPcategories(String pcategories) {
		this.pcategories = pcategories;
	}
	public String getPboundary() {
		return pboundary;
	}
	public void setPboundary(String pboundary) {
		this.pboundary = pboundary;
	}
	public String getPoffice() {
		return poffice;
	}
	public void setPoffice(String poffice) {
		this.poffice = poffice;
	}
    
	public String getBreaktime() {
		return breaktime;
	}
	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}
	public String getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public String getApplytime() {
		return applytime;
	}
	public void setApplytime(String applytime) {
		this.applytime = applytime;
	}
	public String getPfield() {
		return pfield;
	}
	public void setPfield(String pfield) {
		this.pfield = pfield;
	}
	public String getpBBXS() {
		return pBBXS;
	}
	public void setpBBXS(String pBBXS) {
		this.pBBXS = pBBXS;
	}
	public int getSxzt() {
		return sxzt;
	}
	public void setSxzt(int sxzt) {
		this.sxzt = sxzt;
	}
	public String getPolciycontent() {
		return polciycontent;
	}
	public void setPolciycontent(String polciycontent) {
		this.polciycontent = polciycontent;
	}

	
}
