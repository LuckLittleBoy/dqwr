<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function form1submit(){
	
	document.form1.submit();
}
</script>
</head>
<body>
<%
	DataBaseDao database = new DataBaseDao();
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

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
	YH user = (YH) request.getSession().getAttribute("user");
	String id = request.getParameter("id");
	Connection con = database.connection();
	ArrayList<ZC>  policytaglist = Brose.thPolicy(con, pageno, pagesize,user.getYHID());
	int pageCount=Brose.thpagecount(con,pageno,pagesize,user.getYHID());
	if (pageno>pageCount){
%>
		
		<%
			pageno=1;
				pageCount=Brose.thpagecount(con,pageno,pagesize,user.getYHID());
				policytaglist = Brose.thPolicy(con, pageno, pagesize,user.getYHID());
			}
			con.close();
		%>
	<table  width='100%' >
		<tr align="center"><th width='40px'>序号</th><th>政策名字</th><th>政策文号</th><th width='60px'>审核人</th><th width='80px'>时效状态</th><th width='80px'>目前状态</th><th>操作</th></tr >
		<%
			int i=0;
			for(ZC policytag : policytaglist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
				
				<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dqwr/thyw?pno=<%=policytag.getZCID() %>"><%=policytag.getZCMC() %></a></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policytag.getZCWH() %></td>
					
					<td><%=policytag.getZSHRID() %></td>
					<%if(policytag.getZSXZTW().equals("1")){ %>
					<td>有效</td>
					<%}else{ %>
					<td>失效</td>
					<%} %>
					<td>退回</td>
					<td><a href="../dbyyw?pno=<%=policytag.getZCID() %>"><img  height='22px' src="../images/by.gif"></a>
					 <a href="../baocun?zcid=<%=policytag.getZCID() %>"><img height='22px'  src="../images/bc.gif"></a>
					  <a href="../dlyw?pno=<%=policytag.getZCID() %>"><img  height='22px'  src="../images/del.gif"></a></td>
				</tr>
			<%}else{ bg="#F0F0F0";%>
					<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dqwr/thyw?pno=<%=policytag.getZCID() %>"><%=policytag.getZCMC() %></a></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policytag.getZCWH() %></td>
					
					<td><%=policytag.getZSHRID() %></td>
					<%if(policytag.getZSXZTW().equals("1")){ %>
					<td>有效</td>
					<%}else{ %>
					<td>失效</td>
					<%} %>
					<td>退回</td>
					<td><a href="../dbyyw?pno=<%=policytag.getZCID() %>"><img height='22px' src="../images/by.gif"></a> <a href="../baocun?zcid=<%=policytag.getZCID() %>"><img height='22px' src="../images/bc.gif"></a> <a href="../dlyw?pno=<%=policytag.getZCID() %>"><img height='22px' src="../images/del.gif"></a></td>
				</tr>
			<%} %>
		<%} %>
		</table>
		<div style="background: #C0E4FA;position: relative;" >
	<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; <a href="thzc.jsp?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;<a href="thzc.jsp?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
	<form name="form1" method="post" action="thzc.jsp"><div align="right"><a href="thzc.jsp?pageno=1">首页</a>&nbsp;&nbsp;<a href="thzc.jsp?pageno=<%=pageCount %>">尾页</a>  跳转到
	 <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a></div></form>
	</div>
</body>
</html>