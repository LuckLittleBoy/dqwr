<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/dqwr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dqwr/ws/js/syzc.js"></script>
<style type="text/css">
body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
	th{
		border-color: #666666;
		background-color: #dedede;
	}
</style>
<title>Insert title here</title>
<%
	int pageno =0;
	int pagesize =0;
	String size=request.getParameter("pagesize");
	if(size!=null){
		pagesize = Integer.parseInt(size);
	}
	if(pagesize<=0){
		pagesize = 15;
		}
	String no=request.getParameter("pageno");
	if(no!=null){
		pageno = Integer.parseInt(no);
	}
	
	if(pageno<=0){
		 pageno = 1;
		}

%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	<input type="hidden" value="<%=pageno %>" id="pageno">
	<input type="hidden" value="<%=pagesize %>" id="pagesize">
	<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">欢迎来到河北科技政策管理中心</div>
	<div>我的所有政策：
	<div id="syzc"></div>
	</div >
	</div>
</div>
</body>
</html>