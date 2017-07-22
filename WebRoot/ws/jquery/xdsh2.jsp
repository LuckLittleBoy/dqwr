<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    import="com.dqwr.requirement.entity.Requirement" import="com.dqwr.requirement.dao.impl.RequireDaoImpl"
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
	//String sxzt = request.getParameter("sxzt");//时效擦好像
	String search = request.getParameter("search");//查询选择（名字还是文号）
	String find = request.getParameter("find");//查询内容
	//String timesearch = request.getParameter("timesearch");//时间查询选择
	//String startT = request.getParameter("startT");//开始时间
	//String endT = request.getParameter("endT");//结束时间
	//String shzt = request.getParameter("shzt");
	//System.out.println("shzt:"+shzt);
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
	ArrayList<Requirement>  requirelist = Brose.xdshPolicy(con, pageno, pagesize,user.getYHID(),search,find);
	int pageCount=Brose.xdshPagecount(con, pageno, pagesize,user.getYHID(),search,find);
	if (pageno>pageCount){
%>
		
		<%
			pageno=1;
			requirelist = Brose.xdshPolicy(con, pageno, pagesize,user.getYHID(),search,find);
			pageCount=Brose.xdshPagecount(con, pageno, pagesize,user.getYHID(),search,find);
			}
			con.close();
		%>
<table  width='100%' >
		<tr align="center"><th width='40px'>序号</th><th>需求名称</th><th>发布时间</th><th width='80px'>操作</th></tr >
		<%
			int i=0;
			for(Requirement require : requirelist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
				<tr align="center" bgcolor="<%=bg %>">
					<td><%=i %></td>
					<td><%=require.getRequName() %></td>
					<td><%=require.getFillTime() %></td>
					<td><a href="/dqwr/qt/ShowRequireDetai?requid=<%=require.getRequId()%>">审核</a></td>
				</tr>
			<%}else{ bg="#F0F0F0";%>
					<tr align="center" bgcolor="<%=bg %>">
					<<td><%=i %></td>
					<td><%=require.getRequName() %></td>
					<td><%=require.getFillTime() %></td>
					<td><a href="/dqwr/qt/ShowRequireDetai?RequId=<%=require.getRequId() %>">审核</a></td>
				</tr>
			<%} %>
		<%} %>
		</table>
<input type="hidden" id="max" value="<%=pageCount %>">
		<div style="background: #C0E4FA;position: relative;" >
	<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; <a href="#" onclick="shangye()">上一页</a>&nbsp;&nbsp;<a href="#" onclick="xiaye()">下一页</a></div>
	<form name="form1" method="post" action="syzc.jsp"><div align="right"><a href="#" onclick="sy()">首页</a>&nbsp;&nbsp;<a href="#" onclick="my()">尾页</a>  跳转到
	 <input type="text" size="1"  style="width: 20px;height: 15px;" id="pageno2" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="tiaozhuan()">跳转</a></div></form>
	</div>
</body>
</html>