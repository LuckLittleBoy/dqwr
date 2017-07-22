<%@ page language="java" import="java.util.*" 
    import="com.dqwr.expert.daoimpl.*"
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
  </head>
  
  <%
         ResultSet expertrs;
         int ExpertID=Integer.parseInt(request.getParameter("expertid"));
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         ExpertDaoImpl expertimpl=new ExpertDaoImpl();
         expertrs=expertimpl.selectExpertById(conn, ExpertID);
         expertrs.next();
         System.out.println(expertrs.getString(2));
%> 
<body bgcolor="#ffffff">
<div style="background-color: #ffffff; position: relative;margin-top: 0px;margin-left: 0px;border: #ffffff 2px solid" >
<div style="background: #C0E4FA;" align="center">专家退回</div>
<div  align="center">
<%
   if(expertrs.getString(30)!=null){
%>
  <font color="red">形式审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=expertrs.getString(30) %></textarea><br>
  <br>
<%
   }
   if(expertrs.getString(32)!=null){
%>
  <font color="red">技术审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=expertrs.getString(32) %></textarea><br>
  <br>
<%  
   }
%>
</div>
</div>
  <table border="1" align="center" bgcolor="#FFFFFF"> 
   <tr>
      <td>姓名</td>
      <td><input type="text" name="expertname" value=<%=expertrs.getString(2) %>>&nbsp&nbsp性别&nbsp&nbsp&nbsp
      <%
        int sex=expertrs.getByte(3);
        if(sex==1){
       %>
       <input type="radio" name="sex" value="1" checked="checked">男&nbsp;&nbsp;<input type="radio" name="sex" value="0">女
       <%
        }else{
       %>
       <input type="radio" name="sex" value="1">男&nbsp;&nbsp;<input type="radio" name="sex" value="0" checked="checked">女
       <%	
        }
       %>
      </td>
     </tr>
    <tr>
      <td>出生年月</td>
      <td><input type="text" name="birthday" value=<%=expertrs.getString(4) %>>&nbsp&nbsp证件号码&nbsp&nbsp&nbsp<input type="text" name="idcard" value=<%=expertrs.getString(5) %>>
      </td>
     </tr>
     <tr>
      <td>学历</td>
      <td><input type="text" name="educational" value=<%=expertrs.getString(6) %>>&nbsp&nbsp学位&nbsp&nbsp&nbsp<input type="text" name="degree" value=<%=expertrs.getString(7) %>>
      </td>
     </tr>
     <tr>
      <td>所学专业</td>
      <td><input type="text" name="studyspec" value=<%=expertrs.getString(8) %>>&nbsp&nbsp现从事专业&nbsp&nbsp&nbsp<input type="text" name="engagespec" value=<%=expertrs.getString(9) %>>
      </td>
     </tr> 
     <tr>
      <td>机构代码</td>
      <td><input type="text" name="orgaid" value=<%=expertrs.getString(11) %>> 
      </td>
     </tr> 
      <tr>
      <td>单位名称</td>
      <td><input type="text" name="organame" value=<%=expertrs.getString(10) %>>&nbsp&nbsp单位所属地区&nbsp&nbsp&nbsp<input type="text" name="area" value=<%=expertrs.getString(12) %>>
      </td>
     </tr> 
      <tr>
      <td>现任职务</td>
      <td><input type="text" name="position" value=<%=expertrs.getString(13) %>>&nbsp&nbsp职称&nbsp&nbsp&nbsp<input type="text" name="jobtitle" value=<%=expertrs.getString(14) %>>
      </td>
     </tr> 
     
     <!--不能确定 -->
      <tr>
      <td>地址</td>
      <td><input type="text" name="address" value=<%=expertrs.getString(15) %>> 
      </td>
     </tr> 
      <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel" value=<%=expertrs.getString(16) %>>&nbsp&nbsp&nbsp&nbsp手机&nbsp<input type="text" name="mobile" value=<%=expertrs.getString(17) %>></td>
     </tr>
     <tr>
      <td>邮箱</td>
      <td><input type="text" name="email" value=<%=expertrs.getString(18) %>>&nbsp&nbsp邮编&nbsp&nbsp&nbsp<input type="text" name="zipcode" value=<%=expertrs.getString(19) %>>
      </td>
     </tr> 
      <tr>
     <td>技术领域</td>
     <td>
         <div id="First" style="border:1px;border-style:solid;">
         <h5>主要技术领域</h5>
         <%
           String first=expertrs.getString(20);
         %>
         <%
         if(first.equals("新能源技术")){
         %>
         <input type="radio" name="Firstfield" value="新能源技术" checked="checked">新能源技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="新能源技术">新能源技术
         <% 
         }
         %>
         
         <%
         if(first.equals("大气污染治理技术")){
         %>
         <input type="radio" name="Firstfield" value="大气污染治理技术" checked="checked">大气污染治理技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="大气污染治理技术">大气污染治理技术
         <% 
         }
         %>

         <%
         if(first.equals("污水处理技术")){
         %>
         <input type="radio" name="Firstfield" value="污水处理技术" checked="checked">污水处理技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="污水处理技术">污水处理技术</br>
         <% 
         }
         %>
         
         <%
         if(first.equals("固废处理技术")){
         %>
         <input type="radio" name="Firstfield" value="固废处理技术" checked="checked">固废处理技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="固废处理技术">固废处理技术
         <% 
         }
         %>
         
         <%
         if(first.equals("污染场地修复技术")){
         %>
         <input type="radio" name="Firstfield" value="污染场地修复技术" checked="checked">污染场地修复技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="污染场地修复技术">污染场地修复技术
         <% 
         }
         %>
 
         <%
         if(first.equals("建筑节能技术")){
         %>
         <input type="radio" name="Firstfield" value="建筑节能技术" checked="checked">建筑节能技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="建筑节能技术">建筑节能技术</br>
         <% 
         }
         %>
   
         <%
         if(first.equals("工业节能技术")){
         %>
         <input type="radio" name="Firstfield" value="工业节能技术" checked="checked">工业节能技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="工业节能技术">工业节能技术
         <% 
         }
         %>

         <%
         if(first.equals("余热利用技术")){
         %>
         <input type="radio" name="Firstfield" value="余热利用技术" checked="checked">余热利用技术
         <%
         }else{
         %>
           <input type="radio" name="Firstfield" value="余热利用技术">余热利用技术
         <% 
         }
         %>
         
         
         <%
         if(first.equals("其他")){
         %>
          <input type="radio" name="Firstfield" value="其他" checked="checked">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; " value=<%=expertrs.getString(21) %>>
         <%
         }else{
         %>
          <input type="radio" name="Firstfield" value="其他">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; ">
         <% 
         }
         %>
        
         </div>
         <br>
         <div id="Second" style="border:1px;border-style:solid;">
         <h5>次要技术领域</h5>
         <%
           String second=expertrs.getString(22);
           if(null == second)
           {
           		second="";
           }
         %>
         <%
         if(second.equals("新能源技术")){
         %>
         <input type="radio" name="Secondfield" value="新能源技术" checked="checked">新能源技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="新能源技术">新能源技术
         <% 
         }
         %>
         
         
         <%
         if(second.equals("大气污染治理技术")){
         %>
         <input type="radio" name="Secondfield" value="大气污染治理技术" checked="checked">大气污染治理技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="大气污染治理技术">大气污染治理技术
         <% 
         }
         %>

         <%
         if(second.equals("污水处理技术")){
         %>
         <input type="radio" name="Secondfield" value="污水处理技术" checked="checked">污水处理技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="污水处理技术">污水处理技术</br>
         <% 
         }
         %>
         
         <%
         if(second.equals("固废处理技术")){
         %>
         <input type="radio" name="Secondfield" value="固废处理技术" checked="checked">固废处理技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="固废处理技术">固废处理技术
         <% 
         }
         %>
         
         <%
         if(second.equals("污染场地修复技术")){
         %>
         <input type="radio" name="Secondfield" value="污染场地修复技术" checked="checked">污染场地修复技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="污染场地修复技术">污染场地修复技术
         <% 
         }
         %>
 
         <%
         if(second.equals("建筑节能技术")){
         %>
         <input type="radio" name="Secondfield" value="建筑节能技术" checked="checked">建筑节能技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="建筑节能技术">建筑节能技术</br>
         <% 
         }
         %>
   
         <%
         if(second.equals("工业节能技术")){
         %>
         <input type="radio" name="Secondfield" value="工业节能技术" checked="checked">工业节能技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="工业节能技术">工业节能技术
         <% 
         }
         %>

         <%
         if(second.equals("余热利用技术")){
         %>
         <input type="radio" name="Secondfield" value="余热利用技术" checked="checked">余热利用技术
         <%
         }else{
         %>
           <input type="radio" name="Secondfield" value="余热利用技术">余热利用技术
         <% 
         }
         %>
         
         
         <%
         if(second.equals("其他")){
         %>
          <input type="radio" name="Secondfield" value="其他" checked="checked">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; " value=<%=expertrs.getString(23) %>>
         <%
         }else{
         %>
          <input type="radio" name="Secondfield" value="其他">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; ">
         <% 
         }
         %>
         </div>
         <br>
         <div id="Third" style="border:1px;border-style:solid;">
         <h5>第三技术领域</h5>
         <%
           String third=expertrs.getString(24);
           if(null == third)
           {
           		third="";
           }
         %>
         <%
         if(third.equals("新能源技术")){
         %>
         <input type="radio" name="Thirdfield" value="新能源技术" checked="checked">新能源技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="新能源技术">新能源技术
         <% 
         }
         %>
         
         
         <%
         if(third.equals("大气污染治理技术")){
         %>
         <input type="radio" name="Thirdfield" value="大气污染治理技术" checked="checked">大气污染治理技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="大气污染治理技术">大气污染治理技术
         <% 
         }
         %>

         <%
         if(third.equals("污水处理技术")){
         %>
         <input type="radio" name="Thirdfield" value="污水处理技术" checked="checked">污水处理技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="污水处理技术">污水处理技术</br>
         <% 
         }
         %>
         
         <%
         if(third.equals("固废处理技术")){
         %>
         <input type="radio" name="Thirdfield" value="固废处理技术" checked="checked">固废处理技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="固废处理技术">固废处理技术
         <% 
         }
         %>
         
         <%
         if(third.equals("污染场地修复技术")){
         %>
         <input type="radio" name="Thirdfield" value="污染场地修复技术" checked="checked">污染场地修复技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="污染场地修复技术">污染场地修复技术
         <% 
         }
         %>
 
         <%
         if(third.equals("建筑节能技术")){
         %>
         <input type="radio" name="Thirdfield" value="建筑节能技术" checked="checked">建筑节能技术</br>
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="建筑节能技术">建筑节能技术</br>
         <% 
         }
         %>
   
         <%
         if(third.equals("工业节能技术")){
         %>
         <input type="radio" name="Thirdfield" value="工业节能技术" checked="checked">工业节能技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="工业节能技术">工业节能技术
         <% 
         }
         %>

         <%
         if(third.equals("余热利用技术")){
         %>
         <input type="radio" name="Thirdfield" value="余热利用技术" checked="checked">余热利用技术
         <%
         }else{
         %>
           <input type="radio" name="Thirdfield" value="余热利用技术">余热利用技术
         <% 
         }
         %>
         
         
         <%
         if(third.equals("其他")){
         %>
          <input type="radio" name="Thirdfield" value="其他" checked="checked">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; " value=<%=expertrs.getString(25) %>>
         <%
         }else{
         %>
          <input type="radio" name="Thirdfield" value="其他">其他，请注明(可多选)<input type="text" name="FirstOtherfield" style="width: 117px; ">
         <% 
         }
         %>
         </div>
     </td>
     </tr>
    <tr>
     <td>主要研究领域及成果情况</td>
     <td>
		<textarea cols="80" rows="8" name="overview"><%=expertrs.getString(26) %></textarea>
	</td>
     </tr> 
       <tr>
     <td>国内外主要学术组织兼职情况</td>
     <td>
		<textarea cols="80" rows="8" name="pluralism"><%=expertrs.getString(27) %></textarea>
	</td>
     </tr>    
       <tr>
     <td>获得成果奖励及荣誉称号情况</td>
     <td>
		<textarea cols="80" rows="8" name="honor"><%=expertrs.getString(28) %></textarea>
	</td>
     </tr>       
  </table>
</div>
</body>
