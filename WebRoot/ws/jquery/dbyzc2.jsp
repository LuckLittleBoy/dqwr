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
	String sxzt = request.getParameter("sxzt");//时效擦好像
	String search = request.getParameter("search");//查询选择（名字还是文号）
	String find = request.getParameter("find");//查询内容
	String timesearch = request.getParameter("timesearch");//时间查询选择
	String startT = request.getParameter("startT");//开始时间
	String endT = request.getParameter("endT");//结束时间
	String shzt = request.getParameter("shzt");
	System.out.println("shzt:"+shzt);
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
	ArrayList<ZC>  policytaglist = Brose.syzcchPolicy(con, pageno, pagesize,user.getYHID(),search,find,sxzt,timesearch,startT,endT,shzt);
	int pageCount=Brose.syzcchPagecount(con, pageno, pagesize,user.getYHID(),search,find,sxzt,timesearch,startT,endT,shzt);
	if (pageno>pageCount){
%>
		
		<%
			pageno=1;
			policytaglist = Brose.syzcchPolicy(con, pageno, pagesize,user.getYHID(),search,find,sxzt,timesearch,startT,endT,shzt);
			pageCount=Brose.syzcchPagecount(con, pageno, pagesize,user.getYHID(),search,find,sxzt,timesearch,startT,endT,shzt);
			}
			con.close();
		%>
	<table  width='100%' >
		<tr align="center"><th width='40px'>序号</th><th>政策名字</th><th>政策文号</th><th width='100px'>政策类别</th><th width='160px'>最近操作时间</th><th >时效状态</th><th width='80px'>目前状态</th>	</tr >
		<%
			int i=0;
			for(ZC policytag : policytaglist){ 
				i=i+1;String bg =null;
				if (i%2==1){
					bg="#ffffff";
		%>
				
				<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dqwr/dbyyw?pno=<%=policytag.getZCID() %>"  style="color: red"><%=policytag.getZCMC() %></a></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policytag.getZCWH() %></td>
					<td><%=policytag.getZCFLMC() %></td>
					<%if(!"".equals(policytag.getLasttime())){ %>
					<td><%=policytag.getLasttime().substring(0,19) %></td>
					<% }else{%>
					<td></td>
					<%} %>
					<%if(policytag.getZSXZTW().equals("1")){ %>
					<td>有效</td>
					<%}else{ %>
					<td>失效</td>
					<%} %>
					<td>待标引</td>
				</tr>
			<%}else{ bg="#F0F0F0";%>
				
				
					<tr align="center" bgcolor="<%=bg %>">
				
					<td><%=i %></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dqwr/dbyyw?pno=<%=policytag.getZCID() %>"  style="color: red"><%=policytag.getZCMC() %></a></td>
					<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policytag.getZCWH() %></td>
					<td><%=policytag.getZCFLMC() %></td>
					<%if(!"".equals(policytag.getLasttime())){ %>
					<td><%=policytag.getLasttime().substring(0,19) %></td>
					<% }else{%>
					<td></td>
					<%} %>
					<%if(policytag.getZSXZTW().equals("1")){ %>
					<td>有效</td>
					<%}else{ %>
					<td>失效</td>
					<%} %>
					<td>待标引</td>
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