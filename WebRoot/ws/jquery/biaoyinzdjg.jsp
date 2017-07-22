<%--
	自动补全的Ajax实例
--%>
<%@ page contentType="text/xml; charset=UTF-8" language="java"
	import="java.sql.*,com.dqwr.dao.*"
    pageEncoding="utf-8" %>
<!-- 返回xml数据的“视图层”暂时不做任何逻辑判断,先将所有的单词都返回、待前后台应用可以完整的协作后，在限制返回的内容 -->
<%
	//页面端传送的字符串
	String zdjg = (String)request.getParameter("zdjg");

%>
<zdjgs>
<%
	DataBaseDao database = new DataBaseDao();
	response.setCharacterEncoding("UTF-8");
	Connection con = database.connection();
	String sql = "select * from ZDJGView where zid LIKE ? OR zdjgpy LIKE ? or zdjgmc LIKE ?";
	
	PreparedStatement stmt=null;
	ResultSet rs = null;
	stmt=con.prepareStatement(sql);
	stmt.setString(1, zdjg+"%");
	stmt.setString(2, zdjg+"%");
	stmt.setString(3, zdjg+"%");
	rs=stmt.executeQuery();
	//ajax 动态生成 实行范围
	while(rs.next()){
		out.println("<zdjg>"+rs.getString("zid")+"  "+rs.getString("zdjgmc")+"("+rs.getString("zssbm")+")"+"</zdjg>");
	}
	rs.close();
	database.closeConnection(con);
	stmt.close();
%>

	
</zdjgs>

