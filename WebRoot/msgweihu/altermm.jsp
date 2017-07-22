<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

function alterusermm(){
	var requestmsg;
	var xhr=getxmlhttp();
	var oldmm=document.getElementById("oldmm").value;
	var remm=document.getElementById("remm").value;
	var newmm=document.getElementById("newmm").value;
	if(oldmm==""||remm==""||newmm==""){
		 alert('数据不能为空');
		 return;
	 }
	else if(remm!=newmm){
		 alert('新密码与确认密码不相同');
		 return;
	 }
	 else{
		 if(!/^\w+$/.test(newmm)){
			 alert("密码必须由数字、26个英文字母或者下划线组成!");
			 return;
		}
	 }
	//准备连接
	var url="../AlterMYMM";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				result=eval('('+requestmsg+')');
				if(result.update=="fail"){
					alert("用户密码修改失败");
				}
				else{			
					alert("用户密码成功");
				}
				
			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("oldmm="+oldmm+"&newmm="+newmm);
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
<head>
  <title>用户密码修改</title>
  <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script> 
  <script src="../js/jquery.hashchange.min.js" type="text/javascript"></script>
  <script src="lib/jquery.easytabs.min.js" type="text/javascript"></script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
<br/>
	<center>
	<h3>用户密码修改</h3>
		 <table class='gridtable'>   	  
			 <tr>  
			 	<td>原密码：</td>  <td><input type='text' id='oldmm' value=''/></td> 
			  </tr> 
			  <tr>  
			 	<td>新密码：</td>  <td><input type='text' id='newmm' value=''/></td>  
			 </tr>  
			 <tr>
			 	<td>确认密码：</td>  <td><input type='text' id='remm' value=''/></td>  
			 </tr>
			 <tr>
			 	<td colspan="2" align="center"><button onclick="alterusermm()" style="width: 60px;height: 30px;">确认</button></td>  
			 </tr>
		</table> 
	</center>
</div>
</body>
</html>
