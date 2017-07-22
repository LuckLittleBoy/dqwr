<%--
	自动补全的Ajax实例
--%>
<%@ page contentType="text/xml; charset=UTF-8" language="java"
	import="java.sql.*,com.dqwr.dao.*"
    pageEncoding="utf-8" %>
<!-- 返回xml数据的“视图层”暂时不做任何逻辑判断,先将所有的单词都返回、待前后台应用可以完整的协作后，在限制返回的内容 -->

<%
	DataBaseDao database = new DataBaseDao();
	response.setCharacterEncoding("UTF-8");
	Connection con = database.connection();
	String sql = "select * from TTZLYView ";
	
	PreparedStatement stmt=null;
	ResultSet rs = null;
	stmt=con.prepareStatement(sql);

	rs=stmt.executeQuery();
	//ajax 动态生成 实行范围
	
	out.println("<option value=''>请选择所属专题</option>");
	while(rs.next()){
		out.println("<option value='"+rs.getString("TID")+"'>"+rs.getString("TTzlymc")+"</option>");
	}
	rs.close();
	database.closeConnection(con);
	stmt.close();
%>


