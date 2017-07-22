package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 颁布形式表
 * 取值范围
	BID	BBBXSMC	                        ZBZ
	1	国家主席令（法律）	
	2	国务院令（行政法规）	
	3	地方人民代表大会主席团或者常务委员会公告（地方性法规）	
	4	部门首长令（部门规章）	
	5	地方首长令（地方政府规章）	
	6	下发文件（非立法性文件）	

 */

public class IssueShape
{
	private int id;//序号（主键）
	private String name;//颁布形式名称
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
