<%@ page language="java" contentType="text/html;charset=UTF-8" import="com.dqwr.topic.entity.TopicNews"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
TopicNews topicnews=(TopicNews)request.getAttribute("topicnews");
String topicname=(String)request.getAttribute("topicname");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="Topic" style="margin-left: 250px;">
    <div style="margin-left:240px;">
    <h2><font color="navy">专题活动查看</font></h2>
    </div>
    <div style="border-style:groove;width:600px;">
    <br>
           &nbsp;&nbsp;所属专题:&nbsp;&nbsp;<label style="font-weight: bold;"><%=topicname %></label><br><br>
           &nbsp;&nbsp;活动标题:&nbsp;&nbsp;<label><%=topicnews.getTitle() %></label><br><br>
           &nbsp;&nbsp;发布人:&nbsp;&nbsp;&nbsp;&nbsp;<label><%=topicnews.getPublisher() %></label><br><br>
           &nbsp;&nbsp;发布时间:&nbsp;&nbsp;<label><%=topicnews.getTime().substring(0,10) %></label><br><br>
           &nbsp;&nbsp;内容:<br>
           <label><%=topicnews.getContent() %></label>
    <br>
    </div>
  </div>      
</body>
</html>