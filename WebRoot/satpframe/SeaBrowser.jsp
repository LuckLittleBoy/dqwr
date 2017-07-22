<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.satp.entity.*, java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="js/fenye.js"></script>
<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	table { border-collapse:collapse; border-spacing:0; }
	th{
		border-color: #666666;
		background-color: #dedede;
	}
	td { margin:0; padding:10px; border:1px solid #ccc; }
    </style>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
  <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String sql2=(String)request.getAttribute("sql");


int pageno =0;
int pagesize =0;
int pageCount=1;
String size=(String)request.getAttribute("pagesize");
if(size!=null){
	pagesize = Integer.parseInt(size);
}
if(pagesize<=0){
	pagesize = 15;
	}
pageno=(Integer)request.getAttribute("pageno");
if(pageno<=0){
	 pageno = 1;
	}
pageCount=(Integer)request.getAttribute("pageCount");

if (pageno>pageCount){
	%>
	<script type="text/javascript"></script>
	<%
	pageno=1;
}

%>
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
		<div style="position: relative;min-height: 490px; " >
		<%-- <div style="background: #C0E4FA;position: relative;" align="center"><%=name %></div> --%>
		<table  width='100%' >
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
			<div style="background: #C0E4FA;position: relative;" >
		<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; 
		<%if(pageno>1){ %>
		<a href="ZcSearchServlet?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>
		 <%} %>&nbsp;&nbsp;
		  <%if(pageno<pageCount){ %>
		 <a href="ZcSearchServlet?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a>
		 <%} %></div>
		<div align="right">
		<%if(pageno>1){ %>
		<a href="ZcSearchServlet?pageno=1">首页</a><%} %>&nbsp;&nbsp;
		<%if(pageno<pageCount){ %>
		<a href="ZcSearchServlet?pageno=<%=pageCount%>">尾页</a><%} %>
		  跳转到
		 <input type="text" size="1"  class="pageno" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="goses()">跳转</a></div>
		</div>
		</div>
	</div>
	</body>
</html>