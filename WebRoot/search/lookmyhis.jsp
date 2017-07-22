<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看历史记录</title>
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
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
function getQueryMsg(str_query){
	var xhr=getxmlhttp();
	//准备连接
	var url="../IndexServlet";
	//处理含有中文的url
	url=encodeURI(url); 
	url=encodeURI(url);
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("str_query="+str_query);
}
function lookmsg(astr){
	window.open(astr);
}
function getmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../LookHistory?id="+getCookie('his');
	//响应函数，请求时调用 
	
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var zc =eval('('+requestmsg+')');
				if(zc.zc=="fail"){
					showmsgDiv("数据获取失败");
				}else{				
					document.getElementById("searchstr").innerHTML=zc.searchstr;
					document.getElementById("searchdate").innerHTML=zc.searchdate;
					getQueryMsg(zc.searchstr);
					var msg="<table class='gridtable'>"+
					"<tr><th>政策编号</th><th>政策标题</th><th>政策类别</th><th>施行日期</th><th>操作</th></tr>";
					for(var i=0;i<zc.zc.length;i++){	
						astr="showzhengce.jsp?zcwh="+zc.zc[i].id;		
						clickstr="\"lookmsg('"+astr+"')\"";
						msg+="<tr>"+
							"<td>"+zc.zc[i].id+"</td>"+							
							"<td><a href='"+astr+"' target='_blank' >"+zc.zc[i].title+"</a></td>"+	
							"<td>"+zc.zc[i].classtify+"</td>"+
							"<td>"+zc.zc[i].date+"</td>"+
							"<td><button class='btn btn-signup' onclick="+clickstr+">查看</button></td>"+
						"</tr>";
						
					}
				msg+="</table>";
				document.getElementById("zctable").innerHTML=msg;
					
				}

			}
		}
	};
	xhr.open("post",url,true);//方式、请求url，是否异步
	xhr.send(null);
}
</script>
</head>
<body onload="getmsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 550px;">
	<div align="center">
		<button class='btn btn-signnow' onclick="window.history.back(-1);" >返回</button>
		<table border="0">
			<tr><td width="100px"><br/><div>检索条件：</div><br/></td><td><div id="searchstr" style="color: blue;"></div></td></tr>
			<tr><td><br/><div>检索时间：</div><br/></td><td><div id="searchdate" style="color: red;"></div></td></tr>
			<tr><td colspan="2"><br/>检索结果：</td></tr>
			<tr><td colspan="2"><div id="zctable" align="center"></div></td></tr>
		</table>
	</div>
</div>
	
</body>
</html>