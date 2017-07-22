<%@ page language="java" contentType="text/html;charset=UTF-8" import="com.dqwr.topic.entity.Topic"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Topic topic=(Topic)request.getAttribute("topic");
String pageno=request.getParameter("pageno");
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
 <form id="topicupload" action="TopicEditServlet" method="post" enctype="multipart/form-data">
  <div id="Topic" style="margin-left: 350px;">
    <div style="margin-left:240px;">
    <h2><font color="blue">专题修改</font></h2>
    </div>
    <div style="border-style:groove;width:600px;">
    <br>
           &nbsp;&nbsp;专题名称:<input type="text" name="topicname" style="width:500px;" value=<%=topic.getTopicname() %>><br><br>
           &nbsp;&nbsp;发布人:&nbsp;&nbsp;<input type="text" name="publisher" style="width:500px;" value=<%=topic.getPublisher() %>><br><br>
           &nbsp;&nbsp;发布时间:<input  id="time" name="time" type="text" onclick="new Calendar().show(this);" value=<%=topic.getTime() %>><br><br>
           &nbsp;&nbsp;链接地址:<input type="text" name="link" style="width:500px;" value=<%=topic.getLink() %>><br><br>
           &nbsp;&nbsp; 图&nbsp;&nbsp;&nbsp;片:<input type="file" name="picture">
           <input type="text" name="picpath" value=<%=topic.getPicpath() %>>
           <input type="hidden" name="id" value=<%=topic.getId() %>>
           <input type="hidden" name="pageno" value=<%=pageno %>>
    <br>
    <br>
    </div>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div align="left">
       <input type="submit" value="修改">
     </div>
  </div>      
 </form>
</body>
</html>