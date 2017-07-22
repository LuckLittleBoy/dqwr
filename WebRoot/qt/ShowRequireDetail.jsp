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
	<!-- 折叠边框 -->
  <style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc}
  .table-c table tr{height:50px;}
  .table-cc table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-cc table td{border-right:1px solid #3299cc;border-bottom:1px solid #3299cc;width: 540px;}
  .table-cc table tr{height:50px;}
  h3{font-style: italic;color:navy;}
  .title{font-weight:bold;width:20%;} 
  </style>
	<!-- 折叠边框 -->

  </head>
  <body >   <!-- bgcolor="#c0e4fa" -->
 
 <%
 String tag = request.getParameter("tag");
 if(tag!=null&&tag!="")
 {
 %>
 <div style="float: left;">
	<a href="qt/qttjfx.jsp?tag=<%= tag %>" style="color:blank;font-size:16px;margin-left:20px;line-height:30px;">返回</a>
</div>
 <%
 }
 %> 
 
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
 
<% 
int requid=Integer.parseInt(request.getParameter("requid"));

ResultSet rs1,rs2,rs3;
DataBaseDao db=new DataBaseDao();
Connection conn=db.connection();
RequireDaoImpl requireimpl=new RequireDaoImpl();
OrgaDaoImpl  orgaimpl=new OrgaDaoImpl();
rs1=requireimpl.SelectRequireById(conn, requid);

 while(rs1.next())
 {
  rs2=orgaimpl.SelectOrgaById(conn,rs1.getString(2));
  rs2.next();
%>
 <div  style="margin-left:20px" class="table-c">
 <br>
    <center><h2><font color="navy">技术需求</font></h2></center>
    
    <table  border="0" width="72%" align="center" bgcolor="#FFFFFF">   
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
      </div>
  <div  style="margin-left:20px" class="table-cc">
 
  <table class="table-cc" border="0" width="72%" align="center" bgcolor="#FFFFFF">
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
  </body><br><br>
  <script type="text/javascript">        
function addMore()
{
    var td = document.getElementById("more");
    
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}
</script>
</html>
