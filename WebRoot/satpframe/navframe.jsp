<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北科技政策管理中心</title>
</head>
<style type="text/css">
body { font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif; }
	ul { margin:0; padding:0; list-style:none; }
	a { color:#fff;margin-left:5px;  text-decoration:none; }
	a:hover { color:#fff;text-decoration:underline; }
</style>
<script type="text/javascript">
function loginout(){
	var xhr=getxmlhttp();
	
	var url="../LoginOut";
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				
				
				
			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
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
<% YH user = (YH) session.getAttribute("user"); %>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="background-color: #1f8de4;height: 30px; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
	<div style="position: absolute;top: 2px;left: 5px" ><img width="25px" src="../images/left.png" onclick="history.go(-1)">&nbsp;<img width="25px" src="../images/right.png" onclick="history.go(+1)"></div>
	<div style="position: absolute;top: 5px;right: 20px" ><font color="ffffff">欢迎您：&nbsp;<%=user.getYHNC() %>|<a target="manFrame" href="../msgweihu/altermm.jsp">修改密码</a>|<a target="_top" onclick="loginout()" href="../login.html">退出</a></font></div>
</div>
</body>
</html>