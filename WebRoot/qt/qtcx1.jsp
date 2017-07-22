<%@ page language="java" contentType="text/html; charset=UTF-8" 
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="com.dqwr.technology.dao.impl.*"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.technology.entity.Technology" pageEncoding="UTF-8"%>
	<!-- utf-8改为gbk -->
<%
	String path = request.getContextPath();
	String tag = null;
	tag = request.getParameter("tag");
%>
<html>
<head>
<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js">
	
</script>
<script type="text/javascript">
   function select0(){
	   document.getElementById("case1").style.display="none";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
   }
   
   function select1(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="none";
	   document.getElementById("case3").style.display="none";
   }
   
   function select2(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="none";
   }
   
   function select3(){
	   document.getElementById("case1").style.display="";
	   document.getElementById("case2").style.display="";
	   document.getElementById("case3").style.display="";
   }
function addMore1()
{   
    var td = document.getElementById("more1");
    
    
    var num1=document.getElementById("num1");
	num1.value=parseInt(num1.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num1.value=parseInt(num1.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore2()
{   
    var td = document.getElementById("more2");
    
    var num2=document.getElementById("num2");
	num2.value=parseInt(num2.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num2.value=parseInt(num2.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function addMore3()
{   
    var td = document.getElementById("more3");
    
    var num3=document.getElementById("num3");
	num3.value=parseInt(num3.value)+1;
	
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
        num3.value=parseInt(num3.value)-1;
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}
</script>
<script type="text/javascript">
//验证我要发布表格内容是否为空
function checkTecSubmit()
{
	var orgaid=$("#orgaid").val();
	var organame=$("#organame").val();
	var natureid=$('input:radio[name="natureid"]:checked').val();
	var techname=$("#techname").val();
	var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
	var casenumber=$('input:radio[name="casenumber"]:checked').val();
	if(orgaid==""||organame==null||natureid==null||techname==""||fieldid==null||casenumber==null){
		alert("必填项不能为空!");
		return false;
	}else{
		return true;
	}
}
//检查机构代码
/* function TestOrgaidIsEx(){
	 var orgaid=document.getElementById("orgaid").value;
	 $.ajax({
	 type:'post',
	 url:'orgaidisexist',
	 data:"orgaid="+orgaid+"",
	 success:function(msg){
	 $('#orgaidlabel').html("<font color='red'>"+msg+"</font>");//msg就是一个jsp页面数据,直接嵌入<div id="text">
	 },
	 error:function(){
	 alert('加载信息失败...');
	 }
	 });
	 } */
	jQuery(function() {//上来就显示所有的
		jQuery.post("/dqwr/qt/jquery/technology.jsp", {
			"pagesize" : jQuery("#pagesize").val(),
			"pageno" : jQuery("#pageno").val(),
			"search" : jQuery("#search").val(),
			"find" : jQuery("#find").val(),
			"techpass" : jQuery("#techpass").val(),
		}, function(response) {
			jQuery("#xdsh").html(response);
		});
		$("#select").click(function() {//点击确定按钮 按条件查询
			jQuery.post("/dqwr/qt/jquery/technology.jsp", {
				"pagesize" : jQuery("#pagesize").val(),
				"pageno" : jQuery("#pageno").val(),
				"techpass" : jQuery("#techpass").val(),
				"search" : jQuery("#search").val(),
				"find" : jQuery("#find").val(),
			}, function(response) {
				jQuery("#xdsh").html(response);
			});
		});
	});
</script>
<script type="text/javascript">
	function check() {
		var num = document.getElementById("num");
		if (num.value == "1") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
		}
		if (num.value == "2") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			} else {
				if (document.getElementById('q1').value == "") {
					alert("第二项查询条件不能为空");
					thisform.q1.focus();
					return false;
				}
			}
		}
		if (num.value == "3") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
		}
		if (num.value == "4") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
			if (document.getElementById('q3').value == "") {
				alert("第四项查询条件不能为空");
				thisform.q3.focus();
				return false;
			}
		}
		if (num.value == "5") {
			if (document.getElementById('q0').value == "") {
				alert("首项查询条件不能为空");
				thisform.q0.focus();
				return false;
			}
			if (document.getElementById('q1').value == "") {
				alert("第二项查询条件不能为空");
				thisform.q1.focus();
				return false;
			}
			if (document.getElementById('q2').value == "") {
				alert("第三项查询条件不能为空");
				thisform.q2.focus();
				return false;
			}
			if (document.getElementById('q3').value == "") {
				alert("第四项查询条件不能为空");
				thisform.q3.focus();
				return false;
			}
			if (document.getElementById('q4').value == "") {
				alert("第五项查询条件不能为空");
				thisform.q4.focus();
				return false;
			}
		}
	}

	function addRow() {
		var obj = document.getElementById("num");
		var t = document.getElementById("sTable");
		if (t.rows.length >= 4) {
			alert('最多只能有3个条件');
			return;
		}
		var strId = t.rows.length;

		var e = document.createElement("select");
		e.name = "logic" + strId;
		e.id = "logic" + strId;
		e.size = 1;
		e.options[0] = new Option("并且", "AND");
		e.options[1] = new Option("或者", "OR");
		e.options[2] = new Option("不含", "NOT");

		var e2 = document.createElement("select");
		e2.name = "sType" + strId;
		e2.id = "sType" + strId;
		e2.size = 1;
		e2.options[0] = new Option("技术名称", "TechName");
		e2.options[1] = new Option("技术领域", "FieldId");
		e2.options[2] = new Option("发布时间", "FillTime");

		var q1 = document.createElement("input");
		q1.type = "text";
		q1.size = 50;
		q1.maxlength = 60;
		q1.name = "q" + strId;
		q1.id = "q" + strId;

		var row = t.insertRow(t.rows.length);
		var c0 = row.insertCell(0);
		c0.appendChild(e);

		var c1 = row.insertCell(1);
		c1.appendChild(e2);
		c1.appendChild(q1);
		obj.value = parseInt(obj.value) + 1;

	}

	function removeRow() {
		var obj = document.getElementById("num");
		tr = document.getElementById("sTable").rows;
		if (tr.length > 1) {
			var row = tr[tr.length - 1];
			if (row.parentNode)
				row.parentNode.removeChild(row);
			obj.value = parseInt(obj.value) - 1;
		}
	}
</script>
<script type="text/javascript">
function form1submit() {
	var jumpPageNo=document.getElementById("jumpPageNo").value;
	if(jumpPageNo==""||jumpPageNo==null){
	  alert("跳转页不能为空！");
	}else{
		document.form1.submit();	
	}
}
</script>
<script language="JavaScript" src="js/qtcx.js"></script>
<!-- 将我要发布嵌入到下方 -->
<script language="javascript">
	var http_request = false;
	function createRequest(url, objID) {
		http_request = false;
		if (window.XMLHttpRequest) {
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {
				http_request.overrideMimeType("text/xml");
			}
		} else if (window.ActiveXObject) {
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		if (!http_request) {
			alert("无法创建XMLHTTP实例");
			return false;
		}
		http_request.open("post", url, true);
		http_request.send(null);
		var obj = document.getElementById(objID);
		http_request.onreadystatechange = function() {
			if (http_request.readyState == 4) {
				if (http_request.status == 200) {
					obj.innerHTML = http_request.responseText;
				} else {
					alert('您请求的页面发现错误！');
				}
			}
		}
	}
</script>
<!-- 嵌入结束 -->


<script language="javascript">
	var xmlhttp;
	function verify(url, obj) {
		//确定浏览器
		if (window.XMLHttpRequest) {
			//针对FireFox、Mozillar、Opera、Safari、IE7、IE8
			//创建XMLHttpRequest对象
			xmlhttp = new XMLHttpRequest();
			//修正某些浏览器的BUG
			if (xmlhttp.overrideMimeType) {
				xmlhttp.overrideMimeType("text/html");
			}
		} else if (window.ActiveXObject) {
			//针对IE5、IE5.5、IE6
			//这两个为插件名称作为参数传递，为了创建ActiveXObject
			var activeName = [ "MSXML2.XMLHTTP", "Microsoft.XMLHTTP" ];
			for (var i = 0; i > activeName.length(); i++) {
				try {
					//非别取出，如果创建成功则终止循环，如果失败则会抛出异常继续循环
					xmlhttp = new ActiveXObject(activeName[i]);
					break;
				} catch (e) {
				}
			}
		}
		//确定XMLHttpRequest是否创建成功
		/*if(!xmlhttp) {
		 &nbsp; &nbsp; &nbsp; &nbsp; alert("XMLHttpRequest创建失败!");
		 &nbsp; &nbsp; &nbsp; &nbsp; return;
		 &nbsp; &nbsp; }else {
		 &nbsp; &nbsp; &nbsp; &nbsp; alert("XMLHttpRequest创建成功!"+xmlhttp);
		 &nbsp; &nbsp; }*/
		//注册回调函数
		xmlhttp.onreadystatechange = callback;
		//设置连接信息
		//1.是http请求的方式
		//2.是服务器的地址
		//3.是采用同步还是异步，true为异步
		//xmlhttp.open("GET",url,true);
		//post请求与get请求的区别
		//第一个参数设置成post第二个只写url地址，第三个不变
		xmlhttp.open("POST", "classisservlet", true);
		//post请求要自己设置请求头
		xmlhttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		//发送数据，开始与服务器进行交互
		//post发送请求
		xmlhttp.send(url);
	}
	function callback() {
		//接收响应数据
		//判断对象状态是否交互完成，如果为4则交互完成
		if (xmlhttp.readyState == 4) {
			//判断对象状态是否交互成功,如果成功则为200
			if (xmlhttp.status == 200) {
				//接收数据,得到服务器输出的纯文本数据
				var response = xmlhttp.responseText;
				//得到div的节点将数据显示在div上
				var divresult = document.getElementById(obj);
				divresult.innerHTML = response;
			}
		}
	}
</script>


<script language="javascript">
	//设置cookie
	function addCookie(name, expiresHours) {
		//重复的不再写入
		var value = $(".pno").val();
		var is = true;
		var strCookie = document.cookie;
		var arrCookie = strCookie.split(";");
		for (var i = 0; i < arrCookie.length; i++) {
			var arr = arrCookie[i].split("=");
			if (arr[1] == value) {
				alert(value);
				is = false;
				return;
			}
		}
		if (is == false)
			return;
		var cookieString = name + "=" + value;
		//判断是否设置过期时间 
		if (expiresHours > 0) {
			var date = new Date();
			date.setTime(date.getTime + expiresHours * 3600 * 1000);
			cookieString = cookieString + "; expires=" + date.toGMTString();
		}
		document.cookie = cookieString;

	}

	function resultReach(id) {
		var result = document.getElementById("result");
		var Find = document.getElementById("ermao").value;
		var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
		var a = containSpecial.test(Find);
		if (a == true) {
			alert("输入存在特殊字符，请检查");
		} else {
			if (id == 2)

			{
				result.value = "2";
			} else if (id == 1) {
				result.value = "1";
			}
			form1.submit();
		}
	}

	$(function() {
		$(".href1").click(function() {
			var href_val = $(this).attr("href");
			$(".show").html(href_val);
		});
	});
</script>
<script language="JavaScript" src="js/time.js"></script>

<style type="text/css">
<!--
.center {
	font-size: 12px;
}

.news tr {
	height: 30px
}

.news td, th {
	background: expression(( this.parentNode.rowIndex)%2==0?"#3DB7CC":"#B3F4FF");
}

.news a {
	color: #000000;
}

.tag ul {
	list-style: none;
}

.tag li {
	float: left;
	margin-left: 50px;
}

.left li {
	margin-top: 10px;
}

a {
	text-decoration: none
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/indexbg.jpg);
	background-repeat: repeat-x;
	background-color: #F3F3F3;;
}

.STYLE1 {
	font-size: 13px;
	font-weight: bold;
	color: #FFFFFF;
}

.STYLE11 {
	font-size: 13px;
	color: #000033;
	font-weight: bold;
}

.STYLE2 {
	font-size: 12px;
	color: #ffffff;
}

.STYLE3 {
	color: #FFFFFF;
	font-size: 12px;
	line-height: 25px;
}

a:link {
	color: black;
	text-decoration: none
}

a:visited {
	color: black;
	text-decoration: none
}

a:hover {
	color: red;
	text-decoration: none
}

.STYLE5 {
	font-size: 20px;
	font-weight: bold;
	color: #FFFFFF;
}

.leftul li {
	width: 180px;
	line-height: 29px;
	text-align: left;
	background: url(images/dot.gif) repeat-X bottom; e;
	font-size: 14px;
	height: 29px;
}

.leftul li.line {
	margin-left: -10px;
	padding-left: 30px;
	font-size: 0px;
	height: 1px;
	background: #e5e5e5;
}
-->
</style>
</head>
<body>
	<div align="center">
		<!-- Save for Web Slices (首页new切割好.psd) -->
		<table id="__01" width="1046" height="968" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td colspan="26"><img src="images/index_01.jpg" width="1046"
					height="193" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="193" alt=""></td>
			</tr>
			<tr>
				<td colspan="26" background="images/index_02.gif"><div
						align="center" class="STYLE11">
						<a href="<%=path%>/qt/index.jsp">首&nbsp;&nbsp;页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/zcfl.jsp">文献资源</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx.jsp?Type=0&Scope=2">工作动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx.jsp?Type=1&Scope=0">行业动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qttjfx.jsp?tag=1">技术需求</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx1.jsp?tag=1">成熟技术</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtcx2.jsp?look=1">创新要素</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path%>/qt/qtzthd.jsp" style='text-decoration: none;'>专题活动</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="<%=path%>/qt/lxwm.jsp">联系我们</a>
					</div></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="31" alt=""></td>
			</tr>
			<!-- 	  时间动态显示 -->

			<%
				YH wbuser = (YH) session.getAttribute("wbuser");
						String show;
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String dateNowStr = sdf.format(date);
			%>
			<tr>

				<td height="25" colspan="30" background="images/index_03.jpg"
					class="STYLE2"><div align="center">
						<div id="nowtime"></div>
						<%
							if (wbuser != null) {
						%>
						<div style="float: left;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wbuser.getUsername()%>&nbsp;您好，今天是<%=dateNowStr%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div align="right">
							<a href="#" id="zx" style="color: white">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<%
							}
											else{
						%>
						<div style="float: left;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游客您好，今天是<%=dateNowStr%>,想浏览更多内容或提交信息请先登陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>

						<%
							}
						%>
					</div></td>
			</tr>
			<!--  时间动态显示结束 -->
			<tr>
				<td colspan="26"><img src="images/index_04.jpg" width="1047"
					height="3" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="3" alt=""></td>
			</tr>
			<% if(wbuser!=null){%>
			<tr bgcolor="#FEFEFE">
				<td colspan="2" border="0" valign="top" bgcolor="#ffffff">
					<div id="body">
						<!-- OA树开始-->
						<div
							style="background: #3FA0F1; height: 30px; width: 170px; margin-top: 5px; margin-left: 2px"
							align="center">
							<font color="#ffffff" style="top: 4px; position: relative;">菜单</font>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px;"
							align="left" ;id="huoqu">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;" ;id="fabu"> <a
								href="<%=path%>/qt/qtcx1.jsp?tag=3">我要发布</a>
							<!-- <a href=""
								id="public"
								onclick="createRequest('csjsqt.jsp','refresh');return false;">我要发布</a> -->
							<!-- 嵌入添加 -->
							<!-- ajax添加 -->
							<iframe src="" id="testFrame" name="testFrame"
								style="width: 100%; height: 100%;" frameborder="0"
								marginwidth="0" marginheight="0" height="100%;" scrolling="no"
								allowtransparency="true"> </iframe>
							<!-- 添加结束     -->
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;"><a
								href="<%=path%>/qt/qtcx1.jsp?tag=1">我已发布</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;"><a
								href="<%=path%>/qt/qtcx1.jsp?tag=4">已征集</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;"><a
								href="<%=path%>/qt/qtcx1.jsp?techpass=5&tag=2">已退回</a>
						</div>
						<br> <br> <br> <br> <br>

					</div> <font></font>
				</td>

				<td colspan="2" valign="top" style="margin-left: 4px">
					<div id="refresh">
						<!-- 内容 -->
						<div
							style="background: #ffffff; height: 30px; width: 865px; color: red; margin-top: 5px; margin-left: 10px"
							align="center">请输入查询条件:</div>
						<%
							//找机构
								if(tag!=null){
								  if(tag.equals("1")){
						%>
						<%
							request.setCharacterEncoding("UTF-8");
							response.setCharacterEncoding("UTF-8");
							/* String type =(String)request.getAttribute("type"); */
							String keyword = (String) request.getAttribute("keyword");

							int pageno = 0;
							int pagesize = 0;
							int pageCount = 1;
							String size = (String) request.getAttribute("pagesize");
							if (size != null) {
								pagesize = Integer.parseInt(size);
							}

							if (pagesize <= 0) {
								pagesize = 15;
							}

							if (request.getAttribute("pageno") != null) {
								pageno = (Integer) request.getAttribute("pageno");
								if (pageno <= 0) {
							pageno = 1;
								}
							}
							if (request.getAttribute("pageCount") != null) {
								pageCount = (Integer) request.getAttribute("pageCount");
								if (pageno > pageCount) {
							pageno = 1;
								}
							}
						%>
						<form name="thisform" action="qtcx1.jsp" method="get"
							onsubmit="return check();">
							<div class="search"
								style="border-style: groove; border-width: 0px; width: 90%; margin-left: 5%;">
								<table width="95%" border="0" cellpadding="3" cellspacing="1"
									bgcolor="#FFFFFF">
									<caption style="color: red;"></caption>
									<tbody>
										<input type="hidden" id="num" name="num" value="1" />
										<input type="hidden" name="tag" value=<%=tag%>>

										<tr>
											<td colspan="2" align="left" bgcolor="#FFFFFF"
												style="padding-left: 20px;">
												<table bgcolor="#FFFFFF" cellspacing="1" cellpadding="0"
													id="sTable">
													<tbody>
														<tr id="row1">
															<td style="width: 60px;" align="center"><img
																src="images/11.gif" title="增加限制条件" onclick="addRow()"
																style="cursor: hand;"> <img src="images/22.gif"
																title="移除限制条件" onclick="removeRow()"
																style="cursor: hand;"></td>
															<td><select name="sType0" size="1">
																	<option value="TechName">技术名称</option>
																	<option value="FieldId">技术领域</option>
																	<option value="FillTime">发布时间</option>
															</select> <input type="text" size="50" maxlength="80" name="q0"
																id="q0"> <input type="submit" class="submit"
																value="&nbsp;查&nbsp;询&nbsp;" size="30"></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
						<div style="height: 600px; width: 855px; margin-left: 10px"
							id="show">
							<!-- 删除开始-->


							<%
								DataBaseDao database = new DataBaseDao();
													String sType0 = null, q0 = null;
													String logic1 = null, sType1 = null, q1 = null;
													String logic2 = null, sType2 = null, q2 = null;
													String logic3 = null, sType3 = null, q3 = null;
													String logic4 = null, sType4 = null, q4 = null;
													request.setCharacterEncoding("utf-8");
													response.setCharacterEncoding("utf-8");
													String num = request.getParameter("num");
													System.out.println("num--" + num);
							%>
							<%
								int pageno1 = 0;
													int pagesize1 = 0;
													int requid = 0;
													String size1 = request.getParameter("pagesize");
													if (size1 != null) {
														pagesize1 = Integer.parseInt(size1);
													}
													if (pagesize1 <= 0) {
														pagesize1 = 15;
													}
													String no = request.getParameter("pageno");
													if (no != null) {
														pageno1 = Integer.parseInt(no);
													}

													if (pageno1 <= 0) {
														pageno1 = 1;
													}
													Connection con = database.connection();

													ArrayList<Technology> technologylist;
													int pageCount1;
													String username=wbuser.getUsername();
													if (num == null) {
														System.out.println("你进入无num操作");
														technologylist = Technologymodel.techlist1(con, pageno1,
																pagesize1,username);
														pageCount1 = Technologymodel.techpage1(con, pageno1, pagesize1,username);
														if (pageno1 > pageCount1) {
															pageno1 = 1;
															technologylist = Technologymodel.techlist1(con, pageno1,
																	pagesize1,username);
															pageCount1 = Technologymodel.techpage1(con, pageno1,
																	pagesize1,username);
														}

													} else {
														System.out.println("你进入有num操作");
														sType0 = request.getParameter("sType0");
														if (request.getParameter("q0") != null) {
															q0 = request.getParameter("q0");
														}

														logic1 = request.getParameter("logic1");
														sType1 = request.getParameter("sType1");
														if (request.getParameter("q1") != null) {
															q1 = request.getParameter("q1");
														}

														logic2 = request.getParameter("logic2");
														sType2 = request.getParameter("sType2");
														if (request.getParameter("q2") != null) {
															q2 = request.getParameter("q2");
																	/* new String(request.getParameter("q2").getBytes(
																	"iso8859-1"), "UTF-8"); */
														}

														logic3 = request.getParameter("logic3");
														sType3 = request.getParameter("sType3");
														if (request.getParameter("q3") != null) {
															q3 = request.getParameter("q3");
														}

														technologylist = Technologymodel.techlist21(con, pageno1,
																pagesize1, num, sType0, q0, logic1, sType1, q1, logic2,
																sType2, q2,username);
														pageCount1 = Technologymodel
																.techpage21(con, pageno1, pagesize1, num, sType0, q0,
																		logic1, sType1, q1, logic2, sType2, q2,username);
														if (pageno1 > pageCount1) {
															pageno1 = 1;
															technologylist = Technologymodel.techlist21(con, pageno1,
																	pagesize1, num, sType0, q0, logic1, sType1, q1,
																	logic2, sType2, q2,username);
															pageCount1 = Technologymodel.techpage21(con, pageno1,
																	pagesize1, num, sType0, q0, logic1, sType1, q1,
																	logic2, sType2, q2,username);
														}
													}
													con.close();
							%>
							<table width='100%'>
								<tr align="center" bgcolor="#c0e4fa">
									<th width='40px'>序号</th>
									<th width='600px'>技术名称</th>
									<th>发布时间</th>
								</tr>
								<%
									int i = 0;
															for (Technology tech : technologylist) {
																i = i + 1;
																String bg = null;
																if (i % 2 == 1) {
																	bg = "#ffffff";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowTechTest.jsp?TechId=<%=tech.getTechId()%>&OrgaId=<%=tech.getOrgaId()%>&tag=<%= tag %>','refresh');return false;"><%=tech.getTechName()%></a></td>
									<td align="center"><%=tech.getFillTime()%></td>
								</tr>
								<%
									} else {
																	bg = "#F0F0F0";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowTechTest.jsp?TechId=<%=tech.getTechId()%>&OrgaId=<%=tech.getOrgaId()%>&tag=<%= tag %>','refresh');return false;"><%=tech.getTechName()%></a></td>
									<td align="center"><%=tech.getFillTime()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</table>
							<div style="background: #C0E4FA; position: relative;">
								<div style="background: #C0E4FA; position: absolute;"
									align="left">
									共有
									<%=i%>
									条最新记录，当前页第<%=pageno1%>/<%=pageCount1%>页 &nbsp;&nbsp; <a
										href="qtcx1.jsp?tag=1&pageno=<%if((pageno1+1)<1) out.print(1);else out.print(pageno1-1);%>">上一页</a>&nbsp;&nbsp;<a
										href="qtcx1.jsp?tag=1&pageno=<%if((pageno1+1)>pageCount1) out.print(pageCount1);else out.print(pageno1+1);%>">下一页</a>
								</div>
								<form name="form1" method="post" action="qtcx1.jsp?tag=<%= tag %>">
									<div align="right">
										<a href="qtcx1.jsp?tag=1&pageno=1">首页</a>&nbsp;&nbsp;<a
											href="qtcx1.jsp?tag=1&pageno=<%=pageCount1%>">尾页</a> 跳转到 <input
											type="text" size="1" style="width: 20px; height: 15px;"
											name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#?tag=<%= tag %>"
											onclick="form1submit()">跳转</a>
									</div>
								</form>
							</div>
							<!-- 删除结束-->
						</div>
						<%
							}
								  if(tag.equals("4")){
					    %>
					    <%
							request.setCharacterEncoding("UTF-8");
							response.setCharacterEncoding("UTF-8");
							/* String type =(String)request.getAttribute("type"); */
							String keyword = (String) request.getAttribute("keyword");

							int pageno = 0;
							int pagesize = 0;
							int pageCount = 1;
							String size = (String) request.getAttribute("pagesize");
							if (size != null) {
								pagesize = Integer.parseInt(size);
							}

							if (pagesize <= 0) {
								pagesize = 15;
							}

							if (request.getAttribute("pageno") != null) {
								pageno = (Integer) request.getAttribute("pageno");
								if (pageno <= 0) {
							pageno = 1;
								}
							}
							if (request.getAttribute("pageCount") != null) {
								pageCount = (Integer) request.getAttribute("pageCount");
								if (pageno > pageCount) {
							pageno = 1;
								}
							}
						%>
						<form name="thisform" action="qtcx1.jsp" method="get"
							onsubmit="return check();">
							<div class="search"
								style="border-style: groove; border-width: 0px; width: 90%; margin-left: 5%;">
								<table width="95%" border="0" cellpadding="3" cellspacing="1"
									bgcolor="#FFFFFF">
									<caption style="color: red;"></caption>
									<tbody>
										<input type="hidden" id="num" name="num" value="1" />
										<input type="hidden" name="tag" value=<%=tag%>>

										<tr>
											<td colspan="2" align="left" bgcolor="#FFFFFF"
												style="padding-left: 20px;">
												<table bgcolor="#FFFFFF" cellspacing="1" cellpadding="0"
													id="sTable">
													<tbody>
														<tr id="row1">
															<td style="width: 60px;" align="center"><img
																src="images/11.gif" title="增加限制条件" onclick="addRow()"
																style="cursor: hand;"> <img src="images/22.gif"
																title="移除限制条件" onclick="removeRow()"
																style="cursor: hand;"></td>
															<td><select name="sType0" size="1">
																	<option value="TechName">技术名称</option>
																	<option value="FieldId">技术领域</option>
																	<option value="FillTime">发布时间</option>
															</select> <input type="text" size="50" maxlength="80" name="q0"
																id="q0"> <input type="submit" class="submit"
																value="&nbsp;查&nbsp;询&nbsp;" size="30"></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
						<div style="height: 600px; width: 855px; margin-left: 10px"
							id="show">
							<!-- 删除开始-->


							<%
								DataBaseDao database = new DataBaseDao();
													String sType0 = null, q0 = null;
													String logic1 = null, sType1 = null, q1 = null;
													String logic2 = null, sType2 = null, q2 = null;
													String logic3 = null, sType3 = null, q3 = null;
													String logic4 = null, sType4 = null, q4 = null;
													request.setCharacterEncoding("utf-8");
													response.setCharacterEncoding("utf-8");
													String num = request.getParameter("num");
													System.out.println("num--" + num);
							%>
							<%
								int pageno1 = 0;
													int pagesize1 = 0;
													int requid = 0;
													String size1 = request.getParameter("pagesize");
													if (size1 != null) {
														pagesize1 = Integer.parseInt(size1);
													}
													if (pagesize1 <= 0) {
														pagesize1 = 15;
													}
													String no = request.getParameter("pageno");
													if (no != null) {
														pageno1 = Integer.parseInt(no);
													}

													if (pageno1 <= 0) {
														pageno1 = 1;
													}
													Connection con = database.connection();

													ArrayList<Technology> technologylist;
													int pageCount1;
													String username=wbuser.getUsername();
													if (num == null) {
														System.out.println("你进入无num操作");
														technologylist = Technologymodel.techlist11(con, pageno1,
																pagesize1,username);
														pageCount1 = Technologymodel.techpage11(con, pageno1, pagesize1,username);
														if (pageno1 > pageCount1) {
															pageno1 = 1;
															technologylist = Technologymodel.techlist11(con, pageno1,
																	pagesize1,username);
															pageCount1 = Technologymodel.techpage11(con, pageno1,
																	pagesize1,username);
														}

													} else {
														System.out.println("你进入有num操作");
														sType0 = request.getParameter("sType0");
														if (request.getParameter("q0") != null) {
															q0 = request.getParameter("q0");
														}

														logic1 = request.getParameter("logic1");
														sType1 = request.getParameter("sType1");
														if (request.getParameter("q1") != null) {
															q1 = request.getParameter("q1");
														}

														logic2 = request.getParameter("logic2");
														sType2 = request.getParameter("sType2");
														if (request.getParameter("q2") != null) {
															q2 = request.getParameter("q2");
																	/* new String(request.getParameter("q2").getBytes(
																	"iso8859-1"), "UTF-8"); */
														}

														logic3 = request.getParameter("logic3");
														sType3 = request.getParameter("sType3");
														if (request.getParameter("q3") != null) {
															q3 = request.getParameter("q3");
														}

														technologylist = Technologymodel.techlist211(con, pageno1,
																pagesize1, num, sType0, q0, logic1, sType1, q1, logic2,
																sType2, q2,username);
														pageCount1 = Technologymodel
																.techpage211(con, pageno1, pagesize1, num, sType0, q0,
																		logic1, sType1, q1, logic2, sType2, q2,username);
														if (pageno1 > pageCount1) {
															pageno1 = 1;
															technologylist = Technologymodel.techlist211(con, pageno1,
																	pagesize1, num, sType0, q0, logic1, sType1, q1,
																	logic2, sType2, q2,username);
															pageCount1 = Technologymodel.techpage211(con, pageno1,
																	pagesize1, num, sType0, q0, logic1, sType1, q1,
																	logic2, sType2, q2,username);
														}
													}
													con.close();
							%>
							<table width='100%'>
								<tr align="center" bgcolor="#c0e4fa">
									<th width='40px'>序号</th>
									<th width='600px'>技术名称</th>
									<th>发布时间</th>
								</tr>
								<%
									int i = 0;
										for (Technology tech : technologylist) {
												i = i + 1;
												String bg = null;
										if (i % 2 == 1) {
												bg = "#ffffff";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowTechTest.jsp?TechId=<%=tech.getTechId()%>&OrgaId=<%=tech.getOrgaId()%>&tag=<%= tag %>','refresh');return false;"><%=tech.getTechName()%></a></td>
									<td align="center"><%=tech.getFillTime()%></td>
								</tr>
								<%
									} else {
																	bg = "#F0F0F0";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowTechTest.jsp?TechId=<%=tech.getTechId()%>&OrgaId=<%=tech.getOrgaId()%>&tag=<%= tag %>','refresh');return false;"><%=tech.getTechName()%></a></td>
									<td align="center"><%=tech.getFillTime()%></td>
								</tr>
								<%
									}
								%>
								<%
									}
								%>
							</table>
							<div style="background: #C0E4FA; position: relative;">
								<div style="background: #C0E4FA; position: absolute;"
									align="left">
									共有
									<%=i%>
									条最新记录，当前页第<%=pageno1%>/<%=pageCount1%>页 &nbsp;&nbsp; <a
										href="qtcx1.jsp?tag=4&pageno=<%if((pageno1+1)<1) out.print(1);else out.print(pageno1-1);%>">上一页</a>&nbsp;&nbsp;<a
										href="qtcx1.jsp?tag=4&pageno=<%if((pageno1+1)>pageCount1) out.print(pageCount1);else out.print(pageno1+1);%>">下一页</a>
								</div>
								<form name="form1" method="post" action="qtcx1.jsp?tag=<%= tag %>">
									<div align="right">
										<a href="qtcx1.jsp?tag=4&pageno=1">首页</a>&nbsp;&nbsp;<a
											href="qtcx1.jsp?tag=4&pageno=<%=pageCount1%>">尾页</a> 跳转到 <input
											type="text" size="1" style="width: 20px; height: 15px;"
											name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#?tag=<%= tag %>"
											onclick="form1submit()">跳转</a>
									</div>
								</form>
							</div>
							<!-- 删除结束-->
						</div>
						<% }
								 if(tag.equals("2")){
						%>
						<%
							int pageno =0;
							int pagesize =0;
							int pass=0;
							String size=request.getParameter("pagesize");
							if(size!=null){
								pagesize = Integer.parseInt(size);
							}
							if(pagesize<=0){
								pagesize = 10;
								}
							String no=request.getParameter("pageno");
							if(no!=null){
								pageno = Integer.parseInt(no);
							}
							
							if(pageno<=0){
								 pageno = 1;
								}
						    String techpass=request.getParameter("techpass");
						    if(techpass!=null){
						    	pass=Integer.parseInt(techpass);
						    }
						%>
						<!-- <div
						style="background: #ffffff; height: 30px; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center"></div> -->
						<div
							style="background-color: #ffffff; position: relative; margin-top: -12px; margin-left: 10px; border: #ffffff 2px solid">
							<input type="hidden" value="<%=pageno%>" id="pageno"> <input
								type="hidden" value="<%=pagesize%>" id="pagesize"> <input
								type="hidden" value="<%=pass%>" id="techpass"> <input
								type="hidden" name="tag" value=<%=tag%>>

							<div style="position: relative; min-height: 490px;">
								<fieldset>
									<div
										style="background-color: #ffffff; position: relative; margin-top: 8px; margin-bottom: -12px; margin-left: 90px; border: #ffffff 2px solid">
										<span style="margin-left: 29px"><strong> </strong></span> <select
											class="i-text" name="search" id="search">
											<option value="TechName">技术名称</option>
											<option value="FillTime">发布时间</option>
										</select> <input class="demo2_class1" size="50" maxlength="80"
											name="find" id="find" type="text"> <input id="select"
											style="height: 22px; vertical-align: middle;" type="image"
											src="../images/qd1.gif">
									</div>
								</fieldset>
								<br>
								<div>
									<div id="xdsh" style="height: 600px;"></div>
								</div>
							</div>
						</div>
					</div> <br /> <!-- 内容 --> 
					
					<%
 	}
 					if(tag.equals("3")){ 
 					request.setCharacterEncoding("GBK");
 					response.setCharacterEncoding("GBK");
 					
 					%>
					<form action="/dqwr/TechServletqt" method="post"
						enctype="multipart/form-data" onsubmit="return checkTecSubmit()">
						<table border="1" align="center" bgcolor="#FFFFFF">
							<tr>
								<td><font color="red">(*必填)</font></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术名称
								</td>
								<td><input type="text" name="techname" id="techname"
									style="width: 433px;" /></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;机构代码
								</td>
								<td><input type="text" name="orgaid" id="orgaid"
									style="width: 434px;" /><label name="orgaidlabel"
									id="orgaidlabel"></label></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;单位名称
								</td>
								<td><input type="text" name="organame" id="organame"
									style="width: 434px;" /></td>
							</tr>
							<tr>
								<td>单位法人</td>
								<td><input type="text" name="legalperson" />&nbsp;&nbsp;联系人&nbsp&nbsp&nbsp&nbsp<input
									type="text" name="contacts" /></td>
							</tr>
							<tr>
								<td>地址</td>
								<td><input type="text" name="address" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱&nbsp&nbsp&nbsp&nbsp<input
									type="text" name="email" /></td>
							</tr>
							<tr>
								<td>联系电话</td>
								<td>固话：<input type="text" name="tel" />&nbsp&nbsp&nbsp&nbsp手机：&nbsp<input
									type="text" name="cel" /></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;单位性质
								</td>
								<td><input type="radio" name="natureid" id="natureid"
									value="企业">企业 <input type="radio" name="natureid"
									id="natureid" value="高等院校">高等院校 <input type="radio"
									name="natureid" id="natureid" value="研究机构">研究机构 <input
									type="radio" name="natureid" id="natureid" value="其他">其他，请注明<input
									type="text" name="othernature" style="width: 117px;"></td>
							</tr>
							<tr>
								<td>单位简介</td>
								<td><textarea cols="80" rows="8" name="introduction"
										placeholder="(包括：结构成立时间、规模、主要产品等)"></textarea></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术来源
								</td>
								<td><input type="radio" name="sourceid" value="自主研发">自主研发
									<input type="radio" name="sourceid" value="合作开发">合作开发 <input
									type="radio" name="sourceid" value="技术引进吸收再创新">技术引进吸收再创新</br>
									<input type="radio" name="sourceid" value="技术引进">技术引进，请注明技术持有单位<input
									type="text" name="techowner" style="width: 117px;"></br> <input
									type="radio" name="sourceid" value="其他">其他，请注明<input
									type="text" name="othersource" style="width: 117px;"></td>
							</tr>
							 <tr>
     <td>&nbsp;<label style="color:red;">*</label>&nbsp;技术领域</td>
     <td><input type="checkbox" name="fieldid" id="fieldid" value="新能源技术">新能源技术
         <input type="checkbox" name="fieldid" id="fieldid" value="大气污染治理技术">大气污染治理技术
         <input type="checkbox" name="fieldid" id="fieldid" value="污水处理技术">污水处理技术</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="固废处理技术">固废处理技术
         <input type="checkbox" name="fieldid" id="fieldid" value="污染场地修复技术">污染场地修复技术
         <input type="checkbox" name="fieldid" id="fieldid" value="建筑节能技术">建筑节能技术</br>
         <input type="checkbox" name="fieldid" id="fieldid" value="工业节能技术">工业节能技术
         <input type="checkbox" name="fieldid" id="fieldid" value="余热利用技术">余热利用技术
         <input type="checkbox" name="fieldid" id="fieldid" value="其他">其他，请注明(可多选)<input type="text" name="otherfield" style="width: 117px; ">
     </td>
     </tr>
							<tr>
								<td>技术简介</td>
								<td><textarea cols="80" rows="8" name="techoverview"
										placeholder="(包括：技术原理、指标、关键设备及先进/创新性描述等)"></textarea></td>
							</tr>
							<tr>
								<td>适用范围</td>
								<td><textarea cols="80" rows="8" name="scope"
										placeholder="(包括：行业、使用限定条件等)（行业参见国民经济行业分类三级目录）"></textarea></td>
							</tr>
							<tr>
								<td>先进度</td>
								<td><input type="radio" name="progressid" value="国际领先">国际领先
									<input type="radio" name="progressid" value="国际先进">国际先进
									<input type="radio" name="progressid" value="国内领先">国内领先
									<input type="radio" name="progressid" value="国内先进">国内先进
								</td>
							</tr>
							<tr>
								<td>成熟度</td>
								<td><input type="radio" name="stateid" value="示范应用">示范应用
									<input type="radio" name="stateid" value="规模化应用">规模化应用
									<input type="radio" name="stateid" value="未产业化">未产业化</td>
							</tr>
							<tr>
								<td>经济指标</td>
								<td><textarea cols="80" rows="8" name="econindicator"
										placeholder="(包括：投资、运行维护费用、投资回收期、预期效益等)"></textarea></td>
							</tr>
							<tr>
								<td>节能减排预期效果</td>
								<td><textarea cols="80" rows="8" name="result"
										placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
								</td>
							</tr>
							<tr>
								<td>成果转发方式</td>
								<td><input type="radio" name="transid" value="技术转让">技术转让
									<input type="radio" name="transid" value="技术授权">技术授权 <input
									type="radio" name="transid" value="技术服务">技术服务 <input
									type="radio" name="transid" value="已转让">已转让（受合约约束不能转让）<br>
									<input type="radio" name="transid" value="其他"> 其他，请注明<input
									type="text" name="othertransfrom" style="width: 117px;">
								</td>
							</tr>
							<tr>
								<td>成果融资需求</td>
								<td><input type="radio" name="finaneedid" value="股权融资">股权融资
									<input type="radio" name="finaneedid" value="债权融资">债权融资
									<input type="radio" name="finaneedid" value="其他">
									其他，请注明<input type="text" name="otherneed" style="width: 117px;">
								</td>
							</tr>
							<tr>
								<td>成果的融资需<br>求金额（万元）
								</td>
								<td><input type="text" name="money"
									style="height: 32px; width: 142px"></td>
							</tr>
							<tr>
								<td style="width: 152px; height: 14px"><strong>典型案例情况：</strong></td>
							</tr>
							<tr>
								<td>&nbsp;<label style="color: red;">*</label>&nbsp;案例数量
								</td>
								<td><input type="radio" name="casenumber" id="casenumber"
									value="0" onclick="select0()">无 <input type="radio"
									name="casenumber" id="casenumber" value="1" onclick="select1()">1个
									<input type="radio" name="casenumber" id="casenumber" value="2"
									onclick="select2()">2个 <input type="radio"
									name="casenumber" id="casenumber" value="3" onclick="select3()">3个
									<input type="radio" name="casenumber" id="casenumber"
									value="多个">多个</td>
							</tr>

							<!--案例1开始  -->
							<tbody id="case1" name="case1">
								<tr>
									<td>
										<h3>案例1</h3> <input type="hidden" name="num1" id="num1"
										value="1">
									</td>
								</tr>
								<tr>
									<td>&nbsp;<label style="color: red;">*</label>&nbsp;案例名称
									</td>
									<td><input type="text" name="casename" id="casename" />&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input
										type="text" name="starttime" /></td>
								</tr>
								<tr>
									<td>&nbsp;<label style="color: red;">*</label>&nbsp;实施单位
									</td>
									<td><input type="text" name="implement" id="implement">&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input
										type="text" name="cooperation" /></td>
								</tr>
								<tr>
									<td>联系人</td>
									<td><input type="text" name="contact" />&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input
										type="text" name="casetel" /></td>
								</tr>
								<tr>
									<td>项目情况</td>
									<td><textarea cols="80" rows="8" name="caseoverview"
											placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea></td>

									<tr>
 																					     <td>项目实施后节能减排效果</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="effect"
											placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>项目实施后企业效益及经济效益</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="benefit"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>用户对本项技术的综合性评价</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="appraisal"
											placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
 																						</td>
 																					     </tr>
 																						<tr>
 																					     <td>相关证明材料</td>
 																					     <td id="more1">
 																							上传附件（图片或者文档）</br>
 																							 <input name="file" type="file" 
										label="上传附件（图片或者文档）" theme="simple">
 																							 <input type="button" value="添加更多..."
										onclick="addMore1()"></br>
 																						</td>
 																						</tr>
 																						</tbody>
 																						<!--案例1结束  -->
 																						
 																						
 																						 <!--案例2开始  -->
 																					      <tbody id="case2" name="case2">
 																					     <tr>
 																					       <td>
 																					       <h3>案例2</h3>
 																					       <input type="hidden" name="num2" id="num2"
										value="1">
 																					       </td>
 																					     </tr>
 																					     <tr>
 																					      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
 																					      <td><input type="text" name="casename2" />&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input
										type="text" name="starttime2" /></td>
 																					     </tr>
 																					     <tr>
 																					      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
 																					      <td><input type="text"
										name="implement2" />&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input
										type="text" name="cooperation2" /></td>
 																					     </tr>
 																					     <tr>
 																					      <td>联系人</td>
 																					      <td><input type="text" name="contact2" />&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input
										type="text" name="casetel2" /></td>
 																					     </tr>
 																					     <tr>
 																					     <td>项目情况</td>
 																					     <td>
 																							<textarea cols="80" rows="8"
											name="caseoverview2"
											placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
 																						</td>
 																						 
								<tr>
 																					     <td>项目实施后节能减排效果</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="effect2"
											placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>项目实施后企业效益及经济效益</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="benefit2"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>用户对本项技术的综合性评价</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="appraisal2"
											placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
 																						</td>
 																					     </tr>
 																						<tr>
 																					     <td>相关证明材料</td>
 																					     <td id="more2">
 																							上传附件（图片或者文档）</br>
 																							 <input name="file" type="file"
										label="上传附件（图片或者文档）" theme="simple">
 																							 <input type="button" value="添加更多..."
										onclick="addMore2()"></br>
 																						</td>
 																						</tr>
 																						</tbody>
 																						<!--案例2结束  -->
 																						
 																						 <!--案例3开始  -->
 																					      <tbody id="case3" name="case3">
 																					     <tr>
 																					       <td>
 																					       <h3>案例3</h3>
 																					       <input type="hidden" name="num3" id="num3"
										value="1">
 																					       </td>
 																					     </tr>
 																					     <tr>
 																					      <td>&nbsp;<label style="color:red;">*</label>&nbsp;案例名称</td>
 																					      <td><input type="text" name="casename3" />&nbsp&nbsp&nbsp&nbsp起始时间&nbsp<input
										type="text" name="starttime3" /></td>
 																					     </tr>
 																					     <tr>
 																					      <td>&nbsp;<label style="color:red;">*</label>&nbsp;实施单位</td>
 																					      <td><input type="text"
										name="implement3" />&nbsp&nbsp&nbsp&nbsp合作方式&nbsp<input
										type="text" name="cooperation3" /></td>
 																					     </tr>
 																					     <tr>
 																					      <td>联系人</td>
 																					      <td><input type="text" name="contact3" />&nbsp&nbsp&nbsp&nbsp联系电话&nbsp<input
										type="text" name="casetel3" /></td>
 																					     </tr>
 																					     <tr>
 																					     <td>项目情况</td>
 																					     <td>
 																							<textarea cols="80" rows="8"
											name="caseoverview3"
											placeholder="（包括：主要工艺原理、流程、一次性投资、运行和维护成本等）"></textarea>
 																						</td>
 																						 
								<tr>
 																					     <td>项目实施后节能减排效果</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="effect3"
											placeholder="(包括：能有效提高比例/污染物减排量/温室气体消减量/副产能源利用量/新能源所占比例等具体指标)"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>项目实施后企业效益及经济效益</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="benefit3"></textarea>
 																						</td>
 																					     </tr>
 																					     <tr>
 																					     <td>用户对本项技术的综合性评价</td>
 																					     <td>
 																							<textarea cols="80" rows="8" name="appraisal3"
																				placeholder="(包括：实施的效果、存在的问题及有待改进的地方)"></textarea>
 																						</td>
 																					     </tr>
 																						<tr>
 																					     <td>相关证明材料</td>
 																					     <td id="more3">
 																							上传附件（图片或者文档）</br>
 																							 <input name="file1" type="file"
																				label="上传附件（图片或者文档）" theme="simple">
 																							 <input type="button" value="添加更多..."
																					onclick="addMore3()"></br>
 																						</td>
 																						</tr>
 																						</tbody>
 																						<!--案例3结束  -->
 																							
 																						<tr>
 																						   <td>填报时间</td>
 																						   <td><input type="text" name="filltime"
									style="width: 215px; " onclick="new Calendar().show(this);"></td>
 																						</tr>   
 																						<tr style="display:none">
 																						<td>
 																						用户昵称
 																						</td>
 																						   <td><input type="text" name="username" value="<%=wbuser.getUsername()%>"></td>
 																						</tr>           
 																					  </table>
 																					  <br>
 																					   <p align="center">
 												 <input type="submit" id="btnSubmit" value="提交"
								style="height: 30px; width: 65px; background-color: #408080;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input
								type="reset" value="取消"
								style="height: 30px; width: 65px; background-color: #408080;">
 																					   </p>
 																					  </form>
 																		<%  }
 																			}
																		 %>
				</td>
				<%}
			  else{ %> 
			  <tr bgcolor="#FEFEFE">
				<td colspan="2" border="0" valign="top" bgcolor="#ffffff">
					<div id="body">
						<!-- OA树开始-->
						<div
							style="background: #3FA0F1; height: 30px; width: 170px; margin-top: 5px; margin-left: 2px"
							align="center">
							<font color="#ffffff" style="top: 4px; position: relative;">菜单</font>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px;"
							align="left" ;id="huoqu"><img style="margin-left: 15px;" src="images/tubiao.jpg"
										width="12px" height="12px;" ;id="fabu">
									<a href="" id="public">我要发布</a>
									<!-- 嵌入添加 -->
							<!-- ajax添加 -->
							<iframe src="" id="testFrame" name="testFrame"
										style="width: 100%; height: 100%;" frameborder="0"
										marginwidth="0" marginheight="0" height="100%;" scrolling="no"
										allowtransparency="true"> </iframe>
							<!-- 添加结束     -->
						</div>
						<div
										style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
										align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
											width="12px" height="12px;"><a
											href="<%=path%>/qt/qtcx1.jsp?tag=1">我已发布</a>
						</div>
						<div
										style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
										align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
											width="12px" height="12px;"><a
											href="<%=path%>/qt/qtcx1.jsp?tag=1">已征集</a>
						</div>
						<div
										style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
										align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
											width="12px" height="12px;"><a
											href="<%=path%>/qt/qtcx1.jsp?techpass=5&tag=2">已退回</a>
						</div>
						<br> <br> <br> <br> <br>

					</div> <font></font>
				
								</td>
			  <td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<div
						style="background: #ffffff; height: 30px; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center"></div>
 					    <div align="center"
						style="background:#ffffff;height:30px;width:865px;margin-top:3px;margin-left:10px"
						align="left">&nbsp;&nbsp;</div>
	    
					<div style="height: 600px; width: 855px; margin-left: 10px"
						id="show">
						<!-- 删除开始-->
                  <p align="center">
							<font size="5" color="red">只有注册用户才能访问</font>
						</p>

						<!-- 删除结束-->

					</div> <br /> <!-- 内容 -->
				</td>
			</tr>
			
			
			<tr>
			  <%}%>
			</tr>
			<tr>
				<td height="29" colspan="4"><div align="center">
						<font color=#000099 size="4"><strong>友情链接</strong></font> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--政府网站--</option>
							<option value="http://www.hebei.gov.cn/">中国.河北</option>
							<option value="http://www.hebstd.gov.cn/">省科学技术厅</option>
							<option value="http://www.ii.gov.cn/">省信息产业厅</option>
							<option value="http://www.hbdrc.gov.cn/">省发改委</option>
							<option value="http://www.hee.cn/">省教育厅</option>
							<option>------------</option>
							<option value="http://www.most.gov.cn/">科学技术部</option>
							<option value="http://www.sdpc.gov.cn/">国家发改委</option>
							<option value="http://www.moe.edu.cn/">教育部</option>
							<option value="http://www.sipo.gov.cn/">国家知识产权局</option>
							<option value="http://www.cas.cn/">中国科学院</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--本省科技--</option>
							<option
								value="http://www.sjzkj.gov.cn/cyportal/template/site00_index.jsp">石家庄</option>
							<option value="http://www.chengde.gov.cn/">承德市</option>
							<option value="http://www.zjkkj.gov.cn/">张家口市</option>
							<option value="http://www.tskj.com.cn/">唐山市</option>
							<option value="http://www.lfinfo.gov.cn/">廊坊市</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--各省科技--</option>
							<option value="http://www.heinfo.gov.cn/Home/Index.asp">河北科技信息网</option>
							<option value="http://www.bjkw.gov.cn/n8785584/index.html">北京市科委</option>
							<option value="http://www.tisti.ac.cn/">天津科技网</option>
							<option value="http://www.sxinfo.gov.cn/">中国山西之窗</option>
							<option value="http://www.nmsti.com/2014/">内蒙古科技信息网</option>
							<option value="http://www.lninfo.gov.cn/">辽宁科技信息网</option>
							<option value="http://kjt.jl.gov.cn/kjt/4/tindex.shtml">吉林科学技术厅</option>
							<option value="http://www.hljkjt.gov.cn/">黑龙江科技厅</option>
							<option value="http://www.jsinfo.gov.cn/">江苏科技信息网</option>
							<option value="http://www.zjinfo.gov.cn/">浙江科技网</option>
							<option value="http://www.ahinfo.gov.cn/">安徽科技网</option>
							<option value="http://www.fjinfo.gov.cn/">福建科技网</option>
							<option value="http://www.jxinfo.gov.cn/">江西科技信息网</option>
							<option value="http://www.sdstc.gov.cn/">山东科学技术厅</option>
							<option value="http://www.hnkjt.gov.cn/new/index.eiip">河南科技网</option>
							<option value="http://www.hbstd.gov.cn/">湖北科学技术厅</option>
							<option value="http://www.sti.gd.cn/">广东金科网</option>
							<option value="http://www.cstc.gov.cn/">重庆市科委</option>
							<option
								value="http://www.sninfo.gov.cn:8083/initSnFirstPageList.do?method=initSnFirstPageList">陕西科技信息网</option>
							<option value="http://www.xjinfo.gov.cn/">新疆科技信息网</option>
							<option value="http://www.scst.gov.cn/info/">四川省科学技术厅</option>
							<option value="http://www.gsinfo.net.cn/">甘肃科技信息网</option>
							<option value="http://www.ynst.net.cn/">云南科技信息网</option>

						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--其他科技--</option>
							<option value="http://www.cast.org.cn/">中国科学技术协会</option>
							<option value="http://www.stdaily.com/">科技日报</option>
							<option value="http://www.stdaily.com/">中国科普网</option>
							<option value="http://www.istic.ac.cn/">中国科技信息研究</option>
							<option value="http://www.chinainfo.gov.cn/">中国科技信息</option>
							<option value="http://www.cstec.org/zh/index.aspx">中国科技交流中心</option>
							<option>-----------</option>
							<option value="http://www.picmg.com.cn/">中国计算机行业网</option>
							<option value="http://www.clii.com.cn/">中国轻工信息网</option>
							<option value="http://www.aptchina.com/">中国应用技术网</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--资源网站--</option>
							<option value="http://scitech.people.com.cn/policy/#1">中国科技政策网</option>
							<option value="http://policy.tech110.net/">国家科技成果网</option>
							<option value="http://www.most.gov.cn/dqwr/gjdqwr/">国家科技政策</option>
							<option value="http://www.chinalaw.gov.cn/article/fgkd/xfg/">国务院法制办公室</option>
							<option
								value="http://www.sninfo.gov.cn:8083/initSnZcfgTwoPageList.do?method=initSnZcfgTwoPageList">陕西省科技信息网</option>
							<option value="http://www.51policy.cn/">江苏省科技政策服务网</option>
							<option value="http://zc.k8008.com/">科易网科技政策服务中心</option>
							<option value="http://www.kjzj.org.cn/">中关村科技服务平台</option>
							<option value="http://www.dqwrfg.com/html/sort/sort3/index.html">贵州省科技政策法规服务平台</option>
						</select> <select
							onChange="window.open(this.options[this.selectedIndex].value)">
							<option selected>--搜索引擎--</option>
							<option value="http://www.sohu.com/">搜狐</option>
							<option value="http://www.sina.com.cn/">新浪</option>
							<option value="http://www.163.com/">网易</option>
							<option value="http://www.baidu.com/">百度</option>
							<option value="http://www.google.com/">goole</option>
						</select>

					</div></td>
			</tr>
			<tr>
				<td height="29" colspan="4" background="images/index_0900.jpg"
					class="STYLE1"><div align="center">
						<a style="color: #FFFFFF" href="lxwm.jsp">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;设为首页&nbsp;&nbsp;|&nbsp;&nbsp;加入收藏&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="mzsm.jsp" style="color: #ffffff">免责声明</a>
					</div></td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" background="images/index_651.jpg"><div
						align="center" class="STYLE3">
						版权所有 @ 河北省科学技术情报研究院科技政策服务平台 <br> 地址: 河北省石家庄市青园街233号 邮编：050021
					</div></td>
			</tr>

		</table>
		<!-- End Save for Web Slices -->
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#zx").click(function() {
				alert("注销成功");
				jQuery.post("../qtzx", function(response) {
					location.replace('index.jsp');
				});

			});
			$("#zcbtn").click(function() {
				location.replace("zhuce.jsp");
			})
		});
	</script>
	<map name="Map">
		<area shape="rect" coords="21,1,117,37" href="#">
		<area shape="rect" coords="127,2,227,37" href="#">
		<area shape="rect" coords="23,49,143,75" href="#">
		<area shape="rect" coords="152,45,231,82" href="#">
	</map>
</body>
</html>