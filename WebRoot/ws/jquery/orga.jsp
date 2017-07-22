<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.requirement.entity.Orga,com.dqwr.model.Orgamodel, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>机构管理</title>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){
    /* 点击事件会在超链接跳转前发生 */
    $("#div_test a").click(function(){
        var link = $(this).attr('href');
        $('#div_view').attr('src', link);
        var href = window.location.href;
        window.location.href = href.substr(0, href.indexOf('#')) + '#' + link;
        return false;
    });
});

function form1submit(){
	var jumpPageNo=document.getElementById("jumpPageNo").value;
	if(jumpPageNo==""||jumpPageNo==null){
	  alert("跳转页不能为空！");
	}else{
		document.form1.submit();	
	}
}
</script>
</head>

<body>
	<%
    	DataBaseDao database = new DataBaseDao();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");//查询选择（名字还是文号）
		String find = request.getParameter("find");
		int pageno =0;
		int pagesize =0;
		int pass=0;
		int requid=0;
		String size=request.getParameter("pagesize");
		if(size!=null){
			pagesize = Integer.parseInt(size);
		}
		if(pagesize<=0){
			pagesize =10;
		}
		String no=request.getParameter("pageno");
		if(no!=null){
			pageno = Integer.parseInt(no);
		}
	
		if(pageno<=0){
		 	pageno = 1;
		}
		
		Connection con = database.connection();

		ArrayList<Orga> orgalist;
		int pageCount1;

		orgalist = Orgamodel.OrgaList1(con, pageno, pagesize,search,find);
		pageCount1 = Orgamodel.OrgaPagecount1(con, pageno, pagesize,search,find);
		if (pageno > pageCount1) {
			pageno = 1;
			orgalist = Orgamodel.OrgaList1(con, pageno, pagesize,search,find);
			pageCount1 = Orgamodel.OrgaPagecount1(con, pageno, pagesize,search,find);
		}
		con.close();
	%>
	<table width='100%' style="table-layout:fixed">
		<tr align="center">
			<th>序号</th>
			<th>组织编号</th>
			<th>组织名称</th>
			<th>所属行业</th>
			<th>操作</th>
		</tr>
		<%
			int i = 0;
			for (Orga orga : orgalist) {
				i = i + 1;
				String bg = null;
				if (i % 2 == 1) {
					bg = "#ffffff";
		%>

		<tr align="left" bgcolor="<%=bg%>">
			<td align="center"><%=i%></td>
			<td align="center"><%=orga.getOrgaId()%></td>
			<td align="left"><%=orga.getOrgaName()%></td>
			<td align="center"><%=orga.getIndustryID()%></td>
			<td align="center">
			<a href="/dqwr/operateorga?operateid=0&orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgadelete">删除|</a>
			<a href="/dqwr/operateorga?operateid=1&orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgaedit">修改|</a>
			<a href="LookOrga.jsp?orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgalook">查看</a>
			</td>
		</tr>
		<%
				} 
				else {
						bg = "#F0F0F0";
		%>

		<tr align="left" bgcolor="<%=bg%>">
			<td align="center"><%=i%></td>
			<td align="center"><%=orga.getOrgaId()%></td>
			<td align="left"><%=orga.getOrgaName()%></td>
			<td align="center"><%=orga.getIndustryID()%></td>
			<td align="center">
			<a href="/dqwr/operateorga?operateid=0&orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgadelete">删除|</a>
			<a href="/dqwr/operateorga?operateid=1&orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgaedit">修改|</a>
			<a href="LookOrga.jsp?orgaid=<%=orga.getOrgaId() %>&pageno=<%=pageno %>" id="orgalook">查看</a>
			</td>
		</tr>
		<%
				}
		%>
		<%
			}
		%>
	</table>
	<div style="background: #C0E4FA; position: relative;">
		<div style="background: #C0E4FA; position: absolute;" align="left">
			共有
			<%=i%>
			条最新记录，当前页第<%=pageno%>/<%=pageCount1%>页 &nbsp;&nbsp; <a
				href="orga.jsp?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1);%>">上一页</a>&nbsp;&nbsp;<a
				href="orga.jsp?pageno=<%if((pageno+1)>pageCount1) out.print(pageCount1);else out.print(pageno+1);%>">下一页</a>
		</div>
		<form name="form1" method="post" action="orga.jsp">
			<div align="right">
				<a href="orga.jsp?pageno=1">首页</a>&nbsp;&nbsp;<a
					href="orga.jsp?pageno=<%=pageCount1%>">尾页</a> 跳转到 <input
					type="text" size="1" style="width: 20px; height: 15px;"
					name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#"
					onclick="form1submit()">跳转</a>
			</div>
		</form>
	</div>
</body>
</html>