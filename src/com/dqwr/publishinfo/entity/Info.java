package com.dqwr.publishinfo.entity;

public class Info {
    private int InfoId;
    private String Title;
    private byte Type;
    private byte Scope;
    private String Content;
    private String CreatorId;
    private String AddDate;
    private int IsPass;
    private int Reject;
    private String Option;
    public int getIsPass() {
		return IsPass;
	}
	public void setIsPass(int isPass) {
		IsPass = isPass;
	}
	private String Opition;
	
	public int getInfoId() {
		return InfoId;
	}
	public void setInfoId(int infoId) {
		InfoId = infoId;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public byte getType() {
		return Type;
	}
	public void setType(byte type) {
		Type = type;
	}
	public byte getScope() {
		return Scope;
	}
	public void setScope(byte scope) {
		Scope = scope;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCreatorId() {
		return CreatorId;
	}
	public void setCreatorId(String creatorId) {
		CreatorId = creatorId;
	}
	public String getAddDate() {
		return AddDate;
	}
	public void setAddDate(String addDate) {
		AddDate = addDate;
	}
	public int getReject() {
		return Reject;
	}
	public void setReject(int reject) {
		Reject = reject;
	}
	public String getOption() {
		return Option;
	}
	public void setOption(String option) {
		Option = option;
	}
	
}
