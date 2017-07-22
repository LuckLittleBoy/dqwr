package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 用户表
 */

public class User 
{
	private String id;//用户ID(主键)
	private String name;//用户昵称
	private String password;//密码
	private int roleId;//角色ID（外键）
	
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
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public int getRoleId()
	{
		return roleId;
	}
	public void setRoleId(int roleId)
	{
		this.roleId = roleId;
	}
	
}
