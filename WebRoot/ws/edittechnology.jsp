<%@ page language="java" import="java.util.*" 
    import="com.dqwr.technology.dao.impl.*"
    import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
    contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String pageno=request.getParameter("pageno");
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
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/Calendar.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language=javascript>
	function addMore1()
	{   
	    var td = document.getElementById("more1");
	    
	    
	    var num1=document.getElementById("num1");
		num1.value=parseInt(num1.value)+1;
		
	    var br = document.createElement("br");
	    var input = document.createElement("input");
	    var button = document.createElement("input");
	    
	    input.type = "file";
	    input.name = "file";
	    
	    button.type = "button";
	    button.value = "移除";
	    
	    button.onclick = function()
	    {
	        td.removeChild(br);
	        td.removeChild(input);
	        td.removeChild(button);
	        num1.value=parseInt(num1.value)-1;
	    }
	    td.appendChild(br);
	    td.appendChild(input);
	    td.appendChild(button);
	}
	function addMore2()
	{   
	    var td = document.getElementById("more2");
	    
	    var num2=document.getElementById("num2");
		num2.value=parseInt(num2.value)+1;
		
	    var br = document.createElement("br");
	    var input = document.createElement("input");
	    var button = document.createElement("input");
	    
	    input.type = "file";
	    input.name = "file";
	    
	    button.type = "button";
	    button.value = "移除";
	    
	    button.onclick = function()
	    {
	        td.removeChild(br);
	        td.removeChild(input);
	        td.removeChild(button);
	        num2.value=parseInt(num2.value)-1;
	    }
	    td.appendChild(br);
	    td.appendChild(input);
	    td.appendChild(button);
	}
	function addMore3()
	{   
	    var td = document.getElementById("more3");
	    
	    var num3=document.getElementById("num3");
		num3.value=parseInt(num3.value)+1;
		
	    var br = document.createElement("br");
	    var input = document.createElement("input");
	    var button = document.createElement("input");
	    
	    input.type = "file";
	    input.name = "file";
	    
	    button.type = "button";
	    button.value = "移除";
	    
	    button.onclick = function()
	    {
	        td.removeChild(br);
	        td.removeChild(input);
	        td.removeChild(button);
	        num3.value=parseInt(num3.value)-1;
	    }
	    td.appendChild(br);
	    td.appendChild(input);
	    td.appendChild(button);
	}
	function returnlist(){
		window.location.href='ws/technology.jsp?techpass=2';
	}
	 $(function(){
	    	$("#btnSubmit").click(function(){
	    		var orgaid=$("#orgaid").val();
	    		var organame=$("#organame").val();
	    		var natureid=$('input:radio[name="natureid"]:checked').val();
	    		var techname=$("#techname").val();
	    		var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
	    		var casenumber=$('input:radio[name="casenumber"]:checked').val();
	    		if(orgaid==""||organame==null||natureid==null||techname==""||fieldid==null||casenumber==null){
	    			alert("必填项不能为空!");
	    			return false;
	    		}else{
	    			return true;
	    		}
	    	});
	     });
	     function TestOrgaidIsEx(){
	    	 var orgaid=document.getElementById("orgaid").value;
	    	 $.ajax({
	    	 type:'post',
	    	 url:'orgaidisexist',
	    	 data:"orgaid="+orgaid+"",
	    	 success:function(msg){
	    	 $('#orgaidlabel').html("<font color='red'>"+msg+"</font>");//msg就是一个jsp页面数据,直接嵌入<div id="text">
	    	 },
	    	 error:function(){
	    	 alert('加载信息失败...');
	    	 }
	    	 });
	    	 }
	</script>
  </head>
   <%
         ResultSet orgars,techrs,casers;
         int Techid=Integer.parseInt(request.getParameter("techid"));
         String orgaid=request.getParameter("orgaid");
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
  <body bgcolor="#6CA6CD">
  <div align="center" style="margin: 5px 0px 0px 0px;background-color: white;">
  <form action="edittechservlet" method="post" enctype="multipart/form-data">
  <br>
  <table border="1" align="center" bgcolor="#FFFFFF">
  <tr>
  <td>
   <font color="red">(*必填)</font>
  </td>
  </tr>
    <tr>
     <input type="hidden" name="techid" value=<%=Techid %>>
     <input type="hidden" name="orgaid" value=<%=orgaid %>>
     <input type="hidden" name="pageno" value=<%=pageno %>>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术名称</td>
      <td><input type="text" name="techname" style="width: 433px;" value=<%=techrs.getString(3) %>>
      </td>
     </tr>
      <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;机构代码</td>
      <td><input type="text" name="orgaid" style="width: 434px; " value=<%=orgars.getString(1) %>></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;单位名称</td>
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
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;单位性质</td>
     <td>
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
       if(flag==3){
      %>
      <input type="radio" name="natureid" value="企业" checked="checked">企业
      <%	   
       }else{
      %>
      <input type="radio" name="natureid" value="企业">企业
      <%    
       }
       if(flag==2){
      %>
      <input type="radio" name="natureid" value="高等院校" checked="checked">高等院校
      <%   
       }else{
      %>
      <input type="radio" name="natureid" value="高等院校">高等院校   
      <%    
       }
       if(flag==1){
      %>
       <input type="radio" name="natureid" value="研究机构" checked="checked">研究机构
      <%    
       }else{
      %>
       <input type="radio" name="natureid" value="研究机构">研究机构
      <%   
       }
       if(flag==0){
      %>
      <input type="radio" name="natureid" value="其他" checked="checked">其他，请注明<input type="text" name="othernature" style="width: 117px; " value=<%=orgars.getString(13) %>>
      <%   
       }else{
      %>
      <input type="radio" name="natureid" value="其他">其他，请注明<input type="text" name="othernature" style="width: 117px; ">
      <%  
       }
      %>  
     </td>
     </tr>
      <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction"><%=orgars.getString(14)%></textarea>
	</td>
     </tr>
     <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术来源</td>
     <td>
      <%
       if(techrs.getBytes(4)!=null){
       byte[] source=techrs.getBytes(4);
       int sourceflag=0;
       for(int i=0;i<source.length;i++)
       {
    	   if(source[i]==1){
    		   sourceflag=i;
    	   } 
       }
            if(sourceflag==4){
    	      %>
    	      <input type="radio" name="sourceid" value="自主研发" checked="checked">自主研发
    	      <%	   
    	       }else{
    	      %>
    	      <input type="radio" name="sourceid" value="自主研发">自主研发
    	      <%    
    	       }
    	       if(sourceflag==3){
    	      %>
    	       <input type="radio" name="sourceid" value="合作开发" checked="checked">合作开发
    	      <%   
    	       }else{
    	      %>
    	       <input type="radio" name="sourceid" value="合作开发">合作开发
    	      <%    
    	       }
    	       if(sourceflag==2){
    	      %>
    	      <input type="radio" name="sourceid" value="技术引进吸收再创新" checked="checked">技术引进吸收再创新</br>
    	      <%    
    	       }else{
    	      %>
    	      <input type="radio" name="sourceid" value="技术引进吸收再创新">技术引进吸收再创新</br>
    	      <%   
    	       }
    	       if(sourceflag==1){
    	      %>
    	      <input type="radio" name="sourceid" value="技术引进" checked="checked">技术引进，请注明技术持有单位<input type="text" name="techowner" style="width: 117px;" value=<%=techrs.getString(5) %>></br>
    	      <%   
    	       }else{
    	      %>
    	      <input type="radio" name="sourceid" value="技术引进">技术引进，请注明技术持有单位<input type="text" name="techowner" style="width: 117px;"></br>
    	      <%  
    	       }
    	       if(sourceflag==0){
    	      %>
    	     <input type="radio" name="sourceid" value="其他" checked="checked">其他，请注明<input type="text" name="othersource" style="width: 117px; " value=<%=techrs.getString(6) %>>    	      
    	      <%    
    	       }else{
    	      %>
    	      <input type="radio" name="sourceid" value="其他">其他，请注明<input type="text" name="othersource" style="width: 117px; ">
    	      
    	      <%   
    	       }
       }else{
        %>
        <input type="radio" name="sourceid" value="自主研发">自主研发
         <input type="radio" name="sourceid" value="合作开发">合作开发
         <input type="radio" name="sourceid" value="技术引进吸收再创新">技术引进吸收再创新</br>
         <input type="radio" name="sourceid" value="技术引进">技术引进，请注明技术持有单位<input type="text" name="techowner" style="width: 117px; "></br>
         <input type="radio" name="sourceid" value="其他">其他，请注明<input type="text" name="othersource" style="width: 117px; ">
        <%
       }
    	%>
     </td>
     </tr>    
     <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术领域</td>
     <td>
     <% 
       String field=techrs.getString(7);
       int field1=0,field2=0,field3=0,field4=0,field5=0,field6=0,field7=0,field8=0,field9=0;
       String[] fieldid=field.split(";");
       for(int i=0;i<fieldid.length;i++){
    	   if(fieldid[i].equals("新能源技术")){
    		   field1=1;
    	   }
           if(fieldid[i].equals("大气污染治理技术")){
        	   field2=1;
    	   }
           if(fieldid[i].equals("污水处理技术")){
        	   field3=1;
    	   }
           if(fieldid[i].equals("固废处理技术")){
        	   field4=1;
    	   }
           if(fieldid[i].equals("污染场地修复技术")){
        	   field5=1;
    	   }
           if(fieldid[i].equals("建筑节能技术")){
        	   field6=1;
    	   }
           if(fieldid[i].equals("工业节能技术")){
        	   field7=1;
    	   }
           if(fieldid[i].equals("余热利用技术")){
        	   field8=1;
    	   }
           
       }
    	   if(field1==1){
     %>
    		  <input type="checkbox" name="fieldid" value="新能源技术" checked="checked">新能源技术 
    <%
    	   }else{
    %>
    		   <input type="checkbox" name="fieldid" value="新能源技术" >新能源技术
    <% 
    	   }
           if(field2==1){
     %>
        	   <input type="checkbox" name="fieldid" value="大气污染治理技术" checked="checked">大气污染治理技术
     <%
    	   }else{
     %>
    		   <input type="checkbox" name="fieldid" value="大气污染治理技术" >大气污染治理技术
     <%
    	   }
           if(field3==1){
      %> 
        	   <input type="checkbox" name="fieldid" value="污水处理技术" checked="checked">污水处理技术</br>
      <%    
    	   }else{
       %>
    		   <input type="checkbox" name="fieldid" value="污水处理技术" >污水处理技术</br>
      <%  
    	   }
           if(field4==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="固废处理技术" checked="checked">固废处理技术
    	  <% 
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="固废处理技术" >固废处理技术
    	   <% 
    	   }
           if(field5==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="污染场地修复技术" checked="checked">污染场地修复技术
    	   <% 
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="污染场地修复技术" >污染场地修复技术
    	   <% 
    	   }
           if(field6==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="建筑节能技术" checked="checked">建筑节能技术</br>
    	   <%
    	   }else{
    		   %>
    		   <input type="checkbox" name="fieldid" value="建筑节能技术" >建筑节能技术</br>
    	   <% 
    	   }
           if(field7==1){
        	   %>
        	   <input type="checkbox" name="fieldid" value="工业节能技术" checked="checked">工业节能技术
           <% 
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="工业节能技术" >工业节能技术
          <%
           }
          if(field8==1){
        	  %>
        	  <input type="checkbox" name="fieldid" value="余热利用技术" checked="checked">余热利用技术
           <% 
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="余热利用技术" >余热利用技术
           <% 
           }
           if(techrs.getString(8)!=null){
        	   %>
        	   <input type="checkbox" name="fieldid" value="其他" checked="checked">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; " value=<%=techrs.getString(8) %>>
          <%
           }else{
        	   %>
        	   <input type="checkbox" name="fieldid" value="其他">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; ">
           <% 
           }
       %>
     </td>
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
     <td>
     <%
     if(techrs.getBytes(11)!=null){
     byte[] process=techrs.getBytes(11);
     int processflag=0;
     String processname=null;
     for(int i=0;i<process.length;i++)
     {
  	   if(process[i]==1){
  		   processflag=i;
  	   } 
     }
       if(processflag==3){
      %>
      <input type="radio" name="progressid" value="国际领先" checked="checked">国际领先
      <%	   
       }else{
      %>
      <input type="radio" name="progressid" value="国际领先">国际领先
      <%    
       }
       if(processflag==2){
      %>
       <input type="radio" name="progressid" value="国际先进" checked="checked">国际先进
      <%   
       }else{
      %>
       <input type="radio" name="progressid" value="国际先进">国际先进  
      <%    
       }
       if(processflag==1){
      %>
        <input type="radio" name="progressid" value="国内领先" checked="checked">国内领先
      <%    
       }else{
      %>
       <input type="radio" name="progressid" value="国内领先">国内领先
      <%   
       }
       if(processflag==0){
      %>
       <input type="radio" name="progressid" value="国内先进" checked="checked">国内先进
      <%   
       }else{
      %>
       <input type="radio" name="progressid" value="国内先进">国内先进
      <%  
       }
     }else{
    	%>
    	 <input type="radio" name="progressid" value="国际领先">国际领先
         <input type="radio" name="progressid" value="国际先进">国际先进
         <input type="radio" name="progressid" value="国内领先">国内领先
         <input type="radio" name="progressid" value="国内先进">国内先进
    	<%
     }
      %>  
     </td>
     </tr>
     <tr>
     <td>成熟度</td>
      <td>
     <%
     if(techrs.getBytes(12)!=null){
     byte[] state=techrs.getBytes(12);
     int stateflag=0;
     String statename=null;
     for(int i=0;i<state.length;i++)
     {
  	   if(state[i]==1){
  		   stateflag=i;
  	   } 
     }
       if(stateflag==2){
      %>
        <input type="radio" name="stateid" value="示范应用" checked="checked">示范应用
      <%   
       }else{
      %>
       <input type="radio" name="stateid" value="示范应用">示范应用
      <%    
       }
       if(stateflag==1){
      %>
        <input type="radio" name="stateid" value="规模化应用" checked="checked">规模化应用
      <%    
       }else{
      %>
       <input type="radio" name="stateid" value="规模化应用">规模化应用
      <%   
       }
       if(stateflag==0){
      %>
       <input type="radio" name="stateid" value="未产业化" checked="checked">未产业化
      <%   
       }else{
      %>
       <input type="radio" name="stateid" value="未产业化">未产业化
      <%  
       }
     }else{
    	%>
    	 <input type="radio" name="stateid" value="示范应用">示范应用
         <input type="radio" name="stateid" value="规模化应用">规模化应用
         <input type="radio" name="stateid" value="未产业化">未产业化
    	<%
     }
      %>  
     </td>
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
      <td>
      <%
      if(techrs.getBytes(15)!=null){
      byte[] tran=techrs.getBytes(15);
      int tranflag=0;
      String tranname=null;
      for(int i=0;i<tran.length;i++)
      {
   	   if(tran[i]==1){
   		   tranflag=i;
   	   } 
      }
            if(tranflag==4){
    	      %>
              <input type="radio" name="transid" value="技术转让" checked="checked">技术转让    	      
              <%	   
    	       }else{
    	      %>
    	      <input type="radio" name="transid" value="技术转让">技术转让
    	      <%    
    	       }
    	       if(tranflag==3){
    	      %>
    	       <input type="radio" name="transid" value="技术授权" checked="checked">技术授权
    	      <%   
    	       }else{
    	      %>
    	       <input type="radio" name="transid" value="技术授权">技术授权
    	      <%    
    	       }
    	       if(tranflag==2){
    	      %>
    	     <input type="radio" name="transid" value="技术服务" checked="checked">技术服务
    	      <%    
    	       }else{
    	      %>
    	      <input type="radio" name="transid" value="技术服务">技术服务
    	      <%   
    	       }
    	       if(tranflag==1){
    	      %>
    	      <input type="radio" name="transid" value="已转让" checked="checked">已转让（受合约约束不能转让）<br>
    	      <%   
    	       }else{
    	      %>
    	      <input type="radio" name="transid" value="已转让">已转让（受合约约束不能转让）<br>
    	      <%  
    	       }
    	       if(tranflag==0){
    	      %>
    	      <input type="radio" name="transid" value="其他" checked="checked"> 其他，请注明<input type="text" name="othertransfrom" style="width: 117px;" value=<%=techrs.getString(16) %>>    	      
    	      <%    
    	       }else{
    	      %>
              <input type="radio" name="transid" value="其他"> 其他，请注明<input type="text" name="othertransfrom" style="width: 117px; ">
    	      
    	      <%   
    	       }
      }else{
    	 %>
    	 <input type="radio" name="transid" value="技术转让">技术转让
         <input type="radio" name="transid" value="技术授权">技术授权
         <input type="radio" name="transid" value="技术服务">技术服务
         <input type="radio" name="transid" value="已转让">已转让（受合约约束不能转让）<br>
         <input type="radio" name="transid" value="其他"> 其他，请注明<input type="text" name="othertransfrom" style="width: 117px; ">
    	 <%
      }
    	      %>
     </td>
     </tr>
     
      <tr>
     <td>成果融资需求</td>
      <td>
     <%
     if(techrs.getBytes(17)!=null){
     byte[] finanee=techrs.getBytes(17);
     int finaneeflag=0;
     String finaneename=null;
     for(int i=0;i<finanee.length;i++)
     {
  	   if(finanee[i]==1){
  		   finaneeflag=i;
  	   } 
     }
       if(finaneeflag==0){
      %>
        <input type="radio" name="finaneedid" value="股权融资" checked="checked">股权融资
      <%   
       }else{
      %>
       <input type="radio" name="finaneedid" value="股权融资">股权融资
      <%    
       }
       if(finaneeflag==1){
      %>
         <input type="radio" name="finaneedid" value="债权融资" checked="checked">债权融资
      <%    
       }else{
      %>
        <input type="radio" name="finaneedid" value="债权融资">债权融资
      <%   
       }
       if(finaneeflag==2){
      %>
       <input type="radio" name="finaneedid" value="其他" checked="checked"> 其他，请注明<input type="text" name="otherneed" style="width: 117px; " value=<%=techrs.getString(18) %>>
      <%   
       }else{
      %>
       <input type="radio" name="finaneedid" value="其他"> 其他，请注明<input type="text" name="otherneed" style="width: 117px; ">
      <%  
       }
     }else{
       %>
         <input type="radio" name="finaneedid" value="股权融资">股权融资
         <input type="radio" name="finaneedid" value="债权融资">债权融资
         <input type="radio" name="finaneedid" value="其他"> 其他，请注明<input type="text" name="otherneed" style="width: 117px; ">
       <%   
     }
      %>  
     </td>
     </tr>
     <tr>
       <td>成果的融资需<br>求金额（万元）</td>
       <td><input type="text" name="money" style="height: 32px; width: 142px"  value=<%=techrs.getString(19) %>></td>
     </tr>
      <tr>
       <td style="width: 152px; height: 14px"><strong>典型案例情况：</strong></td>
     </tr>
      <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例数量</td>
     <td>
       <%
         String nums=techrs.getString(20);
       if(nums.equals("0"))
    	 //如果典型案例数量是0
       {
       %>
      <input type="radio" id="casenumber" name="casenumber" value="0" checked="checked"  >0个
      <% 	 
       }else{
      %>
      <input type="radio" id="casenumber" name="casenumber" value="0" ">0个
      <%	 
       }
       if(nums.equals("1")){
        	 casers.next();
        %>
        <input type="radio" id="casenumber" name="casenumber" value="1" checked="checked"   >1个
        <% 	 
         }else{
        %>
        <input type="radio" id="casenumber" name="casenumber" value="1"  >1个
        <%	 
         }
         if(nums.equals("2")){
        	 casers.next();
        %>
          <input type="radio" id="casenumber" name="casenumber" value="2" checked="checked"  >2个
         <% 	 
         }else{
         %>
          <input type="radio" id="casenumber" name="casenumber" value="2"  >2个
         <%	 
         }
         if(nums.equals("3")){
         %>
       <input type="radio" name="casenumber" value="3" checked="checked"  >3个
         <% 	 
         }else{
         %>
          <input type="radio" name="casenumber" value="3" onclick="select3()"  >3个
         <%	 
          }
         if(nums.equals("多个")){
          %>
         <input type="radio" name="casenumber" value="多个" checked="checked">多个
          <% 	 
          }else{
          %>
          <input type="radio" name="casenumber" value="多个">多个
          <%	 
          }
         %>
     </td>
     </tr>
      <%
      //添加典型案例为0的情况
     if(nums.equals("0")){
    %>
    <tr>
    
	</tr>
    <%
     }
    //添加典型案例为1的情况
      if(nums.equals("1")){
    %>
    <tr>
	  <td>
	  <h3>案例1</h3>
	  </td>
	  <td>
	  <input type="hidden" id="num1" name="num1" value="1">
	  <input type="text" id="caseid1" name="caseid1"  value=<%=casers.getString(1) %>>
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
    <td id="more1">
    <%
    	ArrayList<String> paths = new ArrayList<String>();
    	int pathFlag =0;//默认表示没有取到
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
    <%
       //无证明材料
    	if(pathFlag!=1){
    %>   
    <font>无</font>
    <br>
    <input name="file" type="file" label="上传附件（图片或者文档）" theme="simple" >
    <a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null"></a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
	   <%
			for(int i=0;i<paths.size();i++){
    	 		String name1=null;
    	  		name1=paths.get(i).substring(8);
       %>
      <a href="/dqwr/LoadFile?path=<%=paths.get(i)%>"><%=name1%></a>&nbsp;<a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths.get(i)%>">修改</a>&nbsp;
      <input type="button" value="添加更多..." onclick="addMore1()"></br>
      <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
    <%
     }
     if(nums.equals("2")){  	 
    %>
     <tr>
	    <td>
	    <h3>案例1</h3>
	    </td>
	    <td>
	    <input type="hidden" id="num1" name="num1" value="1">
	    <input type="text" id="caseid1" name="caseid1"  value=<%=casers.getInt(1) %>>
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
    <td id="more1">
    <%
    	ArrayList<String> paths1 = new ArrayList<String>();
    	int pathFlag1 =0;//默认表示没有取到
    	if(!casers.getString(13).isEmpty()){
   	 		//使用flag来标记路径是否存在
   		 	pathFlag1 =1;//存在标记为1
   	 		for(int a=0;a<casers.getString(13).split(";").length;a++){
    	 		paths1.add(casers.getString(13).split(";")[a]); 
   	 		}
    	}else{
   	 		pathFlag1 =0;//不存在标记为0
    	}
    %>
    <%
    	if(pathFlag1!=1){
    %>
    <font>无</font><br><a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>
    &techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null">上传</a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
		<%
			for(int i=0;i<paths1.size();i++){
    	 		String name1=null;
    	  		name1=paths1.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths1.get(i)%>"><%=name1%></a>&nbsp;
        <a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>
        &orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths1.get(i)%>">修改</a>&nbsp;
        <input type="button" value="添加更多..." onclick="addMore1()"></br>
        <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
    <% 
    casers.next(); 
    %>
    <tr>
	    <td>
	    <h3>案例2</h3>
	    </td>
	    <td>
	    <input type="hidden" id="num2" name="num2" value="1">
	    <input type="text" id="caseid2" name="caseid2"  value=<%=casers.getInt(1) %>>
	    </td>
	    </tr>
	    <tr>
      <td>案例名称</td>
      <td><input type="text" name="casename2" value=<%=casers.getString(3) %>>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime2" value=<%=casers.getString(4) %>></td>
     </tr>
     <tr>
      <td>实施单位</td>
      <td><input type="text" name="implement2" value=<%=casers.getString(5) %>>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation2" value=<%=casers.getString(6) %>></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact2" value=<%=casers.getString(7) %>>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel2" value=<%=casers.getString(8) %>></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview2"><%=casers.getString(9) %></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect2"><%=casers.getString(10) %></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit2"><%=casers.getString(11) %></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal2"><%=casers.getString(12) %></textarea>
	</td>
     </tr>
      <tr>
     <td>相关证明材料</td>
    <td id="more2">
    <%
    	ArrayList<String> paths2 = new ArrayList<String>();
    	int pathFlag2 =0;//默认表示没有取到
    	if(!casers.getString(13).isEmpty()){
   	 		//使用flag来标记路径是否存在
   		 	pathFlag2 =1;//存在标记为1
   	 		for(int a=0;a<casers.getString(13).split(";").length;a++){
    	 		paths2.add(casers.getString(13).split(";")[a]); 
   	 		}
    	}else{
   	 		pathFlag2 =0;//不存在标记为0
    	}
    %>
    <%
    	if(pathFlag2!=1){
    %>
    <font>无</font><br><a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null">上传</a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
		<%
			for(int i=0;i<paths2.size();i++){
    	 		String name1=null;
    	  		name1=paths2.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths2.get(i)%>"><%=name1%></a>&nbsp;<a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths2.get(i)%>">修改</a>&nbsp;
        <input type="button" value="添加更多..." onclick="addMore1()"></br>
        <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
    <% 
     }
     if(nums.equals("3")){
    %>
     <tr>
	    <td>
	    <h3>案例1</h3>
	    </td>
	    <td>
	    <input type="hidden" id="num1" name="num1" value="1">
	    <input type="text" id="caseid1" name="caseid1"  value=<%=casers.getInt(1) %>>
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
    <td id="more1">
    <%
    	ArrayList<String> paths = new ArrayList<String>();
    	int pathFlag =0;//默认表示没有取到
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
    <%
    	if(pathFlag!=1){
    %>
    <font>无</font><br><a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null">上传</a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
		<%
			for(int i=0;i<paths.size();i++){
    	 		String name1=null;
    	  		name1=paths.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths.get(i)%>"><%=name1%></a>&nbsp;<a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths.get(i)%>">修改</a>&nbsp;
        <input type="button" value="添加更多..." onclick="addMore1()"></br>
        <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
    <% 
    casers.next(); 
    %>
    <tr>
	    <td>
	    <h3>案例2</h3>
	    </td>
	    <td>
	    <input type="hidden" id="num2" name="num2" value="1">
	    <input type="text" id="caseid2" name="caseid2"  value=<%=casers.getInt(1) %>>
	    </td>
	    </tr>
	    <tr>
      <td>案例名称</td>
      <td><input type="text" name="casename2" value=<%=casers.getString(3) %>>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime2" value=<%=casers.getString(4) %>></td>
     </tr>
     <tr>
      <td>实施单位</td>
      <td><input type="text" name="implement2" value=<%=casers.getString(5) %>>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation2" value=<%=casers.getString(6) %>></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact2" value=<%=casers.getString(7) %>>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel2" value=<%=casers.getString(8) %>></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview2"><%=casers.getString(9) %></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect2"><%=casers.getString(10) %></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit2"><%=casers.getString(11) %></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal2"><%=casers.getString(12) %></textarea>
	</td>
     </tr>
     <tr>
     <td>相关证明材料</td>
    <td id="more2">
    <%
    	ArrayList<String> paths2 = new ArrayList<String>();
    	int pathFlag2 =0;//默认表示没有取到
    	if(!casers.getString(13).isEmpty()){
   	 		//使用flag来标记路径是否存在
   		 	pathFlag2 =1;//存在标记为1
   	 		for(int a=0;a<casers.getString(13).split(";").length;a++){
    	 		paths.add(casers.getString(13).split(";")[a]); 
   	 		}
    	}else{
   	 		pathFlag2 =0;//不存在标记为0
    	}
    %>
    <%
    	if(pathFlag2!=1){
    %>
    <font>无</font><br><a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null">上传</a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
		<%
			for(int i=0;i<paths2.size();i++){
    	 		String name1=null;
    	  		name1=paths2.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths2.get(i)%>"><%=name1%></a>&nbsp;<a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths2.get(i)%>">修改</a>&nbsp;
        <input type="button" value="添加更多..." onclick="addMore1()"></br>
        <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
     <% 
    casers.next(); 
    %>
    <tr>
	    <td>
	    <h3>案例3</h3>
	    </td>
	    <td>
	    <input type="hidden" id="num3" name="num3" value="1">
	    <input type="text" id="caseid3" name="caseid3"  value=<%=casers.getInt(1) %>>
	    </td>
	    </tr>
	    <tr>
      <td>案例名称</td>
      <td><input type="text" name="casename3" value=<%=casers.getString(3) %>>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime3" value=<%=casers.getString(4) %>></td>
     </tr>
     <tr>
      <td>实施单位</td>
      <td><input type="text" name="implement3" value=<%=casers.getString(5) %>>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation3" value=<%=casers.getString(6) %>></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact3" value=<%=casers.getString(7) %>>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel3" value=<%=casers.getString(8) %>></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview3"><%=casers.getString(9) %></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect3"><%=casers.getString(10) %></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit3"><%=casers.getString(11) %></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal3"><%=casers.getString(12) %></textarea>
	</td>
     </tr>
      <tr>
     <td>相关证明材料</td>
    <td id="more3">
    <%
    	ArrayList<String> paths3 = new ArrayList<String>();
    	int pathFlag3 =0;//默认表示没有取到
    	if(!casers.getString(13).isEmpty()){
   	 		//使用flag来标记路径是否存在
   		 	pathFlag3 =1;//存在标记为1
   	 		for(int a=0;a<casers.getString(13).split(";").length;a++){
    	 		paths.add(casers.getString(13).split(";")[a]); 
   	 		}
    	}else{
   	 		pathFlag3 =0;//不存在标记为0
    	}
    %>
    <%
    	if(pathFlag3!=1){
    %>
    <font>无</font><br><a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=null&replacepath=null">上传</a>&nbsp;
    <input type="button" value="添加更多..." onclick="addMore1()"></br>
    <br>  
    <%
    	}else{
    %>    
      <font color="red">(修改证明材料之前请先点击“保存”按钮，保存修改数据)</font>
      <br>
		<%
			for(int i=0;i<paths3.size();i++){
    	 		String name1=null;
    	  		name1=paths3.get(i).substring(8);
       %>
        <a href="/dqwr/LoadFile?path=<%=paths3.get(i)%>"><%=name1%></a>&nbsp;<a href="ws/editcaseupload.jsp?caseid=<%=casers.getInt(1) %>&techid=<%=Techid %>&orgaid=<%=orgaid %>&paths=<%=casers.getString(13)%>&replacepath=<%=paths3.get(i)%>">修改</a>&nbsp;
        <input type="button" value="添加更多..." onclick="addMore1()"></br>
        <br>
       <%	
       		}
         }
       %>
	</td> 
	</tr>
    <% 
     }
    %>	
     <!--案例1开始  -->
      <tbody id="case1" name="case1">
     <tr>
       <td>
       <h3>案例1</h3>
       <input type="hidden" name="num1" id="num1" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename" id="casename"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement" id="implement">&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more1">
		上传附件（图片或者文档）</br>
		 <input name="file" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore1()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例1结束  -->
	
	
	 <!--案例2开始  -->
      <tbody id="case2" name="case2">
     <tr>
       <td>
       <h3>案例2</h3>
       <input type="hidden" name="num2" id="num2" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename2"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime2"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement2"/>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation2"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact2"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel2"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview2" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect2" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit2"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal2" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more2">
		上传附件（图片或者文档）</br>
		 <input name="file" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore2()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例2结束  -->
	
	 <!--案例3开始  -->
      <tbody id="case3" name="case3">
     <tr>
       <td>
       <h3>案例3</h3>
       <input type="hidden" name="num3" id="num3" value="1">
       </td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
      <td><input type="text" name="casename3"/>&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input type="text" name="starttime3"/></td>
     </tr>
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
      <td><input type="text" name="implement3"/>&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input type="text" name="cooperation3"/></td>
     </tr>
     <tr>
      <td>联系人</td>
      <td><input type="text" name="contact3"/>&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input type="text" name="casetel3"/></td>
     </tr>
     <tr>
     <td>项目情况</td>
     <td>
		<textarea cols="80" rows="8" name="caseoverview3" placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
	</td>
	 <tr>
     <td>项目实施后节能减排效果</td>
     <td>
		<textarea cols="80" rows="8" name="effect3" placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
	</td>
     </tr>
     <tr>
     <td>项目实施后企业效益及经济效益</td>
     <td>
		<textarea cols="80" rows="8" name="benefit3"></textarea>
	</td>
     </tr>
     <tr>
     <td>用户对本项技术的综合性评价</td>
     <td>
		<textarea cols="80" rows="8" name="appraisal3" placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
	</td>
     </tr>
	<tr>
     <td>相关证明材料</td>
     <td id="more3">
		上传附件（图片或者文档）</br>
		 <input name="file1" type="file" label="上传附件（图片或者文档）" theme="simple" >
		 <input type="button" value="添加更多..." onclick="addMore3()"></br>
	</td>
	</tr>
	</tbody>
	<!--案例3结束  -->	
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px;" value=<%=techrs.getString(21) %>></td>
	</tr>         
  </table>
  <br>
   <center>
   <input type="submit" value="保存" style="height: 30px; width: 65px; background-color: #408080;">
   <input type="button" value="返回" style="height:30px;width:65px;background-color:#408080;" onclick="returnlist();">
   </center>
  </form>
  </div>
  </body>
  <script type="text/javascript">
  //页面初始案例为空
  	   document.getElementById("case1").style.display="none";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
  function select0(){
	   document.getElementById("case1").style.display="none";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
  }
  
  function select1(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
  }
  
  function select2(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="none";
  }
  
  function select3(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="";
  }
function addMore()
{   
	var num = document.getElementById("num1");
    num.value = parseInt(num.value) + 1;
	var td = document.getElementById("more");
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
    	var num = document.getElementById("num1");
        num.value = parseInt(num.value)-1;
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
    }
    
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore2()
{   
	var num = document.getElementById("num2");
    num.value = parseInt(num.value) + 1;
	var td = document.getElementById("more2");
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
    	var num = document.getElementById("num2");
        num.value = parseInt(num.value)-1;
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
    }
    
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore3()
{   
	var num = document.getElementById("num3");
    num.value = parseInt(num.value) + 1;
	var td = document.getElementById("more3");
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
    	var num = document.getElementById("num3");
        num.value = parseInt(num.value)-1;
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
    }
    
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}
</script>
</html>
