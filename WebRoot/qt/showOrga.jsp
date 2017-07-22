<%@ page language="java" import="java.util.*" 
    import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc;width: 540px;}
  .table-c table tr{height:50px;}
  .title{font-weight:bold;} 
      h3{font-style: italic;color:navy;}
  
  </style>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Requirement Analysis.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <%
         ResultSet orgas;
       	 String OrgaId=request.getParameter("OrgaId");
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
         orgas=orgaimpl.selectOrgaById(conn, OrgaId);
         orgas.next();
%> 
<body bgcolor="#ffffff">
<%
 String look = request.getParameter("look");
 if(look!=null&&look!="")
 {
 %>
 <div style="float: left;">
	<a href="qt/qtcx2.jsp?look=<%= look %>" style="color:blank;font-size:16px;margin-left:20px;line-height:30px;">返回</a>
</div>
 <%
 }
 %> 
<div class="table-c" style=" margin-bottom:150px">
<br>
     <center><h2><font color="navy">机构信息</font></h2></center>
 
   <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
   <tr>
     <td class="title">机构代码</td>
     <td colspan="3"><%=orgas.getString(1)%></td>
   </tr>
   <tr>
   <td class="title">单位名称</td>
   <td colspan="3"><%=orgas.getString(2) %></td>
   </tr>
   <tr>
   <td class="title">单位网址</td>
   <td colspan="3"><%=orgas.getString(11) %></td>
   </tr>
   <tr>
   <td class="title">单位法人</td>
   <td><%=orgas.getString(5) %></td><td class="title">联系人</td><td><%=orgas.getString(6)%></td>
   </tr>
   <tr>
      <td class="title">地址</td>
      <td><%=orgas.getString(9) %></td><td class="title">邮箱</td><td><%=orgas.getString(10)%></td>
     </tr>
     <tr>
      <td class="title">固话</td>
      <td><%=orgas.getString(7)%></td><td class="title">手机</td><td><%=orgas.getString(8)%></td>
     </tr>
     <tr>
     <td class="title">单位性质</td>
     <%
       byte[] nature=orgas.getBytes(12);
       int flag=0;
       String name=null;
       for(int i=0;i<nature.length;i++)
       {
    	   if(nature[i]==1){
    		   flag=i;
    	   } 
       }
       switch(flag){
       case 3:
    	   name="企业";
    	   break;
       case 2:
    	   name="高等院校";
    	   break;
       case 1:
    	   name="研究机构";
    	   break;
       case 0:
    	   name=orgas.getString(13);
    	   break;
       }
     %>
     <td colspan="3"><%=name%></td>
     </tr>
     <tr>
     <td class="title">单位简介</td>
     <td colspan="3">
		<%=orgas.getString(14)%>
	</td>
     </tr>
   </table>
  </div>
  <br>
</body>
