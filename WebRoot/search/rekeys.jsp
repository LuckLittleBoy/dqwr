<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全文检索</title>
<script src="../js/dowithUrl.js"></script> 
<script src="../js/tool.js"></script> 
<style type="text/css">
.btn{background-color: #D2340F;color:white;text-decoration: none;font-family:Arial;font-weight: 900;font-size: 15px;padding:5px 6px;border-radius: 3px;}
.btn-buynow{background-color: #D2340F;}
.btn-buynow:hover{background-color: #EF411A;}
.btn-buyre{background-color: #00340F;}
.btn-buyre:hover{background-color: #00411A;}
.btn-signup{background-color: #006DCC;}
.btn-signup:hover{background-color: rgb(0,74,204);}
.btn-login{background-color: rgb(113,181,27);}
.btn-login:hover{background-color: rgb(147,199,25);}
</style>
<script src="../js/jquery.min.js"></script> 
<SCRIPT type=text/javascript>	
history="";//记录加入历史记录的政策文号
str_query="";//检索条件
colors=['#0000FF','#A52A2A','#5F9EA0','#D2691E','#C0F000','#00FFFF','#008B8B','#A9A9A9','#DA0000','#556B2F','#9932CC','#E9967A','#483D8B','#00CED1','#FF1493','#696969','#B22222','#228B22','#00000E','#00E00D','#008000','#CD5C5C','#F0E68C','#FFF0F5','#FFFACD','#F08080','#0000E0','#0000A0','#FFB6C1','#20B2AA','#0000EB','#B0C4DE','#32CD32','#FF00FF','#66CDAA','#BA55D3','#3CB371','#00FA9A','#C71585','#F5FFFA','#FFE4B5','#000080','#FDF5E6','#FFA500','#DA70D6','#98FB98','#DB7093','#FFDAB9','#FFC0CB','#B0E0E6','#FF0000','#4169E1','#FA8072','#2E8B57','#A0522D','#6A5ACD','#FFFAFA','#4682B4','#D8BFD8','#40E0D0','#00E0ED','#000E00','#FFFF00'];
querys={};
function querymsg(){	
	var str_query="";	
	str_query=document.getElementById("str_many_query").value;
	str_query=dowithURL(str_query);
	if(str_query==""){
		alert("请输入检索内容。");
		document.getElementById("str_many_query").focus();
		return;
	}		
	if(progress!=0){
		alert("检索正在进行中，请等待...");
		return;
	}
	getKeys(str_query);
}


function getKeys(str_query){	
		var requestmsg;
		var xhr=getxmlhttp();
		//准备连接
		var url="../GetKeys";
		var param="str_query="+str_query;
		if($("keysku").checked){
			param+="&userkeysku=true";
		}else{
			param+="&userkeysku=false";
		}
		if($("nokeysku").checked){
			param+="&usernokeysku=true";
		}
		else{
			param+="&usernokeysku=false";
		}
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
				//	alert(requestmsg);
				//全局变量
					var keys =eval('('+requestmsg+')');
					key=keys.keys;
					showKeyList(null);
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(param);
		
	
	}
	
//获取xmlhttprequest
function getxmlhttp()
{
	var xmlhttp=null;
	try
	{
		xmlhttp=new XMLHttpRequest();
	}catch(e)
	{
		var MSXML=['MSXML2.XMLHTTP.6.0','MSXML2.XMLHTTP.5.0',
		'MSXML2.XMLHTTP.4.0','MSXML2.XMLHTTP.3.0','MSXML2.XMLHTTP',
		'Microsoft.XMLHTTP'];
		for(var n=0;n<MSXML.length;n++)
		{
			try{
			xmlhttp=new ActiveXObject(MSXML[n]);
			break;
			}
			catch(e){
				
			}
		}
	}
	return xmlhttp;
}
		//进度条更新
progress=0;
function updateprogress (){
	$("br_div").style.display='none';
	if(progress>78){
		progress_time= setTimeout("updateprogress()",2000);
		progress+=1;
		}
	else {
		
		progress+=Math.floor(Math.random()*3);
		progress_time= setTimeout("updateprogress()",100);
	}
	if(progress>99)progress=99;
	$("progress_bar").style.width=progress+"%";
	$("progress_text").innerHTML="正在检索请稍等，进度："+progress+"%";
	
}
function progressComplete(){
	clearTimeout(progress_time);
	$("progress_bar").style.width="100%";
	$("progress_text").innerHTML="正在检索请稍等，进度：100%";
	//隐藏进度条
	setTimeout("noneProgress()",300);
	progress=0;//把进度值置为0
	
} 
function noneProgress(){
	$("wrap").style.display='none';
	 var endtime=new Date().getTime();
	$("br_div").innerHTML="检索用时:"+(endtime-starttime)/1000+"秒";
	$("br_div").style.display='block';
	
} 
//动态增加button
function addPageButton(){
	
	var buttonNum=0;
	var count =querys.querys.length;
	if(count%10==0)buttonNum=count/10;
	else buttonNum=count/10+1;
	var str_buttons="";
	for(var i=1; i<=buttonNum;i++){
		 buttonid="pagebutton"+i;
		if(i==1)str_buttons+="<button style='width:30px' disabled='disabled' id="+buttonid+" onclick='interThisPage(this)'>"+i+"</button>";
		else str_buttons+="<button style='width:30px' id="+buttonid+"  onclick='interThisPage(this)'>"+i+"</button>";
	}
	$("buttons").innerHTML=str_buttons;
	//记录当前页的按钮
	ablebutton=$("pagebutton1");
	
}
//显示每页的内容数据
	function interThisPage(obj){
		
		obj.disabled=true;
		ablebutton.disabled=false;
		ablebutton=obj;
		var e=obj.innerHTML;
		var msg="";
		var n=e*10>querys.querys.length?querys.querys.length:e*10;
		for(var i=(e-1)*10;i<n;i++ ){
			var astr="showzhengce.jsp?zcwh="+querys.querys[i].id;
			msg+="<div class='divpostion_content'>"+
			"		<div><a href='"+astr+"' target='_blank' style='font-size:18px' >"+querys.querys[i].title+"</a><input type='checkbox' id=zhengce"+i+" onchange='addmyhistory("+i+")' style='margin-left:80px;'></div>"+
			"		<div  class='divpostion' style='font-size:14px'>时间：<span>"+querys.querys[i].date+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
			"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+changebackground(querys.querys[i].content)+"</div>"+
			"</div><br/>";		
			}

		document.getElementById("tablemag").innerHTML=msg;
		window.scroll(0,20);
		
		
	}
	function getPhraseQuery(id){
		saveKeyValue();
		var requestmsg;
		var slop=10;
		var issort=false;
		if($("slop2").checked)slop=10;
		if($("slop3").checked)slop=20;
		if($("slop4").checked)slop=50;
		if($("issort").checked)issort=true;
		var xhr=getxmlhttp();
		//开始时间
		starttime=new Date().getTime();
		$("wrap").style.display='block';
		updateprogress();
		str_query=""+key;
		//准备连接
		var url="../PhraseQueryServlet";
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
					//	alert(requestmsg);
					//全局变量
						
						querys=eval('('+requestmsg+')');
						addPageButton();
					//	alert(querys.querys[0].content);	
						var msg=""; 
						if(querys.querys[0]==null){
							 msg="<div style='color:#0099FF; font-size: 18px'>没有检索到任何信息</div>";
							document.getElementById("tablemag").innerHTML=msg;
							progressComplete();	
							return;
						}
						else
						{
							$("soso").style.display='block';
						var n=(querys.querys.length>10?10:querys.querys.length);				
						for(var i=0;i<n;i++ ){
							var astr="showzhengce.jsp?zcwh="+querys.querys[i].id;
							msg+="<div class='divpostion_content'>"+
							"		<div><a href='"+astr+"' target='_blank' style='font-size:18px' >"+querys.querys[i].title+"</a><input type='checkbox' id=zhengce"+i+" onchange='addmyhistory("+i+")' style='margin-left:80px;'></div>"+
							"		<div  class='divpostion' style='font-size:14px'>时间：<span>"+querys.querys[i].date+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
							"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+changebackground(querys.querys[i].content)+"</div>"+
							"</div><br/>";			
							}
						}

						document.getElementById("tablemag").innerHTML=msg;	
						//alert(str_query);
						progressComplete();
						if(str_query.length>10)
							document.getElementById("sostr").innerHTML=str_query.substr(0,10)+"...";				
						else document.getElementById("sostr").innerHTML=str_query;
						document.getElementById("soresult").innerHTML="";
					
				}
			}
		};
		
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		if(id==1){
			xhr.send("str_query="+key+" &issort="+issort+"&slop="+slop);
		}else{
			var arrwh='';
			for(var i in querys.querys){
				arrwh+=querys.querys[i].id+",";
			}
			xhr.send("str_query="+key+" &issort="+issort+"&slop="+slop+"&arrwh="+arrwh);
		}
		
}
function changebackground(str){
	var new_str=str;
	for(var i=0;i<key.length;i++){
	}
	//alert(new_str);
	return new_str;
}
	
</SCRIPT>
<link href="../css/search.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function addHistory(){

	if(history==""||str_query==""){
		showmsgDiv("新的历史结果集为空，无法增加");
		return;
	}
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../AddHistory";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.add=="success"){
					showmsgDiv("历史数据增加成功");
				}else{
					showmsgDiv("<font color=red>历史数据增加失败</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("history="+history+"&str_query="+str_query);
}
function getoldhistorymsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetWDLS";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var wdls =eval('('+requestmsg+')');
				if(wdls.wdls=="fail"){
					showmsgDiv("数据获取失败");
				}else{				
					var msg="";
					var n=wdls.wdls.length>3?3:wdls.wdls.length;
					for(var i=0;i<n;i++){			
							msg+=(i+1)+":"+wdls.wdls[i].serchstr+"<br/><hr/>";						
					}

				document.getElementById("oldsoresult").innerHTML=msg;
					
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
//加入我的历史
function addmyhistory(i){
	var checkboxid= "zhengce"+i;
	var reg=new RegExp("<font color='#FA6060'>","g"); 
	var str=querys.querys[i].title;
	str=str.replace(reg,"");
	reg=new RegExp('</font>',"g"); 
	str=str.replace(reg,"");
	//alert(str);
	var insertstr="";
	if(str.length>13){
		insertstr=str.substr(0,13)+"...<br>";
	}
	else insertstr=str+"<br>";
	if($(checkboxid).checked){
			document.getElementById("soresult").innerHTML+=insertstr;
			history+=querys.querys[i].id+";";
	}
	else{
		var s=document.getElementById("soresult").innerHTML;
		reg=new RegExp(insertstr,"g"); 
		s=s.replace(reg,"");
		document.getElementById("soresult").innerHTML=s;
		var v=querys.querys[i].id+";";
		reg2=new RegExp(v,"g"); 
		history=history.replace(reg2,"");
	}
	
}

function lookHistory(){
	window.location.href="myhistory.jsp";
}
</SCRIPT>
<link href="../css/search.css" rel="stylesheet" type="text/css" />
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
</head>
<body onload="getoldhistorymsg()">
<div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div style="background-color: #ffffff;">
<!-- 多行全文检索输入框 -->
<div id="manySearch" >
	<fieldset class="fieldset_style"  >
		<font color="#FF0000" size="3px">输入您要检索的内容：</font><br/>
		<br/><br/>
		<div style="margin-left:80px;">
		启用:&nbsp;&nbsp;&nbsp;<label for="keysku">关键词库</label><input type="checkbox"   id="keysku" />
		&nbsp;&nbsp;&nbsp;<label for="nokeysku">无用词库</label><input type="checkbox" id="nokeysku"/>
		<br><br>
		<textarea id="str_many_query" style="resize:none;color:#0099FF;width:540px; height: 120px; font-size: 20px" ></textarea>
		<br/><img src="../images/bt_query.jpg"  style="vertical-align: bottom; margin:10px 0px 5px 220px; " onclick="querymsg()" /><br/>
		
		<br/><br/>
		</div>
		<br/>
	</fieldset>	
</div>	

<!-- 重组关键词 -->
<div id="showKeyDiv" >
	<fieldset class="fieldset_style" >
	<font color="#FF0000" size="2px">重组关键字顺序：</font><br/>
	<table>
	<tr>
	<td>
		<div id="keyList" style=" overflow:auto;line-height:22px;  width:200px; height:160px; border:1px solid;"></div>
	</td>
	<td >
		<img  src="../images/103.gif"  onclick="keyUpMove()" />
		<br/><img style="margin-top: 10px;" onclick="keyAdd()" src="../images/101.gif" />
		<br/><img src="../images/102.gif" style="margin-top: 10px;"  onclick="keyDel()" />
		<br/><img src="../images/104.gif" style="margin-top: 10px;" onclick="keyDownMove()"  />
		
	</td>
	<td>
	<div  style=" height:160px;margin:0px 0 0 80px; width:400px;">
		间隔数：
		<label for="slop2"><10</label><input type="radio"  checked="checked" id="slop2"  name="slop"   />
		<label for="slop3"><20</label><input type="radio" id="slop3"  name="slop"   />
		<label for="slop4"><50</label><input type="radio" id="slop4"  name="slop"   />
		<input style="display: none;" type="checkbox" id="issort"  name="issort"   />
		<br/><br/>
	<img style="margin: 10px 0px 0 0px;"  src="../images/103.gif"   />:上移关键字
	<img style="margin: 10px 0 0 0px;"  src="../images/101.gif" />:新增关键字
	<br/><img src="../images/104.gif" style="margin: 10px 0px 0 0px;"/>:下移关键字
	<img src="../images/102.gif" style="margin: 10px 0px 0 0px;"  />:删除关键字<br/><br/>
		<div align="left">
		<img  alt="确定" src="../images/config.gif" onclick="getPhraseQuery(1)">
		<img  alt="确定" src="../images/jgzjs.gif" onclick="getPhraseQuery(2)">
		
		</div>
	</div>
	</td>
	</tr>
	</table>
				
	</fieldset>	
</div>	
<div>
<fieldset id="fieldset_style" class="fieldset_style">
	<!-- 进度条 -->
	<div class="wrap" id="wrap" style="display: none;" align="center"> 
	    <div class="progressbar"> 
	        <div class="text" id="progress_text">正在检索请稍等，进度：0%</div> 
	        <div class="bar" id="progress_bar" style="width: 0%;"></div> 
	    </div> 
	</div>


	
	<div id="br_div"><br/></div>
	
	<div id="comments"></div>
	<fieldset id="fieldset_style_inner">
	<!-- **********显示信息********** -->
	<div id="tablemag" style="magin:30px; padding: 20px" >
		<font color="0099FF" size="3px">
		1.请输入内容进行全文检索<br/><br/>
		2.全文检索将对所以政策文档内的内容进行检索，搜索时间会随搜索内容的不同而不同，请耐心等待。
		</font>
	</div>
	<!-- **********分页按钮********** -->
	<div id="buttons" style="margin: 10px" >

	</div>
	</fieldset>
	<br/>
</fieldset>
</div>

<div align="center" id="oldsoso" style=" position:fixed;border:#43A3D4 solid 1px;top:15px;left:780px;width: 280px;">
		我的检索历史<br/><hr/>
		<div  align="left" id="oldsoresult" style="margin-left: 10px;line-height: 20px;"></div>
		<button class="btn btn-buynow" onclick="lookHistory()">查看历史检索</button>
	</div>
	<div align="center" id="soso" style=" position:fixed;border:#43A3D4 solid 1px;top:270px;left:780px;width: 280px;display: none;">
		新的检索历史<br/><hr/>
		<div id="sostr"></div>		
		<hr/>
		<div  align="left" id="soresult" style="margin-left: 10px;line-height: 20px;"></div>
		<button class="btn btn-buynow" onclick="addHistory()">确认</button>
	</div>	

</div>
<script type="text/javascript">
//key=["关键词1","关键词2","关键词3","关键词4","关键词5","关键词6"];
function showKeyList(e){
	var  msg="";
	for(var i=1;i<= key.length;i++){
		var keyid="key"+i;
		if(e!=null){
			
			if(e.title=='selected')return;
			if(e.id==keyid)
				msg+="<div contenteditable='true'style='color:"+colors[i-1]+"' title='selected' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
				else
					msg+="<div contenteditable='true' style='color:"+colors[i-1]+"' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
			
		}
		else{
			if(i==1)
				msg+="<div contenteditable='true'style='color:"+colors[i-1]+"' title='selected' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
				else
					msg+="<div contenteditable='true' style='color:"+colors[i-1]+"' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";		
		}	
		
	}
	$("keyList").innerHTML=msg;
}


function keyUpMove(){
	saveKeyValue();
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=1){
		var t=key[n-1];
		key[n-1]=key[n-2];
		key[n-2]=t;
	}	
	showKeyList(keylist[n-2]);
}
function keyDownMove(){
	saveKeyValue();
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=keylist.length){
		var t=key[n-1];
		key[n-1]=key[n];
		key[n]=t;
		showKeyList(keylist[n]);
	}	
}

function keyAdd(){
	saveKeyValue();
	var n=0;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	for(var i=keylist.length;i>=n;i--){
		if(i==n){
			key[i]="新关键字";
			continue;
		}
		key[i]=key[i-1];
		
	}	
	if(n!=keylist.length) showKeyList(keylist[n]);
	else {
		
		var keyid="key"+(keylist.length+1);
		showKeyList({'id':keyid,'style':{'background':''}});
	}
}
function keyDel(){
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	var key2=[];
	for(var i=0;i<keylist.length-1;i++){
		if(i<(n-1))key2[i]=key[i];
		else key2[i]=key[i+1];
	}
	key=[];
	for(var i=0;i<key2.length;i++){
		key[i]=key2[i];
	
	}
	showKeyList(keylist[n-2]);
}
//保存修改后的值
function saveKeyValue(){
	var n=0;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=0)
	key[n-1]=keylist[n-1].innerHTML;
	
}


function changetextvalue(obj){
	$("str_query").value=obj.innerHTML;
}
function $(id){
	return document.getElementById(id);
}

</script>
</body>
</html>