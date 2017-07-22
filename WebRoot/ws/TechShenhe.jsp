<%@ page language="java" import="java.util.*" 
    import="com.dqwr.technology.dao.impl.*"
    import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/upload1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){ 
		$("#shenhe").change(function(){
			if($(this).val()==0){
				$("#yijian").slideToggle();
			}
			if($(this).val()==1){
				$("#yijian").slideToggle();	
			}
			
		});
		
	});
	</script>
  </head>
  <%
         ResultSet orgars,techrs,casers;
         int Techid=Integer.parseInt(request.getParameter("Techid"));
         String orgaid=request.getParameter("orgaid");
         String SH=request.getParameter("SH");
         String pageno=request.getParameter("pageno");
         DataBaseDao db=new DataBaseDao();
         Connection conn=db.connection();
         OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
         TechnologyDaoImpl techimpl=new TechnologyDaoImpl();
         CaseDaoImpl caseimpl=new CaseDaoImpl();
         orgars=orgaimpl.SelectOrgaById(conn, orgaid);
         orgars.next();
         techrs=techimpl.selectTechById(conn, Techid);
         techrs.next();
         casers=caseimpl.selectCaseById(conn, Techid);
%> 
<body bgcolor="#ffffff">
<form id="example" name="example" method="post" action="${pageContext.request.contextPath}/techsh?techid=<%=techrs.getInt(1) %>&SH=<%=SH %>&pageno=<%=pageno %>" onsubmit="checkAllTextValid(this)" target="manFrame">
<div style="background-color: #ffffff; position: relative;margin-top: 0px;margin-left: 0px;border: #ffffff 2px solid" >
<div style="background: #C0E4FA;" align="center">审核操作</div>
<div  align="center">审核：<select name="shenhe" id="shenhe" style="c">
    <option value="1" selected>通过</option>
    <option value="0">退回</option>
</select>
<div id="yijian" style="display:none">
<font color="red">退回原因：</font><br>
<textarea rows="4" cols="80" name="yjnr" id="yjnr"></textarea>
</div>
<input type="submit" value="确定">
</div>
</div>
</form>
  <table border="1" align="center" bgcolor="#FFFFFF">
    <tr>
      <td>技术名称</td>
      <td><input type="text" name="techname" style="width: 433px; " value=<%=techrs.getString(3) %>>
      </td>
     </tr>
      <tr>
      <td>机构代码</td>
      <td><input type="text" name="orgaid" style="width: 434px; " value=<%=orgars.getString(1) %>></td>
     </tr>
     <tr>
      <td>单位名称</td>
      <td><input type="text" name="organame" style="width: 434px; " value=<%=orgars.getString(2) %>></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="legalperson" value=<%=orgars.getString(5) %>>&nbsp;&nbsp;联系人&nbsp&nbsp&nbsp&nbsp<input type="text" name="contacts" value=<%=orgars.getString(6) %>></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="address" value=<%=orgars.getString(9) %>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱&nbsp&nbsp&nbsp&nbsp<input type="text" name="email" value=<%=orgars.getString(10) %>></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel" value=<%=orgars.getString(7) %>>&nbsp&nbsp&nbsp&nbsp手机：&nbsp<input type="text" name="cel" value=<%=orgars.getString(8) %>></td>
     </tr>
     <tr>
     <td>单位性质</td>
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
     <td><%=name%></td>
     </tr>
     <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction"><%=orgars.getString(14)%></textarea>
	</td>
     </tr>
      <tr>
     <td>技术来源</td>
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
     <td>技术领域</td>
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
     </tr>
       <tr>
     <td>技术简介</td>
     <td>
		<textarea cols="80" rows="8" name="techoverview"><%=techrs.getString(9) %></textarea>
	</td>
     </tr>
     <tr>
     <td>适用范围</td>
     <td>
		<textarea cols="80" rows="8" name="scope"><%=techrs.getString(10) %></textarea>
	</td>
     </tr>
     <tr>
     <td>先进度</td>
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
     <td>成熟度</td>
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
    	   statename="未产业化";
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
     <td>经济指标</td>
     <td>
		<textarea cols="80" rows="8" name="econindicator"><%=techrs.getString(13) %></textarea>
	</td>
     </tr>
     <tr>
     <td>节能减排预期效果</td>
     <td>
		<textarea cols="80" rows="8" name="result"><%=techrs.getString(14) %></textarea>
	</td>
     </tr>
      <tr>
     <td>成果转发方式</td>
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
     <td>成果融资需求</td>
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
       <td>成果的融资需<br>求金额（万元）</td>
       <td><input type="text" name="money" style="height: 32px; width: 142px"  value=<%=techrs.getString(19) %>></td>
     </tr>
      <tr>
       <td style="width: 152px; height: 14px"><strong>典型案例情况：</strong></td>
     </tr>
      <tr>
     <td>案例数量</td>
     <td>
      <%=techrs.getString(20) %>
     </td>
     </tr>
     <% 
        int casenum=0;
        int pathFlag=0;
        ArrayList<String> paths=new ArrayList<String>(); 
        while(casers.next()){
            casenum++;
            //使用pathFlag标记路径是否存在
        	if(!casers.getString(13).isEmpty()){
        		 pathFlag=1;
 				for(int a=0;a<casers.getString(13).split(";").length;a++) {
 					paths.add(casers.getString(13).split(";")[a]);
 					
 				}    }   
 				else{
 					pathFlag=0;
 				}
       %>
      <tr>
	 <td>
	 <h3>案例<%=casenum %></h3>
	</td>
	</tr>
     <tr>
      <td>案例名称</td>
      <td><input type="text" name="casename" value=<%=casers.getString(3) %>>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime" value=<%=casers.getString(4) %>></td>
     </tr>
     <tr>
      <td>实施单位</td>
      <td><input type="text" name="implement" value=<%=casers.getString(5) %>>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation" value=<%=casers.getString(6) %>></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact" value=<%=casers.getString(7) %>>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel" value=<%=casers.getString(8) %>></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview"><%=casers.getString(9) %></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect"><%=casers.getString(10) %></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit"><%=casers.getString(11) %></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal"><%=casers.getString(12) %></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td>
      <%
         if(pathFlag == 1){
         	for(int i=0;i<paths.size();i++){
        	 	String namecl=null;
        	  	namecl=paths.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths.get(i) %>"><%=namecl %></a>
        <br>
       <%}
         }else{
        		 %>
        		 <a >无</a>
        <br>
		<%}%>
     </td>
	</tr>
      <%   	
        }   
      %>  
	<!--案例1结束  -->		
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px;" value=<%=techrs.getString(21) %>></td>
	</tr>           
  </table>
  <br>
  </body>
</html>
