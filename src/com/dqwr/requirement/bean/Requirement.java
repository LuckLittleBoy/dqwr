package com.dqwr.requirement.bean;

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
    private String  FillTime;
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
	public String getFillTime() {
		return FillTime;
	}
	public void setFillTime(String fillTime) {
		FillTime = fillTime;
	}
}
