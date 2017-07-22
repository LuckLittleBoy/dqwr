package com.dqwr.entity;

import java.util.List;
/**
 * 
 ************类说明**************
 * 类名：CDGJD
 * 实体类：菜单的根节点
 * 建类时间：2014-1-26 上午12:09:06
 * 类描述：菜单根节点
 */
public class CDGJD {
	private String cdid;
	private String cdnc;
	private String cdjb;
	private String url;
	private List<CD> cd22;//2级叶子结点
	private List<CD21> cd21;//2级非结点
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCdid() {
		return cdid;
	}
	public void setCdid(String cdid) {
		this.cdid = cdid;
	}
	public String getCdnc() {
		return cdnc;
	}
	public void setCdnc(String cdnc) {
		this.cdnc = cdnc;
	}
	public String getCdjb() {
		return cdjb;
	}
	public void setCdjb(String cdjb) {
		this.cdjb = cdjb;
	}
	public List<CD> getCd22() {
		return cd22;
	}
	public void setCd22(List<CD> cd22) {
		this.cd22 = cd22;
	}
	public List<CD21> getCd21() {
		return cd21;
	}
	public void setCd21(List<CD21> cd21) {
		this.cd21 = cd21;
	}
	
}
