<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% String result = (String) request.getAttribute("result");
%>
<script type="text/javascript">
<%if(result!=null){ %>
	alert('<%=result %>');
	<%if(result.equals("政策解读发布成功")){ %>
	window.location.href="ws/zcjdll.jsp";
<%}else{%>
	window.location.href="ws/kindeditor-4.1.7/jsp/zcjdluru.jsp";
<% }} %> 

</script>
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
<%ZCJDEntity zcjd = (ZCJDEntity)request.getAttribute("zcjd"); %>
<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA"id="body" style="overflow-x:auto;overflow-y:auto;">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid;height: 98%;min-height: 550px;" align="center">
	<input type="hidden" value="" id="allpage">
	<input type="hidden" value="15" id="pagesize">
	<input type="hidden" value="" id="currentpage">
	<div style="position: relative;min-height: 490px; "  >
	<div style="width: 100%" id="jdtitle" align="center"><font size="6" ><%=zcjd.getJdtitle() %></font></div>
	<div style="width: 100%" id="jdxx" align="center"><font size="1">发布人：<%=zcjd.getJdwhos() %>&nbsp;&nbsp;
	发布时间：<%=zcjd.getJdtimes() %> &nbsp;&nbsp;被点击数：<%=zcjd.getClick() %></font></div>
	<div style="width: 96%" id="jdcontent" align="left"><%=zcjd.getJdcontent() %></div>
	<table id="zcjdtable" width='100%'></table>
	<div id="bottom"></div>
	</div>
</div>
</body>
</html>