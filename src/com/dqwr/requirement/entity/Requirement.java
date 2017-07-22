package com.dqwr.requirement.entity;

import java.sql.Date;

public class Requirement {
    private int RequId;
    private String OrgaId;
    private String RequName;
    private String FieldId;
    private String OtherField;
    private String IndustryID;
    private String RequOverview;
    private String Keyword;
    private String Application;
    private byte[] CooperationID;
    private String OtherCooperation;
    private String  FillTime;
    private int XSSH;
    private String XSSHYJ;
    private int JSSH;
    private String JSSHYJ;
    private int Reject;
    public String Username;
	public int getXSSH() {
		return XSSH;
	}
	public void setXSSH(int xSSH) {
		XSSH = xSSH;
	}
	public int getJSSH() {
		return JSSH;
	}
	public void setJSSH(int jSSH) {
		JSSH = jSSH;
	}
	public int getRequId() {
		return RequId;
	}
	public void setRequId(int requId) {
		RequId = requId;
	}
	public String getOrgaId() {
		return OrgaId;
	}
	public void setOrgaId(String orgaId) {
		OrgaId = orgaId;
	}
	public String getRequName() {
		return RequName;
	}
	public void setRequName(String requName) {
		RequName = requName;
	}
	public String getFieldId() {
		return FieldId;
	}
	public void setFieldId(String fieldId) {
		FieldId = fieldId;
	}
	public String getOtherField() {
		return OtherField;
	}
	public void setOtherField(String otherField) {
		OtherField = otherField;
	}
	public String getIndustryID() {
		return IndustryID;
	}
	public void setIndustryID(String industryID) {
		IndustryID = industryID;
	}
	public String getRequOverview() {
		return RequOverview;
	}
	public void setRequOverview(String requOverview) {
		RequOverview = requOverview;
	}
	public String getKeyword() {
		return Keyword;
	}
	public void setKeyword(String keyword) {
		Keyword = keyword;
	}
	public String getApplication() {
		return Application;
	}
	public void setApplication(String application) {
		Application = application;
	}
	public byte[] getCooperationID() {
		return CooperationID;
	}
	public void setCooperationID(byte[] cooperationID) {
		CooperationID = cooperationID;
	}
	
	public String getOtherCooperation() {
		return OtherCooperation;
	}
	public void setOtherCooperation(String otherCooperation) {
		OtherCooperation = otherCooperation;
	}
	public String getFillTime() {
		return FillTime;
	}
	public void setFillTime(String fillTime) {
		FillTime = fillTime;
	}
	public String getXSSHYJ() {
		return XSSHYJ;
	}
	public void setXSSHYJ(String xSSHYJ) {
		XSSHYJ = xSSHYJ;
	}
	public String getJSSHYJ() {
		return JSSHYJ;
	}
	public void setJSSHYJ(String jSSHYJ) {
		JSSHYJ = jSSHYJ;
	}
	public int getReject() {
		return Reject;
	}
	public void setReject(int reject) {
		Reject = reject;
	}
	public void setUsername(String username) {
		  Username = username;
	}
	public String getUsername() {
		// TODO Auto-generated method stub
		return Username;
	}
	
	
}
