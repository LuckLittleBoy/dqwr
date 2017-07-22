<%@ page language="java" contentType="text/html;charset=UTF-8" 
    import="java.util.*"
    import="com.dqwr.topic.entity.TopicNews"
	import="java.sql.ResultSet" 
	import="com.dqwr.dao.*"
	import="java.sql.Connection"
	import="com.dqwr.topic.dao.impl.TopicDaoImpl"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专题活动查看</title>
</head>
<body>
<%
  String topicname = "";
  String topic = "";
  String publisher = "";
  String content = "";
  String time = "";
  int topicnewsid = Integer.parseInt(request.getParameter("topicnewsid"));
  DataBaseDao db=new DataBaseDao();
  Connection conn=db.connection();
  TopicDaoImpl  topicimpl=new TopicDaoImpl();
  ResultSet rs=topicimpl.SelectLookTopicNewsById(conn,topicnewsid);
  while(rs.next()){
	  topicname=rs.getString(7);
	  topic=rs.getString(4);
	  publisher=rs.getString(5);
	  content=rs.getString(3);
	  time=rs.getString(6);
  }
%>
<%
 String type = request.getParameter("type");
 if(type!=null&&type!="")
 {
 %>
 <div style="float: left;">
	<a href="qtzthd.jsp" style="color:blank;font-size:16px;margin-left:20px;">返回</a>
</div>
 <%
 }
 %>
  <div id="Topic">
    <div style="border-style:groove;width:600px;margin-left: 120px">
    <br>
           &nbsp;&nbsp;所属专题:&nbsp;&nbsp;<label style="font-weight: bold;"><%=topicname %></label><br><br> 
           &nbsp;&nbsp;活动标题:&nbsp;&nbsp;<label><%=topic %></label><br><br>
           &nbsp;&nbsp;发布人:&nbsp;&nbsp;&nbsp;&nbsp;<label><%=publisher %></label><br><br>
           &nbsp;&nbsp;发布时间:&nbsp;&nbsp;<label><%=time %></label><br><br>
           &nbsp;&nbsp;内容:<br>
           <label><%=content %></label>
    <br>
    </div>
  </div>      
</body>
</html>