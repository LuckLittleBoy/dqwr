<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的检索历史</title>
<script type="text/javascript">
function getmsg(){	
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
					var msg="<table width='90%' class='gridtable'>"+
					"<tr><th>编号</th><th>检索内容</th><th>检索日期</th><th>标记结果条数</th><th>操作</th></tr>";
					for(var i=0;i<wdls.wdls.length;i++){			
							msg+="<tr>"+
							"<td>"+wdls.wdls[i].id+"</td>"+							
							"<td>"+wdls.wdls[i].serchstr+"</td>"+	
							"<td>"+wdls.wdls[i].riqi+"</td>"+
							"<td>"+wdls.wdls[i].result+"</td>"+
							"<td><button class='btn btn-signup' onclick=lookhistory('"+wdls.wdls[i].id+"') >查看</button></td>"+
						"</tr>";
						
					}
				msg+="</table>";
				document.getElementById("WDLStable").innerHTML=msg;
					
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
function lookhistory(id){
	addCookie("his",id,36000);
	//alert(getCookie("his"));
	window.location.href="lookmyhis.jsp";
}
//把编号写入cookie
function addCookie(name,value,expiresHours){
	//重复的不再写入
	var is=true;
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split(";"); 
	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if(arr[1]==value){
			is=false;
			return;
		}
		} 
	if(is==false)return;
	var cookieString=name+"="+value; 
	//判断是否设置过期时间 
	if(expiresHours>0){ 
	var date=new Date(); 
	date.setTime(date.getTime+expiresHours*3600*1000); 
	cookieString=cookieString+"; expires="+date.toGMTString(); 
	} 
	document.cookie=cookieString; 
	
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
</script>
</head>
<body onload=" getmsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
	<br/>
	<div align="center">
		<div id="WDLStable"></div>
	</div>
</div>
</body>
</html>