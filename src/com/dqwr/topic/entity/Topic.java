package com.dqwr.topic.entity;

public class Topic {
 private int id;
 private String topicname;
 private String publisher;
 private String time;
 private String link;
 private String picpath;
 private int display;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTopicname() {
	return topicname;
}
public void setTopicname(String topicname) {
	this.topicname = topicname;
}
public String getPublisher() {
	return publisher;
}
public void setPublisher(String publisher) {
	this.publisher = publisher;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getLink() {
	return link;
}
public void setLink(String link) {
	this.link = link;
}
public String getPicpath() {
	return picpath;
}
public void setPicpath(String picpath) {
	this.picpath = picpath;
}
public int getDisplay() {
	return display;
}
public void setDisplay(int display) {
	this.display = display;
}
}
