<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/satp/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/satp/js/welcome.js"></script>
<style type="text/css">
	body{
	;font:14px/1.5 "Microsoft YaHei",tahoma,Verdana,Geneva,sans-serif;}
	table, th, td
  {
  	border-collapse:collapse;
  	border: 1px solid #eee;
  }
  th{
  	background: #C1E4F8
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
	<div>最新动态：
	<div id="alter"></div>
	</div >
	</div>
</div>
</body>
</html>