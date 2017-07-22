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
	if(str=="待审政策")return "可查看自己等待审核的政策";
	else if(str=="已审政策")return "可查看自己已经审核通过的政策";
	else if(str=="退回政策")return "可查看自己已经没有审核通过的政策";
	else if(str=="待标政策")return "可查看自己已经待标引的政策";
	else if(str=="政策录入")return "录入新的政策";
	else if(str=="政策修订")return "修改的政策可修定信息";
	else if(str=="修订审核")return "审核修订后的政策";
	
	else if(str=="政策审核")return "审核录入的新政策";
	else if(str=="分类浏览")return "分类别查看政策信息";
	else if(str=="分类检索")return "分类别检索政策信息";
	else if(str=="综合检索")return "根据多个条件准确查询政策信息";
	else if(str=="统计分析")return "综合分析政策分布范围";
	else if(str=="族谱分析")return "分析政策的族谱关系";
	else if(str=="时效分析")return "分析政策的时效关系";
	else if(str=="关键词维护")return "维护系统政策中的关键词";
	else if(str=="无用关键词维护")return "维护系统政策中的无用的关键词";
	else if(str=="信息比对")return "政策信息的比对";
	else if(str=="主题词维护")return "维护系统政策中的主题词";
	else if(str=="我的检索历史")return "查看自己的全文检索记录";
	else if(str=="关键词检索")return "通过关键词来查询政策";
	else if(str=="全文检索")return "全文搜索政策信息";
	else if(str=="日志维护")return "查看系统日志信息";
	else if(str=="数据库备份")return "备份数据库，防止数据丢失";
	else if(str=="数据库优化")return "清理数据库缓冲，增加查询效率";
	else if(str=="基本信息维护")return "维护实行范围、政策类别等信息";
	else if(str=="用户权限管理")return "新建用户、权限分配";
	else if(str=="可删政策")return "可删除自己的未通过政策";
	else if(str=="检索关键词")return "检索关键字是否存在";
	else if(str=="前台用户管理")return "升级普通用户成为研究人员";
	else if(str=="个人信息管理")return "用户修改个人信息";
	else if(str=="意见反馈管理")return "外部意见反馈信息管理";
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
					location.reload();   
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
						"<td ><button style='background-color:rgb(113,181,27);color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;'  onclick=alterusermm('"+ALLUsers.users[i].yhid+"') >重置密码</button><button style='background-color:rgb(113,181,27);color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;'  onclick=alterusermsg('"+i+"') >保存修改</button></td>"+
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

jQuery(function(){
  $(document).on("click","#deletejs",{"jsid":$("#jsqxid").val(),},function(e){
	 jQuery.post("../DeleteJS",function(response){
		 var Deletejs=eval("("+response+")");
		 if(Deletejs.deletejs=="fail"){
			 alert("删除角色失败");
		 }else{
			 alert("删除角色成功");
			 location.reload();
		 }
	 }); 
	  
  });	
	
});


jQuery(function(){
	/*
	 * 添加角色
	 */
	window.ALLPower2={};
	$(document).on("click","#addjs",function(e){
		jQuery.post("../GetUserPower",
				function(response){
			var Power=eval("("+response+")");
			ALLPower2=Power;//放入全局变量中
			if(Power.Power=="fail"){
				alert("数据获取失败");
			}else{
				ALLPower2=Power;
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
					 "<th class='{sorter: false}' align='center' ><input type='checkbox' id='js"+Power.Power[i].jb+"' class='checkalljs'></th>"+
		           "</tr>"+
		          "</thead>"; 
					for(var j=0;j<Power.Power[i].xp.length;j++){
						//alert(Power.Power[i].xp[j].nc);
						msg+="<tbody>"+
							"<tr class='oddrow'>"+
				   			"<td align='center'>"+Power.Power[i].xp[j].nc+"</td>"+
							"<td >"+qxshuoming(Power.Power[i].xp[j].nc)+"</td>"+
							"<th class='{sorter: false}' align='center' ><input type='checkbox' id='js"+Power.Power[i].xp[j].id+"' ></th>"+
				        	"</tr>"+
				         "</tbody>";
					}
				}	
				msg+="</table>";
				
				$("#jsqxtable").html(msg);
				
				$("table").tablecloth({
				     theme: "paper",
				     striped: true,
				     sortable: true,
				     condensed: true
				   });
			}

			
		});
		$("#newjs").toggle(500);
		$("#jsqxtable").toggle(500);
		$("#cj").toggle(500);
	})
	$(document).on("click","#tjjs",function(e){
		var newjsqxmsg="";
		for(var i=0;i<ALLPower2.Power.length;i++){
			for(var j=0;j<ALLPower2.Power[i].xp.length;j++){
				for(var j=0;j<ALLPower2.Power[i].xp.length;j++){
					if(document.getElementById("js"+ALLPower2.Power[i].xp[j].id).checked)
						newjsqxmsg+=ALLPower2.Power[i].xp[j].id+",";
				}
			}
		}
		jQuery.post("../AddJS",{
			"newqxmsg":newjsqxmsg,
			"jsname":$("#jsname").val(),
		},
		function(response){
			var jsresult=eval("("+response+")");
			if(jsresult.add=="fail"){
				alert("添加数据失败");
			}else if(jsresult.add=="adderror"){
				alert("角色已经存在！");
			}
			else{
				alert("角色增加成功");
				location.reload();   
			}
		});
	});
	$(document).on("click",".checkalljs",function(e){
		var zid=""+$(this).attr('id');
		var c=document.getElementById(zid);
		var value=false;
		if (c.checked)value=true;
		else
			value=false;
		for(var i=0;i<ALLPower2.Power.length;i++){
			if(ALLPower2.Power[i].jb==$(this).attr('id').substring(2)){
				for(var j=0;j<ALLPower2.Power[i].xp.length;j++){
					//alert(Power.Power[i].xp[j].nc);
					$("#js"+ALLPower2.Power[i].xp[j].id).attr("checked",value);
				}
				break;
			}		
		}	

	});
	
	/*
	 * 分配角色
	 */
	//获取角色
	jQuery.post("../GetJSMSG",function(response){
		var js=eval("("+response+")");
		if(js.js=="fail"){
			alert("数据获取失败");
		}else{
			ALLJS=js;
			var msg="<font><b>&nbsp;&nbsp;选择角色    :  </b></font><select id='jsqxid'><option selected = 'selected' value='-1'>请选择角色</option>";
			for(var i=0;i<js.js.length;i++){
				if(js.js[i].jsid!="16")
					msg+="<option value ='"+js.js[i].jsid+"'>"+js.js[i].jsmc+"</option>";
			}
			msg+="</optgroup></select>";
			$("#userjsqx").html(msg);
			$("table").tablecloth({
			     theme: "paper",
			     striped: true,
			     sortable: true,
			     condensed: true
			 });
		}
	});
	//用户选择角色事件
	$(document).on("change","#jsqxid",function(){
		jQuery.post("../GetJSQX",{
			"jsid":$("#jsqxid").val(),
			
		},function(response){
			var jsqx=eval("("+response+")");
			if(jsqx.jsqx=="fail"){
				alert("数据获取失败");
			}else{
				initQXTable();//清空所有的选中重新设置
				for(var n=0;n<jsqx.jsqx.length;n++){
					for(var i=0;i<ALLPower.Power.length;i++){
						for(var j=0;j<ALLPower.Power[i].xp.length;j++){
							//alert(userqx.userqx[n].cdid+"__"+ALLPower.Power[i].xp[j].id)
							if(jsqx.jsqx[n].cdid==ALLPower.Power[i].xp[j].id){
								$("#"+ALLPower.Power[i].xp[j].id).attr("checked",true);
								break;
							}		
						}
					}		
				}
				$("#userjsid").val($("#jsqxid").val());
			}
		});
	});
	//自定义角色changeuserqx
	$(document).on("click",".changeuserqx",function(e){
		$("#userjsid").val(16);
	});

	
	/*
	 * 修改角色权限
	 */
	jQuery.post("../GetJSMSG",function(response){
		var js=eval("("+response+")");
		if(js.js=="fail"){
			alert("数据获取失败");
		}else{
			ALLJS=js;
			var msg="<font><b>请选择角色:  </b></font><select id='jsid'><option selected = 'selected' value='-1'>请选择角色</option>";
			for(var i=0;i<js.js.length;i++){
				if(js.js[i].jsid!="16")
					msg+="<option value ='"+js.js[i].jsid+"'>"+js.js[i].jsmc+"</option>";
			}
			msg+="</optgroup></select>";
			$("#selectjs").html(msg);
			$("table").tablecloth({
			     theme: "paper",
			     striped: true,
			     sortable: true,
			     condensed: true
			 });
		}
	});
	
	window.ALLPower3={};
	jQuery.post("../GetUserPower",
			function(response){
		var Power=eval("("+response+")");
		ALLPower3=Power;//放入全局变量中
		if(Power.Power=="fail"){
			alert("数据获取失败");
		}else{
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
				 "<th class='{sorter: false}' align='center' ><input type='checkbox' id='jsqx"+Power.Power[i].jb+"' class='checkalljsqx'></th>"+
	           "</tr>"+
	          "</thead>"; 
				for(var j=0;j<Power.Power[i].xp.length;j++){
					//alert(Power.Power[i].xp[j].nc);
					msg+="<tbody>"+
						"<tr class='oddrow'>"+
			   			"<td align='center'>"+Power.Power[i].xp[j].nc+"</td>"+
						"<td >"+qxshuoming(Power.Power[i].xp[j].nc)+"</td>"+
						"<th class='{sorter: false}' align='center' ><input type='checkbox' id='jsqx"+Power.Power[i].xp[j].id+"' ></th>"+
			        	"</tr>"+
			         "</tbody>";
				}
			}	
			msg+="</table>";
			
			$("#selectjsqx").html(msg);
			
			$("table").tablecloth({
			     theme: "paper",
			     striped: true,
			     sortable: true,
			     condensed: true
			   });
		}

		
	});
	$(document).on("click",".checkalljsqx",function(e){
		var zid=""+$(this).attr('id');
		var c=document.getElementById(zid);
		var value=false;
		if (c.checked)value=true;
		else
			value=false;
		for(var i=0;i<ALLPower3.Power.length;i++){
			if(ALLPower3.Power[i].jb==$(this).attr('id').substring(4)){
				for(var j=0;j<ALLPower3.Power[i].xp.length;j++){
					//alert(Power.Power[i].xp[j].nc);
					$("#jsqx"+ALLPower3.Power[i].xp[j].id).attr("checked",value);
				}
				break;
			}		
		}	

	});

	
	$(document).on("change","#jsid",function(){
		jQuery.post("../GetJSQX",{
			"jsid":$("#jsid").val(),
			
		},function(response){
			var jsqx=eval("("+response+")");
			if(jsqx.jsqx=="fail"){
				alert("数据获取失败");
			}else{
				initJSQXTable();//清空所有的选中重新设置
				for(var n=0;n<jsqx.jsqx.length;n++){
					for(var i=0;i<ALLPower3.Power.length;i++){
						for(var j=0;j<ALLPower3.Power[i].xp.length;j++){
							//alert(userqx.userqx[n].cdid+"__"+ALLPower.Power[i].xp[j].id)
							if(jsqx.jsqx[n].cdid==ALLPower3.Power[i].xp[j].id){
								$("#jsqx"+ALLPower3.Power[i].xp[j].id).attr("checked",true);
								break;
							}		
						}
					}		
				}
			}
		});
	});
	
});
function initJSQXTable(){
	var msg="<table cellspacing='1' cellpadding='3' class='tablehead' style='background:#CCC;'>"+   
    "<thead>              "+
      "<tr class='colhead'>"+
        "<th align='center'>权限名称</th>"+
        "<th align='center'>权限说明</th>"+
        "<th align='center'>是否赋予</th>"+
      "</tr>"+
      "</thead>";
	for(var i=0;i<ALLPower3.Power.length;i++){
		msg+="<thead>"+
      "<tr class='stathead'>"+
       "<th class='{sorter: false}' colspan='2'>"+ALLPower3.Power[i].nc+"</th>"+
		 "<th class='{sorter: false}' align='center' ><input type='checkbox' id='jsqx"+ALLPower3.Power[i].jb+"' class='checkalljsqx'></th>"+
     "</tr>"+
    "</thead>"; 
		for(var j=0;j<ALLPower3.Power[i].xp.length;j++){
			//alert(Power.Power[i].xp[j].nc);
			msg+="<tbody>"+
				"<tr class='oddrow'>"+
	   			"<td align='center'>"+ALLPower3.Power[i].xp[j].nc+"</td>"+
				"<td >"+qxshuoming(ALLPower3.Power[i].xp[j].nc)+"</td>"+
				"<th class='{sorter: false}' align='center' ><input type='checkbox' id='jsqx"+ALLPower3.Power[i].xp[j].id+"' ></th>"+
	        	"</tr>"+
	         "</tbody>";
		}
	}	
	msg+="</table>";
	document.getElementById("selectjsqx").innerHTML=msg;
	$("table").tablecloth({
	     theme: "paper",
	     striped: true,
	     sortable: true,
	     condensed: true
	});
	//提交
	$(document).on("click","#changejsqx",function(e){
		var newjsqxmsg="";
		for(var i=0;i<ALLPower3.Power.length;i++){
			for(var j=0;j<ALLPower3.Power[i].xp.length;j++){
				for(var j=0;j<ALLPower3.Power[i].xp.length;j++){
					if(document.getElementById("jsqx"+ALLPower3.Power[i].xp[j].id).checked)
						newjsqxmsg+=ALLPower3.Power[i].xp[j].id+",";
				}
			}
		}
		jQuery.post("../SaveJSQX",{
			"newqxmsg":newjsqxmsg,
			"jsid":$("#jsid").val(),
		},
		function(response){
			var jsresult=eval("("+response+")");
			if(jsresult.set=="fail"){
				alert("添加数据失败");
			}else if(jsresult.set=="saveerror"){
				alert("没有选择角色！");
			}
			else if(jsresult.set=="success"){			
				alert("修改成功");
				location.reload();   
			}
		});
	})

}
