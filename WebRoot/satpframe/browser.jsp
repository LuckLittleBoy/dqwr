<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*,com.satp.entity.*, java.util.ArrayList" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>分类浏览</title>
	    
	<script src="js/jquery.tablecloth.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/tablecloth.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/select.css">
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/select.js"></script>
	<script language="javascript" src="js/fenye.js"></script>
	<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;background-color:#B1D8EA }
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	th{
		border-color: #666666;
		border:0px;
		background-color: #dedede;
	}
	td { margin:0; padding:10px; border:1px solid #ccc; }
    </style>
  </head>
  	
  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
  	<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
  	<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String type =(String)request.getAttribute("type");
String keyword =(String)request.getAttribute("keyword");

int pageno =0;
int pagesize =0;
int pageCount=1;
String size=(String)request.getAttribute("pagesize");
if(size!=null){
	pagesize = Integer.parseInt(size);
}
if(pagesize<=0){
	pagesize =15;
	}
pageno=(Integer)request.getAttribute("pageno");
if(pageno<=0){
	 pageno = 1;
	}
pageCount=(Integer)request.getAttribute("pageCount");

if (pageno>pageCount){
	%>
	<%
	pageno=1;
}

%>
 <div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;"">
<fieldset>
		<div class="loading">
			<p><img src="images/data-loading.gif" alt="数据装载中" /></p>
			<p>数据装载中......</p>
		</div>
		<div class="car">
			<span class="ZCFL">
				<strong  >选择浏览方式:</strong>
				<select>
					<option value="" selected="selected">请选择</option>
					<option value="ZCLB">政策类别</option>
					<option value="SXFW">施行范围</option>
					<option value="TZLY">所属专题</option>
				</select>
				<img src="images/pfeil.gif" alt="有数据" />
			</span>
			<span class="cartype">
				<strong  >分类条件</strong>
				<select></select>
			</span>
		</div>
		<div>
		<input type="hidden" name="types" class="types" value="<%=type %>"/>
		<input type="hidden" name="keywords" class="keywords" value="<%=keyword %>"/>
		</div>		
	<div style="background-color: #ffffff; position: relative;margin-top:8px;" >
		<table width='98%' >
			<tr align="center"><th width='40px'>序号</th><th>政策名称</th><th width='80px'>政策类别</th><th width='100px'>施行时间</th><th width='80px'>时效状态</th>
			</tr >
			<%
			ArrayList<Policy> policytaglist = (ArrayList<Policy>)request.getAttribute("policytaglist"); //结果集
				int i=0;
				for(Policy policy : policytaglist){ 
					i=i+1;
					if(i%2==1){
			%>
					<tr align="center" bgcolor="#ffffff">
						<td><%=i %></td>
						<td align="left"><a href=ZCLookServlet?pno=<%=policy.getPno() %>><%=policy.getPname() %></a></td>
						<td><%=policy.getPcategories() %></td>
						<td><%=policy.getApplytime() %></td>
						<%if(policy.getSxzt()==1) {%>
						<td>有效</td>
						<%}else {%>
						<td>无效</td>
						<%} %>
						
					</tr>
				<%}else{%>
					<tr align="center" bgcolor="#F0F0F0">
						<td><%=i %></td>
						<td align="left"><a href=ZCLookServlet?pno=<%=policy.getPno() %>><%=policy.getPname() %></a></td>
						<td><%=policy.getPcategories() %></td>
						<td><%=policy.getApplytime() %></td>
						<%if(policy.getSxzt()==1) {%>
						<td>有效</td>
						<%}else {%>
						<td>无效</td>
						<%} %>
						
					</tr>
				<%} %>
			<%}
				%>
			</table>
			<div style="background: #C0E4FA;position: relative;width: 98%;" >
		<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; 
		<%if(pageno>1){ %>
		<a href="ZCTypeServlet?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>&type=<%=type%>&keyword=<%=keyword %>">上一页</a>
		 <%} %>&nbsp;&nbsp;
		  <%if(pageno<pageCount){ %>
		 <a href="ZCTypeServlet?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>&type=<%=type%>&keyword=<%=keyword %>">下一页</a>
		 <%} %></div>
		<div align="right">
		<%if(pageno>1){ %>
		<a href="ZCTypeServlet?pageno=1&type=<%=type %>">首页</a><%} %>&nbsp;&nbsp;
		<%if(pageno<pageCount){ %>
		<a href="ZCTypeServlet?pageno=<%=pageCount%>&type=<%=type %>">尾页</a><%} %>
		  跳转到
		 <input type="text" size="1"  class="pageno" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="go()">跳转</a></div>
		</div>
	</div>
	</fieldset>
	</div>
	</div>
	<script type="text/javascript">
	 $(document).ready(function() {
		   $("table").tablecloth({
		     theme: "paper",
		     striped: true,
		     sortable: true,
		     condensed: true
		   });
		 });

	</script>
</body>
</html>