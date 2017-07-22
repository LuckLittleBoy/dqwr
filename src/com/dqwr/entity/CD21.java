	package com.dqwr.entity;

import java.util.List;
/**
 * 
 ************类说明**************
 * 类名：CD21
 * 实体类：2级菜单
 * 建类时间：2014-1-25 下午11:40:27
 * 类描述：2级非结点
 */
public class CD21 {
	private String cdid;
	private String cdnc;
	private String cdjb;
	private List<CD> cd3;//三级菜单
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
	public List<CD> getCd3() {
		return cd3;
	}
	public void setCd3(List<CD> cd3) {
		this.cd3 = cd3;
	}

}
