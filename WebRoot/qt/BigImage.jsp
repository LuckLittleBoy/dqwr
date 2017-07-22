<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*,com.dqwr.dao.*"%>
<html>
<body align="center">
  <%
     DataBaseDao db=new DataBaseDao();
     Connection conn=null;
     conn=db.connection();
     int id=Integer.parseInt(request.getParameter("id"));
     System.out.println(id);
     String sql="select Big from PublicPic where id='"+id+"'";
     PreparedStatement stmt=conn.prepareStatement(sql);
     ResultSet rs=null;
     rs=stmt.executeQuery();
     while(rs.next()){
    	 String bigpath=rs.getString(1);
    	 int index = bigpath.lastIndexOf("\\");
		 bigpath = bigpath.substring(index + 1);
   %>   
       <a href="http://www.aqistudy.cn/" ><img src="../getSmallPath?text=<%=bigpath%> " onclick="show()"/></a><!-- http://www.aqistudy.cn/ -->
   <%	 
     }
  %>
</body>
</html>
