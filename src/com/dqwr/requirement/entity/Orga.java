package com.dqwr.requirement.entity;

public class Orga {
   private String OrgaId;
   private String OrgaName;
   private String OrgaParentId;
   private String IndustryID;
   private String LegalPerson;
   private String Contacts;
   private String Tel;
   private String Cel;
   private String Address;
   private String Email;
   private String Web;
   private byte[] NatureID;
   private String OtherNature;
   private String Introduction;
   public String Username;
public String getOrgaId() {
	return OrgaId;
}
public void setOrgaId(String orgaId) {
	OrgaId = orgaId;
}
public String getOrgaName() {
	return OrgaName;
}
public void setOrgaName(String orgaName) {
	OrgaName = orgaName;
}
public String getOrgaParentId() {
	return OrgaParentId;
}
public void setOrgaParentId(String orgaParentId) {
	OrgaParentId = orgaParentId;
}
public String getIndustryID() {
	return IndustryID;
}
public void setIndustryID(String industryID) {
	IndustryID = industryID;
}
public String getLegalPerson() {
	return LegalPerson;
}
public void setLegalPerson(String legalPerson) {
	LegalPerson = legalPerson;
}
public String getContacts() {
	return Contacts;
}
public void setContacts(String contacts) {
	Contacts = contacts;
}
public String getTel() {
	return Tel;
}
public void setTel(String tel) {
	Tel = tel;
}
public String getCel() {
	return Cel;
}
public void setCel(String cel) {
	Cel = cel;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getWeb() {
	return Web;
}
public void setWeb(String web) {
	Web = web;
}

public byte[] getNatureID() {
	return NatureID;
}
public void setNatureID(byte[] natureID) {
	NatureID = natureID;
}
public String getOtherNature() {
	return OtherNature;
}
public void setOtherNature(String otherNature) {
	OtherNature = otherNature;
}
public String getIntroduction() {
	return Introduction;
}
public void setIntroduction(String introduction) {
	Introduction = introduction;
}
public void setUsername(String username) {
	// TODO Auto-generated method stub
	Username=username;
}
public String getUsername() {
	return Username;
}
 
}
