<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    import="com.dqwr.requirement.dao.impl.RequireDaoImpl" import="com.dqwr.requirement.entity.Requirement"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
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
	String reqpass=request.getParameter("reqpass");
	if(reqpass!=null){
		pass=Integer.parseInt(reqpass);
	}
	YH user = (YH) request.getSession().getAttribute("user");
	String id = request.getParameter("id");
	Connection con = database.connection();

	ArrayList<Requirement> requirelist = Brose.Requirelist(con, pageno, pagesize,pass,search,find);
	int pageCount=Brose.requirePagecount(con, pageno, pagesize,pass,search,find);
	if (pageno>pageCount){
%>	
		<%
			    pageno=1;
				requirelist = Brose.Requirelist(con, pageno, pagesize,pass,search,find);
				pageCount=Brose.requirePagecount(con, pageno, pagesize,pass,search,find);
			}
			con.close();
		%>
        <table  width='100%' style="table-layout:fixed">
		<tr align="center"><th width='5%'>序号</th><th width='45%'>需求名称</th><th>填报时间</th><th width='30%'>操作</th></tr >
		<%
			int i=0;
			for(Requirement require : requirelist){ 
				i=i+1;
				String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
				
				<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><%=require.getRequName() %></td>
					<td><%=require.getFillTime() %></td>
		  <% 
		     if(pass==1){
		   %>
		    <td><a href="RequireShenhe.jsp?requid=<%=require.getRequId()%>&SH=0&pageno=<%=pageno %>" id="shenhe1">审核</a></td>
		   <% 
		     }
		     if(pass==2){
		    %>
		    <td><a href="/dqwr/operaterequire?reqpass=2&operateid=0&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>" id="xsdelete">删除|</a><a href="/dqwr/operaterequire?operateid=1&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&flag=2&pageno=<%=pageno %>" id="xsedit">修改|</a><a href="LookRequire.jsp?requid=<%=require.getRequId()%>&pageno=<%=pageno %>" id="xslook">查看</a></td>
		   <%	 
		     }
		     if(pass==3){
		    %>
		    <td><a href="RequireShenhe.jsp?requid=<%=require.getRequId()%>&SH=1&pageno=<%=pageno %>" id="shenhe2">审核</a></td>
		    <% 
		     }
		     if(pass==4){
		    %>
		    <td><a href="/dqwr/operaterequire?reqpass=4&operateid=0&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>" id="xsdelete">删除|</a><a href="/dqwr/operaterequire?operateid=1&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&flag=4&pageno=<%=pageno %>" id="xsedit">修改|</a><a href="LookRequire.jsp?requid=<%=require.getRequId()%>&pageno=<%=pageno %>" id="xslook">查看</a></td>
		    <% 
		     }
		     if(pass==5)
		     {
		    %>
		    <td><a href="/dqwr/operaterequire?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>">查看</a></td>
		    <%
		     }
		    %>
					<%
					  requid=require.getRequId();
					%>
				</tr>
			<%}else{ bg="#F0F0F0";%>
				
				
					<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><%=require.getRequName() %></td>
					<td><%=require.getFillTime() %></td>
			  <% 
		     if(pass==1){
		   %>
		    <td><a href="RequireShenhe.jsp?requid=<%=require.getRequId()%>&SH=0&pageno=<%=pageno %>" id="shenhe1">审核</a></td>
		   <% 
		     }
		     if(pass==2){
		    %>
		    <td><a href="/dqwr/operaterequire?reqpass=2&operateid=0&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>" id="xsdelete">删除|</a><a href="/dqwr/operaterequire?operateid=1&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&flag=2&pageno=<%=pageno %>" id="xsedit">修改|</a><a href="LookRequire.jsp?requid=<%=require.getRequId()%>&pageno=<%=pageno %>" id="xsdelete">查看</a></td>
		   <%	 
		     }
		     if(pass==3){
		    %>
		    <td><a href="RequireShenhe.jsp?requid=<%=require.getRequId()%>&SH=1&pageno=<%=pageno %>" id="shenhe2">审核</a></td>
		    <% 
		     }
		     if(pass==4){
		    %>
		    <td><a href="/dqwr/operaterequire?reqpass=4&operateid=0&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>" id="xsdelete">删除|</a><a href="/dqwr/operaterequire?operateid=1&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&flag=4&pageno=<%=pageno %>" id="xsedit">修改|</a><a href="LookRequire.jsp?requid=<%=require.getRequId()%>&pageno=<%=pageno %>" id="xsdelete">查看</a></td>
		    <% 
		     }
		     if(pass==5)
		     {
		    %>
		    <td><a href="/dqwr/operaterequire?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>">查看</a></td>
		    <%
		     }
		    %>
				</tr>
			<%} %>
		<%} %>
		</table>
		<div style="background: #C0E4FA;position: relative;" >
	<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; <a href="xdsh.jsp?reqpass=<%=pass %>&pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;<a href="xdsh.jsp?reqpass=<%=pass %>&pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
	<form name="form1" method="post" action="xdsh.jsp?reqpass=<%=pass %>"><div align="right"><a href="xdsh.jsp?reqpass=<%=reqpass %>&pageno=1">首页</a>&nbsp;&nbsp;<a href="xdsh.jsp?reqpass=<%=reqpass %>&pageno=<%=pageCount %>">尾页</a>  跳转到
	 <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a></div></form>
	</div>
</body>
</html>