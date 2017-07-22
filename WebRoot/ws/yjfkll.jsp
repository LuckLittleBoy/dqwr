<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<script type="text/javascript" src="js/yjfkll.js"></script>
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

<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA"id="body" style="overflow-x:auto;overflow-y:auto;">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid;height: 98%;min-height: 550px;" align="center">
	<input type="hidden" value="" id="allpage">
	<input type="hidden" value="15" id="pagesize">
	<input type="hidden" value="" id="currentpage">
	<input type="hidden" value="" id="searchhd">
	<div style="position: relative;min-height: 490px; " align="left" >
	<div style="background: #C0E4FA;position: relative;" align="center">所有反馈意见</div>
	<fieldset>
    <legend><strong  >选择筛选条件：</strong></legend>
    <div  style="background-color: #ffffff; position: relative;margin-top:8px;margin-left:12px;border: #ffffff 2px solid" >
    <strong  >标头搜索:</strong>
    <input type="text" id='searchnr'>
   	<input  id="search" style="height: 22px;vertical-align: middle;" type="image"  src="../images/qd.gif" >
    </div>
    </fieldset>
	<table id="zcjdtable" width='100%'></table>
	<div id="bottom"></div>
	</div>
</div>
</body>
</html>