package com.ybc.dqwr.entity;

/**
 * @author 于步超
 * 施行范围表
 * 
 * 取值范围
	SSXFWID	    SPYJC	SSXFWMC
	000000	    ALL	全国地方（各省、市、自治区）
	110000 BJ	BJ	北京市
	120000 TJ	TJ	天津市
	130000 HE	HB	河北省
	140000 SX	SX	山西省
	150000 NM	NMG	内蒙古自治区
	210000 LN	LN	辽宁省
	220000 JL	JL	吉林省
	230000 HL	HLJ	黑龙江省
	310000 SH	SH	上海市
	320000 JS	JS	江苏省
	330000 ZJ	ZJ	浙江省
	340000 AH	AH	安徽省
	350000 FJ	FJ	福建省
	360000 JX	JX	江西省
	370000 SD	SD	山东省
	410000 HA	HN	河南省
	420000 HB	HB	湖北省
	430000 HN	HN	湖南省
	440000 GD	GD	广东省
	450000 GX	GX	广西壮族自治区
	460000 HI	HN	海南省
	500000 CQ	CQ	重庆市
	510000 SC	SC	四川省
	520000 GZ	GZ	贵州省
	530000 YN	YN	云南省
	540000 XZ	XZ	西藏自治区
 */

public class TakeScope
{
	private String id;//施行范围ID（主键）
	private String spell;//拼音简称
	private String name;//施行范围名称
	private String remark;//备注
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
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
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
	
}
