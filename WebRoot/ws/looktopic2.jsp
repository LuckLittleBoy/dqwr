<%@ page language="java" contentType="text/html;charset=UTF-8" import="com.dqwr.topic.entity.Topic2"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Topic2 topic2=(Topic2)request.getAttribute("topic");
%>
<html>
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Calendar.js"></script>
</head>
<body>
  <div id="Topic" style="margin-left: 250px;">
    <div style="margin-left:240px;">
    <h2><font color="navy">专题查看</font></h2>
    </div>
    <div style="border-style:groove;width:600px;">
    <br>
           &nbsp;&nbsp;专题名称:&nbsp;&nbsp;<label><%=topic2.getTopicname() %></label><br><br>
           &nbsp;&nbsp;发布人:&nbsp;&nbsp;&nbsp;&nbsp;<label><%=topic2.getPublisher() %></label><br><br>
           &nbsp;&nbsp;发布时间:&nbsp;&nbsp;<label><%=topic2.getTime().substring(0,10) %></label><br><br>
    <br>
    </div>
  </div>      
</body>
</html>