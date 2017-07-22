<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
  <title>关键字检索</title>
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

function seachkey(){	
	var keyseach=document.getElementById("keyseach").value;
	if(keyseach==""){
		alert("请输入检索关键字");return;
	}
	if(!(/[\u4e00-\u9fa5]+/).test(keyseach.charAt(0))){ 
		  alert("关键字首字必须是汉字。");
		  return;
	}
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../KeySeachStatus";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var keys =eval('('+requestmsg+')');
				if(keys.isztc=="fail"){
					alert("数据获取异常");
				}else{
					document.getElementById("keyseachstr").innerHTML="<font size='4px' color='blue'><b>"+keyseach+"</b></font>";
					if(keys.isztc){
						document.getElementById("isztc").innerHTML="<b>已存在</b>";
						document.getElementById("ztcdo").innerHTML="<b>主题词不允许删除</b>";
					}else {
						document.getElementById("isztc").innerHTML="<b>不存在</b>";
						document.getElementById("ztcdo").innerHTML="<img src='../images/jr.gif' onclick='addkey(1)'/>";
					}
					if(keys.wygjc){
						document.getElementById("iswygjc").innerHTML="<b>已存在</b>";
						document.getElementById("wygjcdo").innerHTML="<img src='../images/del.gif' onclick='delkey(2)'/>";
					}else {
						document.getElementById("iswygjc").innerHTML="<b>不存在</b>";
						document.getElementById("wygjcdo").innerHTML="<img src='../images/jr.gif' onclick='addkey(2)'/>";
					}
					if(keys.gjc){
						document.getElementById("isgjc").innerHTML="<b>已存在</b>";
						document.getElementById("gjcdo").innerHTML="<img src='../images/del.gif' onclick='delkey(3)'/>";
					}else{
						document.getElementById("isgjc").innerHTML="<b>不存在</b>";
						document.getElementById("gjcdo").innerHTML="<img src='../images/jr.gif' onclick='addkey(3)'/>";
					} 
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("keyseach="+keyseach);
}
function addkey(id){
	var requestmsg;
	var xhr=getxmlhttp();
	var keyseach=document.getElementById("keyseach").value;
	 if(!(/[\u4e00-\u9fa5]+/).test(keyseach.charAt(0))){ 
		  alert("关键词首字必须是汉字。");
		  return;
	  }
	//准备连接
	var url="";
	if(id==3)url="../AddKeysWord";
	else if(id==1)url="../AddZTCWord";
	else if(id==2)url="../AddNoKeysWord";
	
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				querys=eval('('+requestmsg+')');
				if(querys.add=="success"){
					alert("增加成功");
				}else{
					alert("<font color=red增加失败</font>");
				}
				seachkey();
				
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("addkeymc="+keyseach);
}
function delkey(id){
	var keyseach=document.getElementById("keyseach").value;
	if(confirm("你确定删除'"+keyseach+"'?")){
	
		var requestmsg;
		var xhr=getxmlhttp();
		var url="../DeleteSeachKey";
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
					//alert(requestmsg);
					querys=eval('('+requestmsg+')');
					if(querys.del=="success"){
						alert("数据删除成功");
					}else{
						alert("数据删除失败");
					}
					seachkey();
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("id="+id+"&name="+keyseach);
		
	}
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div  align="center" style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
	<div align="center">
	<br/><br/><br/><br/><br/>
		关键字检索:<input type="text" id="keyseach"><img alt="搜索" height="24px" style="vertical-align: middle;" onclick="seachkey()" src="../images/sosuo.gif">
		<br/><br/><br/>
		<table width="60%"  class='gridtable'>
			<tr>
				<td id='keyseachstr' align="center" colspan="3">请输入检索的关键字</td>
			</tr>
			<tr>
				<th >类型</th><th >是否存在</th><th >操作</th>
			</tr>
			<tr>
				<td><b>主题词</b></td>
				<td id='isztc'></td>
				<td id='ztcdo'>无</td>
			</tr>
			<tr>
				<td><b>关键词</b></td>
				<td  id='isgjc'></td>
				<td id='gjcdo'>无</td>
			</tr>
			<tr>
				<td><b>无用关键词</b></td>
				<td  id='iswygjc'></td>
				<td id='wygjcdo'>无</td>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>
