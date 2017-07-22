<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
    import="com.dqwr.technology.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
	import="com.dqwr.requirement.dao.impl.*"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowTechTest.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<style>
  .table-c table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-c table td{text-align:left;border-right:1px solid #3299cc;border-bottom:1px solid #3299cc;}
  .table-c table tr{height:50px;}
   .table-cc table{border-top:4px solid #3299cc;border-left:1px solid #3299cc}
  .table-cc table td{text-align:left;border-right:1px solid #3299cc;border-bottom:1px solid #3299cc;width: 540px;}
  .table-cc table tr{height:50px;}
  h3{font-style: italic;color:navy;}
  .title{font-weight:bold;width:20%;} 
  </style>
  </head>
  <body bgcolor="#c0e4fa">
  
		 <%
		 String tag = request.getParameter("tag");
		 if(tag!=null&&tag!="")
		 {
		 %>
		 <div style="float: left;">
			<a href="qt/qtcx1.jsp?tag=<%= tag %>" style="color:blank;font-size:16px;margin-left:20px;line-height:30px;">返回</a>
		</div>
		 <%
		 }
		%> 
		
		<%
		 String look = request.getParameter("look");
		 if(look!=null&&look!="")
		 {
		 %>
		 <div style="float: left;">
			<a href="qt/qtcx2.jsp?look=<%= look %>" style="color:blank;font-size:16px;margin-left:20px;line-height:30px;">返回</a>
		</div>
		 <%
		 }
		%> 
		
        <%
         ResultSet orgars,techrs,casers;
         int TechId=Integer.parseInt(request.getParameter("TechId"));
         String orgaid=request.getParameter("OrgaId");   
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
         TechnologyDaoImpl techimpl=new TechnologyDaoImpl();
         CaseDaoImpl caseimpl=new CaseDaoImpl();
         orgars=orgaimpl.SelectOrgaById(conn,orgaid);
         orgars.next();
         techrs=techimpl.selectTechById(conn, TechId);
         techrs.next();
         casers=caseimpl.selectCaseById(conn, TechId);
         //casers.next();
%> 
<body bgcolor="#ffffff">
<div class="table-c">
 <br>
        <center><h2><font color="navy">成熟技术</font></h2></center>
    <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
    <tr>
      <td class="title">技术名称</td>
      <td><%=techrs.getString(3) %>
      </td>
    </tr>
      <tr>
     <td class="title">技术来源</td>
     <%
       String sourcename="";
       if(techrs.getBytes(4)!=null){
       byte[] source=techrs.getBytes(4);
       int sourceflag=0;

       for(int i=0;i<source.length;i++)
       {
    	   if(source[i]==1){
    		   sourceflag=i;
    	   } 
       }
       switch(sourceflag){
       case 0:
    	   sourcename=techrs.getString(6);
    	   
    	   break;
       case 1:
    	   sourcename=techrs.getString(5);
    	   
    	   break;
       case 2:
    	   sourcename="技术引进吸收再创新";
    	   break;
       case 3:
    	   sourcename="合作开发";
    	   break;
       case 4:
    	   sourcename="自主研发";
    	   break;
       }
       }
     %>
     <td><%=sourcename%></td>
     </tr>
     <tr>
     <td class="title">技术领域</td>
     <% 
      String field="";
      String[] fields=techrs.getString(7).split(";");
      for(int i=0;i<fields.length;i++){
    	 if(fields[i].equals("其他")){
    		 field+=techrs.getString(8);
    	 }else{
    		 field+=fields[i]+";";
    	 } 
      }
      %>
      <td><%=field%></td>
     </tr>
     <%--  <tr>
     <td class="title">技术领域</td>
       <%
        String field="";
        if(techrs.getString(7)!=null){
        	field+=techrs.getString(7);
        } 
        if(techrs.getString(8)!=null){
        	System.out.println(techrs.getString(8));
        	field+=techrs.getString(8);
        }
      %>
     <td><%=field %></td>
     </tr> --%>
       <tr>
     <td class="title">技术简介</td>
     <td>
		<%=techrs.getString(9) %>
	</td>
     </tr>
     <tr>
     <td class="title">适用范围</td>
     <td>
		<%=techrs.getString(10) %>
	</td>
     </tr>
     <tr>
     <td class="title">先进度</td>
     <%
       String processname="";
       if(techrs.getBytes(11)!=null){
       byte[] process=techrs.getBytes(11);
       int processflag=0;
       for(int i=0;i<process.length;i++)
       {
    	   if(process[i]==1){
    		   processflag=i;
    	   } 
       }
       switch(processflag){
       case 0:
    	   processname="国内先进";
    	   break;
       case 1:
    	   processname="国内领先";
    	   break;
       case 2:
    	   processname="国际先进";
    	   break;
       case 3:
    	   processname="国际领先";
    	   break;
       }
       }
     %>
     <td><%=processname%></td>
     </tr>
     <tr>
     <td class="title">成熟度</td>
      <%
       String statename="";
       if(techrs.getBytes(12)!=null){
       byte[] state=techrs.getBytes(12);
       int stateflag=0;
       
       for(int i=0;i<state.length;i++)
       {
    	   if(state[i]==1){
    		   stateflag=i;
    	   } 
       }
       switch(stateflag){
       case 0:
    	   statename="示范应用";
    	   break;
       case 1:
    	   statename="规模化应用";
    	   break;
       case 2:
    	   statename="示范应用";
    	   break;
       }
       }
     %>
     <td><%=statename%></td>
     </tr> 
     <tr>
     <td class="title">经济指标</td>
     <td>
		<%=techrs.getString(13) %>
	</td>
     </tr>
     <tr>
     <td class="title">节能减排预期效果</td>
     <td>
		<%=techrs.getString(14) %>
	</td>
     </tr>
      <tr>
     <td class="title">成果转发方式</td>
     <%
       String tranname="";
       if(techrs.getBytes(15)!=null){
       byte[] tran=techrs.getBytes(15);
       int tranflag=0;
      
       for(int i=0;i<tran.length;i++)
       {
    	   if(tran[i]==1){
    		   tranflag=i;
    	   } 
       }
       switch(tranflag){
       case 0:
    	   tranname=techrs.getString(16);
    	   break;
       case 1:
    	   tranname="已转让";
    	   break;
       case 2:
    	   tranname="技术服务";
    	   break;
       case 3:
    	   tranname="技术授权";
    	   break;
       case 4:
    	   tranname="技术转让";
    	   break;
       }
       }
     %>
     <td><%=tranname%></td>
     </tr>
      <tr>
     <td class="title">成果融资需求</td>
     <%
      String finaneename="";
       if(techrs.getBytes(17)!=null){
       byte[] finanee=techrs.getBytes(17);
       int finaneeflag=0;
       
       for(int i=0;i<finanee.length;i++)
       {
    	   if(finanee[i]==1){
    		   finaneeflag=i;
    	   } 
       }
       System.out.println("i="+finaneeflag);
       switch(finaneeflag){
       case 0:
    	   finaneename=techrs.getString(18);
    	   break;
       case 1:
    	   finaneename="债权融资";
    	   break;
       case 2:
    	   finaneename="股权融资";
    	   break;
       }
       }
     %>
     <td><%=finaneename%></td>
     </tr>
     <tr>
       <td class="title">成果的融资需<br>求金额（万元）</td>
       <td><%=techrs.getString(19) %></td>
     </tr>
    <tr>
	   <td class="title">填报时间</td>
	   <td colspan="3"><%=techrs.getString(21) %></td>
	</tr>        
     </table>     
      <br>
      </div>
      <div class="table-cc">
      
     <% 
        int casenum=0;
     	int pathFlag=0;
     	ArrayList<String> paths = new ArrayList<String>();
        while(casers.next()){
         casenum++;
         if(!casers.getString(13).isEmpty()){
        	 //使用flag来标记路径是否存在
        	 pathFlag =1;//存在标记为1
        	 for(int a=0;a<casers.getString(13).split(";").length;a++){
         	 	paths.add(casers.getString(13).split(";")[a]); 
        	 }
         }else{
        	 pathFlag =0;//不存在标记为0
         }
      %>
     <center><h2><font color="navy">典型案例<%=casenum %></font></h2></center>
    <table border="0" width="72%" align="center" bgcolor="#FFFFFF">  
     <tr>
      <td class="title">案例名称</td>
      <td><%=casers.getString(3) %></td><td class="title">起始时间</td><td><%=casers.getString(4)%></td>
     </tr>
     <tr>
      <td class="title">实施单位</td>
      <td><%=casers.getString(5) %></td><td class="title">合作方式</td><td><%=casers.getString(6) %></td>
     </tr>
     <tr>
      <td class="title">联系人</td>
      <td><%=casers.getString(7) %></td><td class="title">联系电话</td><td><%=casers.getString(8) %></td>
     </tr>
     <tr>
     <td class="title">项目情况</td>
     <td colspan="3">
		<%=casers.getString(9) %>
	</td>
	 <tr>
     <td class="title">项目实施后节能减排效果</td>
     <td colspan="3">
		<%=casers.getString(10) %>
	</td>
     </tr>
     <tr>
     <td class="title">项目实施后企业效益及经济效益</td>
     <td colspan="3">
		<%=casers.getString(11) %>
	</td>
     </tr>
     <tr>
     <td class="title">用户对本项技术的综合性评价</td>
     <td colspan="3">
		<%=casers.getString(12) %>
	</td>
     </tr>
	 <tr>
     <td class="title">相关证明材料</td>
     <td colspan="3">
       <%
         if(pathFlag == 1){
         	for(int i=0;i<paths.size();i++){
        	 	String name=null;
        	  	name=paths.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths.get(i) %>"><%=name %></a>
        <br>
       <%}
         }else{
        		 %>
        		 <a href="#">无</a>
        <br>
		<%}%>
     </td>
	</tr>   
</table>
      <%   	
        }   
      %>  	
  <!--单位信息  -->
   <br>
     <center><h2><font color="navy">单位信息</font></h2></center>
   <table border="0" width="72%" align="center" bgcolor="#FFFFFF">
   <tr>
     <td class="title">机构代码</td>
     <td colspan="3"><%=orgars.getString(1)%></td>
   </tr>
   <tr>
   <td class="title">单位名称</td>
   <td colspan="3"><%=orgars.getString(2) %></td>
   </tr>
   <tr>
   <td class="title">单位法人</td>
   <td><%=orgars.getString(5) %></td><td class="title">联系人</td><td><%=orgars.getString(6)%></td>
   </tr>
   <tr>
      <td class="title">地址</td>
      <td><%=orgars.getString(9) %></td><td class="title">邮箱</td><td><%=orgars.getString(10)%></td>
     </tr>
     <tr>
      <td class="title">固话</td>
      <td><%=orgars.getString(7)%></td><td class="title">手机</td><td><%=orgars.getString(8)%></td>
     </tr>
     <tr>
     <td class="title">单位性质</td>
     <%
       byte[] nature=orgars.getBytes(12);
       int flag=0;
       String name=null;
       for(int i=0;i<nature.length;i++)
       {
    	   if(nature[i]==1){
    		   flag=i;
    	   } 
       }
       switch(flag){
       case 3:
    	   name="企业";
    	   break;
       case 2:
    	   name="高等院校";
    	   break;
       case 1:
    	   name="研究机构";
    	   break;
       case 0:
    	   name=orgars.getString(13);
    	   break;
       }
     %>
     <td colspan="3"><%=name%></td>
     </tr>
     <tr>
     <td class="title">单位简介</td>
     <td colspan="3">
		<%=orgars.getString(14)%>
	</td>
     </tr>
   </table>
  </div>
  <br>
  </body>
</html>
