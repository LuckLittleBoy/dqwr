<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/Calendar.js"></script>
  <script language="javascript">
     $(function(){
    	$("#btnSubmit").click(function(){
    		var expertname=$("#expertname").val();
    		var orgaid=$("#orgaid").val();
    		var organame=$("#organame").val();
    		var sex=$('input:radio[name="sex"]:checked').val();
    		var Firstfield=$('input:radio[name="Firstfield"]:checked').val();
    		var Secondfield=$('input:radio[name="Secondfield"]:checked').val();
    		var Thirdfield=$('input:radio[name="Thirdfield"]:checked').val();
    		if(expertname==""||orgaid==""||organame==""||sex==null||Firstfield==null){
    			alert("必填项不能为空!");
    			return false;
    		}else{
    			if(Secondfield!=null){
    				if(Firstfield=="其他"&&Secondfield=="其他"){
    					
    				}else{
    					if(Firstfield==Secondfield){
    						alert("重复请重新选择!");
    						return false;
    					}
    				}
    			}
    			if(Thirdfield!=null){
    				if(Thirdfield=="其他"){
    					
    				}else{
    					if((Thirdfield==Secondfield)||(Thirdfield==Firstfield)){
    						alert("重复请重新选择");
    						return false;
    					}
    				}
    			}
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
    <base href="<%=basePath%>">
    <title>My JSP 'Requirement Analysis.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body bgcolor="#6CA6CD">
  <div align="center" style="margin: 5px 0px 0px 0px;background-color: white;">
  <form action="ExpertServlet" method="post">
  <br>
  <table border="1" align="center" bgcolor="#FFFFFF">
  <tr >
  <td>
   <font color="red">(*必填)</font>
  </td>
  </tr> 
   <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;姓名</td>
      <td><input type="text" name="expertname" id="expertname">&nbsp;&nbsp;<label style="color:red;">*</label>&nbsp;性别&nbsp&nbsp&nbsp<input type="radio" name="sex" value="1">男&nbsp;&nbsp;<input type="radio" name="sex" value="0">女
      </td>
     </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;出生年月</td>
      <td><input name="birthday" type="text" onclick="new Calendar().show(this);"  readonly="readonly">&nbsp&nbsp证件号码&nbsp&nbsp&nbsp<input type="text" name="idcard"/>
      </td>
     </tr>
     <tr>
      <td>&nbsp;&nbsp;&nbsp;学历</td>
      <td><input type="text" name="educational"/>&nbsp&nbsp学位&nbsp&nbsp&nbsp<input type="text" name="degree"/>
      </td>
     </tr>
     <tr>
      <td>&nbsp;&nbsp;&nbsp;所学专业</td>
      <td><input type="text" name="studyspec"/>&nbsp;&nbsp;现从事专业&nbsp&nbsp&nbsp<input type="text" name="engagespec"/>
      </td>
     </tr> 
     <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;机构代码</td>
      <td><input type="text" name="orgaid" id="orgaid" onchange="TestOrgaidIsEx()"><label name="orgaidlabel" id="orgaidlabel"></label> 
      </td>
     </tr> 
      <tr>
      <td>&nbsp;<label style="color:red;">*</label>&nbsp;单位名称</td>
      <td><input type="text" name="organame" id="organame">&nbsp&nbsp单位所属地区&nbsp&nbsp&nbsp<input type="text" name="area"/>
      </td>
     </tr> 
      <tr>
      <td>&nbsp;&nbsp;&nbsp;现任职务</td>
      <td><input type="text" name="position"/>&nbsp&nbsp职称&nbsp&nbsp&nbsp<input type="text" name="jobtitle"/>
      </td>
     </tr> 
     
     <!--不能确定 -->
      <tr>
      <td>&nbsp;&nbsp;&nbsp;地址</td>
      <td><input type="text" name="address"/> 
      </td>
     </tr> 
      <tr>
      <td>&nbsp;&nbsp;&nbsp;联系电话</td>
      <td>固话：<input type="text" name="tel"/>&nbsp&nbsp&nbsp&nbsp手机&nbsp<input type="text" name="mobile"/></td>
     </tr>
     <tr>
      <td>&nbsp;&nbsp;&nbsp;邮箱</td>
      <td><input type="text" name="email"/>&nbsp&nbsp邮编&nbsp&nbsp&nbsp<input type="text" name="zipcode"/>
      </td>
     </tr> 
      <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术领域</td>
     <td>
         <div id="first_field" style="border-style: solid; border-width: 1px;">
         <h5><label style="color:red;">*</label>主要技术领域</h5>
         <input type="radio"  name="Firstfield" value="新能源技术">新能源技术
         <input type="radio"  name="Firstfield" value="大气污染治理技术">大气污染治理技术
         <input type="radio"  name="Firstfield" value="污水处理技术">污水处理技术</br>
         <input type="radio"  name="Firstfield" value="固废处理技术">固废处理技术
         <input type="radio"  name="Firstfield" value="污染场地修复技术">污染场地修复技术
         <input type="radio"  name="Firstfield" value="建筑节能技术">建筑节能技术</br>
         <input type="radio"  name="Firstfield" value="工业节能技术">工业节能技术
         <input type="radio"  name="Firstfield" value="余热利用技术">余热利用技术
         <input type="radio"  name="Firstfield" value="其他">其他<input type="text" name="FirstOtherfield" style="width: 117px; ">
         </div>
         <div id="second_field" style="border-style: solid; border-width: 1px;">
         <h5>次要技术领域</h5>
         <input type="radio"  name="Secondfield" value="新能源技术">新能源技术
         <input type="radio"  name="Secondfield" value="大气污染治理技术">大气污染治理技术
         <input type="radio"  name="Secondfield" value="污水处理技术">污水处理技术</br>
         <input type="radio"  name="Secondfield" value="固废处理技术">固废处理技术
         <input type="radio"  name="Secondfield" value="污染场地修复技术">污染场地修复技术
         <input type="radio"  name="Secondfield" value="建筑节能技术">建筑节能技术</br>
         <input type="radio"  name="Secondfield" value="工业节能技术">工业节能技术
         <input type="radio"  name="Secondfield" value="余热利用技术">余热利用技术
         <input type="radio"  name="Secondfield" value="其他">其他<input type="text" name="SecondOtherfield" style="width: 117px; ">
         </div>
         <div id="third_field" style="border-style: solid; border-width: 1px;">
         <h5>第三技术领域</h5>
         <input type="radio"  name="Thirdfield" value="新能源技术">新能源技术
         <input type="radio"  name="Thirdfield" value="大气污染治理技术">大气污染治理技术
         <input type="radio"  name="Thirdfield" value="污水处理技术">污水处理技术</br>
         <input type="radio"  name="Thirdfield" value="固废处理技术">固废处理技术
         <input type="radio"  name="Thirdfield" value="污染场地修复技术">污染场地修复技术
         <input type="radio"  name="Thirdfield" value="建筑节能技术">建筑节能技术</br>
         <input type="radio"  name="Thirdfield" value="工业节能技术">工业节能技术
         <input type="radio"  name="Thirdfield" value="余热利用技术">余热利用技术
         <input type="radio"  name="Thirdfield" value="其他">其他<input type="text" name="ThirdOtherfield" style="width: 117px; ">
         </div>
     </td>
     </tr>
    <tr>
     <td>&nbsp;&nbsp;&nbsp;主要研究领域及成果情况</td>
     <td>
		<textarea cols="70" rows="8" name="overview"></textarea>
	</td>
     </tr> 
       <tr>
     <td>&nbsp;&nbsp;&nbsp;国内外主要学术组织兼职情况</td>
     <td>
		<textarea cols="70" rows="8" name="pluralism" placeholder="(包括：组织名称、现任职务、加入时间)"></textarea>
	</td>
     </tr>    
       <tr>
     <td>&nbsp;&nbsp;&nbsp;获得成果奖励及荣誉称号情况</td>
     <td>
		<textarea cols="70" rows="8" name="honor" placeholder="(包括：成果及奖励名称、授予单位、授予时间)"></textarea>
	</td>
     </tr>       
  </table>
  <br>
   <center>
   <input type="submit" id="btnSubmit" value="提交" onclick="return CheckRadio()"style="height: 30px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp<input type="reset" value="重置" style="height: 30px; width: 65px; background-color: #408080;">
   </center>
  </form>
  <br>
</div>

</body>

