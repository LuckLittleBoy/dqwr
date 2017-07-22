package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 权限表
 */

public class Menu {
	private String id ;//菜单ID(主键、自定增长)
	private String name;//用户昵称(唯一值)
	private String level;//菜单级别
	private String url;//菜单链接
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getLevel()
	{
		return level;
	}
	public void setLevel(String level)
	{
		this.level = level;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	
}
