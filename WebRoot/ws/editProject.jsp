<%@ page language="java"
	import="beans.Emp,com.dqwr.project.dao.impl.ProjectDaoImpl,java.sql.*,com.dqwr.dao.DataBaseDao"
	
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script language="javascript">
 function back(){
	 document.location.href="ws/projectManage.jsp";
 }
</script>
</head>
<body>
  <% 
  //Emp emp=(Emp)request.getAttribute("emp");
  int empid=Integer.parseInt(request.getParameter("empid"));
  String pageno=request.getParameter("pageno");
  ResultSet rs=null;
  Connection con=null;
  ProjectDaoImpl projectimpl=new ProjectDaoImpl();
  DataBaseDao db=new DataBaseDao();
  con=db.connection();
  rs=projectimpl.lookProject(con,empid);
  rs.next();
  int operateid=Integer.parseInt(request.getParameter("operateid"));
  String path=null;
  String declare=null;
  String commit=null;
  String question=null;
  String accept=null;
  %>
  <center>
    <br>
  </center>
  <form method="post" action="/dqwr/EditProjectServlet">
  <input type="hidden" name="empid" value=<%=rs.getInt(1) %>>
  <input type="hidden" name="pageno" value=<%=pageno %>>
  <table width="50%" height="70%" align="center" border="1">
    <tr align="center">
      <td width="20%">
                项目名称 
      </td>
      <td>
        <input type="text" name="projectname" style="width:90%;" value=<%=rs.getString(2) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                 单位名称 
      </td>
      <td>
        <input type="text" name="organame" style="width:90%;" value=<%=rs.getString(3) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                组织机构代码
      </td>
      <td>
        <input type="text" name="orgaid" style="width:90%;" value=<%=rs.getString(4) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                申请拨款
      </td>
      <td>
        <input type="text"  name="askfund" style="width:90%;" value=<%=rs.getString(5) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                合作单位
      </td>
      <td>
        <input type="text"  name="cooperateorga" style="width:90%;" value=<%=rs.getString(6) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                负责人
      </td>
      <td>
        <input type="text"  name="head" style="width:90%;" value=<%=rs.getString(7) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                技术领域
      </td>
      <td>
        <input type="text"  name="field" style="width:90%;" value=<%=rs.getString(8) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                指南代码
      </td>
      <td>
        <input type="text"  name="guidecode" style="width:90%;" value=<%=rs.getString(9) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                归口 
      </td>
      <td>
        <input type="text"  name="orgaparent" style="width:90%;" value=<%=rs.getString(10) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                起止年限 
      </td>
      <td>
        <input type="text"  name="stopendyear" style="width:90%;" value=<%=rs.getString(11) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="11%">
                是否高薪技术企业 
      </td>
      <td>
        <input type="text"  name="isenterprise" style="width:90%;" value=<%=rs.getString(12) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                计划类别 
      </td>
      <td>
        <input type="text"  name="plantype" style="width:90%;" value=<%=rs.getString(13) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                分管部门 
      </td>
      <td>
        <input type="text"  name="department" style="width:90%;" value=<%=rs.getString(14) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                项目编号 
      </td>
      <td>
        <input type="text"  name="projectid" style="width:90%;" value=<%=rs.getString(15) %>>
      </td>
    </tr>
    <tr align="center">
      <td width="20%">
                合同经费 
      </td>
      <td>
        <input type="text"  name="money" style="width:90%;" value=<%=rs.getString(16) %>>
      </td>
    </tr>
    <% 
     if(rs.getString(17)!=null){
    	 declare=rs.getString(17).substring(8);
    %>
    <tr align="center">
      <td width="20%">
            项目申报书
      </td>
      <td>
        <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='0'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=declare %>(点击修改)</a>
      </td>
    <%
     }else{
    	 declare="无相关文档";
     %>
     <tr align="center">
      <td width="20%">
            项目申报书
      </td>
      <td>
        <%=declare %>
      </td>
    <%
     }
    %>
     
      
     <%
     
     if(rs.getString(18)!=null){
    	 commit=rs.getString(18).substring(8);
    %>
     <tr align="center">
      <td width="20%">
       项目任务书
      </td>
      <td>
      <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='1'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=commit %>(点击修改)</a>
      </td>
    </tr>
    <%
     }else{
    	 commit="无相关文档";
    %>
     <tr align="center">
      <td width="20%">
       项目任务书
      </td>
      <td>
       <%=commit %>
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
      <td width="20%">
           中期调查表
      </td>
      <td>
         <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='2'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=question %>(点击修改)</a>
      </td>
    </tr>
    <%
     }else{
    	 question="无相关文档";
    %>
     <tr align="center">
      <td width="20%">
              中期调查表
      </td>
      <td>
         <%=question %>
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
      <td width="20%">
       验收报告
      </td>
      <td>
       <a href="ws/processMonitor.jsp?empid=<%=rs.getInt(1) %>&item='3'&operateid=<%=operateid %>&pageno=<%=pageno %>"><%=accept %>(点击修改)</a>
      </td>
    </tr>
    
    <%
     }else{
    	 accept="无相关文档";
   %>
    <tr align="center">
      <td width="20%">
           验收报告
      </td>
      <td>
       <%=accept %>
      </td>
    </tr>
   <%
     }
    %>
    
  </table>
  <br>
   <center>
   <input type="submit" value="修改" style="height: 30px; width: 65px; background-color: #408080;">
   </center>
  </form>
</body>
</html>