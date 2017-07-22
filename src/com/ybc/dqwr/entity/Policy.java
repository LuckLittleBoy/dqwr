package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 政策表
 */

public class Policy {
	private int id;//政策ID(主键、自定增长)
	private String policyId;//政策文号
	private String name;//政策名称(唯一值)
	private String content;//政策内容
	private String publishId;//发布人ID（外键）
	private String checkId;//审核人ID
	private String checkState;//审核状态（待审核，通过，保存，未通过，退回）
	private String failState;//政策失效状态位(0标识失效，1标识有效)缺省为1
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getPolicyId()
	{
		return policyId;
	}
	public void setPolicyId(String policyId)
	{
		this.policyId = policyId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getPublishId()
	{
		return publishId;
	}
	public void setPublishId(String publishId)
	{
		this.publishId = publishId;
	}
	public String getCheckId()
	{
		return checkId;
	}
	public void setCheckId(String checkId)
	{
		this.checkId = checkId;
	}
	public String getCheckState()
	{
		return checkState;
	}
	public void setCheckState(String checkState)
	{
		this.checkState = checkState;
	}
	public String getFailState()
	{
		return failState;
	}
	public void setFailState(String failState)
	{
		this.failState = failState;
	}	
}
