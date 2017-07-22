<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>权限管理</title>
	<link href="../css/bootstrap.css" rel="stylesheet">
	<link href="../css/tablecloth.css" rel="stylesheet">
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../qxmanager/js/qx.js"></script>
	<script src="../js/tool.js"></script>
	<script src="../js/jquery.tablecloth.js"></script>
	<script src="../js/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="lib/jquery.easytabs.min.js" type="text/javascript"></script>
 <style>
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;background-color: #B1D8EA;}
	
   .etabs { margin: 0; padding: 0; }
   .tab { display: inline-block; zoom:1; *display:inline; background: #eee; border: solid 1px #999; border-bottom: none; -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; }
   .tab a { font-size: 14px; line-height: 2em; display: block; padding: 0 10px; outline: none; text-decoration:none; }
   .tab a:hover { text-decoration: underline; }
   .tab.active { background: #fff; padding-top: 6px; position: relative; top: 1px; border-color: #666; }
   .tab a.active { font-weight: bold; }
   .tab-container .panel-container { background: #fff; border: solid #666 1px; padding: 10px; -moz-border-radius: 0 4px 4px 4px; -webkit-border-radius: 0 4px 4px 4px;margin:0px 50px 0px 50px; }
   .panel-container { margin-bottom: 10px; }
 </style>
 <style type="text/css">
.btn{background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;}
.btn-buynow{background-color: #D2340F;}
.btn-buynow:hover{background-color: #EF411A;}
.btn-signup{background-color: #006DCC;}
.btn-signup:hover{background-color: rgb(0,74,204);}
.btn-login{background-color: rgb(113,181,27);}
.btn-login:hover{background-color: rgb(147,199,25);}
</style>
<script type="text/javascript">
    $(document).ready( function() {
      $('#tab-container').easytabs();
    });
</script>
<script type="text/javascript">
ALLPower={};
ALLUsers={};
function getusermsg(){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetUserMsg";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var users =eval('('+requestmsg+')');
				if(users.users=="fail"){
					alert("数据获取失败");
				}else{
					ALLUsers=users;
					var msg="<font><b>请选择用户 :  </b></font><select id='userid' onchange='getuserqx()'><option label='请选择用户' value='-11'></option>";
					for(var i=0;i<users.users.length;i++){
						msg+="<option value ='"+users.users[i].yhid+"'>"+users.users[i].yhid+"("+users.users[i].jsmc+")</option>";
					}
					 msg+="</optgroup></select>";
					 document.getElementById("selectuser").innerHTML=msg;
					$("table").tablecloth({
					     theme: "paper",
					     striped: true,
					     sortable: true,
					     condensed: true
					 });
				}

			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
	xhr.send(null);
}
////获取选定用户的权限
function getuserqx(){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetUserQX";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				userqx=eval('('+requestmsg+')');
				if(userqx.userqx=="fail"){
					alert("数据获取失败");
				}else{
					initQXTable();//清空所有的选中重新设置
					for(var n=0;n<userqx.userqx.length;n++){
						for(var i=0;i<ALLPower.Power.length;i++){
							for(var j=0;j<ALLPower.Power[i].xp.length;j++){
								//alert(userqx.userqx[n].cdid+"__"+ALLPower.Power[i].xp[j].id)
								if(userqx.userqx[n].cdid==ALLPower.Power[i].xp[j].id){
									document.getElementById(ALLPower.Power[i].xp[j].id).checked=true;
									break;
								}		
							}
						}		
					}
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("userid="+document.getElementById("userid").value);
}

function getqxmsg(){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetUserPower";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var Power =eval('('+requestmsg+')');
				ALLPower=Power;//放入全局变量中
				if(Power.Power=="fail"){
					alert("数据获取失败");
				}else{
					allPower=Power;
					var msg="<table  cellspacing='1' cellpadding='3' class='tablehead' style='background:#CCC;'>"+   
			          "<thead>              "+
			            "<tr class='colhead'>"+
			              "<th align='center'>权限名称</th>"+
			              "<th align='center'>权限说明</th>"+
			              "<th align='center'>是否赋予</th>"+
			            "</tr>"+
			            "</thead>";
					for(var i=0;i<Power.Power.length;i++){
						msg+="<thead>"+
			            "<tr class='stathead'>"+
			             "<th class='{sorter: false}' colspan='2'>"+Power.Power[i].nc+"</th>"+
						 "<th class='{sorter: false}' align='center' ><input type='checkbox' disabled class='changeuserqx' id='z"+Power.Power[i].jb+"' onchange='changeALL("+Power.Power[i].jb+")'></th>"+
			           "</tr>"+
			          "</thead>"; 
						for(var j=0;j<Power.Power[i].xp.length;j++){
							//alert(Power.Power[i].xp[j].nc);
							msg+="<tbody>"+
								"<tr class='oddrow'>"+
					   			"<td align='center'>"+Power.Power[i].xp[j].nc+"</td>"+
								"<td >"+qxshuoming(Power.Power[i].xp[j].nc)+"</td>"+
								"<th class='{sorter: false}' align='center' ><input type='checkbox' disabled class='changeuserqx' id='"+Power.Power[i].xp[j].id+"' ></th>"+
					        	"</tr>"+
					         "</tbody>";
						}
					}	
					msg+="</table>";
					document.getElementById("qxtable").innerHTML=msg;
					getusermsg();
					$("table").tablecloth({
					     theme: "paper",
					     striped: true,
					     sortable: true,
					     condensed: true
					   });
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
function qxshuoming(str){
	if(str=="工作动态信息发布")return "发布新的工作动态";
	else if(str=="行业动态信息发布")return "可发布省内外行业动态";
	 
	else if(str=="发布气象图片")return "发布最新的气象图片";
	else if(str=="信息录入")return "录入新的信息";
	else if(str=="信息审核")return "可对已发布信息进行审核";
	else if(str=="信息管理")return "可对已发布信息进行删除、编辑、查看三项操作";
	else if(str=="形式审核")return "可对已录入信息进行形式上的审核";
	else if(str=="形式管理")return "可对已录入信息进行进行形式上的删除、修改、查看三项操作";
	else if(str=="技术审核")return "可对已录入信息进行技术上的审核";
	else if(str=="技术管理")return "可对已录入信息进行技术上的删除、修改、查看三项操作";
	else if(str=="退回")return "可对已退回信息进行查看";
	else if(str=="专家信息录入")return "录入新的专家信息";
	else if(str=="项目信息导入")return "将已存在的项目信息导入系统";
	else if(str=="项目管理")return "可对已导入信息进行删除、修改、查看三项操作";
	else if(str=="添加专题")return "添加新的专题栏";
	else if(str=="专题管理")return "可对已添加专题进行删除、修改、查看三项操作";
	else if(str=="活动管理")return "可对专题下的各项活动信息进行修改";
	else if(str=="添加专题链接")return "添加新的专题链接";
	else if(str=="链接管理")return "可对已添加专题链接进行删除、修改、查看及默认四项操作";
	else if(str=="日志维护")return "查看系统日志信息";
	else if(str=="数据库备份")return "备份数据库，防止数据丢失";
	else if(str=="用户权限管理")return "新建用户、权限分配";
	else if(str=="前台用户管理")return "可对前台用户进行检索和删除操作";
	else if(str=="免责声明编辑")return "可对前台免责声明进行编辑"
}
//每次重新画table界面防止数据覆盖
function initQXTable(){
	var msg="<table cellspacing='1' cellpadding='3' class='tablehead' style='background:#CCC;'>"+   
    "<thead>              "+
      "<tr class='colhead'>"+
        "<th align='center'>权限名称</th>"+
        "<th align='center'>权限说明</th>"+
        "<th align='center'>是否赋予</th>"+
      "</tr>"+
      "</thead>";
	for(var i=0;i<ALLPower.Power.length;i++){
		msg+="<thead>"+
      "<tr class='stathead'>"+
       "<th class='{sorter: false}' colspan='2'>"+ALLPower.Power[i].nc+"</th>"+
		 "<th class='{sorter: false}' align='center' ><input type='checkbox' disabled id='z"+ALLPower.Power[i].jb+"' onchange='changeALL("+ALLPower.Power[i].jb+")'></th>"+
     "</tr>"+
    "</thead>"; 
		for(var j=0;j<ALLPower.Power[i].xp.length;j++){
			//alert(Power.Power[i].xp[j].nc);
			msg+="<tbody>"+
				"<tr class='oddrow'>"+
	   			"<td align='center'>"+ALLPower.Power[i].xp[j].nc+"</td>"+
				"<td >"+qxshuoming(ALLPower.Power[i].xp[j].nc)+"</td>"+
				"<th class='{sorter: false}' align='center' ><input type='checkbox' disabled id='"+ALLPower.Power[i].xp[j].id+"' ></th>"+
	        	"</tr>"+
	         "</tbody>";
		}
	}	
	msg+="</table>";
	document.getElementById("qxtable").innerHTML=msg;
	$("table").tablecloth({
	     theme: "paper",
	     striped: true,
	     sortable: true,
	     condensed: true
	});
}
//点一级菜单则全选或取消
function changeALL(id){
	var zid="z"+id;
	var c=document.getElementById(zid);
	var value=false;
	if (c.checked)value=true;
	else
		value=false;
	for(var i=0;i<ALLPower.Power.length;i++){
		if(ALLPower.Power[i].jb==id){
			for(var j=0;j<ALLPower.Power[i].xp.length;j++){
				//alert(Power.Power[i].xp[j].nc);
				document.getElementById(ALLPower.Power[i].xp[j].id).checked=value;
			}
			break;
		}		
	}	
}
function changeALLJS(id){
	var zid="js"+id;
	var c=document.getElementById(zid);
	var value=false;
	if (c.checked)value=true;
	else
		value=false;
	for(var i=0;i<ALLPower2.Power.length;i++){
		if(ALLPower.Power[i].jb==id){
			for(var j=0;j<ALLPower2.Power[i].xp.length;j++){
				//alert(Power.Power[i].xp[j].nc);
				document.getElementById(ALLPower.Power[i].xp[j].id).checked=value;
			}
			break;
		}		
	}	
}
function saveqx(){
	if(confirm("确定分配权限？")){
		var newqxmsg="";
		for(var i=0;i<ALLPower.Power.length;i++){
			for(var j=0;j<ALLPower.Power[i].xp.length;j++){
				if(document.getElementById(ALLPower.Power[i].xp[j].id).checked)
				newqxmsg+=ALLPower.Power[i].xp[j].id+",";
			}
		}
		var requestmsg;
		var xhr=getxmlhttp();
		//准备连接
		var url="../SaveNewQX";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
					//alert(requestmsg);
					userqx=eval('('+requestmsg+')');
					if(userqx.set=="fail"){
						alert("数据获取失败");
					}else if(userqx.set=="error"){
						alert("没选择用户");
					}
					else{			
						alert("权限分配成功");
						location.reload(true);
					}
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("newqxmsg="+newqxmsg+"&userid="+document.getElementById("userid").value+"&jsid="+document.getElementById("userjsid").value);
		
	}	
}
</script>
<style type="text/css">
.msg-div{
	width: 280px;
	height:60px;
	color:#ffffff;
	margin-left:40%;
	background-color:#000000;
	position: absolute;
	filter: alpha(opacity=70); 
	opacity: 0.6;
}
</style>
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
</head>
<body onload="showusersmsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
	<br/>
	<div id="tab-container" class='tab-container'>
	<input type="hidden" value="16" id="userjsid">
	 <ul class='etabs' style="text-align: center;">
	  
	   <li class='tab'><a href="#yhgl" >用户管理</a></li>
	    <li class='tab' ><a href="#qxgl" onclick="getqxmsg()">权限管理</a></li>
	   <li class='tab'><a href="#jsgl" >角色管理</a>
	 </ul>
	 <div class='panel-container'>
	  <div id="qxgl" align="center">
	   <h2>权限管理</h2>
	   
	   <div id='selectuser'></div>
	   <div id='userjsqx'></div>
	   <div id="qxtable" style="width:98%"></div>
		
		
		<button style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;" onclick="saveqx()">分配</button>
	  </div>
	  <!-- 角色管理 -->
	  <div id="jsgl" align="center">
	   <h2>角色管理</h2>
	   
	   <!-- 
	   <div id='selectuser'></div>
	   <div id="jsqxtable" style="width:98%"></div>
		 -->
		<button id="addjs" style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;">新增角色</button>
		<button id="deletejs" style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;">删除角色</button>
		
		<div id="newjs"  style="width:98%;display: none;">
		
		<table border="0">
			<tbody>	<tr> <td align="right"><h4>角色名<font color='red'>*</font></h4></td><td><input type='text' style="margin: 0px 0px 0px 0px" id='jsname' value=''/></td></tr></tbody>	
			
			</table>	
		
		</div>
		<div id="jsqxtable" style="width:98%;display: none;" ></div>
		<div id="cj"  style="width:98%;display: none;">
		<button id="tjjs" style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;">创建</button>
		</div>
		<hr>
		<div id='selectjs'></div>
		<div id='selectjsqx'></div>
		<button id="changejsqx" style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;">修改</button>
		
	  </div>
	 <!-- 结束 -->
	   <div id="yhgl" align="center">
		 <button style="background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;"  onclick="showadduser()">新增用户</button>
		<br/>
		<div id="newuser"  style="width:60%;display: none;">
			<table border="0">
			<tbody>	<tr> <td align="right"><h4>用户名<font color='red'>*</font></h4></td><td><input type='text' style="margin: 0px 0px 0px 0px" id='adduserid' value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>姓名<font color='red'>*</font></h4></td><td><input style="margin: 0px 0px 0px 0px" type='text' id='addusernc' value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>密码<font color='red'>*</font></h4></td><td><input style="margin: 0px 0px 0px 0px" type='text' id='addusermm' value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>性别</h4></td><td><input id='addusersex' type="radio" name='sex' checked="checked">男 <input type="radio" name='sex'>女</td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>单位</h4></td><td><input type='text' id='adduserunit' style="margin: 0px 0px 0px 0px" value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>职位</h4></td><td><input type='text' id='adduserjob' style="margin: 0px 0px 0px 0px" value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>职称</h4></td><td><input type='text' id='addusertitle' style="margin: 0px 0px 0px 0px" value=''/></td></tr>	</tbody>	
			<tbody>		<tr> <td align="right"><h4>电话</h4></td><td><input type='text' id='addusertell' style="margin: 0px 0px 0px 0px" value=''/></td></tr></tbody>	
			<tbody>		<tr> <td align="right"><h4>操作</h4></td><td  ><img onclick='add_user()'  style="margin: 0px 0px 0px 100px" alt="" src="../images/config.gif"/></td></tr></tbody>	
			</table>	
		</div>	
		<br/>
	    <div id="usertable"></div>
	  </div>
	 </div>
	</div>
</div>
<script type="text/javascript" charset="utf-8">
function showadduser(){
	if(document.getElementById("newuser").style.display=='none')
	document.getElementById("newuser").style.display='block';
	else
		document.getElementById("newuser").style.display='none';
	
	  
}
function showaddjs(){
	if(document.getElementById("newjs").style.display=='none')
	document.getElementById("newjs").style.display='block';
	else
		document.getElementById("newjs").style.display='none';	  
}
function alterusermm(id){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../AlterUserMM";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				result=eval('('+requestmsg+')');
				if(result.update=="fail"){
					alert("用户密码修改失败");
				}
				else{			
					alert("用户密码重置为:dqwr 成功");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("userid="+id);
}
function add_user(){
	if(document.getElementById("addusermm").value==""||document.getElementById("adduserid").value==""||document.getElementById("addusernc").value==""){
		 alert('带 * 的数据不能为空');
		 return;
	 }
	else if(!/^\w+$/.test(document.getElementById("addusermm").value)||!/^\w+$/.test(document.getElementById("adduserid").value)){
		 alert("用户名、密码必须由数字、26个英文字母或者下划线组成!");
		 return;
	}
	var addusersex='';
	if(document.getElementById("addusersex").checked){
		addusersex='男';
	}else{
		addusersex='女';
	}
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../AddUser";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				adduser=eval('('+requestmsg+')');
				if(adduser.add=="fail"){
					alert("添加数据失败");
				}else if(adduser.add=="adderror"){
					alert("此用户已经存在！");
				}
				else{			
					alert("用户增加成功");
					location.reload(true);   
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("adduserid="+document.getElementById("adduserid").value+"&addusernc="+document.getElementById("addusernc").value+"&addusermm="+document.getElementById("addusermm").value+"&addusersex="+addusersex+"&adduserunit="+document.getElementById("adduserunit").value+"&adduserjob="+document.getElementById("adduserjob").value+"&addusertitle="+document.getElementById("addusertitle").value+"&addusertell="+document.getElementById("addusertell").value);
}
function alterusermsg(id){
	var alterid="alterid"+id;
	var altername="altername"+id;
	var alterunit="alterunit"+id;
	var alterjob="alterjob"+id;
	var altertitle="altertitle"+id;
	var altertell="altertell"+id;
	var altersex="altersex"+id;
	alterid=document.getElementById(alterid).innerHTML;
	altername=document.getElementById(altername).innerHTML;
	alterunit=document.getElementById(alterunit).innerHTML;
	alterjob=document.getElementById(alterjob).innerHTML;
	altertitle=document.getElementById(altertitle).innerHTML;
	altertell=document.getElementById(altertell).innerHTML;
	altersex=document.getElementById(altersex).innerHTML;
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../AlterUser";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				alteruser=eval('('+requestmsg+')');
				if(alteruser.update=="fail"){
					alert("修改用户数据失败");
				}
				else{			
					alert("用户数据修改成功");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("alterid="+alterid+"&altername="+altername+"&alterunit="+alterunit+"&alterjob="+alterjob+"&altertitle="+altertitle+"&altertell="+altertell+"&altersex="+altersex);

}

function deleteusermsg(id){
	var userid=id;
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../DeleteUser";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				alteruser=eval('('+requestmsg+')');
				if(alteruser.deleteuser=="fail"){
					alert("删除用户失败");
				}
				else{			
					alert("删除用户成功");
					location.reload(true);
				}
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("userid="+userid+"");

}

function showusersmsg(){
	getusermsg();
	var msg="<table cellspacing='1' cellpadding='3' class='tablehead' style='background:#CCC;'>"+   
    "<thead>              "+
      "<tr class='colhead'>"+
        "<th align='center'>用户名</th>"+
        "<th align='center'>用户信息</th>"+
      "</tr>"+
      "</thead>";
	for(var i=0;i<ALLUsers.users.length;i++){
		msg+="<thead>"+
			      "<tr class='stathead'>"+
			       "<th class='{sorter: false}' id='alterid"+i+"'>"+ALLUsers.users[i].yhid+"</th>"+
			       "<th class='{sorter: false}' >角色："+ALLUsers.users[i].jsmc+"</th>"+
			     "</tr>"+
			    "</thead>"+
				"<tbody>"+
					"<tr class='oddrow'>"+
			  			"<td align='center'>姓名</td>"+
						"<td contenteditable='true' id='altername"+i+"'>"+ALLUsers.users[i].yhnc+"</td>"+
			       	"</tr></tbody><tbody>"+
			       	"<tr class='oddrow'>"+
			  			"<td align='center'>性别</td>"+
						"<td contenteditable='true' id='altersex"+i+"'>"+ALLUsers.users[i].yhsex+"</td>"+
		      	 	"</tr></tbody><tbody>"+
			       	"<tr class='oddrow'>"+
			  			"<td align='center'>单位</td>"+
						"<td contenteditable='true' id='alterunit"+i+"'>"+ALLUsers.users[i].yhunit+"</td>"+
			       	"</tr></tbody><tbody>"+
				    "<tr class='oddrow'>"+
			  			"<td align='center'>职位</td>"+
						"<td contenteditable='true' id='alterjob"+i+"'>"+ALLUsers.users[i].yhjob+"</td>"+
			       	"</tr></tbody><tbody>"+
				     "<tr class='oddrow'>"+
			  			"<td align='center'>职称</td>"+
						"<td contenteditable='true' id='altertitle"+i+"'>"+ALLUsers.users[i].yhtitle+"</td>"+
			       	"</tr></tbody><tbody>"+
			       	"<tr class='oddrow'>"+
			  			"<td align='center'>联系电话</td>"+
						"<td contenteditable='true' id='altertell"+i+"' >"+ALLUsers.users[i].yhtell+"</td>"+
			       	"</tr></tbody><tbody>"+
			    	"<tr class='oddrow'>"+
			  			"<td align='center'>操作</td>"+
						"<td ><button style='background-color:rgb(113,181,27);color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;'  onclick=alterusermm('"+ALLUsers.users[i].yhid+"') >重置密码</button><button style='background-color:rgb(113,181,27);color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;'  onclick=alterusermsg('"+i+"') >保存修改</button><button style='background-color:rgb(113,181,27);color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;'  onclick=deleteusermsg('"+ALLUsers.users[i].yhid+"') >删除用户</button></td>"+
		      	 	"</tr>"+
			     "</tbody>";
	}	
	msg+="</table>";
	document.getElementById("usertable").innerHTML=msg;	
	$("table").tablecloth({
	     theme: "paper",
	     striped: true,
	     sortable: true,
	     condensed: true
	});
}

</script>
</body>
</html>
