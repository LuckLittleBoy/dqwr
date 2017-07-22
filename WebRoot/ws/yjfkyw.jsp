<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String result = (String) request.getAttribute("result");
%>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/zcjdll.js"></script>
	<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
	
	
	table tr{padding:3px 3px 3px 3px;}
	table tr th{background-color:#C0E4FA;}
	table tr td{background-color:white;}
	hr{width:90%;filter: alpha(opacity=100,finishopacity=0,style=2);color:#000;z-index:5;}
	.title{font-family:隶书;}
	.fgx{font-size:12px;width:60px;margin-top:-16px;background-color:white;z-index:50;}
	
	.one td{background-color:rgb(229,255,229)}
	.two td{background-color:white;}
	.over td{background-color:#F0F0F0;}
	
	
</style>
<%YJFK yjfk = (YJFK)request.getAttribute("yjfk"); %>
<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA"id="body" style="overflow-x:auto;overflow-y:auto;">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid;height: 98%;min-height: 550px;" align="center">
	
	<div style="position: relative;min-height: 490px; "  >
	<table>
    <tr ><td align="right">意见人</td><td><%=yjfk.getYjr() %></td></tr>
  	<tr ><td align="right">发意见发布时间</td><td><%=yjfk.getTime() %></td></tr>    	
  	<tr ><td align="right">您是通过什么方式知道本服务平台的？</td><td><%=yjfk.getFs() %></td></tr>
  	<tr ><td align="right">您想了解什么政策信息？</td><td><%=yjfk.getLjxx() %></td></tr>
  	<tr ><td align="right">您对我们有什么建议和要求？</td><td><%=yjfk.getJyyq() %></td></tr>
  	<tr ><td align="right" valign="top">您认为本服务平台栏目设置是否满足您的需求？</td><td><%=yjfk.getXq() %></td></tr>
  	<tr ><td align="right" valign="top">您希望增加什么栏目或信息？</td><td ><%=yjfk.getXw() %></td></tr>
  	<tr ><td align="right">您的联系方式：</td><td><%=yjfk.getLxfs() %></td></tr>
  	
  	</table>
	</div>
</div>
</body>
</html>