<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文档查重</title>

<script src="../js/jquery.min.js"></script> 
<SCRIPT type=text/javascript>	

function getMsg(){	
		var requestmsg;
		var xhr=getxmlhttp();
		//准备连接
		var url="../CheckRepeat";
		//处理含有中文的url
		url=encodeURI(url); 
		url=encodeURI(url);
		//无法获取%的处理
		var str_query=document.getElementById("str_many_query").value.replace(/%/g,"百分点").replace(/&/g,"和").replace(/[/g," ").replace(/]/g," ");
		if(str_query==""||str_query==null){
			alert("请输入内容");
			return ;
		}
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText.replace(/百分点/g,"%");
					//alert(requestmsg);
					result=eval('('+requestmsg+')');
					
					//alert(result.result.length);				
					document.getElementById("aritileTitle").innerHTML="";
					document.getElementById("tablemag").innerHTML="<hr/><center>你的内容<center><br/>";
					for(var i=0;i<result.result.length;i++){
						document.getElementById("tablemag").innerHTML+=result.result[i].newStr+"<br/>";
					}
					var count=0;
					for(var i=0;i<result.result.length;i++){
						if(result.result[i].isRepeat13){
							document.getElementById("aritileTitle").innerHTML+="&nbsp;&nbsp;第"+(i+1)+"段：&nbsp;内容出自:"+result.result[i].title+"&nbsp;&nbsp;类型:"+result.result[i].type+"&nbsp;&nbsp;时间:"+result.result[i].date+"<br/>";
							count++;
						}
					}	
					if(count!==0){
						document.getElementById("aritileTitle").innerHTML="&nbsp;&nbsp;相似政策列表为：<br/>"+document.getElementById("aritileTitle").innerHTML;
						alert("提示：检测到相似政策"+count+"段");
					}
					else{
						alert("提示：没有检测相似政策");
					}
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("str_query="+str_query);
		
	
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
	
	
</SCRIPT>
<link href="../css/search.css" rel="stylesheet" type="text/css" />
</head>
<body style="background:#B1D8EA;">

<div style="background-color: #ffffff;">
<div  >
	<fieldset class="fieldset_style"  >
		<font color="#FF0000" size="3px">复制您要比对的政策：</font><br/>
		<br/><br/>
		<div style="margin-left:80px;">
		<textarea id="str_many_query" style="resize:none;color:#0099FF;width:540px; height: 220px; font-size: 20px" ></textarea>
		<br/><img src="../images/config.gif"  style="vertical-align: bottom; margin:10px 0px 5px 220px; " onclick="getMsg()" /><br/>
		 
		<br/><br/>
		</div>
		<br/>
	</fieldset>	
</div>	

<div>
<fieldset id="fieldset_style" class="fieldset_style">
	
	<div id="comments"></div>
	<fieldset id="fieldset_style_inner">
	<!-- **********显示信息********** -->
	<div id="aritileTitle"  style="magin:30px; padding: 20px; line-height: 25px" >
	</div>
	<div id="tablemag"  style="magin:30px; padding: 20px; line-height: 25px" >
		<font color="0099FF" size="3px">
		据此你可确定政策的是否存在重复<br/><br/>
		</font>
	</div>
	</fieldset>
	<br/>
</fieldset>
</div>
</div>
</body>
</html>