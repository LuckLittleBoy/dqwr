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
  </head>
  <body bgcolor="#6CA6CD">
  <div align="center" style="margin: 5px 0px 0px 0px;background-color: white;">
  <%
    Orga orga=(Orga)request.getAttribute("orga");
    String pageno=request.getParameter("pageno");
  %>
  <form action="EditOrga?orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" method="post" >
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
     <tr>
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
	<tr style="display:none">
		<td>&nbsp;&nbsp;&nbsp;用户昵称</td>				
		<td><input type="text" name="username" value="<%=orga.getUsername() %>"></td>
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