package com.ybc.dqwr.entity;

import java.util.Date;

/**
 * @author 于步超
 * 标引表
 */

public class Index
{
	private int id;//政策ID（外键）
	private int polityClassifyId;//政策分类(取值参照标引表)
	private String takeScope;//施行范围(取值参照标引表)
	private int issueShapeId;//颁布形式(取值参照标引表)
	private String evolveOffice;//制定机关(取值参照标引表)
	private Date passDate;//通过日期
	private Date publishDate;//公布日期
	private Date takeDate;//施行日期
	private String subject1;//主题词1
	private String subject2;
	private String subject3;
	private String subject4;
	private String subject5;
	private String keyword1;//关键词1
	private String keyword2;
	private String keyword3;
	private String keyword4;
	private String keyword5;
	private String keyword6;
	private String keyword7;
	private String keyword8;
	private String keyword9;
	private String keyword10;
	private String superior;//上位政策(要求录入政策文号)
	private String precursor;//前驱政策(要求录入政策文号)
	private String succeed;//后继政策(要求录入政策文号)
	private String textBody;//文件正文（保存文件WORD文档正文位置）
	private int pdf;//是否保存PDF文档（是否保存PDF文档,0没有，1有）
	private String remark;//备注字段
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPolityClassifyId()
	{
		return polityClassifyId;
	}
	public void setPolityClassifyId(int polityClassifyId)
	{
		this.polityClassifyId = polityClassifyId;
	}
	public String getTakeScope()
	{
		return takeScope;
	}
	public void setTakeScope(String takeScope)
	{
		this.takeScope = takeScope;
	}
	public int getIssueShapeId()
	{
		return issueShapeId;
	}
	public void setIssueShapeId(int issueShapeId)
	{
		this.issueShapeId = issueShapeId;
	}
	public String getEvolveOffice()
	{
		return evolveOffice;
	}
	public void setEvolveOffice(String evolveOffice)
	{
		this.evolveOffice = evolveOffice;
	}
	public Date getPassDate()
	{
		return passDate;
	}
	public void setPassDate(Date passDate)
	{
		this.passDate = passDate;
	}
	public Date getPublishDate()
	{
		return publishDate;
	}
	public void setPublishDate(Date publishDate)
	{
		this.publishDate = publishDate;
	}
	public Date getTakeDate()
	{
		return takeDate;
	}
	public void setTakeDate(Date takeDate)
	{
		this.takeDate = takeDate;
	}
	public String getSubject1()
	{
		return subject1;
	}
	public void setSubject1(String subject1)
	{
		this.subject1 = subject1;
	}
	public String getSubject2()
	{
		return subject2;
	}
	public void setSubject2(String subject2)
	{
		this.subject2 = subject2;
	}
	public String getSubject3()
	{
		return subject3;
	}
	public void setSubject3(String subject3)
	{
		this.subject3 = subject3;
	}
	public String getSubject4()
	{
		return subject4;
	}
	public void setSubject4(String subject4)
	{
		this.subject4 = subject4;
	}
	public String getSubject5()
	{
		return subject5;
	}
	public void setSubject5(String subject5)
	{
		this.subject5 = subject5;
	}
	public String getKeyword1()
	{
		return keyword1;
	}
	public void setKeyword1(String keyword1)
	{
		this.keyword1 = keyword1;
	}
	public String getKeyword2()
	{
		return keyword2;
	}
	public void setKeyword2(String keyword2)
	{
		this.keyword2 = keyword2;
	}
	public String getKeyword3()
	{
		return keyword3;
	}
	public void setKeyword3(String keyword3)
	{
		this.keyword3 = keyword3;
	}
	public String getKeyword4()
	{
		return keyword4;
	}
	public void setKeyword4(String keyword4)
	{
		this.keyword4 = keyword4;
	}
	public String getKeyword5()
	{
		return keyword5;
	}
	public void setKeyword5(String keyword5)
	{
		this.keyword5 = keyword5;
	}
	public String getKeyword6()
	{
		return keyword6;
	}
	public void setKeyword6(String keyword6)
	{
		this.keyword6 = keyword6;
	}
	public String getKeyword7()
	{
		return keyword7;
	}
	public void setKeyword7(String keyword7)
	{
		this.keyword7 = keyword7;
	}
	public String getKeyword8()
	{
		return keyword8;
	}
	public void setKeyword8(String keyword8)
	{
		this.keyword8 = keyword8;
	}
	public String getKeyword9()
	{
		return keyword9;
	}
	public void setKeyword9(String keyword9)
	{
		this.keyword9 = keyword9;
	}
	public String getKeyword10()
	{
		return keyword10;
	}
	public void setKeyword10(String keyword10)
	{
		this.keyword10 = keyword10;
	}
	public String getSuperior()
	{
		return superior;
	}
	public void setSuperior(String superior)
	{
		this.superior = superior;
	}
	public String getPrecursor()
	{
		return precursor;
	}
	public void setPrecursor(String precursor)
	{
		this.precursor = precursor;
	}
	public String getSucceed()
	{
		return succeed;
	}
	public void setSucceed(String succeed)
	{
		this.succeed = succeed;
	}
	public String getTextBody()
	{
		return textBody;
	}
	public void setTextBody(String textBody)
	{
		this.textBody = textBody;
	}
	public int getPdf()
	{
		return pdf;
	}
	public void setPdf(int pdf)
	{
		this.pdf = pdf;
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
