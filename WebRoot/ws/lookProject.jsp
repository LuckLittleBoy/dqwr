<%@ page language="java"
	import="beans.Emp,java.sql.*,com.dqwr.dao.DataBaseDao,com.dqwr.project.dao.impl.ProjectDaoImpl"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{text-align:center;border-right:1px solid #3299cc;border-bottom:1px solid #3299cc}
  .table-c table tr{height:50px;}
  .title{font-weight:bold;} 
        h3{font-style: italic;color:navy;}
  
 </style>
</head>
<body>
  <% 
    int empid=Integer.parseInt(request.getParameter("empid"));
    String pageno=request.getParameter("pageno");
    int operateid=Integer.parseInt(request.getParameter("operateid"));
    ResultSet rs=null;
    Connection con=null;
    ProjectDaoImpl projectimpl=new ProjectDaoImpl();
    DataBaseDao db=new DataBaseDao();
    con=db.connection();
    rs=projectimpl.lookProject(con,empid);
    rs.next();
    String path=null;
    String declare=null;
    String commit=null;
    String question=null;
    String accept=null;
  %>
 <div class="table-c">
 <br>
     <center><h2><font color="navy">项目查看</font></h2></center>
  <table border="0" width="63%" align="center" bgcolor="#FFFFFF">
     <tr >
      <td class="title">
                项目名称 
      </td>
      <td>
        <%=rs.getString(2) %>
      </td>
    </tr>
    <tr>
      <td class="title" >
                 单位名称 
      </td>
      <td>
        <%=rs.getString(3)%>
      </td>
    </tr>
    <tr >
      <td class="title">
                组织机构代码 
      </td>
      <td>
        <%=rs.getString(4) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                申请拨款 
      </td>
      <td>
        <%=rs.getString(5) %>
      </td>
    </tr>
    <tr >
      <td class="title">
                合作单位
      </td>
      <td>
        <%=rs.getString(6) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                负责人 
      </td>
      <td>
        <%=rs.getString(7) %>
      </td>
    </tr>
    <tr >
      <td class="title">
                技术领域 
      </td>
      <td>
        <%=rs.getString(8) %>
      </td>
    </tr>
    <tr >
      <td class="title">
                指南代码 
      </td>
      <td>
        <%=rs.getString(9) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                归口 
      </td>
      <td>
        <%=rs.getString(10) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                起止年限
      </td>
      <td>
        <%=rs.getString(11) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                是否高薪技术企业 
      </td>
      <td>
        <%=rs.getString(12) %>
      </td>
    </tr>
    <tr >
      <td class="title">
                计划类别
      </td>
      <td>
       <%=rs.getString(13) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                分管部门
      </td>
      <td>
        <%=rs.getString(14) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                项目编号
      </td>
      <td>
        <%=rs.getString(15) %>
      </td>
    </tr>
    <tr>
      <td class="title">
                合同经费
      </td>
      <td>
        <%=rs.getString(16) %>
      </td>
    </tr>
    <% 
     if(rs.getString(17)!=null){
    	 declare=rs.getString(17).substring(8);
    %>
    <tr>
      <td class="title">
            项目申报书
      </td>
      <td>
        <a href="/dqwr/LoadFile?path=<%=rs.getString(17) %>"><%=declare %></a>
      </td>
    <%
     }else{
    	 declare="无相关文档(点击上传)";
     %>
     <tr align="center">
      <td width="15%" class="title">
            项目申报书
      </td>
      <td>
        <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='0'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=declare %></a>
      </td>
    <%
     }
    %>
     
      
     <%
     
     if(rs.getString(18)!=null){
    	 commit=rs.getString(18).substring(8);
    %>
     <tr align="center">
      <td width="15%" class="title">
       项目任务书
      </td>
      <td>
        <a href="/dqwr/LoadFile?path=<%=rs.getString(18) %>"><%=commit %></a>
      </td>
    </tr>
    <%
     }else{
    	 commit="无相关文档(点击上传)";
    %>
     <tr align="center">
      <td width="15%" class="title">
       项目任务书
      </td>
      <td>
     <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='1'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=commit %></a>
      </td>
    </tr>
    <%
     }
    %>
    
    
    <% 
     if(rs.getString(19)!=null){
    	 question=rs.getString(19).substring(8);
    %>
    <tr align="center">
      <td width="15%" class="title">
           中期调查表
      </td>
      <td>
         <a href="/dqwr/LoadFile?path=<%=rs.getString(19) %>"><%=question %></a>
      </td>
    </tr>
    <%
     }else{
    	 question="无相关文档(点击上传)";
    %>
     <tr align="center">
      <td width="15%" class="title">
              中期调查表
      </td>
      <td>
         <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='2'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=question %></a>
      </td>
    </tr>
    <%
     }
    %>
     
    
    <% 
     if(rs.getString(20)!=null){
    	 accept=rs.getString(20).substring(8);
    %>
    <tr align="center">
      <td width="15%" class="title">
       验收报告
      </td>
      <td>
        <a href="/dqwr/LoadFile?path=<%=rs.getString(20) %>"><%=accept %></a>
      </td>
    </tr>
    
    <%
     }else{
    	 accept="无相关文档(点击上传)";
   %>
    <tr align="center">
      <td width="15%" class="title">
           验收报告
      </td>
      <td>
     <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='3'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=accept %></a>
      </td>
    </tr>
   <%
     }
    %> 
   
  </table>
  </div>
  <br>
</body>
</html>