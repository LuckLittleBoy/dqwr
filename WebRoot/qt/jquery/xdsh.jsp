<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    import="com.dqwr.requirement.dao.impl.RequireDaoImpl" import="com.dqwr.requirement.entity.Requirement"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery.min.js"></script>
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
	String tag = request.getParameter("tag");
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

/* 	YH user = (YH) request.getSession().getAttribute("user");

 */
 YH wbuser = (YH) session.getAttribute("wbuser");
 String id = request.getParameter("id");
	String username=wbuser.getUsername();
	Connection con = database.connection();
	ArrayList<Requirement> requirelist = Brose.Requirelist1(con, pageno, pagesize,pass,search,find,username);
	int pageCount=Brose.requirePagecount1(con, pageno, pagesize,pass,search,find,username);
	if (pageno>pageCount){
%>	
		<%
			    pageno=1;
				requirelist = Brose.Requirelist1(con, pageno, pagesize,pass,search,find,username);
				pageCount=Brose.requirePagecount1(con, pageno, pagesize,pass,search,find,username);
			}
			con.close();
		%>
        <table  width='100%' style="table-layout:fixed">
		<tr align="center" bgcolor="#c0e4fa"><th width=40px>序号</th><th width=600px>需求名称</th><th >填报时间</th></tr >
		<%
			int i=0;
			for(Requirement require : requirelist){ 
				i=i+1;
				String bg =null;
				if (i%2==1){
					bg="#ffffff";
					 
		%>
				
				<tr align="center" bgcolor="<%=bg %>">
				
					<td align="center"><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><a href="/dqwr/operaterequireb?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>"><%=require.getRequName() %></a></td>
					<td  align="center"><%=require.getFillTime() %></td>
	
<%-- 		    <td><a href="/dqwr/operaterequireb?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>">查看</a></td>
 --%>		  
					<%
					  requid=require.getRequId();
					%>
				</tr>
			<%}else{ bg="#F0F0F0";
			  
			%>
				
				
					<tr align="center" bgcolor="<%=bg %>">				
					
					<td align="center"><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><a href="/dqwr/operaterequireb?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>"><%=require.getRequName() %></a></td>
					<td  align="center"><%=require.getFillTime() %></td>
		
<%-- 		    <td><a href="/dqwr/operaterequireb?operateid=2&requid=<%=require.getRequId()%>&orgaid=<%=require.getOrgaId() %>&pageno=<%=pageno %>">查看</a></td>
 --%>		   
				</tr>
			<%} %>
		<%} %>
		</table>
	<div style="background: #C0E4FA; position: relative;">
		<div style="background: #C0E4FA; position: absolute;" align="left">
			共有
			<%=i%>
			条最新记录，当前页第<%=pageno%>/<%=pageCount%>页 &nbsp;&nbsp; <a
				href="qttjfx.jsp?reqpass=<%=pass%>&tag=2&pageno=<%if ((pageno + 1) < 1)
				out.print(1);
			else
				out.print(pageno - 1);%>">上一页</a>&nbsp;&nbsp;<a
				href="qttjfx.jsp?reqpass=<%=pass%>&tag=2&pageno=<%if ((pageno + 1) > pageCount)
				out.print(pageCount);
			else
				out.print(pageno + 1);%>">下一页</a>
		</div>
		<form name="form1" method="post"
			action="qttjfx.jsp?reqpass=<%=pass%>&tag=2">
			<div align="right">
				<a href="qttjfx.jsp?reqpass=<%=reqpass%>&pageno=1&tag=2">首页</a>&nbsp;&nbsp;<a
					href="qttjfx.jsp?reqpass=<%=reqpass%>&pageno=<%=pageCount%>&tag=2">尾页</a>
				跳转到 <input type="text" size="1" style="width: 20px; height: 15px;"
					name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#"
					onclick="form1submit()">跳转</a>
			</div>
		</form>
	</div>
</body>
</html>