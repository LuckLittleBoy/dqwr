<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		body { font:12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; }
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
<script type="text/javascript">

function getDBMsg(){
	var xhr=getxmlhttp();
	var url="../GetDBMsg";
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				var msg=xhr.responseText;
				var object=eval('('+msg+')');
				document.getElementById("links").innerHTML=object.links;
				document.getElementById("jinchengs").innerHTML=object.jincheng;
				
			}					
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.send(null);
}
//重建索引库
function createindex(){
	var xhr=getxmlhttp();
	var url="../AddAllZC";
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				requestmsg=xhr.responseText;
				var index =eval('('+requestmsg+')');
				if(index.index=="success"){
					alert("索引库重建成功");
				}else{
					alert("索引库重建失败");
				}					
			}					
		}
	}
	xhr.open("post",url,false);//方式、请求url，是否异
	xhr.send(null);
}
//还原数据库
function wipecache(){
	var xhr=getxmlhttp();
	var url="../DByouhua?type="+2;
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				alert("释放数据库缓存成功");								
			}					
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.send(null);
}
//初始化备份文件信息
function getbackup(){
	
}
function claerlink(){
		var xhr=getxmlhttp();
			var url="../DByouhua?type="+1;
			xhr.onreadystatechange=function(){	
				if(xhr.readyState==4){
					if(xhr.status==200||xhr.status==304)
					{
							alert("释放空连接成功");								
					}					
				}
			}
			xhr.open("post",url,true);//方式、请求url，是否异
			xhr.send(null);
};
function onekeyclear(){
	var xhr=getxmlhttp();
	var url="../DByouhua?type="+3;
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
					alert("清理完成");								
			}					
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.send(null);
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
		var MSXML=["MSXML2.XMLHTTP","Miscrosoft.XMLHTTP"];
		for(var n=0;n<MSXML.length;n++)
		{
			try{
			xmlhttp=new ActiveXObject(MSXML[n]);
			break;
			}
			catch(e){}
		}
	}
	return xmlhttp;
}
	
</script>
<body onload="getDBMsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">

<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<br/><br/>
<div align="center">
		<TABLE cellSpacing=0 cellPadding=0 width="90%" >
			<TR >
				<TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px" >
				<div id="nowtime" align="center" ><img src="2.gif"/></div>
				</TD>
			</TR>
		</TABLE>	
		<br/><br/>
		<TABLE class='gridtable' width="60%">
			<TR align="CENTER">
			    <Th colspan="4">数据库信息</Th>
			</TR>
			<TR>
			    <TD>数据库的连接数:</TD> <TD id="links">0</TD><TD>当前进程数:</TD><TD id="jinchengs">0</TD>
			</TR>	  
		</TABLE>
		<br><br>
		<center>
			<img alt=""  onclick="createindex()" src="../images/cjsy.gif">&nbsp;&nbsp;
			<img alt=""  onclick="claerlink()" src="../images/sfkl.gif">&nbsp;&nbsp;
			<img alt=""  onclick="wipecache()" src="../images/qchc.gif">
			<br/><br/><br/><br/>
			<font color='blue'>注：重建索引库需要大量时间，请耐心等待。</font>
		</center>
		
</div>

   		 
<script type="text/javascript">
	function nowtime(){
		var date=new Date();
		var year=date.getFullYear();
		var mounth=date.getUTCMonth()+1;
		var day=date.getDate();
		var hour=date.getHours();
		var min=date.getMinutes();
		var second=date.getSeconds();
		var now=year+"年"+mounth+"月"+day+"日  "+hour+"点"+min+"分"+second+"秒";
		document.getElementById("nowtime").innerHTML=now;
		setTimeout("nowtime()",1000);
	}
	nowtime();
</script>
</div>
 </BODY>
</HTML>