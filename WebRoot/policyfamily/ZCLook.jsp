<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.satp.entity.*"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策查看</title>
<style type="text/css">
	body { font:12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
 	<div style="margin: 10px 10px 5px 10px;background-color: white;height: 98%;min-height: 550px;" align="center">
		<table width='96%' >
		<%
			Policy policytag=(Policy)request.getAttribute("policyList"); //结果集
			System.out.println();
			%>
			<tr align="left">
			<th>
			<h3><strong style="color:#ff7b0e;"><%=policytag.getPname() %></strong></h3>
			<div align="right"><button style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;" onclick="window.history.back(-1);">返回</button></div>
			</th>
			</tr >
			<tr align="left">
			<td>
			<strong style="color:#ff7b0e;">【实施日期】</strong>
            <%if(policytag.getApplytime()==null) 
			{
			%>
			无
			<%}else{ %>
			<%=policytag.getApplytime() %>
			<%} %>
			<br/>
			<strong style="color:#ff7b0e;">【废止日期】</strong>
			<%if(policytag.getBreaktime()==null) 
			{
			%>
			无
			<%}else{ %>
			<%=policytag.getBreaktime() %>
			<%} %>
			</td>
			</tr >
			<tr align="left">
			<th>
			<%=policytag.getPolciycontent() %>
			</th>
			</tr >
		</table>
</div>
</body>
</html>