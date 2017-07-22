<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
    import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
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
  <style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc}
  .table-c table tr{height:50px;}
  .title{font-weight:bold;width:20%;} 
    h3{font-style: italic;color:navy;}
  
  </style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/upload1.js"></script>
  </head>
  <body bgcolor="#ffffff">
          <% 
              String requid=request.getParameter("requid"); 
			  ResultSet rs1,rs2;
			  DataBaseDao db=new DataBaseDao();
			  Connection conn=db.connection();
			  RequireDaoImpl requireimpl=new RequireDaoImpl();
			  OrgaDaoImpl  orgaimpl=new OrgaDaoImpl();
			  rs1=requireimpl.SelectRequireById(conn, Integer.parseInt(requid));
			%>
			<%
			   while(rs1.next())
			   {
				   rs2=orgaimpl.SelectOrgaById(conn,rs1.getString(2));
				   rs2.next();
			%>
	
<div class="table-c">
 <br>
       <center><h2><font color="navy">技术需求</font></h2></center>
    <table border="0" width="60%" align="center" bgcolor="#FFFFFF">   
       <tr>
      <td class="title">技术需求名称</td> 
      <td><%=rs1.getString(3)%></td>
     </tr>
     <tr>
     <td class="title">技术领域</td>
     <% 
      String field="";
      String[] fields=rs1.getString(4).split(";");
      for(int i=0;i<fields.length;i++){
    	 if(fields[i].equals("其他")){
    		 field+=rs1.getString(5);
    	 }else{
    		 field+=fields[i]+";";
    	 } 
      }
      %>
      <td><%=field%></td>
     </tr>
     <tr>
     <td class="title">技术应用行业</td>
     <td>
		<%=rs1.getString(6)%>
	</td>
     </tr>
       <tr>
     <td class="title">技术需求概述</td>
     <td>
		<%=rs1.getString(7)%></td>
     </tr>     
     <tr>
       <td class="title">关键字</td>
       <td><%=rs1.getString(8)%></td>
     </tr>
      <tr>
     <td class="title">需求技术拟应用情况</td>
     <td>
		<%=rs1.getString(9)%>
	</td>
     </tr>
     <tr> 
     <td class="title">合作方式</td>
     <%
       byte[] coop=rs1.getBytes(10);
       int flag1=0;
       String name1=null;
       for(int j=0;j<coop.length;j++)
       {
    	   if(coop[j]==1){
    		   flag1=j;
    	   } 
       }
       
       switch(flag1){
       case 0:
    	   name1="技术引进";
    	   break;
       case 1:
    	   name1="委托研发";
    	   break;
       case 2:
    	   name1="合作研发";
    	   break;
       case 3:
    	   name1=rs1.getString(11);
    	   break;
       }
     %> 
     <td><%=name1 %></td>
     </tr>
	<tr>
	   <td class="title">填报时间</td>
	   <td><%=rs1.getString(12)%></td>
	</tr>             
  </table>

 <br>
     <center><h2><font color="navy">单位信息</font></h2></center>
  <table border="0" width="60%" align="center" bgcolor="#FFFFFF">
   <tr>
     <td class="title">机构代码</td>
     <td colspan="3"><%=rs2.getString(1)%></td>
   </tr>
    <tr>
      <td class="title">单位名称</td>
      <td><%=rs2.getString(2)%></td><td class="title">归口&nbsp&nbsp&nbsp</td><td><%=rs2.getString(3)%></td>
     </tr>
     <tr>
      <td class="title">所属行业</td>
      <td><%=rs2.getString(4)%></td>
      <td class="title">单位法人</td>
      <td><%=rs2.getString(5)%></td>
     </tr>
     <tr>
      <td class="title">联系人</td><td colspan="3"><%=rs2.getString(6)%></td>
     </tr>
     <tr>
      <td class="title">固话</td><td><%=rs2.getString(7)%></td><td class="title">手机&nbsp</td><td><%=rs2.getString(8)%></td>
     </tr>
     <tr>
      <td class="title">地址</td>
      <td><%=rs2.getString(9)%></td><td class="title">邮箱&nbsp;&nbsp;</td><td><%=rs2.getString(10)%></td>
     </tr>
     <tr>
     <td class="title">网址</td>
     <td><%=rs2.getString(11)%></td>
     <td class="title">单位性质</td>
     <%
       byte[] nature=rs2.getBytes(12);
       int flag=0;
       String name=null;
       for(int i=0;i<nature.length;i++)
       {
    	   if(nature[i]==1){
    		   flag=i;
    	   } 
       }
       switch(flag){
       case 0:
    	   name="企业";
    	   break;
       case 1:
    	   name="高等院校";
    	   break;
       case 2:
    	   name="研究机构";
    	   break;
       case 3:
    	   name=rs2.getString(13);
    	   break;
       }
     %>
     <td><%=name%></td>
     </tr>
      <tr>
     <td class="title">单位简介</td>
     <td colspan="3">
		<%=rs2.getString(14)%></td>
     </tr> 
     </table>
  </div>
  <% 
      }
  %>
  </body>
  <br>
</html>
