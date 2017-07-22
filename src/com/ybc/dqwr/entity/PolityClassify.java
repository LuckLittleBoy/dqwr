package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 政策分类表
 * 
 * 取值范围
 * ZCFLMC	ZCFLMC	ZBZ
 * 1	国家法律	
 * 2	行政法规	
 * 3	地方性法规	
 * 4	国务院部门规章	
 * 5	地方政府规章	
 * 6	国家非立法性文件	
 * 7	地方非立法性文件	


 */

public class PolityClassify
{
	private int id;//政策ID（主键）
	private String name;//政策分类名称
	private String remark;//备注
	
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
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
}
