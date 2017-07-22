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
function backupyesno(){
	//备份数据库文件
	if(confirm("备份数据库将覆盖原来备份的数据库，是否继续备份数据库?")){
		backup(1);
		document.getElementById("progress").innerHTML="<img src='2.gif' >";
		}
}

//还原数据库
function getbak(){
	var xhr=getxmlhttp();
	var url="../BakDB";
	url=encodeURI(url); 
	url=encodeURI(url);
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				var msg=xhr.responseText;
				var object=eval('('+msg+')');
				if("success"==object.bak){
					alert("数据库还原成功");
				}
				else alert("数据库还原失败");
				//取消进度条
				document.getElementById("progress").innerHTML="";
			}					
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.send(null);
}
//初始化备份文件信息
function getbackup(){
	//获取文件的信息
		backup(0);
}
function backup(type){
		var xhr=getxmlhttp();
			var url="../BackupDB?type="+type;
			url=encodeURI(url); 
			url=encodeURI(url);
			xhr.onreadystatechange=function(){	
				if(xhr.readyState==4){
					if(xhr.status==200||xhr.status==304)
					{
						uRLEncoder=xhr.responseText;
						var msg=eval('('+uRLEncoder+')');
						if(msg.backup=="success"){
							alert("数据库备份成功");
						document.getElementById("fielname").innerHTML=msg.filename;
						document.getElementById("filesize").innerHTML=msg.size;
						document.getElementById("filedate").innerHTML=msg.date;
						document.getElementById("filepath").innerHTML=msg.path;	
						}else if(msg.backup=="ok"){
							document.getElementById("fielname").innerHTML=msg.filename;
							document.getElementById("filesize").innerHTML=msg.size;
							document.getElementById("filedate").innerHTML=msg.date;
							document.getElementById("filepath").innerHTML=msg.path;
						}
							
						else alert("数据库备份失败");
						//取消进度条
						document.getElementById("progress").innerHTML="";
					}					
				}
			}
			xhr.open("post",url,true);//方式、请求url，是否异
			xhr.send(null);
};
//下载数据库文件
function downloadDB(){
	window.location.href="../DownDB";
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
<body onload="getbackup()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">

<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<div align="center">
		<TABLE cellSpacing=0 cellPadding=0 width="90%" >
			<TR height=100>
				<TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px" >
					<div id="nowtime" align="center" ><img src="2.gif"/></div>	
				</TD>
			</TR>
		</TABLE>
		<TABLE  class='gridtable'>
			<TR align="CENTER">
		    <Th colspan="4">数据库备份信息</Th>
		  </TR>
		  <TR>
		    <TD>备份文件名</TD> <TD>文件大小</TD><TD>备份日期</TD><TD>存储路径<br/><br/></TD>
		  </TR>
		  <TR>
		    <TD id="fielname">dqwr.bak</TD> <TD id="filesize">文件大小</TD><TD id="filedate">备份日期</TD><TD id="filepath">存储路径</TD>
		  </TR>
		</TABLE>
		<center>
			<div id="progress"></div><br/><br/>
			<img src="../images/bfsj.gif" onclick="backupyesno()" >
			<img src="../images/xzbf.gif" onclick="downloadDB()" >
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