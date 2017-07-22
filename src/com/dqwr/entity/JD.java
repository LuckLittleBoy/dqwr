package com.dqwr.entity;
import java.util.ArrayList;
public class JD {
	private String id;
	private String jdcontent;//解读内容
	private String title;//解读标题
	private String whos;//发布人
	private String times;//发布时间
	private String click;//点击次数
   
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id= id;
	}
	public String getJdcontent() {
		return jdcontent;
	}
	public void setJdcontent(String jdcontent) {
		this.jdcontent= jdcontent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWhos() {
		return whos;
	}
	public void setWhos(String whos) {
		this.whos = whos;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
}
