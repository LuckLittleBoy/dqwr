<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
  <title>基本信息维护</title>
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
function getmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetSXFWMsg";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				
				var sxfw =eval('('+requestmsg+')');
				var msg="<table class='gridtable'>"+
					"	<tr>"+
						"<th>编号</th><th>地域名称</th><th>地域简称</th><th>地域拼音</th><th>操作</th>"+
						"</tr>";					
				for(var i=0;i<sxfw.sxfw.length;i++){
				//	var s=sxfw.sxfw[i].ssxfwid.replace(/ /g, "-");//不能含有空格
					msg+="<tr>"+
							"<td><input type='text' id='"+sxfw.sxfw[i].id+"id' value='"+sxfw.sxfw[i].ssxfwid+"' /></td>"+
							"<td><input type='text' id='"+sxfw.sxfw[i].id+"mc' value='"+sxfw.sxfw[i].ssxfwmc+"'/></td>"+
							"<td><input type='text' id='"+sxfw.sxfw[i].id+"jc' value='"+sxfw.sxfw[i].spyjc+"'/></td>"+
							"<td><input type='text' id='"+sxfw.sxfw[i].id+"qp' value='"+sxfw.sxfw[i].ssxfwqp+"'/></td>"+
							"<td><button class='btn btn-signup' onclick=altersxfw('"+sxfw.sxfw[i].id+"') >修改</button><button class='btn btn-login'  onclick='delsxfw("+sxfw.sxfw[i].id+")' >删除</button></td>"+
						"</tr>";
				}
				msg+="</table>";
				document.getElementById("sxfwtable").innerHTML=msg;
			
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}

//修改实行范围
function altersxfw(id){
	//id=id.replace(/-/g, " ");//不能含有空格
	var alterid=id+"id";
	var alterjc=id+"jc";
	var altermc=id+"mc";
	var alterqp=id+"qp";
	var requestmsg;
	var xhr=getxmlhttp();
	var altersxfwid=document.getElementById(alterid).value;
	var altersxfwjc=document.getElementById(alterjc).value;
	var altersxfwmc=document.getElementById(altermc).value;
	var altersxfwqp=document.getElementById(alterqp).value;
	if(altersxfwid==""||altersxfwjc==""|| altersxfwmc==""|| altersxfwmc==""){
		showmsgDiv("数据不能为空");
		return;
	}
	//alert("sss"+altersxfwid+ altersxfwjc+ altersxfwmc+altersxfwmc);
	//准备连接
	var url="../AlterSXFW";
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
					showmsgDiv("<font color=red>数据修改失败<br/>请查看是否存在相同编号数据</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id+"&altersxfwid="+altersxfwid+"&altersxfwjc="+altersxfwjc+"&altersxfwmc="+altersxfwmc+"&altersxfwqp="+altersxfwqp);
}
//删除实行范围
function delsxfw(id){
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../DelSXFW";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.del=="success"){
					showmsgDiv("数据删除成功");
				}else{
					showmsgDiv("<font color=red>数据删除失败</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id);
}

//显示增加实行范围表格
function showaddsxfw(){
	document.getElementById("newsxfw").innerHTML="<table class='gridtable'>"+
	"	<tr>"+
		"<th>编号</th><th>地域名称</th><th>地域简称</th><th>地域拼音</th><th>操作</th>"+
		"</tr>"+
		"<tr>"+
		"<td><input id='addsxfwid' type='text' value='' /></td>"+
		"<td><input type='text' id='addsxfwmc' value=''/></td>"+
		"<td><input type='text' id='addsxfwjc' value=''/></td>"+
		"<td><input id='addsxfwqp' type='text' value=''/></td>"+
		"<td><button class='btn btn-buynow'  onclick='addsxfw()'>确定</button></td>"+
		"</tr></table>";
	  
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
function addsxfw(){
	var requestmsg;
	var xhr=getxmlhttp();
	var addsxfwid=document.getElementById("addsxfwid").value;
	var addsxfwjc=document.getElementById("addsxfwjc").value;
	var addsxfwmc=document.getElementById("addsxfwmc").value;
	var addsxfwqp=document.getElementById("addsxfwqp").value;
	if(addsxfwid==""||addsxfwjc==""|| addsxfwmc==""|| addsxfwqp==""){
		showmsgDiv("数据不能为空");
		return;
	}
	//准备连接
	var url="../AddSXFW";
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
					showmsgDiv("<font color=red>数据增加失败,实行范围编号需唯一</font>");
				}
				//	alert(querys.querys[0].content);	
				
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("addsxfwid="+addsxfwid+"&addsxfwjc="+addsxfwjc+"&addsxfwmc="+addsxfwmc+"&addsxfwqp="+addsxfwqp);
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

<script type="text/javascript">
//2****************调整领域js文件
function gettzlymsg(){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetTZLY";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				
				var tzly =eval('('+requestmsg+')');
				var msg="<table class='gridtable'>"+
					"	<tr>"+
						"<th>编号</th><th>专题名称</th><th>全拼</th><th>简拼</th><th>备注</th>"+
						"</tr>";
			
				
				for(var i=0;i<tzly.tzly.length;i++){
				//	var s=tzly.tzly[i].stzlyid.replace(/ /g, "-");//不能含有空格
					msg+="<tr>"+
							"<td>"+tzly.tzly[i].id+"</td>"+
							"<td>"+tzly.tzly[i].TTZLYMC+"</td>"+
							"<td>"+tzly.tzly[i].TQP+"</td>"+
							"<td>"+tzly.tzly[i].TJC+"</td>"+
							"<td>"+tzly.tzly[i].TBZ+"</td>"+
						"</tr>";
				}
				msg+="</table>";
				document.getElementById("tzlytable").innerHTML=msg;
			
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
	
}
//显示增加调整领域表格
function showaddtzly(){
	document.getElementById("newtzly").innerHTML="<table class='gridtable'>"+
	"	<tr>"+
		"<th>专题名称</th><th>专题全拼</th><th>专题简拼</th><th>备注</th><th>操作</th>"+
		"</tr>"+
		"<tr>"+
		"<td><input type='text' id='addtzlymc' value=''/></td>"+
		"<td><input type='text' id='addtzlyqp' value=''/></td>"+
		"<td><input type='text' id='addtzlyjc' value=''/></td>"+
		"<td><input id='addtzlybz' type='text' value=''/></td>"+
		"<td><button class='btn btn-buynow'  onclick='addtzly()'>确定</button></td>"+
		"</tr></table>";
	  
}
//增加调整领域
function addtzly(){
	var requestmsg;
	var xhr=getxmlhttp();
	var addtzlyqp=document.getElementById("addtzlyqp").value;
	var addtzlyjc=document.getElementById("addtzlyjc").value;
	var addtzlymc=document.getElementById("addtzlymc").value;
	var addtzlybz=document.getElementById("addtzlybz").value;
	if(addtzlyjc==""|| addtzlymc==""|| addtzlyqp==""){
		showmsgDiv("除备注外数据不能为空");
		return;
	}
	//准备连接
	var url="../AddTZYL";
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
	xhr.send("addtzlybz="+addtzlybz+"&addtzlyjc="+addtzlyjc+"&addtzlymc="+addtzlymc+"&addtzlyqp="+addtzlyqp);
}
</script>

<script type="text/javascript">
//2****************调整领域js文件
function getzdjgmsg(){
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetZDJG";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				
				var zdjg =eval('('+requestmsg+')');
				var msg="<table class='gridtable'>"+
					"	<tr>"+
						"<th>编号</th><th>名称</th><th>全称</th><th>原称</th><th>简称(汉)</th><th>简称(音)</th><th>备注</th><th>操作</th>"+
						"</tr>";		
				for(var i=0;i<zdjg.zdjg.length;i++){
				//	var s=zdjg.zdjg[i].szdjgid.replace(/ /g, "-");//不能含有空格
				
					msg+="<tr>"+
							"<td width='3px'>"+zdjg.zdjg[i].ZID+"</td>"+
							"<td><input type='text' id='zdjg"+zdjg.zdjg[i].ZID+"mc'size='10px' value='"+zdjg.zdjg[i].ZDJGMC+"'/></td>"+
							"<td><input type='text' id='zdjg"+zdjg.zdjg[i].ZID+"qc' size='10px' value='"+zdjg.zdjg[i].ZDJGQC+"'/></td>"+
							"<td><input type='text' id='zdjg"+zdjg.zdjg[i].ZID+"ymc' size='10px'  value='"+zdjg.zdjg[i].ZDJGYMC+"'/></td>";					
							
							
							msg+="<td><input type='text' id='zdjg"+zdjg.zdjg[i].ZID+"jc' size='10px'  value='"+zdjg.zdjg[i].ZDJGJC+"'/></td>"+
							"<td><input type='text' id='zdjg"+zdjg.zdjg[i].ZID+"py'  size='10px' value='"+zdjg.zdjg[i].ZDJGPY+"'/></td>"+
							"<td><input id='zdjg"+zdjg.zdjg[i].ZID+"bz' type='text'  size='10px' value='"+zdjg.zdjg[i].ZBZ+"'/></td>"+
							"<td><button class='btn btn-signup' onclick=alterzdjg('"+zdjg.zdjg[i].ZID+"') >修改</button><button class='btn btn-login'  onclick='delzdjg("+zdjg.zdjg[i].ZID+")' >删除</button></td>"+						//"<td>"+zdjg.zdjg[i].ZSSBM+"</td>"+
						
						"</tr>";
				}
				msg+="</table>";
				document.getElementById("zdjgtable").innerHTML=msg;
			
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
	
}
//显示增加调整领域表格
function showaddzdjg(){
	document.getElementById("newzdjg").innerHTML="<table class='gridtable' width='100px'>"+
	"	<tr>"+
		"<th>名称</th><th>全称</th><th>原称</th><th>简称(汉)</th><th>简称(音)</th><th>备注</th><th>操作</th>"+
		"</tr>"+
		"<tr>"+
		"<td><input type='text' id='addzdjgmc'size='12px' value=''/></td>"+
		"<td><input type='text' id='addzdjgqc' size='12px' value=''/></td>"+
		"<td><input type='text' id='addzdjgymc' size='12px'  value=''/></td>"+
		"<td><input type='text' id='addzdjgjc' size='12px'  value=''/></td>"+
		"<td><input type='text' id='addzdjgpy'  size='12px' value=''/></td>"+
		"<td><input id='addzdjgbz' type='text'  size='12px' value=''/></td>"+
		"<td><button class='btn btn-buynow'  onclick='addzdjg()'>确定</button></td>"+
		"</tr></table>";
	  
}
//增加调整领域
function addzdjg(){
	var requestmsg;
	var xhr=getxmlhttp();
	var addzdjgmc=document.getElementById("addzdjgmc").value;
	var addzdjgqc=document.getElementById("addzdjgqc").value;
	var addzdjgymc=document.getElementById("addzdjgymc").value;
	//var addzdjgssbm=document.getElementById("addzdjgssbm").value;
	var addzdjgjc=document.getElementById("addzdjgjc").value;
	var addzdjgpy=document.getElementById("addzdjgpy").value;
	var addzdjgbz=document.getElementById("addzdjgbz").value;

	if(addzdjgmc==""|| addzdjgpy==""){
		showmsgDiv("名称和简称（音）不能为空");
		return;
	}
	//准备连接
	var url="../AddZDJG";
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
	xhr.send("addzdjgmc="+addzdjgmc+"&addzdjgqc="+addzdjgqc+"&addzdjgymc="+addzdjgymc+"&addzdjgjc="+addzdjgjc+"&addzdjgbz="+addzdjgbz+"&addzdjgpy="+addzdjgpy);
}
//修改制定机关
function alterzdjg(id){
	//id=id.replace(/-/g, " ");//不能含有空格
	var altermc="zdjg"+id+"mc";
	var alterqc="zdjg"+id+"qc";
	var alterymc="zdjg"+id+"ymc";
	//var alterssbm="zdjg"+id+"ssbm";
	var alterjc="zdjg"+id+"jc";	
	var alterpy="zdjg"+id+"py";
	var alterbz="zdjg"+id+"bz";
	var requestmsg;
	var xhr=getxmlhttp();
	var alterzdjgmc=document.getElementById(altermc).value;
	var alterzdjgqc=document.getElementById(alterqc).value;
	var alterzdjgymc=document.getElementById(alterymc).value;
	//var alterzdjgssbm=document.getElementById(alterssbm).value;
	var alterzdjgjc=document.getElementById(alterjc).value;
	var alterzdjgpy=document.getElementById(alterpy).value;
	var alterzdjgbz=document.getElementById(alterbz).value;

	if(alterzdjgmc==""||alterzdjgpy==""){
		showmsgDiv("名称和简称（音）不能为空");
		return;
	}
	//alert("sss"+altersxfwid+ altersxfwjc+ altersxfwmc+altersxfwmc);
	//准备连接
	var url="../AlterZDJG";
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
					showmsgDiv("<font color=red>数据修改失败<br/>请查看是否存在相同编号数据</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id+"&alterzdjgmc="+alterzdjgmc+"&alterzdjgqc="+alterzdjgqc+"&alterzdjgymc="+alterzdjgymc+"&alterzdjgjc="+alterzdjgjc+"&alterzdjgpy="+alterzdjgpy+"&alterzdjgbz="+alterzdjgbz );
}
//删除制定机关
function delzdjg(id){
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../DelZDJG";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.del=="success"){
					showmsgDiv("数据删除成功");
				}else{
					showmsgDiv("<font color=red>数据删除失败</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id);
}
</script>
<script type="text/javascript">
function getzclbmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetZCLBMsg";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				
				var zclb =eval('('+requestmsg+')');
				var msg="<table class='gridtable'>"+
					"	<tr>"+
						"<th>编号</th><th>类别名称</th><th>拼音全称</th><th>拼音简称</th><th>备注</th><th>操作</th>"+
						"</tr>";
			
				
				for(var i=0;i<zclb.zclb.length;i++){
				//	var s=zclb.zclb[i].szclbid.replace(/ /g, "-");//不能含有空格
					msg+="<tr>"+
							"<td>"+zclb.zclb[i].ZCFLID+"</td>"+
							"<td><input type='text' id='zclb"+zclb.zclb[i].ZCFLID+"mc' value='"+zclb.zclb[i].ZCFLMC+"'/></td>"+
							"<td><input type='text' id='zclb"+zclb.zclb[i].ZCFLID+"qp' value='"+zclb.zclb[i].ZQP+"'/></td>"+
							"<td><input type='text' id='zclb"+zclb.zclb[i].ZCFLID+"jc' value='"+zclb.zclb[i].ZJC+"'/></td>"+
							"<td><input type='text' id='zclb"+zclb.zclb[i].ZCFLID+"bz' value='"+zclb.zclb[i].ZBZ+"'/></td>"+
							"<td><button class='btn btn-signup' onclick=alterzclb('"+zclb.zclb[i].ZCFLID+"') >修改</button><button class='btn btn-login'  onclick='delzclb("+zclb.zclb[i].ZCFLID+")' >删除</button></td>"+
						"</tr>";
				}
				msg+="</table>";
				document.getElementById("zclbtable").innerHTML=msg;
			
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}

//修改实行范围
function alterzclb(id){
	//id=id.replace(/-/g, " ");//不能含有空格
	var altermc="zclb"+id+"mc";
	var alterqp="zclb"+id+"qp";
	var alterjc="zclb"+id+"jc";
	var alterbz="zclb"+id+"bz";
	var requestmsg;
	var xhr=getxmlhttp();
	var alterzclbmc=document.getElementById(altermc).value;
	var alterzclbjc=document.getElementById(alterjc).value;
	var alterzclbbz=document.getElementById(alterbz).value;
	var alterzclbqp=document.getElementById(alterqp).value;
	if(alterzclbjc==""|| alterzclbqp==""|| alterzclbmc==""){
		showmsgDiv("除备注外数据不能为空");
		return;
	}
	//alert("sss"+alterzclbid+ alterzclbjc+ alterzclbmc+alterzclbmc);
	//准备连接
	var url="../AlterZCLB";
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
					showmsgDiv("<font color=red>数据修改失败<br/>请查看是否存在相同编号数据</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id+"&alterzclbmc="+alterzclbmc+"&alterzclbqp="+alterzclbqp+"&alterzclbbz="+alterzclbbz+"&alterzclbjc="+alterzclbjc);
}
//删除实行范围
function delzclb(id){
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../DelZCLB";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.del=="success"){
					showmsgDiv("数据删除成功");
				}else{
					showmsgDiv("<font color=red>已存在此类别的政策，数据无法删除！</font>");
				}
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("id="+id);
}

//显示增加实行范围表格
function showaddzclb(){
	document.getElementById("newzclb").innerHTML="<table class='gridtable'>"+
	"	<tr>"+
		"<th>类别名称</th><th>拼音全称</th><th>拼音简称</th><th>备注</th><th>操作</th>"+
		"</tr>"+
		"<tr>"+
		"<td><input id='addzclbmc' type='text' value='' /></td>"+
		"<td><input type='text' id='addzclbqp' value=''/></td>"+
		"<td><input type='text' id='addzclbjc' value=''/></td>"+
		"<td><input id='addzclbbz' type='text' value=''/></td>"+
		"<td><button class='btn btn-buynow'  onclick='addzclb()'>确定</button></td>"+
		"</tr></table>";	  
}
function addzclb(){
	var requestmsg;
	var xhr=getxmlhttp();
	var addzclbmc=document.getElementById("addzclbmc").value;
	var addzclbqp=document.getElementById("addzclbqp").value;
	var addzclbjc=document.getElementById("addzclbjc").value;
	var addzclbbz=document.getElementById("addzclbbz").value;
	if(addzclbmc==""||addzclbqp==""|| addzclbjc==""){
		showmsgDiv("名称、全拼、简拼不能为空");
		return;
	}
	//准备连接
	var url="../AddZCLB";
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
					showmsgDiv("<font color=red>数据增加失败,实行范围编号需唯一</font>");
				}
				//	alert(querys.querys[0].content);	
				
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("addzclbmc="+addzclbmc+"&addzclbqp="+addzclbqp+"&addzclbjc="+addzclbjc+"&addzclbbz="+addzclbbz);
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
<body onload="getzclbmsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<br/>
<div id="tab-container" class='tab-container' style="margin-left: 10px;">

 <ul class='etabs' style="text-align: center;">
   <li class='tab' ><a href="#zclb" onclick="getzclbmsg()" >政策类别</a></li>
   <li class='tab'><a href="#sxfw" onclick="getmsg()">实行范围</a></li>
   <li class='tab'><a href="#tzly" onclick="gettzlymsg()">所属专题</a></li>
   <li class='tab'><a href="#zdjg" onclick='getzdjgmsg()'>制定机关</a></li>
 </ul>
 <div class='panel-container'>
  <div id="zclb" align="center">
   <h2>政策类别维护</h2>
	 <button class="btn btn-buynow"  onclick="showaddzclb()">新增</button>
	<br/>
	<div id="newzclb"></div>
	<br/>
    <div id="zclbtable"></div>
		
  </div>
   <div id="sxfw" align="center">
   <h2>实行范围维护 </h2>
    <button class="btn btn-buynow"  onclick="showaddsxfw()">新增</button>
	<br/>
	<div id="newsxfw"></div>
	<br/>
    <div id="sxfwtable"></div>
   	

  </div>
  <div id="tzly" align="center">
  	 <h2>所属专题维护</h2>
    <button class="btn btn-buynow"  onclick="showaddtzly()">新增</button>
	<br/>
	<div id="newtzly"></div>
	<br/>
    <div id="tzlytable"></div>

  </div>
  <div id="zdjg" align="center">
  	 <h2>制定机关维护</h2>
	 <button class="btn btn-buynow"  onclick="showaddzdjg()">新增</button>
	<br/>
	<div id="newzdjg"></div>
	<br/>
	<font color="blue">注：多个汉字简称请用英文';'来隔开</font>
    <div id="zdjgtable"></div>
  </div>
 
 </div>
</div>
</div>
</body>
</html>
