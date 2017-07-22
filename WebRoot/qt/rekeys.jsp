<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>河北省科学技术情报研究院科技政策服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/jquery-1.9.1.min.js">
</script>
<% YH wbuser = (YH) session.getAttribute("wbuser"); %>
<script language="JavaScript" src="js/qtcx.js"></script>
<script language="JavaScript" src="js/time.js"></script>
<script src="../js/dowithUrl.js"></script> 
<script src="../js/tool.js"></script> 
<script language="JavaScript" src="js/dowithUrl.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<SCRIPT type=text/javascript>	
history="";//记录加入历史记录的政策文号
str_query="";//检索条件
colors=['#0000FF','#A52A2A','#5F9EA0','#D2691E','#C0F000','#00FFFF','#008B8B','#A9A9A9','#DA0000','#556B2F','#9932CC','#E9967A','#483D8B','#00CED1','#FF1493','#696969','#B22222','#228B22','#00000E','#00E00D','#008000','#CD5C5C','#F0E68C','#FFF0F5','#FFFACD','#F08080','#0000E0','#0000A0','#FFB6C1','#20B2AA','#0000EB','#B0C4DE','#32CD32','#FF00FF','#66CDAA','#BA55D3','#3CB371','#00FA9A','#C71585','#F5FFFA','#FFE4B5','#000080','#FDF5E6','#FFA500','#DA70D6','#98FB98','#DB7093','#FFDAB9','#FFC0CB','#B0E0E6','#FF0000','#4169E1','#FA8072','#2E8B57','#A0522D','#6A5ACD','#FFFAFA','#4682B4','#D8BFD8','#40E0D0','#00E0ED','#000E00','#FFFF00'];
querys={};
function querymsg(){	
	var str_query="";	
	str_query=document.getElementById("str_many_query").value;
	str_query=dowithURL(str_query);
	if(str_query==""){
		alert("请输入检索内容。");
		document.getElementById("str_many_query").focus();
		return;
	}		
	if(progress!=0){
		alert("检索正在进行中，请等待...");
		return;
	}
	getKeys(str_query);
}


function getKeys(str_query){	
		var requestmsg;
		var xhr=getxmlhttp();
		//准备连接
		var url="../GetKeys";
		var param="str_query="+str_query;
		if($("keysku").checked){
			param+="&userkeysku=true";
		}else{
			param+="&userkeysku=false";
		}
		if($("nokeysku").checked){
			param+="&usernokeysku=true";
		}
		else{
			param+="&usernokeysku=false";
		}
		//响应函数，请求时调用
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
				//	alert(requestmsg);
				//全局变量
					var keys =eval('('+requestmsg+')');
					key=keys.keys;
					showKeyList(null);
				}
			}
		};
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send(param);
		
	
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
		//进度条更新
progress=0;
function updateprogress (){
	$("br_div").style.display='none';
	if(progress>78){
		progress_time= setTimeout("updateprogress()",2000);
		progress+=1;
		}
	else {
		
		progress+=Math.floor(Math.random()*3);
		progress_time= setTimeout("updateprogress()",100);
	}
	if(progress>99)progress=99;
	$("progress_bar").style.width=progress+"%";
	$("progress_text").innerHTML="正在检索请稍等，进度："+progress+"%";
	
}
function progressComplete(){
	clearTimeout(progress_time);
	$("progress_bar").style.width="100%";
	$("progress_text").innerHTML="正在检索请稍等，进度：100%";
	//隐藏进度条
	setTimeout("noneProgress()",300);
	progress=0;//把进度值置为0
	
} 
function noneProgress(){
	$("wrap").style.display='none';
	 var endtime=new Date().getTime();
	$("br_div").innerHTML="检索用时:"+(endtime-starttime)/1000+"秒";
	$("br_div").style.display='block';
	
} 
//动态增加button
function addPageButton(){
	
	var buttonNum=0;
	var count =querys.querys.length;
	if(count%10==0)buttonNum=count/10;
	else buttonNum=count/10+1;
	var str_buttons="";
	for(var i=1; i<=buttonNum;i++){
		 buttonid="pagebutton"+i;
		if(i==1)str_buttons+="<button style='width:30px' disabled='disabled' id="+buttonid+" onclick='interThisPage(this)'>"+i+"</button>";
		else str_buttons+="<button style='width:30px' id="+buttonid+"  onclick='interThisPage(this)'>"+i+"</button>";
	}
	$("buttons").innerHTML=str_buttons;
	//记录当前页的按钮
	ablebutton=$("pagebutton1");
	
}
//显示每页的内容数据
	function interThisPage(obj){
		
		obj.disabled=true;
		ablebutton.disabled=false;
		ablebutton=obj;
		var e=obj.innerHTML;
		var msg="";
		var n=e*10>querys.querys.length?querys.querys.length:e*10;
		for(var i=(e-1)*10;i<n;i++ ){
			var astr="zccxzclook.do?pno="+querys.querys[i].id;
			msg+="<div class='divpostion_content'>"+
			"		<div><a href='"+astr+"'   style='font-size:18px' >"+querys.querys[i].title+"</a></div>"+
			"		<div  class='divpostion' style='font-size:14px'>时间：<span>"+querys.querys[i].date+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
			"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+changebackground(querys.querys[i].content)+"</div>"+
			"</div><br/>";		
			}

		document.getElementById("tablemag").innerHTML=msg;
		window.scroll(0,20);
		
		
	}
	function getPhraseQuery(id){
		saveKeyValue();
		var requestmsg;
		var slop=10;
		var issort=false;
		if($("slop2").checked)slop=10;
		if($("slop3").checked)slop=20;
		if($("slop4").checked)slop=50;
		if($("issort").checked)issort=true;
		var xhr=getxmlhttp();
		//开始时间
		starttime=new Date().getTime();
		$("wrap").style.display='block';
		updateprogress();
		str_query=""+key;
		//准备连接
		var url="../PhraseQueryServlet";
		xhr.onreadystatechange=function(){	
			if(xhr.readyState==4){
				
				if(xhr.status==200||xhr.status==304)
				{				
					requestmsg=xhr.responseText;
					//	alert(requestmsg);
					//全局变量
						
						querys=eval('('+requestmsg+')');
						addPageButton();
					//	alert(querys.querys[0].content);	
						var msg=""; 
						if(querys.querys[0]==null){
							 msg="<div style='color:#0099FF; font-size: 18px'>没有检索到任何信息</div>";
							document.getElementById("tablemag").innerHTML=msg;
							progressComplete();	
							return;
						}
						else
						{
							//$("soso").style.display='block';
						var n=(querys.querys.length>10?10:querys.querys.length);				
						for(var i=0;i<n;i++ ){
							var astr="zccxzclook.do?pno="+querys.querys[i].id;
							msg+="<div class='divpostion_content'>"+
							"		<div><a href='"+astr+"'   style='font-size:18px' >"+querys.querys[i].title+"</a> </div>"+
							"		<div  class='divpostion' style='font-size:14px'>时间：<span>"+querys.querys[i].date+"</span> 类别：<span>"+querys.querys[i].classtify+"</span></div>"+
							"        <div  class='divpostion' style='font-size:12px;line-height:20px; '>"+changebackground(querys.querys[i].content.replace("MicrosoftInternetExplorer402DocumentNotSpecified7.8Web0"," "))+"</div>"+
							"</div><br/>";			
							}
						}

						document.getElementById("tablemag").innerHTML=msg;	
						//alert(str_query);
						progressComplete();
						if(str_query.length>10)
							document.getElementById("sostr").innerHTML=str_query.substr(0,10)+"...";				
						else document.getElementById("sostr").innerHTML=str_query;
						document.getElementById("soresult").innerHTML="";
					
				}
			}
		};
		
		xhr.open("post",url,true);//方式、请求url，是否异步
		//传输大数据
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		if(id==1){
			xhr.send("str_query="+key+" &issort="+issort+"&slop="+slop);
		}else{
			var arrwh='';
			for(var i in querys.querys){
				arrwh+=querys.querys[i].id+",";
			}
			xhr.send("str_query="+key+" &issort="+issort+"&slop="+slop+"&arrwh="+arrwh);
		}
		
}
function changebackground(str){
	var new_str=str;
	for(var i=0;i<key.length;i++){
		new_str=new_str.replace(new RegExp(key[i],"g"), "<font color="+colors[i]+">"+ key[i]+"</font>");
	}
	//alert(new_str);
	return new_str;
}
	
</SCRIPT>
<style type="text/css">

<!--
.tag ul{list-style:none}
.tag li{float:left;margin-left: 50px;}
.left li{margin-top: 10px;}
a{text-decoration:none}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg.jpg);
	background-repeat: repeat-x;
	background-color: #F3F3F3;;
}
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
	color: #FFFFFF;
}
.STYLE22{
	color: #fffff;font-size:20px;font-weight:bold;
}
.STYLE2 {
	font-size: 12px;
	color: #000033;
}
.STYLE3 {
	color: #FFFFFF;
	font-size: 12px;
	line-height: 25px;
}
.STYLE5 {font-size: 20px; font-weight: bold; color: #FFFFFF; }
.leftul li{width:180px;line-height:29px;text-align:left;background:url(images/dot.gif) repeat-X bottom;e; font-size:14px; height:29px;}
.leftul li.line{ margin-left:-10px;padding-left:30px; font-size:0px; height:1px;  background:#e5e5e5;}
-->
</style>
</head>
<body>
<div align="center">
  <!-- Save for Web Slices (首页new切割好.psd) -->
  <table id="__01" width="1046" height="968" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="132" colspan="4">
        <img src="images/index_01.jpg" width="1046" height="132"></td>
	  </tr>
    <tr>
      <td height="42" colspan="4" background="images/index_0300.jpg">
      <div class="nav">
      <div align="center" class="navinner" class="tag">
		<ul class="navlist">
		<li><a href="${pageContext.request.contextPath}/qt/index.jsp" style="color: #FFFFFF">首页</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/zcfl.jsp" style="color: #FFFFFF">政策导航</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/qtcx.jsp" style="color: #FFFFFF">政策查询</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/qttjfx.jsp" style="color: #FFFFFF">政策分析</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/zcjd.jsp" style="color: #FFFFFF">政策解读</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/xtjs.jsp" style="color: #FFFFFF">系统介绍</a></li>
		<li><a href="${pageContext.request.contextPath}/qt/denglu.jsp" style="color: #FFFFFF">用户登陆</a></li>
		</ul>	  
		</div>
		</div>
	  </tr>
    <tr>
      <td height="38" colspan="3" background="images/index_0400.jpg"><span id="d" class="STYLE2">您的位置：首页->政策查询->关键字检索</span></td>
	    <td height="38" background="images/index_0400.jpg" class="STYLE2"><div align="right"><div id="nowtime" style="float: right;"></div>
	    <%if(wbuser!=null){%>
	     <div style="float: right;">欢迎：<%=wbuser.getUsername() %>&nbsp;&nbsp;&nbsp;<a href="#" id="zx" onclick="zx()" style="color: blue">注销</a>&nbsp;&nbsp;</div>
	     <%} %>
	    </div></td>
    </tr>
    
    <tr bgcolor="#FEFEFE">
      <td colspan="2" border="0"  valign="top">
      <!-- <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="41" background="images/temp_09.jpg"><div align="center"><span class="STYLE5">&nbsp;系统介绍</span></div></td>
        </tr>
        <tr>
          <td height="162" background="images/temp_11.jpg">&nbsp;</td>
          </tr>
        <tr>
          <td height="27" background="images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table> -->
      <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
	        <td height="41" background="images/temp_09.jpg"><div align="center"><span class="STYLE5"><img src="images/Developer_Icons_014.png" style="vertical-align: middle;" width="32" height="32">&nbsp;检索方式</span></div></td>
        </tr>
        <tr>
          <td height="162" background="images/temp_11.jpg">
          
				<ul style="list-style: none;" class="leftul">
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="../qtTypeServlet">分类浏览</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qtcx.jsp" id='gjlf'>快速检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qtzhjs.jsp">综合检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qtqwjs.jsp">全文检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="rekeys.jsp">关键词检索</a></li>
				
				</ul>
		
		
			
          &nbsp;</td>
          
          
          </tr>
        <tr>
          <td height="27" background="images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table>
      <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
        	<td height="41" background="images/temp_09.jpg"><div align="center"><span class="STYLE5"><img align="Bottom" src="images/Developer_Icons_014.png" width="32" height="32" style="vertical-align: middle;" >&nbsp;功能介绍</span></div></td>
        </tr>
        <tr>
          <td height="162" background="images/temp_11.jpg">
          
				<ul style="list-style: none;" class="leftul">
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="c2.jsp">分类浏览功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="c1.jsp" id='gjlf'>快速检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="c3.jsp">综合检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="c4.jsp">全文检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="c5.jsp">关键词检索功能</a></li>
				</ul>
		</td>
          </tr>
        <tr>
          <td height="27" background="images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table>
      </td>
     
	   
	    <!-- 内容 -->
	    <td colspan="2" valign="top">
	     
	    <table width="785" height="606" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>
            <td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">关键字检索</span></font><span class="STYLE22">&nbsp;</span></td>
            <td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>
          </tr>
          <tr>
            <td height="550" background="images/2temp_13.jpg">&nbsp;</td>
            <td class="center" valign="top" bgcolor="#FFFFFF">
            <%if(wbuser!=null){ %>
            	<!-- 内容 -->
	   <div style="background-color: #ffffff;">
<!-- 多行全文检索输入框 -->
<div id="manySearch" >
	<fieldset class="fieldset_style"  >
		<font color="#FF0000" size="3px">输入您要检索的内容：</font><br/>
		<br/><br/>
		<div style="margin-left:80px;">
		启用:&nbsp;&nbsp;&nbsp;<label for="keysku">关键词库</label><input type="checkbox"   id="keysku" />
		&nbsp;&nbsp;&nbsp;<label for="nokeysku">无用词库</label><input type="checkbox" id="nokeysku"/>
		<br><br>
		<textarea id="str_many_query" style="resize:none;color:#0099FF;width:540px; height: 120px; font-size: 20px" ></textarea>
		<br/><input type="button" value="检索"  style="vertical-align: bottom; margin:10px 0px 5px 220px; " onclick="querymsg()" /><br/>
		
		<br/><br/>
		</div>
		<br/>
	</fieldset>	
</div>	

<!-- 重组关键词 -->
<div id="showKeyDiv" >
	<fieldset class="fieldset_style" >
	<font color="#FF0000" size="2px">重组关键字顺序：</font><br/>
	<table>
	<tr>
	<td>
		<div id="keyList" style=" overflow:auto;line-height:22px;  width:200px; height:160px; border:1px solid;"></div>
	</td>
	<td >
		<img  src="../images/103.gif"  onclick="keyUpMove()" />
		<br/><img style="margin-top: 10px;" onclick="keyAdd()" src="../images/101.gif" />
		<br/><img src="../images/102.gif" style="margin-top: 10px;"  onclick="keyDel()" />
		<br/><img src="../images/104.gif" style="margin-top: 10px;" onclick="keyDownMove()"  />
		
	</td>
	<td>
	<div  style=" height:160px;margin:0px 0 0 80px; width:400px;">
		间隔数：
		<label for="slop2"><10</label><input type="radio"  checked="checked" id="slop2"  name="slop"   />
		<label for="slop3"><20</label><input type="radio" id="slop3"  name="slop"   />
		<label for="slop4"><50</label><input type="radio" id="slop4"  name="slop"   />
		<input style="display: none;" type="checkbox" id="issort"  name="issort"   />
		<br/><br/>
	<img style="margin: 10px 0px 0 0px;"  src="../images/103.gif"   />:上移关键字
	<img style="margin: 10px 0 0 0px;"  src="../images/101.gif" />:新增关键字
	<br/><img src="../images/104.gif" style="margin: 10px 0px 0 0px;"/>:下移关键字
	<img src="../images/102.gif" style="margin: 10px 0px 0 0px;"  />:删除关键字<br/><br/>
		<div align="left">
		<input  type="button" value="确定" onclick="getPhraseQuery(1)">
		<input  type="button" value="结果中查询" onclick="getPhraseQuery(2)">
		
		</div>
	</div>
	</td>
	</tr>
	</table>
				
	</fieldset>	
</div>	
<div>
<fieldset id="fieldset_style" class="fieldset_style">
	<!-- 进度条 -->
	<div class="wrap" id="wrap" style="display: none;" align="center"> 
	    <div class="progressbar"> 
	        <div class="text" id="progress_text">正在检索请稍等，进度：0%</div> 
	        <div class="bar" id="progress_bar" style="width: 0%;"></div> 
	    </div> 
	</div>


	
	<div id="br_div"><br/></div>
	
	<div id="comments"></div>
	<fieldset id="fieldset_style_inner">
	<!-- **********显示信息********** -->
	<div id="tablemag" style="magin:30px; padding: 20px" >
		<font color="0099FF" size="3px">
		1.请输入内容进行全文检索<br/><br/>
		2.全文检索将对所以政策文档内的内容进行检索，搜索时间会随搜索内容的不同而不同，请耐心等待。
		</font>
	</div>
	<!-- **********分页按钮********** -->
	<div id="buttons" style="margin: 10px" >

	</div>
	</fieldset>
	<br/>
</fieldset>
</div>

</div>
    <script type="text/javascript">
//key=["关键词1","关键词2","关键词3","关键词4","关键词5","关键词6"];
function showKeyList(e){
	var  msg="";
	for(var i=1;i<= key.length;i++){
		var keyid="key"+i;
		if(e!=null){
			
			if(e.title=='selected')return;
			if(e.id==keyid)
				msg+="<div contenteditable='true'style='color:"+colors[i-1]+"' title='selected' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
				else
					msg+="<div contenteditable='true' style='color:"+colors[i-1]+"' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
			
		}
		else{
			if(i==1)
				msg+="<div contenteditable='true'style='color:"+colors[i-1]+"' title='selected' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";
				else
					msg+="<div contenteditable='true' style='color:"+colors[i-1]+"' id="+keyid+" onclick='showKeyList(this)'>"+key[i-1]+"</div>";		
		}	
		
	}
	$("keyList").innerHTML=msg;
}


function keyUpMove(){
	saveKeyValue();
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=1){
		var t=key[n-1];
		key[n-1]=key[n-2];
		key[n-2]=t;
	}	
	showKeyList(keylist[n-2]);
}
function keyDownMove(){
	saveKeyValue();
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=keylist.length){
		var t=key[n-1];
		key[n-1]=key[n];
		key[n]=t;
		showKeyList(keylist[n]);
	}	
}

function keyAdd(){
	saveKeyValue();
	var n=0;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	for(var i=keylist.length;i>=n;i--){
		if(i==n){
			key[i]="新关键字";
			continue;
		}
		key[i]=key[i-1];
		
	}	
	if(n!=keylist.length) showKeyList(keylist[n]);
	else {
		
		var keyid="key"+(keylist.length+1);
		showKeyList({'id':keyid,'style':{'background':''}});
	}
}
function keyDel(){
	var n=1;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	var key2=[];
	for(var i=0;i<keylist.length-1;i++){
		if(i<(n-1))key2[i]=key[i];
		else key2[i]=key[i+1];
	}
	key=[];
	for(var i=0;i<key2.length;i++){
		key[i]=key2[i];
	
	}
	showKeyList(keylist[n-2]);
}
//保存修改后的值
function saveKeyValue(){
	var n=0;
	var keylist=document.getElementById("keyList").childNodes;
	for(var i in keylist){
		var e=keylist[i];
		if(e.title=='selected'){
			n=e.id.substr(3);break;
		}			
	}
	if(n!=0)
	key[n-1]=keylist[n-1].innerHTML;
	
}


function changetextvalue(obj){
	$("str_query").value=obj.innerHTML;
}
function $(id){
	return document.getElementById(id);
}

</script>
			<!-- 内容 -->
			
			 <%}else{ %>
	<font size="3" color="red">查询功能注册以后才能使用</font>
	<%} %>
           </td>
            <td background="images/2temp_15.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>
            <td height="14" background="images/2temp_18.jpg"></td>
            <td><img src="images/2temp_19.jpg" width="17" height="14"></td>
          </tr>
        </table>
        
       
        </td>
    <!-- 内容 -->
    
   
	  </tr>
	  <tr>
	  <td height="29" colspan="4" ><div align="center">
      <font color=#000099 size="4"><strong>友情链接</strong></font>
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--政府网站--</option>
      	<option  value="http://www.hebei.gov.cn/">中国.河北</option>
      	<option  value="http://www.hebstd.gov.cn/">省科学技术厅</option>
      	<option  value="http://www.ii.gov.cn/">省信息产业厅</option>
      	<option  value="http://www.hbdrc.gov.cn/">省发改委</option>
      	<option  value="http://www.hee.cn/">省教育厅</option>
      	<option >------------</option>
      	<option  value="http://www.most.gov.cn/">科学技术部</option>
      	<option  value="http://www.sdpc.gov.cn/">国家发改委</option>
      	<option  value="http://www.moe.edu.cn/">教育部</option>
      	<option  value="http://www.sipo.gov.cn/">国家知识产权局</option>
      	<option  value="http://www.cas.cn/">中国科学院</option>
      </select>
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--本省科技--</option>
      	<option  value="http://www.sjzkj.gov.cn/cyportal/template/site00_index.jsp">石家庄</option>
      	<option  value="http://www.chengde.gov.cn/">承德市</option>
      	<option  value="http://www.zjkkj.gov.cn/">张家口市</option>
      	<option  value="http://www.tskj.com.cn/">唐山市</option>
      	<option  value="http://www.lfinfo.gov.cn/">廊坊市</option>
      </select>
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--各省科技--</option>
      	<option  value="http://www.heinfo.gov.cn/Home/Index.asp">河北科技信息网</option>
      	<option  value="http://www.bjkw.gov.cn/n8785584/index.html">北京市科委</option>
      	<option  value="http://www.tisti.ac.cn/">天津科技网</option>
      	<option  value="http://www.sxinfo.gov.cn/">中国山西之窗</option>
      	<option  value="http://www.nmsti.com/2014/">内蒙古科技信息网</option>
      	<option  value="http://www.lninfo.gov.cn/">辽宁科技信息网</option>
      	<option  value="http://kjt.jl.gov.cn/kjt/4/tindex.shtml">吉林科学技术厅</option>
      	<option  value="http://www.hljkjt.gov.cn/">黑龙江科技厅</option>
      	<option  value="http://www.jsinfo.gov.cn/">江苏科技信息网</option>
      	<option  value="http://www.zjinfo.gov.cn/">浙江科技网</option>
      	<option  value="http://www.ahinfo.gov.cn/">安徽科技网</option>
      	<option  value="http://www.fjinfo.gov.cn/">福建科技网</option>
      	<option  value="http://www.jxinfo.gov.cn/">江西科技信息网</option>
      	<option  value="http://www.sdstc.gov.cn/">山东科学技术厅</option>
      	<option  value="http://www.hnkjt.gov.cn/new/index.eiip">河南科技网</option>
      	<option  value="http://www.hbstd.gov.cn/">湖北科学技术厅</option>
      	<option  value="http://www.sti.gd.cn/">广东金科网</option>
      	<option  value="http://www.cstc.gov.cn/">重庆市科委</option>
      	<option  value="http://www.sninfo.gov.cn:8083/initSnFirstPageList.do?method=initSnFirstPageList">陕西科技信息网</option>
      	<option  value="http://www.xjinfo.gov.cn/">新疆科技信息网</option>
      	<option  value="http://www.scst.gov.cn/info/">四川省科学技术厅</option>
      	<option  value="http://www.gsinfo.net.cn/">甘肃科技信息网</option>
      	<option  value="http://www.ynst.net.cn/">云南科技信息网</option>       	
      	
      </select>
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--其他科技--</option>
      	<option  value="http://www.cast.org.cn/">中国科学技术协会</option> 
      	<option  value="http://www.stdaily.com/">科技日报</option> 
      	<option  value="http://www.stdaily.com/">中国科普网</option> 
      	<option  value="http://www.istic.ac.cn/">中国科技信息研究</option> 
      	<option  value="http://www.chinainfo.gov.cn/">中国科技信息</option> 
      	<option  value="http://www.cstec.org/zh/index.aspx">中国科技交流中心</option>
      	<option>-----------</option> 
      	<option  value="http://www.picmg.com.cn/">中国计算机行业网</option> 
      	<option  value="http://www.clii.com.cn/">中国轻工信息网</option> 
      	<option  value="http://www.aptchina.com/">中国应用技术网</option>  
      </select>
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--资源网站--</option>
      	<option  value="http://scitech.people.com.cn/policy/#1">中国科技政策网</option> 
      	<option  value="http://policy.tech110.net/">国家科技成果网</option> 
      	<option  value="http://www.most.gov.cn/kjzc/gjkjzc/">国家科技政策</option> 
      	<option  value="http://www.chinalaw.gov.cn/article/fgkd/xfg/">国务院法制办公室</option> 
      	<option  value="http://www.sninfo.gov.cn:8083/initSnZcfgTwoPageList.do?method=initSnZcfgTwoPageList">陕西省科技信息网</option> 
      	<option  value="http://www.51policy.cn/">江苏省科技政策服务网</option> 
      	<option  value="http://zc.k8008.com/">科易网科技政策服务中心</option> 
      	<option  value="http://www.kjzj.org.cn/">中关村科技服务平台</option> 
      	<option  value="http://www.kjzcfg.com/html/sort/sort3/index.html">贵州省科技政策法规服务平台</option>  
      </select >
      
      <select onChange="window.open(this.options[this.selectedIndex].value)">
      	<option selected>--搜索引擎--</option>
      	<option  value="http://www.sohu.com/">搜狐</option>
      	<option  value="http://www.sina.com.cn/">新浪</option>
      	<option  value="http://www.163.com/">网易</option>
      	<option  value="http://www.baidu.com/">百度</option>
      	<option  value="http://www.google.com/">goole</option>
      </select >
      
      </div></td>
    </tr>
    <tr>
      <td height="29" colspan="4" background="images/index_0900.jpg" class="STYLE1"><div align="center"><a style="color: #FFFFFF" href="lxwm.jsp">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;设为首页&nbsp;&nbsp;|&nbsp;&nbsp;加入收藏&nbsp;&nbsp;|&nbsp;&nbsp;<a href="mzsm.jsp" style="color:#ffffff">免责声明</a></div></td>
	  </tr>
    <tr>
	     <td colspan="4" rowspan="2" background="images/index_11.jpg"><div align="center" class="STYLE3">
	 	版权所有 @ 河北省科学技术情报研究院科技政策服务平台
		<br>
		地址: 河北省石家庄市青园街233号 邮编：050021 
		</div>
	      </td>
	  </tr>
    
  </table>
  <!-- End Save for Web Slices -->
</div>
<script type="text/javascript">
function zx(){
	alert("注销成功");
	jQuery.post("../qtzx",
			function(response){
		location.replace('denglu.jsp');
	});
}
</script>

<map name="Map"><area shape="rect" coords="21,1,117,37" href="#"><area shape="rect" coords="127,2,227,37" href="#"><area shape="rect" coords="23,49,143,75" href="#"><area shape="rect" coords="152,45,231,82" href="#"></map></body>
</html>