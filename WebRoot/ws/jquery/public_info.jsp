<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    import="com.dqwr.publicinfo.dao.impl.*" import="com.dqwr.publishinfo.entity.Info"
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
	int ispass=0;
	String pass=request.getParameter("ispass");
	if(pass!=null){
		ispass=Integer.parseInt(pass);
	}else
	{
		System.out.println("获得的ispass值是空的");
	}
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
	YH user = (YH) request.getSession().getAttribute("user");
	String id = request.getParameter("id");
	Connection con = database.connection();
	ArrayList<Info> infolist = PublicInfo.public_info(con, pageno, pagesize,search,find,ispass);
	int pageCount=PublicInfo.public_infoPagecount(con, pageno, pagesize,search,find,ispass);
	System.out.println("public_info.jsp的----"+pageCount);
	if (pageno>pageCount){
%>	
		<%
			    pageno=1;
				infolist = PublicInfo.public_info(con, pageno, pagesize,search,find,ispass);
				pageCount=PublicInfo.public_infoPagecount(con, pageno, pagesize,search,find,ispass);
			}
			con.close();
		%>
<table  width='100%' style="table-layout:fixed">
		<tr align="center"><th width='5%'>序号</th><th width='40%'>主题</th><th>发布人</th><th>发布时间</th><th width='25%'>操作</th></tr >
		<%
			int i=0;
			for(Info info : infolist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
				<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><%=info.getTitle() %></td>
					<td><%=info.getCreatorId() %></td>
					<td><%=info.getAddDate() %></td>
			<%
			  if(ispass==0){
		      %>
		      <td><a href="/dqwr/infoshenhe?requid=<%=info.getInfoId()%>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">审核</a></td>
		      <%
			  }else if(ispass==1){
				
		      %>
		      <td><a href="/dqwr/operateinfo?operateid=0&infoid=<%=info.getInfoId() %>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">删除</a>|<a href="/dqwr/operateinfo?operateid=1&infoid=<%=info.getInfoId() %>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">编辑</a>|<a href="/dqwr/operateinfo?operateid=2&infoid=<%=info.getInfoId() %>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">查看</a></td>
		      <%
			  }
			%>
					
				</tr>
			<%}else{ bg="#F0F0F0";%>
				
				
					<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td style="overflow: hidden; text-overflow: ellipsis; word-break: keep-all; white-space: nowrap;text-align:left"><%=info.getTitle() %></td>
					<td><%=info.getCreatorId() %></td>
					<td><%=info.getAddDate() %></td>
					<%
			  if(ispass==0){
		      %>
		      <td><a href="/dqwr/infoshenhe?requid=<%=info.getInfoId()%>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">审核</a></td>
		      <%
			  }else if(ispass==1){
				
		      %>
		      <td><a href="/dqwr/operateinfo?operateid=0&infoid=<%=info.getInfoId()%>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">删除</a>|<a href="/dqwr/operateinfo?operateid=1&infoid=<%=info.getInfoId() %>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">编辑</a>|<a href="/dqwr/operateinfo?operateid=2&infoid=<%=info.getInfoId() %>&pagesize=<%=pagesize %>&pageno=<%=pageno %>">查看</a></td>
		      <%
			  }
			%>
				</tr>
			<%} %>
		<%} %>
		</table>
	<div style="background: #C0E4FA;position: relative;" >
	<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp;
	<%
	 if(ispass==0)
	 {
	 %>
	 <a href="public_info.jsp?ispass=0&pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;
	<a href="public_info.jsp?ispass=0&pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
	<form name="form1" method="post" action="public_info.jsp?ispass=0">
	<div align="right">
	   <a href="public_info.jsp?ispass=0&pageno=1">首页</a>&nbsp;&nbsp;
	   <a href="public_info.jsp?ispass=0&pageno=<%=pageCount %>">尾页</a>  跳转到
	   <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a>
	</div>
	</form>
	 <%	 
	 }else if(ispass==1)
	 {
	%>
	<a href="public_info.jsp?ispass=1&pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;
	<a href="public_info.jsp?ispass=1&pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
	<form name="form1" method="post" action="public_info.jsp?ispass=1">
	<div align="right">
	   <a href="public_info.jsp?ispass=1&pageno=1">首页</a>&nbsp;&nbsp;
	   <a href="public_info.jsp?ispass=1&pageno=<%=pageCount %>">尾页</a>  跳转到
	   <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a>
	</div>
	</form>
    <%	 
	 }
	%> 
	</div>
</body>
</html>