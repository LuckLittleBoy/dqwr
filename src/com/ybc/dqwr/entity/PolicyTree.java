package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 政策树实体类
 */
public class PolicyTree
{
	private int id;
	private String policyId;
	private String parentPolicyId;
	private String name;
	private String isnew;
	
	public String getPolicyId()
	{
		return policyId;
	}
	public void setPolicyId(String policyId)
	{
		this.policyId = policyId;
	}
	public String getParentPolicyId()
	{
		return parentPolicyId;
	}
	public void setParentPolicyId(String parentPolicyId)
	{
		this.parentPolicyId = parentPolicyId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getIsnew()
	{
		return isnew;
	}
	public void setIsnew(String isnew)
	{
		this.isnew = isnew;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	
}
