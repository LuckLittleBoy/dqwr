<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*,beans.Emp, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
	import="com.dqwr.publicinfo.dao.impl.*"
	import="beans.Emp,java.sql.*,com.dqwr.dao.DataBaseDao,com.dqwr.project.dao.impl.ProjectDaoImpl"
	import="com.dqwr.publishinfo.entity.Info" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 点击事件会在超链接跳转前发生 */
		$("#div_test a").click(
				function() {
					var link = $(this).attr('href');
					$('#div_view').attr('src', link);
					var href = window.location.href;
					window.location.href = href.substr(0, href.indexOf('#'))
							+ '#' + link;
					return false;
				});
	});

	function form1submit() {
		var jumpPageNo = document.getElementById("jumpPageNo").value;
		if (jumpPageNo == "") {
			alert("跳转页不能为空！");
		} else {
			document.form1.submit();
		}
	}
</script>

</head>
<body>
	<%
  	DataBaseDao db = new DataBaseDao();
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");//查询选择（名字还是文号）
	String find = request.getParameter("find");
	
 
	  Connection con=null;
	  con=db.connection(); 
	   
	 
	int pageno =0;
	int pagesize =0;
	String size=request.getParameter("pagesize");
	if(size!=null){
		pagesize = Integer.parseInt(size);
	}
	if(pagesize<=0){
		pagesize = 10;
		}
	String no=request.getParameter("pageno");
	if(no!=null){
		pageno = Integer.parseInt(no);
	}
	
	if(pageno<=0){
		 pageno = 1;
		}
	//YH user = (YH) request.getSession().getAttribute("user");
	//String id = request.getParameter("id");
	ArrayList<Emp> emplist = PublicInfo.Project(con, pageno, pagesize,search,find);
	int pageCount=PublicInfo.ProjectPagecount(con, pageno, pagesize,search,find);
	if (pageno>pageCount){
%>
	<%
			    pageno=1;
		        emplist = PublicInfo.Project(con, pageno, pagesize,search,find);
		        pageCount=PublicInfo.ProjectPagecount(con, pageno, pagesize,search,find);
			}
			con.close();
		%>
	<table width='100%' style="table-layout: fixed">
		<tr align="center">
			<th width='5%'>序号</th>
			<th width='8%'>项目编号</th>
			<th width='27%'>项目名称</th>
			<th width='20%'>单位名称</th>
			<th width='10%'>项目所属阶段</th>
			<th width='30%'>操作</th>
		</tr>
		<%
			int i=0;
			for(Emp emp:emplist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
		<tr align="center" bgcolor="<%=bg %>">

			<td><%=i %></td>
			<td  
				style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap " ><%=emp.getProjectId() %></td>
			<td
				style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"align="left"><%=emp.getProjectName() %></td>
			<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"align="left"><%=emp.getOrgaName() %></td>
			<%
				if (emp.getAcceptance() != null) {
			%>
			<td>结题阶段</td>
			<%
				}else if (emp.getQuestionnaire() != null) {
			%>
			<td>在研阶段</td>
			<%
				}else if (emp.getCommitments() != null) {
			%>
			<td>立项阶段</td>
			<%
				}else  {
			%>
			<td>申报阶段</td>
			<%} %>
			<td><a
				href="/dqwr/operateproject?operateid=0&empid=<%=emp.getId() %>&pageno=<%=pageno %>">删除</a>|<a
				href="/dqwr/operateproject?operateid=1&empid=<%=emp.getId() %>&pageno=<%=pageno %>">修改</a>|<a
				href="/dqwr/operateproject?operateid=2&empid=<%=emp.getId() %>&pageno=<%=pageno %>">查看</a></td>
		</tr>
		<%}else{ bg="#F0F0F0";%>
		<tr align="center" bgcolor="<%=bg %>">

			<td><%=i %></td>
			<td
				style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"><%=emp.getProjectId() %></td>
			<td
				style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"align="left"><%=emp.getProjectName() %></td>
			<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap"align="left"><%=emp.getOrgaName() %></td>
			<%
				if (emp.getAcceptance() != null) {
			%>
			<td>结题阶段</td>
			<%
				}else if (emp.getQuestionnaire() != null) {
			%>
			<td>在研阶段</td>
			<%
				}else if (emp.getCommitments() != null) {
			%>
			<td>立项阶段</td>
			<%
				}else  {
			%>
			<td>申报阶段</td>
			<%} %>
			<td><a
				href="/dqwr/operateproject?operateid=0&empid=<%=emp.getId() %>&pageno=<%=pageno %>">删除</a>|<a
				href="/dqwr/operateproject?operateid=1&empid=<%=emp.getId() %>&pageno=<%=pageno %>">修改</a>|<a
				href="/dqwr/operateproject?operateid=2&empid=<%=emp.getId() %>&pageno=<%=pageno %>">查看</a></td>
		</tr>
		<%} %>
		<%} %>

	</table>
	<div style="background: #C0E4FA; position: relative;">
		<div style="background: #C0E4FA; position: absolute;" align="left">
			共有
			<%=i %>
			条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; <a
				href="projectManage.jsp?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;<a
				href="projectManage.jsp?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a>
		</div>
		<form name="form1" method="post" action="projectManage.jsp">
			<div align="right">
				<a href="projectManage.jsp?pageno=1">首页</a>&nbsp;&nbsp;<a
					href="projectManage.jsp?pageno=<%=pageCount %>">尾页</a> 跳转到 <input
					type="text" size="1" style="width: 20px; height: 15px;"
					name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#"
					onclick="form1submit()">跳转</a>
			</div>
		</form>
	</div>
</body>
</html>