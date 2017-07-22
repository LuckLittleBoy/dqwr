<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
          <font size="4">
			<table border="0">
			<% 
			  ResultSet rs=null;
			  DataBaseDao db=new DataBaseDao();
			  Connection conn=db.connection();
			  RequireDaoImpl requireimpl=new RequireDaoImpl();
			  rs=requireimpl.AllReuqire(conn);
			  System.out.println(rs);
			%>
			<%
			   while(rs.next())
			   {
			%>
			 <tr>
			  <td style="padding-left:40px"><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" ><a href="ShowRequireDetail.jsp?requid=<%=rs.getString(1)%>"><font color="blue"><%=rs.getString(3)%></font></a></td>
			  <td>.................................................</td>
			  <td><%=rs.getString(11)%></td>
			 </tr>
			 <%
			 }
			 db.closeConnection(conn);
			 %>
			 
             </table>
             </font>
</body>
</html>