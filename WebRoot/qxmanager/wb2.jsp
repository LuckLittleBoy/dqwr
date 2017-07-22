<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" src="policy.js"></script>
<%String success = (String)request.getAttribute("success"); %>
<%if(success!=null){ %>
<script type="text/javascript">
	alert("<%=success%>");
	</script>
<%} %>
<script type="text/javascript" src="qxmanager/js/wb2.js"></script>
<style type="text/css">
body {
	font: 14px/1.5 宋体, 宋体, \5b8b\4f53, sans-serif;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	margin-left: 5px;
	color: #07F;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

input {
	border: 1px solid #ccc;
	margin: 2px;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

td {
	margin: 0;
	padding: 10px;
	border: 1px solid #ccc;
}
</style>
<style type="text/css">
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 5%;
	left: 15%;
	width: 70%;
	height: 70%;
	padding: 20px;
	border: 10px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
<title>Insert title here</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	background="#B1D8EA" bgcolor="#B1D8EA" id="body"
	style="overflow-x: auto; overflow-y: auto;">
	<div
		style="background-color: #ffffff; position: relative; margin-top: 5px; margin-left: 10px; border: #ffffff 2px solid; height: 98%; min-height: 550px;"
		align="center">
		<div style="position: relative; min-height: 490px;">
			<%String username = (String)request.getAttribute("username"); %>

			<div>
				搜索用户<br />
				<br />
				<div align="center">
					<form action="wbusersearch">
						<strong>用户账号:</strong><input type="text" name="username"
							value="<%=username %>" id="username"><input type="submit"
							value="搜索">
					</form>
					<table width='100%'>
						<tr align="center">
							<th width='40px'>序号</th>
							<th>用户名</th>
							<th>用户账号</th>
							<th>工作单位</th>
							<th>所在行业</th>
							<th>手机</th>
							<th>邮箱</th>
						</tr>

						<%ArrayList<YH> yhlist = (ArrayList<YH>)request.getAttribute("yhlist"); %>
						<%
			int i=0;
			for(YH yh : yhlist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>

						<tr align="center" bgcolor="<%=bg %>">

							<td width=5%><%=i %></td>
							<td align="left" width=10%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yh.getName() %></td>

							<td align="left" width=10%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yh.getUsername() %></td>
							<td align="left" width=15%><%=yh.getGzdw() %></td>
							<td align="left" width=10%><%=yh.getSzhy() %></td>
							<td align="left" width=10%><%=yh.getSj() %></td>
							<td align="left" width=15%><%=yh.getYx() %></td>
							<td align="lsft" width=10%><a
								href="../dqwr/DelWuser?username=<%=yh.getUsername() %>">删除</a></td>

							<%}else{ bg="#F0F0F0";%>
						
						<tr align="center" bgcolor="<%=bg %>">

							<td width=5%><%=i %></td>
							<td align="left" width=10%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yh.getName() %></td>

							<td align="left" width=10%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=yh.getUsername() %></td>
							<td align="left" width=15%><%=yh.getGzdw() %></td>
							<td align="left" width=10%><%=yh.getSzhy() %></td>
							<td align="left" width=10%><%=yh.getSj() %></td>
							<td align="left" width=15%><%=yh.getYx() %></td>
							<td align="lsft" width=10%><a
								href="../dqwr/DelWuser?username=<%=yh.getUsername() %>">删除</a></td>

							<%} %>
							<%} %>
						
					</table>

				</div>
			</div>
		</div>
	</div>
</body>
</html>