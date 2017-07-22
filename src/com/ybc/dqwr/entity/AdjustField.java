package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 调整领域表
 * 
 * 取值范围
	TID	TTZLYMC	         TBZ
	1	科技投入	
	2	税收激励	
	3	金融支持	
	4	政府采购	
	5	引进消化吸收再创新	
	6	创造和保护知识产权	
	7	人才队伍	
	8	教育与科普	
	9	科技创新基地与平台	
	10	加强统筹协调	
	11	其他	

 */

public class AdjustField
{
	private int id;//序号（主键）
	private String name;//调整领域名称
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
