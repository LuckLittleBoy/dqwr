<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/dowithUrl.js"></script>
<title>政策比对</title>
<style type="text/css">
.juzi{background-color: #FFFFFF;white-space:normal; }
.juzi:hover{background-color: #EF411A;white-space:normal; }
div{  
word-wrap: break-word;  
word-break: normal;  
} 
</style>
<script src="../js/jquery.min.js"></script> 
<script type="text/javascript">
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
function showmsg(){
	var str=document.getElementById("ystr").value;
	var arrays=str.split("。");
	for(var i=0;i<arrays.length;i++){
		var reg=new RegExp(arrays[i],"g"); 
		if(arrays[i]!="")
		str=str.replace(reg,"<font onmouseover='searchmsg2("+i+")'  >"+arrays[i]+"</font>");
	}
	document.getElementById("showmsg").innerHTML=str;
	
	var str=document.getElementById("ystr2").value;
	var arrays=str.split("。");
	for(var i=0;i<arrays.length;i++){
		var reg=new RegExp(arrays[i],"g"); 
		if(arrays[i]!="")
		str=str.replace(reg,"<font onmouseover='searchmsg2("+i+")' >"+arrays[i]+"</font>");
	}
	document.getElementById("showmsg2").innerHTML=str;
	
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../WrterIntoIndex";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				alert(requestmsg);
				
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("msg="+document.getElementById("ystr2").value);
}
function searchmsg2(id){
	//alert(id);
	var str=document.getElementById("ystr").value;
	var requestmsg;
	var xhr=getxmlhttp();
	var url="../Comp";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				var str=document.getElementById("ystr2").value;
				var reg=new RegExp(requestmsg,"g"); 
				str=str.replace(reg,"<font color='red' >"+requestmsg+"</font>");
				document.getElementById("showmsg2").innerHTML=str;
			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("msg="+dowithURL(str.split("。")[id]));
	
}
</script>

</head>
<body>
<table width="100%">
<tr><td><textarea rows="10" cols="80" id="ystr"></textarea></td><td><textarea rows="10" cols="80" id="ystr2"></textarea></td></tr>
<tr><td><div id="showmsg" > </div></td><td><div id="showmsg2" > </div></td></tr>
</table>
<button onclick='showmsg()'>确定</button>


</body>
</html>