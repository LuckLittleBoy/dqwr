<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*,com.dqwr.dao.*" %>
<html>
<head>
<title>��̬��ʾ���ݿ�ͼƬ</title>
</head>
<body>
<%
Connection con=null;
DataBaseDao db=new DataBaseDao();
con=db.connection();
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
String sql=new String();
sql= "select * from PublicPic";
ResultSet rs=stmt.executeQuery(sql);
rs.last();
//��ָ���������һ����¼
%>
<table>
<tr><td><IMG height=99 src="Imageout.jsp?id=1" width=136></td>
//ȡ����һ��ͼƬ
<td><IMG height=99 src="Imageout.jsp?id=<%=rs.getInt("id")%>" width=136></td>
//ȡ�����һ��ͼƬ
</tr></table>
</body>
</html>
