<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/Calendar.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">

function getDBMsg(){
	var xhr=getxmlhttp();
	var url="../GetLog";
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var status=eval('('+requestmsg+')'); 
			//inform=status;
				if(status.Log=="fail")
				{				
					alert("数据加载失败");
				}
				else{
					//开始插入页面数据
					var msgstr="<table width='80%' class='gridtable'>"+
					"<TR align='CENTER'><Th colspan='5'>日志记录</Th></TR>"+
					"<tr><td >序号</td><td >类型</td><td >时间</td><td >用户</td><td >事件</td></tr>";
						for(var i in status.Log){						
							msgstr+="<tr><td >"+status.Log[i].id+"</td><td >"+status.Log[i].type+"</td><td >"+status.Log[i].tdate+"</td><td >"+status.Log[i].user+"</td><td >"+status.Log[i].thing+"</td></tr>";
						}		
						msgstr+="</table>";
						//alert(msgstr);
						document.getElementById("logmsg").innerHTML=msgstr;	
						document.getElementById("alldata").innerHTML=status.alldata;	
						document.getElementById("currentPage").innerHTML=status.currentPage;	
						document.getElementById("recorderPage").innerHTML=status.recorderPage;	
						document.getElementById("pages").innerHTML=status.pages;	
						if(status.currentPage=="1")document.getElementById("pre").disabled =true;
						else document.getElementById("pre").disabled =false;
						if(status.currentPage==status.pages)document.getElementById("next").disabled =true;
						else document.getElementById("next").disabled =false;
				}		
				
			}
		}
	}
	xhr.open("post",url,false);//方式、请求url，是否异
	xhr.send(null);
}
function getINITMsg(){
	var xhr=getxmlhttp();
	var url="../GetLogINITMsg";
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var status=eval('('+requestmsg+')'); 
				if(status.loginit=="fail")
				{				
					alert("数据加载失败");
				}
				else{
					var msg=""+
					"<option value='all'>全部</option>"+
					"<optgroup label='请选择用户'>";
					for(var i in status.loginit){
						msg+="<option value='"+status.loginit[i].yhid+"'>"+status.loginit[i].yhid+"</option>";
					}
					msg+="</optgroup>";
					document.getElementById("userid").innerHTML=msg;
					
					var msg="<option value='all'>全部</option>"+
					"<optgroup label='请选择类型'>";
					for(var i in status.type){
						msg+="<option value='"+status.type[i]+"'>"+status.type[i]+"</option>";
					}
					msg+="</optgroup>";
					document.getElementById("logtype").innerHTML=msg;
				}		
				
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
function getDBMsgPage(i){
	var xhr=getxmlhttp();
	var currentPage=document.getElementById("currentPage").innerHTML*1+i;
	var url="../GetLog?currentPage="+currentPage;
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var status=eval('('+requestmsg+')'); 
			//inform=status;
				if(status.Log=="fail")
				{				
					alert("数据加载失败");
				}
				else{
					//开始插入页面数据
					var msgstr="<table width='80%' class='gridtable'>"+
					"<TR align='CENTER'><Th colspan='5'>日志记录</Th></TR>"+
					"<tr><td >序号</td><td >类型</td><td >时间</td><td >用户</td><td >事件</td></tr>";
						for(var i in status.Log){						
							msgstr+="<tr><td >"+status.Log[i].id+"</td><td >"+status.Log[i].type+"</td><td >"+status.Log[i].tdate+"</td><td >"+status.Log[i].user+"</td><td >"+status.Log[i].thing+"</td></tr>";
						}		
						msgstr+="</table>";
						//alert(msgstr);
						document.getElementById("logmsg").innerHTML=msgstr;	
						document.getElementById("alldata").innerHTML=status.alldata;	
						document.getElementById("currentPage").innerHTML=status.currentPage;	
						document.getElementById("recorderPage").innerHTML=status.recorderPage;	
						document.getElementById("pages").innerHTML=status.pages;	
						if(status.currentPage=="1")document.getElementById("pre").disabled =true;
						else document.getElementById("pre").disabled =false;
						if(status.currentPage==status.pages)document.getElementById("next").disabled =true;
						else document.getElementById("next").disabled =false;
				}		
				
			}
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.send(null);
}
function downloadlog(){
	window.location.href="../DownLogTxt";
}
function clearLog(){
	if(confirm("清除日志将清空所有日志信息，无法恢复，清除前请先下载日志文件！你确定要清除吗？")){
		var xhr=getxmlhttp();
		var url="../ClaerLog";
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				if(xhr.status==200||xhr.status==304)
				{
					requestmsg=xhr.responseText;
					var status=eval('('+requestmsg+')'); 
					if(status.Log=="fail")
					{				
						alert("日志清理失败");
					}
					else{
						alert("日志已经清理完成");
					}		
					
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异
		
		xhr.send(null);
	}
}
function seachlogmsg(){
	var startT=document.getElementById("startT").value;
	var userid=document.getElementById("userid").value;
	var logtype=document.getElementById("logtype").value;
	var endT=document.getElementById("endT").value;
	if(startT!=""&&endT!=""&&startT>endT){
		alert("开始日期不允许大于结束日期");
		return;
	}
	var xhr=getxmlhttp();

	var url="../GetLog";
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{
				requestmsg=xhr.responseText;
				var status=eval('('+requestmsg+')'); 
				if(status.Log=="fail")
				{				
					alert("数据加载失败");
				}
				else{
					//开始插入页面数据
					var msgstr="<table width='80%' class='gridtable'>"+
					"<TR align='CENTER'><Th colspan='5'>日志记录</Th></TR>"+
					"<tr><td >序号</td><td >类型</td><td >时间</td><td >用户</td><td >事件</td></tr>";
						for(var i in status.Log){						
							msgstr+="<tr><td >"+status.Log[i].id+"</td><td >"+status.Log[i].type+"</td><td >"+status.Log[i].tdate+"</td><td >"+status.Log[i].user+"</td><td >"+status.Log[i].thing+"</td></tr>";
						}		
						msgstr+="</table>";
						//alert(msgstr);
						document.getElementById("logmsg").innerHTML=msgstr;	
						document.getElementById("alldata").innerHTML=status.alldata;	
						document.getElementById("currentPage").innerHTML=status.currentPage;	
						document.getElementById("recorderPage").innerHTML=status.recorderPage;	
						document.getElementById("pages").innerHTML=status.pages;	
						if(status.currentPage=="1")document.getElementById("pre").disabled =true;
						else document.getElementById("pre").disabled =false;
						if(status.currentPage==status.pages)document.getElementById("next").disabled =true;
						else document.getElementById("next").disabled =false;
				}		
				
			}
		}
	}
	xhr.open("post",url,true);//方式、请求url，是否异
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("endT="+endT+"&startT="+startT+"&userid="+userid+"&logtype="+logtype);
}
</script>
<body onload="getDBMsg();getINITMsg();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">

<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<br/>
<div align="center">
<TABLE cellSpacing=0 cellPadding=0 width="100%"  >
	<TR >
		<TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px" >
		<div id="nowtime" align="center" ><img src="2.gif"/></div>
		</TD>
	</TR>
</TABLE>	
<br>
<div >
	<font size="3px"><b>日志检索 :  </b></font>
	<select id="userid" ></select>
	<select id="logtype" ></select>
	 <input  id="startT" type="text" onclick="new Calendar().show(this);"  readonly="readonly">
	-<input  id="endT" type="text" onclick="new Calendar().show(this);" readonly="readonly">
	<img alt="搜索" height="24px" style="vertical-align: middle;" onclick="seachlogmsg()" src="../images/sosuo.gif">
</div>
<br>
<div id='logmsg'>
	<TABLE  width="80%" class='gridtable' align="center" >
		<TR align="CENTER">
		   <Th colspan="4">日志记录</Th>
		 </TR>
		 <TR>
		   <TD >无</TD>
		 </TR>	  
	</TABLE>
</div>
<div align="center">
	<TABLE  width="80%" class='gridtable' align="center" >
		<TR align="CENTER">
			<Th >总条数：</Th>
		   <Th id='alldata'></Th>
		   <Th >每页记录数：</Th>
		   <Th id='recorderPage'></Th>
		   <Th >
		   	<button id='pre' onclick="getDBMsgPage(-1)">上一页</button>
		   	<button id='next' onclick="getDBMsgPage(1)">下一页</button>
		   
		   </Th>
		   <Th >当前页：</Th>
		   <Th id='currentPage'></Th>
		   
		   <Th >总页数：</Th>
		   <Th id='pages'></Th>
		 </TR>	
		 
	</TABLE>
	<br/><br/>
	<img src="../images/xzrz.gif" onclick="downloadlog()" >
	<img src="../images/qcrz.gif" onclick="clearLog()" >
  	<br/><br/><br/><br/>
		   
	

</div>
	
</div>
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
 </BODY>
</HTML>