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
         ResultSet expertrs;
         int ExpertID=Integer.parseInt(request.getParameter("expertid"));
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         ExpertDaoImpl expertimpl=new ExpertDaoImpl();
         expertrs=expertimpl.selectExpertById(conn, ExpertID);
         expertrs.next();
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
<div class="table-c">
<br>
     <center><h2><font color="navy">专家信息</font></h2></center>
  <table border="0" width="72%" align="center" bgcolor="#FFFFFF"> 
   <tr>
      <td class="title">姓名:</td>
      <td><%=expertrs.getString(2) %></td><td class="title">&nbsp&nbsp性别&nbsp&nbsp&nbsp</td>
      <%
        int sex=expertrs.getByte(3);
        if(sex==1){
       %>
       <td>男&nbsp;&nbsp;</td>
       <%
        }else{
       %>
       <td>女&nbsp;&nbsp;</td>
       <%	
        }
       %>
      </td>
     </tr>
    <tr>
      <td class="title">出生年月</td>
      <td><%=expertrs.getString(4) %></td><td class="title">&nbsp&nbsp证件号码&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(5) %></td>
     </tr>
     <tr>
      <td class="title">学历</td>
      <td><%=expertrs.getString(6) %></td><td class="title">&nbsp&nbsp学位&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(7) %></td>
     </tr>
     <tr>
      <td class="title">所学专业</td>
      <td><%=expertrs.getString(8) %></td><td class="title">&nbsp&nbsp现从事专业&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(9) %></td>
     </tr> 
     <tr>
      <td class="title">机构代码</td>
      <td><%=expertrs.getString(11) %></td><td></td><td></td> 
      </td>
     </tr> 
      <tr>
      <td class="title">单位名称</td>
      <td><%=expertrs.getString(10) %></td><td class="title">&nbsp&nbsp单位所属地区&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(12) %></td>
     </tr> 
      <tr>
      <td class="title">现任职务</td>
      <td><%=expertrs.getString(13) %></td><td class="title">&nbsp&nbsp职称&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(14) %></td>
     </tr> 
     
     <!--不能确定 -->
      <tr>
      <td class="title">地址</td>
      <td><%=expertrs.getString(15) %></td><td></td><td></td>
      </td>
     </tr> 
      <tr>
      <td class="title">固话</td>
      <td><%=expertrs.getString(16) %></td><td class="title">&nbsp&nbsp手机&nbsp</td><td><%=expertrs.getString(17) %></td>
     </tr>
     <tr>
      <td class="title">邮箱</td>
      <td><%=expertrs.getString(18) %></td><td class="title">&nbsp&nbsp邮编&nbsp&nbsp&nbsp</td><td><%=expertrs.getString(19) %></td>
     </tr>
     </table>
     <br>
  <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
  <tr>
   <td class="title">
     主要技术领域
   </td>
    <%
     if(expertrs.getString(20).equals("其他")){
    
    %>
     <td><%=expertrs.getString(21) %></td>
    <%		 
     }else{
    %>
    <td><%=expertrs.getString(20)%></td>
    <%
     }
    %>
  </tr>
   <tr>
   <td class="title">
     第二技术领域
   </td>
    <%
     if(expertrs.getString(22)!=null){
     if(expertrs.getString(22).equals("其他")){
    
    %>
     <td><%=expertrs.getString(23) %></td>
    <%		 
     }else{
    %>
    <td><%=expertrs.getString(22)%></td>
    <%
     }
     }else{
    %>
    <td></td>
    <%
     }
    %>
  </tr>
   <tr>
   <td class="title">
     第三技术领域
   </td>
    <%
     if(expertrs.getString(24)!=null){
     if(expertrs.getString(24).equals("其他")){
    
    %>
     <td><%=expertrs.getString(25) %></td>
    <%		 
     }else{
    %>
    <td><%=expertrs.getString(24)%></td>
    <%
     }
     }else{
     %>
     <td></td>
     <%
     }
    %>
  </tr>
  </table>
  <br>
  <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
    <tr>
     <td class="title">主要研究领域及成果情况</td>
    </tr>
    <tr>
    <td>
     <%=expertrs.getString(26) %>
    </td>
    </tr>
    
    <tr>
     <td class="title">国内外主要学术组织兼职情况</td>
    </tr>
    <tr>
    <td>
     <%=expertrs.getString(27) %>
    </td>
    </tr> 
    
    <tr>
     <td class="title">获得成果奖励及荣誉称号情况</td>
    </tr>
    <tr>
    <td>
     <%=expertrs.getString(28) %>
    </td>
    </tr> 
     
  </table>
  </div>
  <br>
</body>
