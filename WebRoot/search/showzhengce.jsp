<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title></title>
	<link href="../css/bootstrap.css" rel="stylesheet">
	<link href="../css/tablecloth.css" rel="stylesheet">
	<script src="../js/jquery-1.7.1.min.js"></script>
	<script src="../js/tool.js"></script>
	<script src="../js/jquery.tablecloth.js"></script>
	<script src="../js/jquery.hashchange.min.js" type="text/javascript"></script>
	<script src="lib/jquery.easytabs.min.js" type="text/javascript"></script>
 <style>
   .etabs { margin: 0; padding: 0; }
   .tab { display: inline-block; zoom:1; *display:inline; background: #eee; border: solid 1px #999; border-bottom: none; -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; }
   .tab a { font-size: 14px; line-height: 2em; display: block; padding: 0 10px; outline: none; text-decoration:none; }
   .tab a:hover { text-decoration: underline; }
   .tab.active { background: #fff; padding-top: 6px; position: relative; top: 1px; border-color: #666; }
   .tab a.active { font-weight: bold; }
   .tab-container .panel-container { background: #fff; border: solid #666 1px; padding: 10px; -moz-border-radius: 0 4px 4px 4px; -webkit-border-radius: 0 4px 4px 4px;margin:0px 50px 0px 50px; }
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
<script type="text/javascript">
    $(document).ready( function() {
      $('#tab-container').easytabs();
    });
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
<style type="text/css">
body{
	background-color: #B1D8EA
}
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
colors=['#0000FF','#A52A2A','#5F9EA0','#D2691E','#C0F000','#00FFFF','#008B8B','#A9A9A9','#DA0000','#556B2F','#9932CC','#E9967A','#483D8B','#00CED1','#FF1493','#696969','#B22222','#228B22','#00000E','#00E00D','#008000','#CD5C5C','#F0E68C','#FFF0F5','#FFFACD','#F08080','#0000E0','#0000A0','#FFB6C1','#20B2AA','#0000EB','#B0C4DE','#32CD32','#FF00FF','#66CDAA','#BA55D3','#3CB371','#00FA9A','#C71585','#F5FFFA','#FFE4B5','#000080','#FDF5E6','#FFA500','#DA70D6','#98FB98','#DB7093','#FFDAB9','#FFC0CB','#B0E0E6','#FF0000','#4169E1','#FA8072','#2E8B57','#A0522D','#6A5ACD','#FFFAFA','#4682B4','#D8BFD8','#40E0D0','#00E0ED','#000E00','#FFFF00'];
str_query="";
key=[];
//更换政策内容关键字的颜色
function changebackground(str){
	var new_str=str;
	for(var i=0;i<key.length;i++){
		new_str=new_str.replace(new RegExp(key[i].replace(/[ ]/g,""),"g"), "<font color="+colors[i]+">"+ key[i]+"</font>");
	}
	//alert(new_str);
	return new_str;
}
//获取url参数
function GetRequest() {
   var url = location.search; //获取url中"?"符后的字串
   if (url.indexOf("?") != -1) {    //判断是否有参数
      var str = url.substr(1); //从第一个字符开始 因为第0个是?号 获取所有除问号的所有符串
      strs = str.split("=");   //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
      return decodeURI(strs[1]);          //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
   }
}
function hidestrquery(){
	if(document.getElementById("seachstr").innerHTML=="")
		document.getElementById("seachstr").innerHTML="<h3>"+str_query+"</h3>";		
		else document.getElementById("seachstr").innerHTML="";
}
function getseachmsg(){	
	var requestmsg;
	var xhr=getxmlhttp();
	//准备连接
	var url="../GetSeachMsg";
	//alert(url);
	//响应函数，请求时调用
	xhr.onreadystatechange=function(){	
		if(xhr.readyState==4){
			if(xhr.status==200||xhr.status==304)
			{				
				requestmsg=xhr.responseText;
				//alert(requestmsg);
				var querys =JSON.parse(requestmsg);
				if(querys.querys=="fail"){
					showmsgDiv("数据获取失败");
				}else{			
					//alert(querys.querys[0].content);
					var qstr="";
					if(querys.str_query.split(',').length>1){	
						key=querys.str_query.split(',');
						for(var i=0;i<key.length;i++){
							qstr+="<font color="+colors[i]+">"+ key[i]+"</font>&nbsp;&nbsp;";
						}
						//alert(qstr);
					}
					else qstr=querys.str_query;
					str_query=qstr;
					document.getElementById("seachstr").innerHTML="<h3>"+qstr+"</h3>";		
					document.getElementById("zctitle").innerHTML="<h2>"+querys.mc+"</h2>";
					document.getElementById("zclb").innerHTML="<h3>政策类别："+querys.fl+"</h3><hr>";
					document.getElementById("zcdate").innerHTML="<h3>发布时间："+querys.sxrq+"</h3><hr>";
					document.getElementById("zcmsg").innerHTML="<h3>"+changebackground(decodeURIComponent (querys.nr.replace(/\+/g,"%20")))+"</h3>";
					
				}

			}
		}
	};
	xhr.open("post",url,false);//方式、请求url，是否异步
	//传输大数据
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("zcid="+GetRequest());
}
</script>
</head>
<body onload="getseachmsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="margin: 5px 0px 0px 10px;background-color: white;height: 98%;min-height: 650px;">
 <br/><br/>
<div id="tab-container" class='tab-container'>
 <ul class='etabs' style="text-align: center;">
   <li class='tab' ><a href="#seachstr" onclick="hidestrquery()">检索条件</a></li>
 </ul>
 <div class='panel-container'>
  <div id="seachstr" align="center">
   </div>
 </div>
</div>
<div id="tab-container" class='tab-container'>
 <ul class='etabs' style="text-align: center;">
   <li class='tab' ></li>
 </ul>
 <div class='panel-container'>
  <div align="center">
	  <table >
		  <tr align="center"><td colspan="2"><div id="zctitle"></div></td></tr>
		  <tr align="center"><td> <span id="zcdate"></span></td><td><span id="zclb"></span></td></tr>
		  <tr ><td colspan="2"><div id="zcmsg"></div></td></tr>
	 </table>
   </div>
 </div>
</div>
</div>
<div id="ssssss"></div>
</body>
</html> 
