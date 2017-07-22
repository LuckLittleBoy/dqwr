package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 制定机关表
 */

public class EvolveOffice
{
	private int id;//序号（主键）
	private String spell;//制定机关拼音简称
	private String name;//制定机关名称
	private String fullName;//制定机关名字全称
	private String shortName;//制定机关名字简称
	private String oldName;//制定机关原有名称
	private String department;//制定机关所属部门
	private String remark;//备注
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getSpell()
	{
		return spell;
	}
	public void setSpell(String spell)
	{
		this.spell = spell;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getFullName()
	{
		return fullName;
	}
	public void setFullName(String fullName)
	{
		this.fullName = fullName;
	}
	public String getShortName()
	{
		return shortName;
	}
	public void setShortName(String shortName)
	{
		this.shortName = shortName;
	}
	public String getOldName()
	{
		return oldName;
	}
	public void setOldName(String oldName)
	{
		this.oldName = oldName;
	}
	public String getDepartment()
	{
		return department;
	}
	public void setDepartment(String department)
	{
		this.department = department;
	}
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
	
}
