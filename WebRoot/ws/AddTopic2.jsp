<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);
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
 <form id="topicadd" action="TopicAddServlet2" method="post">
  <div id="Topic" style="margin-left: 100px;">
    <div style="margin-left:200px;">
   <h2><font color="navy" >添加专题</font></h2>
   
    </div>
    <div style="border-style:groove;width:600px;">
    <br>
           &nbsp;&nbsp;专题名称:<input type="text" name="topicname" style="width:500px;"><br><br>
           &nbsp;&nbsp;发布人:&nbsp;&nbsp;<input type="text" name="publisher" style="width:500px;"><br><br>
           &nbsp;&nbsp;发布时间:<input  id="time" name="time" type="text" onclick="new Calendar().show(this);" readonly="readonly"><br><br>
    <br>
    </div>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <div align="left">
       <input type="submit" value="添加">
     </div>
  </div>      
 </form>
</body>
</html>