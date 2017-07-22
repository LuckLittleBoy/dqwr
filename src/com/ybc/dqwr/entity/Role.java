package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 角色表
 */

public class Role
{
	private int id;//角色ID(主键、自定增长)
	private String name;//角色名称(唯一值)
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
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
	
}
