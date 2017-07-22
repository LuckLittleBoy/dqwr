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
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/upload1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){ 
		$("#shenhe").change(function(){
			if($(this).val()==0){
				$("#yijian").slideToggle();
			}
			if($(this).val()==1){
				$("#yijian").slideToggle();	
			}
			
		});
		
	});
	</script>
  </head>
  <body bgcolor="#ffffff">
          <% 
              String requid=request.getParameter("requid");
              String pagenp=request.getParameter("pageno");
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

<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
<div style="background: #C0E4FA;position: relative;" align="center">技术需求退回</div>
<div  align="center">
<%
   if(rs1.getString(14)!=null){
%>
  <font color="red">形式审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=rs1.getString(14) %></textarea><br>
  <br>
<%
   }
   if(rs1.getString(16)!=null){
%>
  <font color="red">技术审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=rs1.getString(16) %></textarea><br>
  <br>
<%  
   }
%>
</div>
</div>
  <table border="1" align="center" bgcolor="#FFFFFF">
   <tr>
     <td>机构代码</td>
     <td><input type="text" name="orgaid"  value=<%=rs2.getString(1)%>></td>
   </tr>
    <tr>
      <td>单位名称</td>
      <td><input type="text" name="organame"  style="width:300px;" value=<%=rs2.getString(2)%>>&nbsp&nbsp归口&nbsp&nbsp&nbsp<input type="text" name="orgaparentid"  value=<%=rs2.getString(3)%>>
      </td>
     </tr>
     <tr>
      <td>所属行业</td>
      <td><input type="text" name="industryid"  value=<%=rs2.getString(4)%>></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="legalperson"  value=<%=rs2.getString(5)%>>&nbsp&nbsp联系人&nbsp&nbsp&nbsp&nbsp<input type="text" name="contacts"  value=<%=rs2.getString(6)%>></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel"  value=<%=rs2.getString(7)%>>&nbsp&nbsp&nbsp&nbsp手机&nbsp<input type="text" name="cel"  value=<%=rs2.getString(8)%>></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="address"  style="width:300px;" value=<%=rs2.getString(9)%>>&nbsp;&nbsp;邮箱&nbsp;&nbsp;<input type="text" name="email"  value=<%=rs2.getString(10)%>></td>
     </tr>
     <tr>
      <td>网址</td>
      <td><input type="text" name="web"  value=<%=rs2.getString(11)%>></td>
     </tr>
     <tr>
     <td>单位性质</td>
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
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction" ><%=rs2.getString(14)%></textarea>
	</td>
     </tr>    
      <tr>
       <tr>
      <td>技术需求名称</td> 
      <td><input type="text" name="requname"  style="width:600px;" value=<%=rs1.getString(3)%>></td>
     </tr>
     <tr>
     <td>技术领域</td>
     <% 
      String field="";
      String[] fields=rs1.getString(4).split(";");
      for(int i=0;i<fields.length;i++){
    	 if(fields[i].equals("其他")){
    		 field+=rs1.getString(5)+";";
    	 }else{
    		 if(i==fields.length-1){
    			 field+=fields[i];
    		 }else{
    			field+=fields[i]+";"; 
    		 }
    	 } 
      }
      %>
      <td><%=field%></td>
     </tr>
     <tr>
     <td>技术应用行业</td>
     <td>
		<textarea cols="80" rows="8" name="industryid" ><%=rs1.getString(6)%></textarea>
	</td>
     </tr>
       <tr>
     <td>技术需求概述</td>
     <td>
		<textarea cols="80" rows="8" name="requoverview" ><%=rs1.getString(7)%></textarea>
	</td>
     </tr>     
     <tr>
       <td>关键字（1-5个）</td>
       <td><input type="text" name="keyword" style="height: 44px; width: 468px" value=<%=rs1.getString(8)%>></td>
     </tr>
      <tr>
     <td>需求技术拟应用情况</td>
     <td>
		<textarea cols="80" rows="8" name="application"><%=rs1.getString(9)%></textarea>
	</td>
     </tr>
     <tr> 
     <td>合作方式</td>
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
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px;" value=<%=rs1.getString(12)%>></td>
	</tr>             
  </table>
  <% 
			   }
  %>
  </body>
</html>
