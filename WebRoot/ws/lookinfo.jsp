<%@ page language="java" import="com.dqwr.entity.*,com.dqwr.publishinfo.entity.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.css" />
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/kindeditor.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.js"></script>
	
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
		<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<%
 Info info=(Info)request.getAttribute("info");
int pagesize=Integer.parseInt(request.getParameter("pagesize"));
int pageno=Integer.parseInt(request.getParameter("pageno"));
%>
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">信息内容</div>
		<div style="margin: 5px 10px 0px 100px;">		    
    <br/>
<form id="example" name="example"  target="manFrame">
	<br>
	发布人：&nbsp;&nbsp;<input type="text" name="creator" style="width:640px;" value=<%=info.getCreatorId() %> disabled="disabled"></br>
	主题：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" style="width:640px;" height="30px" value=<%=info.getTitle() %> disabled="disabled"></br>
	发布时间：<input  id="publictime" name="publictime" type="text" onclick="new Calendar().show(this);" value=<%=info.getAddDate()%>><br>
	<%
	 if(info.getType()==1){
		 if(info.getScope()==0){
	%>
	消息范围：<select name="scope" disabled="disabled"><option selected value="0">省内</option><option value="1" disabled="disabled">省外</option></select>
	<br>
	<% 
		 }else{
			 
	%>
	消息范围：<select name="scope" disabled="disabled"><option  value="0">省内</option><option selected value="1">省外</option></select>
	<br>
	<%		 
		 }
	%>
	<% }
	%>
	   <table>
	   <tr>内容：</tr>
	   <tr>
		<textarea name="content1" id="content1" cols="100" rows="1000" style="width:700px;height:330px;" disabled="disabled"><%=info.getContent() %></textarea>
		</tr>
		</table>
		<a href="ws/public_info.jsp?ispass=1&pagesize=<%=pagesize %>&pageno=<%=pageno %>" align="center">返回</a>
	</form>
	</div>
</div>
</div>
</body>
</html>