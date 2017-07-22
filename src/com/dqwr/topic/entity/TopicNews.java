package com.dqwr.topic.entity;

public class TopicNews {
  private int Id;
  private int TopicId;
  private String Title;
  private String Publisher;
  private String Content;
  private String Time;
  private String Toipcname;
  
public String getToipcname() {
	return Toipcname;
}
public void setToipcname(String toipcname) {
	Toipcname = toipcname;
}
  
public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
}
public int getTopicId() {
	return TopicId;
}
public void setTopicId(int topicId) {
	TopicId = topicId;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getPublisher() {
	return Publisher;
}
public void setPublisher(String publisher) {
	Publisher = publisher;
}
public String getContent() {
	return Content;
}
public void setContent(String content) {
	Content = content;
}
public String getTime() {
	return Time;
}
public void setTime(String time) {
	Time = time;
}
  
}
