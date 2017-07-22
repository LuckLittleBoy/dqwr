<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加内容</title>
<script type="text/javascript">
function getmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	var id=document.getElementById("id").value;
	var title=document.getElementById("title").value.replace(/%/g,"百分点");
	var content=document.getElementById("content").value.replace(/%/g,"百分点");
	var type=document.getElementById("type").value.replace(/%/g,"百分点");
	if(id==""||title==""|| content==""|| type==""){
		alert("不能为空");return;
	}
	//准备连接
	var url="../AddTest";
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
	xhr.send("content="+content+"&title="+title+"&id="+id+"&type="+type);

	

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
<link href="../css/search.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="manySearch" >
	<fieldset class="fieldset_style"  >
		<font color="#FF0000" size="2px">输入您要添加的文章：</font><br/><br/>
		编号：<input type="text" id="id" name="id" /><br/><br/>
		标题：<input type="text" id="title" name="title" /><br/><br/>
		类别：<select id="type">
			<option>国家律法 </option>
			<option>行政法规</option>
			<option>地方性法规</option>
			<option>国务院部门规章</option>
			
		</select><br/><br/>
		文档内容：<br/><textarea rows="30" cols="60" id="content" name="content"></textarea>
		<input type="button" value="确认添加" onclick="getmsg()" >
	</fieldset>	
</div>
</body>
</html>