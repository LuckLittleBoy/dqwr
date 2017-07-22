<%@ page language="java" import="java.util.*,com.dqwr.requirement.entity.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="js/Calendar.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body bgcolor="#6CA6CD">
  <div align="center" style="margin: 5px 0px 0px 0px;background-color: white;">
  <%
    Orga orga=(Orga)request.getAttribute("orga");
    Requirement require=(Requirement)request.getAttribute("require");
    String pageno=request.getParameter("pageno");
    String flag1=request.getParameter("flag");
  %>
  <form action="EditRequire?orgaid=<%=orga.getOrgaId() %>&requid=<%=require.getRequId() %>&flag=<%=flag1 %>&pageno=<%=pageno %>" method="post" >
  <table border="1" align="center" bgcolor="#FFFFFF">
   <tr>
     <td>机构代码</td>
     <td><input type="text" name="orgaid" value=<%=orga.getOrgaId() %>></td>
   </tr>
    <tr>
      <td>单位名称</td>
      <td><input type="text" name="organame" value=<%=orga.getOrgaName() %>>&nbsp;&nbsp;归口&nbsp;&nbsp;&nbsp;<input type="text" name="orgaparentid" value=<%=orga.getOrgaParentId() %>>
      </td>
     </tr>
     <tr>
      <td>所属行业</td>
      <td><input type="text" name="industryid" value=<%=orga.getIndustryID() %>></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="legalperson" value=<%=orga.getLegalPerson() %>>&nbsp;&nbsp;联系人&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="contacts" value=<%=orga.getContacts() %>></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel" value=<%=orga.getTel() %>>&nbsp;&nbsp;&nbsp;&nbsp;手机&nbsp;<input type="text" name="cel" value=<%=orga.getCel() %>></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="address" value=<%=orga.getAddress() %>>&nbsp;&nbsp;邮箱&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" value=<%=orga.getEmail() %>></td>
     </tr>
     <tr>
      <td>网址</td>
      <td><input type="text" name="web" value=<%=orga.getWeb() %>></td>
     </tr>
     <td>单位性质</td>
     <td>
     <% 
     byte[] nature=orga.getNatureID();
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
  	   name="其他";
  	   break;
     }
          
     %>
     <% 
        if(name.equals("企业")){
     %>
        <input type="radio" name="natureid" value="企业" checked="checked">企业
     <%
        }else{
     %>
        <input type="radio" name="natureid" value="企业">企业
     <%
        }
     %> 
     <% 
        if(name.equals("高等院校")){
     %>
        <input type="radio" name="natureid" value="高等院校" checked="checked">高等院校
     <%
        }else{
     %>
        <input type="radio" name="natureid" value="高等院校">高等院校
     <%
        }
     %> 
     <% 
        if(name.equals("研究机构")){
     %>
        <input type="radio" name="natureid" value="研究机构" checked="checked">研究机构
     <%
        }else{
     %>
       <input type="radio" name="natureid" value="研究机构">研究机构
     <%
        }
     %> 
     <% 
        if(name.equals("其他")){
     %>
        <input type="radio" name="natureid" value="其他" checked="checked">其他，请注明<input type="text" name="othernature" style="width: 117px; " value=<%=orga.getOtherNature() %>>
     <%
        }else{
     %>
       <input type="radio" name="natureid" value="其他">其他，请注明<input type="text" name="othernature" style="width: 117px; ">
     <%
        }
     %> 
     </td>
     </tr>
      <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction"><%=orga.getIntroduction() %></textarea>
	</td>
     </tr>    
      <tr>
       <tr>
      <td>技术需求名称</td> 
      <td><input type="text" name="requname" value=<%=require.getRequName() %>></td>
     </tr>
     <tr>
     <td>技术领域</td>
     <td>
     <% 
       String field=require.getFieldId();
       int field1=0,field2=0,field3=0,field4=0,field5=0,field6=0,field7=0,field8=0,field9=0;
       String[] fieldid=field.split(";");
       for(int i=0;i<fieldid.length;i++){
    	   if(fieldid[i].equals("新能源技术")){
    		   field1=1;
    	   }
           if(fieldid[i].equals("大气污染治理技术")){
        	   field2=1;
    	   }
           if(fieldid[i].equals("污水处理技术")){
        	   field3=1;
    	   }
           if(fieldid[i].equals("固废处理技术")){
        	   field4=1;
    	   }
           if(fieldid[i].equals("污染场地修复技术")){
        	   field5=1;
    	   }
           if(fieldid[i].equals("建筑节能技术")){
        	   field6=1;
    	   }
           if(fieldid[i].equals("工业节能技术")){
        	   field7=1;
    	   }
           if(fieldid[i].equals("余热利用技术")){
        	   field8=1;
    	   }
           
       }
    	   if(field1==1){
     %>
    		  <input type="checkbox" name="fieldid" value="新能源技术" checked="checked">新能源技术 
    <%
    	   }else{
    %>
    		   <input type="checkbox" name="fieldid" value="新能源技术" >新能源技术
    <% 
    	   }
           if(field2==1){
     %>
        	   <input type="checkbox" name="fieldid" value="大气污染治理技术" checked="checked">大气污染治理技术
     <%
    	   }else{
     %>
    		   <input type="checkbox" name="fieldid" value="大气污染治理技术" >大气污染治理技术
     <%
    	   }
           if(field3==1){
      %> 
        	   <input type="checkbox" name="fieldid" value="污水处理技术" checked="checked">污水处理技术</br>
      <%    
    	   }else{
       %>
    		   <input type="checkbox" name="fieldid" value="污水处理技术" >污水处理技术</br>
      <%  
    	   }
           if(field4==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="固废处理技术" checked="checked">固废处理技术
    	  <% 
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="固废处理技术" >固废处理技术
    	   <% 
    	   }
           if(field5==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="污染场地修复技术" checked="checked">污染场地修复技术
    	   <% 
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="污染场地修复技术" >污染场地修复技术
    	   <% 
    	   }
           if(field6==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="建筑节能技术" checked="checked">建筑节能技术</br>
    	   <%
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="建筑节能技术" >建筑节能技术</br>
    	   <% 
    	   }
           if(field7==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="工业节能技术" checked="checked">工业节能技术
           <% 
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="工业节能技术" >工业节能技术
          <%
           }
          if(field8==1){
        	  %>
        	  <input type="checkbox" name="fieldid" value="余热利用技术" checked="checked">余热利用技术
           <% 
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="余热利用技术" >余热利用技术
           <% 
           }
           if(require.getOtherField()!=null){
        	   %>
        	   <input type="checkbox" name="fieldid" value="其他" checked="checked">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; " value=<%=require.getOtherField() %>>
          <%
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="其他">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; ">
           <% 
           }
       %>
     </td>
     </tr>
     <tr>
     <td>技术应用行业</td>
     <td>
		<textarea cols="80" rows="8" name="industryid1"><%=require.getIndustryID() %></textarea>
	</td>
     </tr>
       <tr>
     <td>技术需求概述</td>
     <td>
		<textarea cols="80" rows="8" name="requoverview"><%=require.getRequOverview() %></textarea>
	</td>
     </tr>     
     <tr>
       <td>关键字（1-5个）</td>
       <td><input type="text" name="keyword" style="height: 44px; width: 468px" value=<%=require.getKeyword() %>></td>
     </tr>
      <tr>
     <td>需求技术拟应用情况</td>
     <td>
		<textarea cols="80" rows="8" name="application" ><%=require.getApplication() %></textarea>
	</td>
     </tr>   
     <td>合作方式</td> 
     <td>
         <% 
        if(require.getCooperationID()[0]==1){
     %>
        <input type="radio" name="cooperationid" value="技术引进" checked="checked">技术引进
     <%
        }else{
     %>
        <input type="radio" name="cooperationid" value="技术引进">技术引进
     <%
        }
     %> 
     <% 
        if(require.getCooperationID()[1]==1){
     %>
        <input type="radio" name="cooperationid" value="委托研发" checked="checked">委托研发
     <%
        }else{
     %>
         <input type="radio" name="cooperationid" value="委托研发">委托研发
     <%
        }
     %> 
     <% 
        if(require.getCooperationID()[2]==1){
     %>
        <input type="radio" name="cooperationid" value="合作研发" checked="checked">合作研发
     <%
        }else{
     %>
        <input type="radio" name="cooperationid" value="合作研发">合作研发
     <%
        }
     %> 
     <% 
        if(require.getCooperationID()[3]==1){
     %>
 <input type="radio" name="cooperationid" value="其他" checked="checked">其他，请注明  
 <input type="text" name="othercooperation" value=<%=require.getOtherCooperation() %>>    
 <%
        }else{
     %>
 <input type="radio" name="cooperationid" value="其他">其他，请注明 
 <input type="text" name="othercooperation">
      <%
        }
     %> 
 
     </td>
     </tr>
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px; " onclick="new Calendar().show(this);" value=<%=require.getFillTime() %>></td>
	</tr> 
  </table>
  <br>
   <center>
   &nbsp;&nbsp;&nbsp;<input type="submit" value="修改" style="height: 40px; width: 65px; background-color: #408080;">
   </center>
  </form>
  </div>
  </body>
</html>
