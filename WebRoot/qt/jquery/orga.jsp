<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*, java.util.ArrayList,com.dqwr.dao.*,java.sql.*"
    import="com.dqwr.requirement.dao.impl.OrgaDaoImpl" import="com.dqwr.requirement.entity.Orga"
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
	String search = request.getParameter("search");//查询选择（名字还是文号）
	String find = request.getParameter("find");
	int pageno =0;
	int pagesize =0;
	int pass=0;
	int expertid=0;
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
	String exppass=request.getParameter("exppass");
	if(exppass!=null){
		pass=Integer.parseInt(exppass);
	}
	YH user = (YH) request.getSession().getAttribute("user");
	String id = request.getParameter("id");
	Connection con = database.connection();
	ArrayList<Orga> orgalist = Orgamodel.xdshPolicy(con, pageno, pagesize,pass,search,find);
	int pageCount=Orgamodel.xdshPagecount(con, pageno, pagesize,pass,search,find);
	if (pageno>pageCount){
%>	
		<%
			    pageno=1;
				orgalist = Orgamodel.xdshPolicy(con, pageno, pagesize,pass,search,find);
				pageCount=Orgamodel.xdshPagecount(con, pageno, pagesize,pass,search,find);
			}
			con.close();
		%>
<table  width='100%' >
		<tr align="center"><th width='40px'>序号</th><th>机构编号</th><th>机构名称</th><th>行业领域</th><th>联系电话<!-- </th><th width='140px'>操作</th> --></tr >
		<%
			int i=0;
			for(Orga orga : orgalist){ 
				i=i+1;
				String bg =null;
				if (i%2==1){
					bg="#ffffff";  
		%>
				<tr align="center" bgcolor="<%=bg %>">				
					<td><%=i %></td>
					<td><%=orga.getOrgaId() %></td>
					<td><%=orga.getOrgaName() %></td>
					<td><%=orga.getIndustryID() %></td>
					<td><%=orga.getCel() %></td>
					 
		  <%-- <% 
		     if(pass==1){
		   %>
		    <td><a href="ExpertShenhe.jsp?ExpertID=<%=orga.getExpertID() %>&SH=0" id="shenhe1">审核</a></td>
		   <% 
		     }
		     if(pass==2){
		    %>
		    <td><a href="LookExpert.jsp?expertid=<%=orga.getExpertID()%>" id="xslook">查看</a></td>
		   <%	 
		     }
		     if(pass==3){
		    %>
		    <td><a href="ExpertShenhe.jsp?ExpertID=<%=orga.getExpertID() %>&SH=1" id="shenhe1">审核</a></td>
		    <% 
		     }
		     if(pass==4){
		    %>
		    <td><a href="/kjzc/operateexpert?operateid=0&expertid=<%=orga.getExpertID()%>" id="xsdelete">删除|</a><a href="/kjzc/operateexpert?operateid=1&expertid=<%=expert.getExpertID()%>&flag=4" id="xsedit">修改|</a><a href="LookExpert.jsp?expertid=<%=expert.getExpertID()%>" id="xslook">查看</a></td>
		    <% 
		     }
		     if(pass==5)
		     {
		    %>
		    <td><a href="/kjzc/operateexpert?operateid=2&expertid=<%=orga.getExpertID()%>" >查看</a></td>
		    <%
		     }
		    %>
					<%
					  expertid=expert.getExpertID();
					%> --%>
				</tr>
			<%}else{ bg="#F0F0F0";%>					
					<tr align="center" bgcolor="<%=bg %>">						
					<td><%=i %></td>
					<td><%=orga.getOrgaId() %></td>
					<td><%=orga.getOrgaName() %></td>
					<td><%=orga.getIndustryID() %></td>
					<td><%=orga.getCel() %></td>
					<%--  <% 
		     if(pass==1){
		   %>
		    <td><a href="ExpertShenhe.jsp?ExpertID=<%=expert.getExpertID() %>&SH=0" id="shenhe1">审核</a></td>
		   <% 
		     }
		     if(pass==2){
		    %>
		    <td><a href="/kjzc/operateexpert?operateid=0&expertid=<%=expert.getExpertID()%>" id="xsdelete">删除|</a><a href="/kjzc/operateexpert?operateid=1&expertid=<%=expert.getExpertID()%>" id="xsedit">修改|</a><a href="LookExpert.jsp?expertid=<%=expert.getExpertID()%>" id="xslook">查看</a></td>
		   <%	 
		     }
		     if(pass==3){
		    %>
		    <td><a href="ExpertShenhe.jsp?ExpertID=<%=expert.getExpertID() %>&SH=1" id="shenhe1">审核</a></td>
		    <% 
		     }
		     if(pass==4){
		    %>
		    <td><a href="/kjzc/operateexpert?operateid=0&expertid=<%=expert.getExpertID()%>" id="xsdelete">删除|</a><a href="/kjzc/operateexpert?operateid=1&expertid=<%=expert.getExpertID()%>" id="xsedit">修改|</a><a href="LookExpert.jsp?expertid=<%=expert.getExpertID()%>" id="xslook">查看</a></td>
		    <% 
		     }
		     if(pass==5)
		     {
		    %>
		    <td><a href="/kjzc/operateexpert?operateid=2&expertid=<%=expert.getExpertID()%>" >查看</a></td>
		    <%
		     }
		    %> --%>
				</tr>
			<%} %>
		<%} %>
		</table>
		<div style="background: #C0E4FA;position: relative;" >
	<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; <a href="xdsh.jsp?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>">上一页</a>&nbsp;&nbsp;<a href="xdsh.jsp?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>">下一页</a></div>
	<form name="form1" method="post" action="xdsh.jsp"><div align="right"><a href="xdsh.jsp?pageno=1">首页</a>&nbsp;&nbsp;<a href="xdsh.jsp?pageno=<%=pageCount %>">尾页</a>  跳转到
	 <input type="text" size="1"  style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="form1submit()">跳转</a></div></form>
	</div>
</body>
</html>