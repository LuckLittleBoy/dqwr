package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 权限表
 */

public class Power
{
	private int roleId;//角色ID(外键)
	private int menuId;//菜单ID(外键)
	
	public int getRoleId()
	{
		return roleId;
	}
	public void setRoleId(int roleId)
	{
		this.roleId = roleId;
	}
	public int getMenuId()
	{
		return menuId;
	}
	public void setMenuId(int menuId)
	{
		this.menuId = menuId;
	}
	
}
