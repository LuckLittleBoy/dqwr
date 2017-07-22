<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关键词频度统计</title>
<script src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="dowithUrl.js"></script>
<script type="text/javascript">
allwords=[];
oldselectedid="";
newselectedid="";
function getwordcount(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetWordCount2";
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
	xhr.send("str_query="+dowithURL(document.getElementById("msg").value) );
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
<body>
	<fieldset class="fieldset_style"  >
		<div align="center">
			<textarea rows="30" cols="90" id="msg"></textarea><br/>
			<button onclick="getwordcount()">提交信息</button>
		</div>
		
	</fieldset>	
</body>
</html>