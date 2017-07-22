<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.dqwr.entity.*,com.dqwr.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'Requirement Analysis.jsp' starting page</title>
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
<!-- 用于提交时检查必填项是否为空 -->
<script language="javascript">
     $(function(){
    	$("#btnSubmit").click(function(){
    		var orgaid=$("#orgaid").val();
    		var organame=$("#organame").val();
    		var natureid=$('input:radio[name="natureid"]:checked').val();
    		var requname=$("#requname").val();
    		var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
    		var cooperationid=$('input:radio[name="cooperationid"]:checked').val();
    		if(orgaid==""||organame==null||natureid==null||requname==""||fieldid==null||cooperationid==null){
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
    	 //alert('加载信息失败...');
    	 }
    	 });
    	 }
     
    </script>
</head>
<body bgcolor="#6CA6CD">
	<div align="center"
		style="margin: 5px 0px 0px 0px; background-color: white;">
		 
		<form action="OrgaServlet" method="post">
			<br>
			<table border="1" align="center" bgcolor="#FFFFFF">
				<tr>
					<td><font color="red">(*必填)</font></td>
				</tr>
				<tr>

					<td>&nbsp;<label style="color: red;">*</label>&nbsp;机构代码
					</td>
					<td><input type="text" name="orgaid" id="orgaid"
						onchange="TestOrgaidIsEx()"><label name="orgaidlabel"
						id="orgaidlabel"></label></td>
				</tr>
				<tr>
					<td>&nbsp;<label style="color: red;">*</label>&nbsp;单位名称
					</td>
					<td><input type="text" name="organame" id="organame" />&nbsp;&nbsp;归口&nbsp&nbsp&nbsp<input
						type="text" name="orgaparentid" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;所属行业</td>
					<td><input type="text" name="industryid" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;单位法人</td>
					<td><input type="text" name="legalperson" />&nbsp&nbsp联系人&nbsp&nbsp&nbsp&nbsp<input
						type="text" name="contacts" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;联系电话</td>
					<td>固话：<input type="text" name="tel" />&nbsp&nbsp&nbsp&nbsp手机&nbsp<input
						type="text" name="cel" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;地址</td>
					<td><input type="text" name="address" />&nbsp&nbsp邮箱&nbsp&nbsp&nbsp&nbsp<input
						type="text" name="email" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;网址</td>
					<td><input type="text" name="web" /></td>
				</tr>
				<td>&nbsp;<label style="color: red;">*</label>&nbsp;单位性质
				</td>
				<td><input type="radio" name="natureid" id="natureid"
					value="企业">企业 <input type="radio" name="natureid"
					id="natureid" value="高等院校">高等院校 <input type="radio"
					name="natureid" id="natureid" value="研究机构">研究机构 <input
					type="radio" name="natureid" id="natureid" value="其他">其他，请注明<input
					type="text" name="othernature" style="width: 117px;"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;单位简介</td>
					<td><textarea cols="80" rows="8" name="introduction"
							placeholder="(包括：机构成立时间、规模、研究力量、现有设备、主要产品等)"></textarea></td>
				</tr>
				<tr>
				<tr>
					<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术需求名称
					</td>
					<td><input type="text" name="requname" id="requname"
						style="width: 70%"></td>
				</tr>
				<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术领域
				</td>
				<td><input type="checkbox" name="fieldid" id="fieldid"
					value="新能源技术">新能源技术 <input type="checkbox" name="fieldid"
					id="fieldid" value="大气污染治理技术">大气污染治理技术 <input
					type="checkbox" name="fieldid" id="fieldid" value="污水处理技术">污水处理技术</br>
					<input type="checkbox" name="fieldid" id="fieldid" value="固废处理技术">固废处理技术
					<input type="checkbox" name="fieldid" id="fieldid" value="污染场地修复技术">污染场地修复技术
					<input type="checkbox" name="fieldid" id="fieldid" value="建筑节能技术">建筑节能技术</br>
					<input type="checkbox" name="fieldid" id="fieldid" value="工业节能技术">工业节能技术
					<input type="checkbox" name="fieldid" id="fieldid" value="余热利用技术">余热利用技术
					<input type="checkbox" name="fieldid" id="fieldid" value="其他">其他，请注明(可多选)<input
					type="text" name="otherfield" style="width: 117px;"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;技术应用行业</td>
					<td><textarea cols="80" rows="8" name="industryid1"></textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;技术需求概述</td>
					<td><textarea cols="80" rows="8" name="requoverview"
							placeholder="(包括：要解决的重大问题和预期经济社会效益)"></textarea></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;关键字（1-5个）</td>
					<td><input type="text" name="keyword"
						style="height: 44px; width: 468px"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;需求技术拟应用情况</td>
					<td><textarea cols="80" rows="8" name="application"
							placeholder="(包括：要解决的重大技术问题和预期经济社会效益)"></textarea></td>
				</tr>
				<tr>
				<td>&nbsp;<label style="color: red;">*</label>&nbsp;合作方式
				</td>
				<td><input type="radio" name="cooperationid" id="cooperationid"
					value="技术引进">技术引进 <input type="radio" name="cooperationid"
					id="cooperationid" value="委托研发">委托研发 <input type="radio"
					name="cooperationid" id="cooperationid" value="合作研发">合作研发 <input
					type="radio" name="cooperationid" id="cooperationid" value="其他">其他，请注明
					<input type="text" name="othercooperation"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;填报时间</td>
					<td><input type="text" name="filltime" style="width: 215px;"
						onclick="new Calendar().show(this);"></td>
				</tr>
				 
			</table>
			<br>
			<center>
				<input type="submit" id="btnSubmit" value="提交"
					style="height: 40px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp<input
					type="reset" value="取消"
					style="height: 40px; width: 65px; background-color: #408080;">
			</center>
		</form>
	</div>
</body>
<script type="text/javascript">        
function addMore()
{
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
