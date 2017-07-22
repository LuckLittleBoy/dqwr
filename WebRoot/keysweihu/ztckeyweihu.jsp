<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
  <title>主题词维护</title>
  <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script> 
  <script src="../js/jquery.hashchange.min.js" type="text/javascript"></script>
  <script src="lib/jquery.easytabs.min.js" type="text/javascript"></script>

 <style>
   .etabs { margin: 0; padding: 0; }
   .tab { display: inline-block; zoom:1; *display:inline; background: #eee; border: solid 1px #999; border-bottom: none; -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; }
   .tab a { font-size: 14px; line-height: 2em; display: block; padding: 0 10px; outline: none; text-decoration:none; }
   .tab a:hover { text-decoration: underline; }
   .tab.active { background: #fff; padding-top: 6px; position: relative; top: 1px; border-color: #666; }
   .tab a.active { font-weight: bold; }
   .tab-container .panel-container { background: #fff; border: solid #666 1px; padding: 10px; -moz-border-radius: 0 4px 4px 4px; -webkit-border-radius: 0 4px 4px 4px; }
   .panel-container { margin-bottom: 10px; }
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
<script type="text/javascript">
    $(document).ready( function() {
      $('#tab-container').easytabs();
    });
</script>
<script type="text/javascript">
allkeys={};
function getmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetZTCWord";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var keys =eval('('+requestmsg+')');
				if(keys.keys=="fail"){
					showmsgDiv("数据获取失败");
				}else{
					allkeys=keys;
					//开始插入页面数据
					var msgstr="<table width='80%' class='gridtable'>"+
					"<TR align='CENTER'><Th colspan='3'>所有主题词</Th></TR>"+
					"<tr ><td >编号</td><td >主题词名称</td><td >操作</td>";
						for(var i=0;i<10;i++){
							if(allkeys.keys[i]==null)break;
							msgstr+="<tr >"+
							"<td style='padding: 8px;'>"+allkeys.keys[i].id+"</td>"+							
							"<td style='padding: 2px;'><input type='text' id='"+allkeys.keys[i].id+"mc' value='"+allkeys.keys[i].keys+"'/></td>"+
							"<td style='padding: 2px;'><button class='btn btn-signup' onclick=alterztc('"+allkeys.keys[i].id+"') >修改</button></td>"+
							"</tr>";

						}		
						msgstr+="</table>";
						//alert(msgstr);
						document.getElementById("logmsg").innerHTML=msgstr;	
						document.getElementById("alldata").innerHTML=allkeys.keys.length;	
						document.getElementById("currentPage").innerHTML=currentPage;	
						document.getElementById("recorderPage").innerHTML=10;	
						document.getElementById("pages").innerHTML=Math.ceil(allkeys.keys.length/10);	
						if(document.getElementById("currentPage").innerHTML=="1")document.getElementById("pre").disabled =true;
						else document.getElementById("pre").disabled =false;
						if(document.getElementById("pages").innerHTML==document.getElementById("currentPage").innerHTML)document.getElementById("next").disabled =true;
						else document.getElementById("next").disabled =false;
					
					
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
currentPage=1;
function changemsg(zimu){
	var msg="<table  width='80%'  class='gridtable'>"+
	"<tr><th>编号</th><th>主题词名称</th><th>操作</th></tr>";
	if(zimu=="all"){
		currentPage=1;
		//开始插入页面数据
		var msgstr="<table width='80%' class='gridtable'>"+
		"<TR align='CENTER'><Th colspan='3'>所有主题词</Th></TR>"+
		"<tr><td >编号</td><td >主题词名称</td><td >操作</td>";
			for(var i=0;i<10;i++){
				if(allkeys.keys[i]==null)break;
				msgstr+="<tr>"+
				"<td style='padding: 8px;'>"+allkeys.keys[i].id+"</td>"+							
				"<td style='padding: 2px;'><input type='text' id='"+allkeys.keys[i].id+"mc' value='"+allkeys.keys[i].keys+"'/></td>"+
				"<td style='padding: 2px;'><button class='btn btn-signup' onclick=alterztc('"+allkeys.keys[i].id+"') >修改</button></td>"+
			"</tr>";

			}		
			msgstr+="</table>";
			//alert(msgstr);
			document.getElementById("logmsg").innerHTML=msgstr;	
			document.getElementById("alldata").innerHTML=allkeys.keys.length;	
			document.getElementById("currentPage").innerHTML=currentPage;	
			document.getElementById("recorderPage").innerHTML=10;	
			document.getElementById("pages").innerHTML=Math.ceil(allkeys.keys.length/10);	
			if(document.getElementById("currentPage").innerHTML=="1")document.getElementById("pre").disabled =true;
			else document.getElementById("pre").disabled =false;
			if(document.getElementById("pages").innerHTML==document.getElementById("currentPage").innerHTML)document.getElementById("next").disabled =true;
			else document.getElementById("next").disabled =false;
			return;
	}
	for(var i=0;i<allkeys.keys.length;i++){
		if(allkeys.keys[i].zimu==zimu.toLowerCase()){
			msg+="<tr>"+
			"<td style='padding: 2px;'>"+allkeys.keys[i].id+"</td>"+							
			"<td style='padding: 2px;'><input type='text' id='"+allkeys.keys[i].id+"mc' value='"+allkeys.keys[i].keys+"'/></td>"+
			"<td style='padding: 2px;'><button class='btn btn-signup' onclick=alterztc('"+allkeys.keys[i].id+"') >修改</button></td>"+
		"</tr>";
		}	
	}
	msg+="</table>";
	var id=zimu+'table';
	document.getElementById(id).innerHTML=msg;
}
function getDBMsgPage(p){
	currentPage=currentPage+p;
	var msgstr="<table width='80%' class='gridtable'>"+
	"<TR align='CENTER'><Th colspan='3'>所有主题词</Th></TR>"+
	"<tr><td >编号</td><td >主题词名称</td><td >操作</td>";
		for(var i=(currentPage-1)*10;i<currentPage*10;i++){
			if(allkeys.keys[i]==null)break;
			msgstr+="<tr>"+
			"<td style='padding: 2px;'>"+allkeys.keys[i].id+"</td>"+							
			"<td style='padding: 2px;'><input type='text' id='"+allkeys.keys[i].id+"mc' value='"+allkeys.keys[i].keys+"'/></td>"+
			"<td style='padding: 2px;'><button class='btn btn-signup' onclick=alterztc('"+allkeys.keys[i].id+"') >修改</button></td>"+
		"</tr>";

		}		
		msgstr+="</table>";
		//alert(msgstr);
		document.getElementById("logmsg").innerHTML=msgstr;	
		document.getElementById("alldata").innerHTML=allkeys.keys.length;	
		document.getElementById("currentPage").innerHTML=currentPage;	
		document.getElementById("recorderPage").innerHTML=10;	
		document.getElementById("pages").innerHTML=Math.ceil(allkeys.keys.length/10);	
		if(document.getElementById("currentPage").innerHTML=="1")document.getElementById("pre").disabled =true;
		else document.getElementById("pre").disabled =false;
		if(document.getElementById("pages").innerHTML==document.getElementById("currentPage").innerHTML)document.getElementById("next").disabled =true;
		else document.getElementById("next").disabled =false;
}

function alterztc(id){
	//id=id.replace(/-/g, " ");//不能含有空格
	var altermc=id+"mc";

	var requestmsg;
	var xhr=getxmlhttp();
	var altermc=document.getElementById(altermc).value;
	if(altermc==""){
		showmsgDiv("数据不能为空");
		return;
	}
	//alert("sss"+altersxfwid+ altersxfwjc+ altersxfwmc+altersxfwmc);
	//准备连接
	var url="../UpdateZTCword";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.update=="success"){
					showmsgDiv("数据修改成功");
				}else{
					showmsgDiv("<font color=red>数据修改失败</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id+"&altermc="+altermc);
}


//显示增加表格
function showaddkey(){
	if(document.getElementById("newkey").innerHTML==""){
	document.getElementById("newkey").innerHTML="<table class='gridtable'>"+
	"	<tr>"+
		"<th>主题词名称</th><th>操作</th>"+
		"</tr>"+
		"<tr>"+
		"<td><input id='addkeymc' type='text' value=''/></td>"+
		"<td><button class='btn btn-buynow'  onclick='addkey()'>确定</button></td>"+
		"</tr></table>";
	}else{
		document.getElementById("newkey").innerHTML="";
	}
	  
}
//信息框的输出
function showmsgDiv(s){
	var msgObj=document.getElementById("msgDiv");
	  var pos=0;
	  if(document.documentElement.scrollTop==0&&document.getElementsByTagName("body")[0].scrollTop==0){
		  pos=0;
	  }
	  else if(document.documentElement.scrollTop!=0)pos=document.documentElement.scrollTop;
	  else pos=document.getElementsByTagName("body")[0].scrollTop;
	  msgObj.style.marginTop = 200+ pos+ "px";
	  document.getElementById("msgDiv").style.display="block";
	document.getElementById("msgDiv").innerHTML="<br>"+s;
	msgDivcount();
}
var myCount = 20;
function msgDivcount() { 
    myCount--;
    if (myCount == 0) {
        document.getElementById("msgDiv").style.display="none";
        myCount = 20;
        clearInterval(timea);
        return;
    }
    document.getElementById("msgDiv").style.opacity=(0.9-(20-myCount)/30);
    var timea=setTimeout("msgDivcount()", 100);
 }
//增加实行范围
function addkey(){
	var requestmsg;
	var xhr=getxmlhttp();
	var addkeymc=document.getElementById("addkeymc").value;
	 if(!(/[\u4e00-\u9fa5]+/).test(addkeymc.charAt(0))){ 
		  alert("主题词首字必须是汉字。");
		  return;
	  }
	if(addkeymc==""){
		showmsgDiv("数据不能为空");
		return;
	}
	//准备连接
	var url="../AddZTCWord";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.add=="success"){
					showmsgDiv("数据增加成功");
				}else{
					showmsgDiv("<font color=red>数据增加失败</font>");
				}
				//	alert(querys.querys[0].content);	
				
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("addkeymc="+addkeymc);
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
function refresh(){
	window.location="ztckeyweihu.jsp";
	
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

</head>
<body onload="getmsg() " leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div  align="center" style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<div align="center">
	<button class="btn btn-buynow"  onclick="showaddkey()">新增</button>
	<button class="btn btn-buyre"  onclick="refresh()">刷新</button>
	<br/>
	<div id="newkey"></div>
	<br/>
	<font color="blue" size='-1'>申明：增加删除修改后，页面数据不会发生改变，请点击刷新重新获取数据</font>
</div>

<div id="tab-container" class='tab-container' style="width:98%">

 <ul class='etabs' style="text-align: center;">
 <li class='tab' ><a href="#all" onclick="changemsg('all')" >all</a></li>
   <li class='tab' ><a href="#A" onclick="changemsg('A')" >A</a></li>
   <li class='tab' ><a href="#B" onclick="changemsg('B')" >B</a></li>
   <li class='tab' ><a href="#C" onclick="changemsg('C')" >C</a></li>
   <li class='tab' ><a href="#D" onclick="changemsg('D')" >D</a></li>
   <li class='tab' ><a href="#E" onclick="changemsg('E')" >E</a></li>
   <li class='tab' ><a href="#F" onclick="changemsg('F')" >F</a></li>
   <li class='tab' ><a href="#G" onclick="changemsg('G')" >G</a></li>
   <li class='tab' ><a href="#H" onclick="changemsg('H')" >H</a></li>
   <li class='tab' ><a href="#J" onclick="changemsg('J')" >J</a></li>
   <li class='tab' ><a href="#K" onclick="changemsg('K')" >K</a></li>
   <li class='tab' ><a href="#L" onclick="changemsg('L')" >L</a></li>
   <li class='tab' ><a href="#M" onclick="changemsg('M')" >M</a></li>
   <li class='tab' ><a href="#N" onclick="changemsg('N')" >N</a></li>
   <li class='tab' ><a href="#O" onclick="changemsg('O')" >O</a></li>
   <li class='tab' ><a href="#P" onclick="changemsg('P')" >P</a></li>
   <li class='tab' ><a href="#Q" onclick="changemsg('Q')" >Q</a></li>
   <li class='tab' ><a href="#R" onclick="changemsg('R')" >R</a></li>
   <li class='tab' ><a href="#S" onclick="changemsg('S')" >S</a></li>
   <li class='tab' ><a href="#T" onclick="changemsg('T')" >T</a></li>
   <li class='tab' ><a href="#W" onclick="changemsg('W')" >W</a></li>
   <li class='tab' ><a href="#X" onclick="changemsg('X')" >X</a></li>
   <li class='tab' ><a href="#Y" onclick="changemsg('Y')" >Y</a></li>
   <li class='tab' ><a href="#Z" onclick="changemsg('Z')" >Z</a></li>
   
 </ul>
<div class='panel-container'>
<div id="all" align="center">
	 <div id='logmsg'>
	<TABLE  width="80%" class='gridtable' align="center" >
		<TR align="CENTER">
		   <Th colspan="3">所有主题词</Th>
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

</div>
    <div id="alltable"></div>		
  </div>
  <div id="A" align="center">
   	<h2>主题词维护A</h2>
    <div id="Atable"></div>		
  </div>
    <div id="B" align="center">
   	<h2>主题词维护B</h2>
    <div id="Btable"></div>		
  </div>
    <div id="C" align="center">
   	<h2>主题词维护C</h2>
    <div id="Ctable"></div>		
  </div>
    <div id="D" align="center">
   	<h2>主题词维护D</h2>
    <div id="Dtable"></div>		
  </div>
    <div id="E" align="center">
   	<h2>主题词维护E</h2>
    <div id="Etable"></div>		
  </div>
    <div id="F" align="center">
   	<h2>主题词维护F</h2>
    <div id="Ftable"></div>		
  </div>
    <div id="G" align="center">
   	<h2>主题词维护G</h2>
    <div id="Gtable"></div>		
  </div>
    <div id="H" align="center">
   	<h2>主题词维护H</h2>
    <div id="Htable"></div>		
  </div>
    <div id="J" align="center">
   	<h2>主题词维护J</h2>
    <div id="Jtable"></div>		
  </div>
    <div id="K" align="center">
   	<h2>主题词维护K</h2>
    <div id="Ktable"></div>		
  </div>
    <div id="L" align="center">
   	<h2>主题词维护L</h2>
	<div id="newL"></div>
    <div id="Ltable"></div>		
  </div>
    <div id="M" align="center">
   	<h2>主题词维护M</h2>
	<div id="newM"></div>
    <div id="Mtable"></div>		
  </div>
    <div id="N" align="center">
   	<h2>主题词维护N</h2>
    <div id="Ntable"></div>		
  </div>
  <div id="O" align="center">
   	<h2>主题词维护O</h2>
    <div id="Otable"></div>		
  </div>
    <div id="P" align="center">
   	<h2>主题词维护P</h2>
    <div id="Ptable"></div>		
  </div>
    <div id="Q" align="center">
   	<h2>主题词维护Q</h2>
    <div id="Qtable"></div>		
  </div>
    <div id="R" align="center">
   	<h2>主题词维护R</h2>
    <div id="Rtable"></div>		
  </div>
    <div id="S" align="center">
   	<h2>主题词维护S</h2>	
    <div id="Stable"></div>		
  </div>
    <div id="T" align="center">
   	<h2>主题词维护T</h2>
    <div id="Ttable"></div>		
  </div>
    <div id="W" align="center">
   	<h2>主题词维护W</h2>
    <div id="Wtable"></div>		
  </div>
    <div id="X" align="center">
   	<h2>主题词维护X</h2>
    <div id="Xtable"></div>		
  </div>
    <div id="Y" align="center">
   	<h2>主题词维护Y</h2>
    <div id="Ytable"></div>		
  </div>
    <div id="Z" align="center">
   	<h2>主题词维护Z</h2>
    <div id="Ztable"></div>		
  </div>
</div>
</div>
</div>
</body>
</html>
