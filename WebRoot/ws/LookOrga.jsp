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
              String orgaid=request.getParameter("orgaid"); 
			  ResultSet rs2;
			  DataBaseDao db=new DataBaseDao();
			  Connection conn=db.connection();
			  RequireDaoImpl requireimpl=new RequireDaoImpl();
			  OrgaDaoImpl  orgaimpl=new OrgaDaoImpl();
			%>
			<%
			   if(orgaid!="")
			   {
				   rs2=orgaimpl.SelectOrgaById(conn,orgaid);
				   rs2.next();
			%>
	
<div class="table-c">
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