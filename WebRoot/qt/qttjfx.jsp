<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.requirement.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.requirement.dao.impl.*"
	import="com.dqwr.requirement.entity.Requirement" pageEncoding="UTF-8"%>
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
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
/* function checkReqSubmit()
{  
	var orgaid=$("#orgaid").val();
	var organame=$("#organame").val();
	var natureid=$('input:radio[name="natureid"]:checked').val();
	var requname=$("#requname").val();
    var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
	var cooperationid=$('input:radio[name="cooperationid"]:checked').val();
	int len = orgaid.length();
	alert(len);
	if(orgaid==""||organame==null||natureid==null||requname==""||fieldid==null||cooperationid==null){
		alert("必填项不能为空!");
		return false;
	} else if(len<9||len>9) {
		alert("机构代码填写错误!");
		return false;
	}else{
		return true;
	}
} */ 
 
$(function(){
	$("#btnSubmit").click(function(){
		var orgaid=$("#orgaid").val();
	    int len=orgaid.length();
	    System.out.println("len"+len);
		var organame=$("#organame").val();
		var natureid=$('input:radio[name="natureid"]:checked').val();
		var requname=$("#requname").val();
		var fieldid=$('input:checkbox[name="fieldid"]:checked').val();
		var cooperationid=$('input:radio[name="cooperationid"]:checked').val();
		if(orgaid==""||organame==null||natureid==null||requname==""||fieldid==null||cooperationid==null){
			alert("必填项不能为空!");
			return false;
		}else{
			return true;
		}
	});
});
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
	 }); */
</script>
<script>
jQuery(function() {//上来就显示所有的
		jQuery.post("/dqwr/qt/jquery/xdsh.jsp", {
			"pagesize" : jQuery("#pagesize").val(),			 
			"pageno" : jQuery("#pageno").val(),
			"search" : jQuery("#search").val(),
			"find" : jQuery("#find").val(),
			"reqpass" : jQuery("#reqpass").val(),
		}, function(response) {
			jQuery("#xdsh").html(response);
		});
		$("#select").click(function() {//点击确定按钮 按条件查询
			jQuery.post("/dqwr/qt/jquery/xdsh.jsp", {
				"pagesize" : jQuery("#pagesize").val(),
				"pageno" : jQuery("#pageno").val(),
				"reqpass" : jQuery("#reqpass").val(),
				"search" : jQuery("#search").val(),
				"find" : jQuery("#find").val(),
			}, function(response) {
				jQuery("#xdsh").html(response);
			});
		});
	});
  function addMore()
  {
      var td = document.getElementById("more");
      
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
      }
      td.appendChild(br);
      td.appendChild(input);
      td.appendChild(button);
  }
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
		if (t.rows.length >= 3) {
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
		e2.options[0] = new Option("需求名称", "RequName");
		e2.options[1] = new Option("技术领域", "FieldId");
		e2.options[2] = new Option("关键词", "Keyword");
		e2.options[3] = new Option("发布时间", "FillTime");

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
	function addRow1() {
		var obj = document.getElementById("num");
		var t = document.getElementById("sTable");
		if (t.rows.length >= 2) {
			alert('最多只能有2个条件');
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
		e2.options[0] = new Option("需求名称", "RequName");
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
<script language="JavaScript" src="js/qttjfx.js"></script>
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
		http_request.open("GET", url, true);
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

.STYLE22 {
	color: #fffff;
	font-size: 20px;
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
				<td height="25"  colspan="30" background="images/index_03.jpg"  class="STYLE2"><div
						align="center">
						<div id="nowtime"  ></div>
						
						<%
							if (wbuser != null) {
						%>
						<div style="float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wbuser.getUsername()%>&nbsp;您好，今天是<%=dateNowStr %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						<div align="right">
							<a href="#" id="zx"
								style="color: white">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<%
							}
							else{
								%>
							<div style="float: left;">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游客您好，今天是<%=dateNowStr %>,想浏览更多内容或提交信息请先登陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					<div id="body" style="border-color: #000">
						<!-- OA树开始-->
						<div
							style="background: #3FA0F1; height: 30px; width: 170px; margin-top: 5px; margin-left: 2px"
							align="center">
							<font color="#ffffff" style="top: 4px; position: relative;">菜单</font>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px;"
							align="left" id="huoqu">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;" id="fabu"><a
								href="<%=path%>/qt/qttjfx.jsp?tag=3" class="TeDingStyle">我要发布</a>
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
								href="<%=path%>/qt/qttjfx.jsp?tag=1" class="TeDingStyle">我已发布</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;"><a
								href="<%=path%>/qt/qttjfx.jsp?tag=4">已征集</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;">
							<!--  <a href=""
								class="TeDingStyle"
								onclick="createRequest('xdsh.jsp?reqpass=5','refresh');return false;">已退回</a>  -->
							<a href="<%=path%>/qt/qttjfx.jsp?tag=2&reqpass=5">已退回</a>
						</div>
						<br> <br> <br> <br> <br>
					</div> <font></font>
				</td>

				<td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 嵌入刷新区域 标记id-->
					
					<div id="refresh">
						<!-- 内容 -->
						<%
							//找机构
							if(tag!=null){
							if(tag.equals("1")){
						%>
						<%
							request.setCharacterEncoding("UTF-8");
															response.setCharacterEncoding("UTF-8");
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
						<div
						style="background: #ffffff; height: 30px;color: red; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center">请输入查询条件:</div>
						<form name="thisform" action="qttjfx.jsp" method="get"
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
																	<option value="RequName">需求名称</option>
																	<option value="FieldId">技术领域</option>
																	<option value="Keyword">关键词</option>
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
 						String username=wbuser.getUsername();
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

						ArrayList<Requirement> requirelist;
						int pageCount1;

						if (num == null) {
							System.out.println("你进入无num操作");
							requirelist = Brose.ReuireList11(con, pageno1, pagesize1,username);
							pageCount1 = Brose.RequirePagecount11(con, pageno1, pagesize1,username);
							if (pageno1 > pageCount1) {
								pageno1 = 1;
								requirelist = Brose.ReuireList11(con, pageno1, pagesize1,username);
								pageCount1 = Brose.RequirePagecount11(con, pageno1,pagesize1,username);
							}

						} else {
							System.out.println("你进入有num操作");

							sType0 = request.getParameter("sType0");
							if (request.getParameter("q0") != null) {
								 q0= request.getParameter("q0");	
								System.out.println(q0);

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
							}

							logic3 = request.getParameter("logic3");
							sType3 = request.getParameter("sType3");
							if (request.getParameter("q3") != null) {
								q3 = request.getParameter("q3");
							}

							requirelist = Brose.RequireList21(con, pageno1, pagesize1, num,
									sType0, q0, logic1, sType1, q1, logic2, sType2, q2,username);
							pageCount1 = Brose
									.RequirePagecount21(con, pageno1, pagesize1, num,
											sType0, q0, logic1, sType1, q1, logic2, sType2,
											q2,username);
							if (pageno1 > pageCount1) {
								pageno1 = 1;
								requirelist = Brose.RequireList21(con, pageno1, pagesize1,
										num, sType0, q0, logic1, sType1, q1, logic2,
										sType2, q2,username);
								pageCount1 = Brose.RequirePagecount21(con, pageno1,
										pagesize1, num, sType0, q0, logic1, sType1, q1,
										logic2, sType2, q2,username);
							}
						}
						con.close();																													
							%>
							<table width='100%'>
								<tr align="center" bgcolor="#c0e4fa">
									<th width='40px'>序号</th>
									<th width='600px'>需求名称</th>
									<th>发布时间</th>
								</tr>
								<%
												int i = 0;
												for (Requirement require : requirelist) {
												i = i + 1;
												String bg = null;
												if (i % 2 == 1) {
													bg = "#ffffff";
								%>

								<tr align="left" bgcolor="<%=bg%>">
									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowRequireDetail.jsp?requid=<%=require.getRequId()%>&tag=<%=tag %>','refresh');return false;"><%=require.getRequName()%></a></td>
									<td align="center"><%=require.getFillTime()%></td>
									<%
										requid = require.getRequId();
									%>
								</tr>
								<%
									} else {
																	bg = "#F0F0F0";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowRequireDetail.jsp?requid=<%=require.getRequId()%>&tag=<%=tag %>','refresh');return false;"><%=require.getRequName()%></a></td>
									<td align="center"><%=require.getFillTime()%></td>
									<%
										requid = require.getRequId();
									%>
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
										href="qttjfx.jsp?pageno=<%if((pageno1+1)<1) out.print(1);else out.print(pageno1-1);%>&tag=1">上一页</a>&nbsp;&nbsp;<a
										href="qttjfx.jsp?pageno=<%if((pageno1+1)>pageCount1) out.print(pageCount1);else out.print(pageno1+1);%>&tag=1">下一页</a>
								</div>
								<form name="form1" method="post" action="qttjfx.jsp?tag=<%= tag %>">
									<div align="right">
										<a href="qttjfx.jsp?pageno=1&tag=1">首页</a>&nbsp;&nbsp;<a
											href="qttjfx.jsp?pageno=<%=pageCount1%>&tag=1">尾页</a> 跳转到 <input
											type="text" size="1" style="width: 20px; height: 15px;"
											name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#?pageno=<%=pageCount1%>&tag=1"
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
						<div
						style="background: #ffffff; height: 30px;color: red; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center">请输入查询条件:</div>
						<form name="thisform" action="qttjfx.jsp" method="get"
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
																	<option value="RequName">需求名称</option>
																	<option value="FieldId">技术领域</option>
																	<option value="Keyword">关键词</option>
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
 						String username=wbuser.getUsername();
						System.out.println("技术需求名称"+username);
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

						ArrayList<Requirement> requirelist;
						int pageCount1;

						if (num == null) {
							System.out.println("你进入无num操作");
							requirelist = Brose.ReuireList111(con, pageno1, pagesize1,username);
							pageCount1 = Brose.RequirePagecount111(con, pageno1, pagesize1,username);
							if (pageno1 > pageCount1) {
								pageno1 = 1;
								requirelist = Brose.ReuireList111(con, pageno1, pagesize1,username);
								pageCount1 = Brose.RequirePagecount111(con, pageno1,pagesize1,username);
							}

						} else {
							System.out.println("你进入有num操作");

							sType0 = request.getParameter("sType0");
							if (request.getParameter("q0") != null) {
								 q0= request.getParameter("q0");	
								System.out.println(q0);

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
							}

							logic3 = request.getParameter("logic3");
							sType3 = request.getParameter("sType3");
							if (request.getParameter("q3") != null) {
								q3 = request.getParameter("q3");
							}

							requirelist = Brose.RequireList211(con, pageno1, pagesize1, num,
									sType0, q0, logic1, sType1, q1, logic2, sType2, q2,username);
							pageCount1 = Brose
									.RequirePagecount211(con, pageno1, pagesize1, num,
											sType0, q0, logic1, sType1, q1, logic2, sType2,
											q2,username);
							if (pageno1 > pageCount1) {
								pageno1 = 1;
								requirelist = Brose.RequireList211(con, pageno1, pagesize1,
										num, sType0, q0, logic1, sType1, q1, logic2,
										sType2, q2,username);
								pageCount1 = Brose.RequirePagecount211(con, pageno1,
										pagesize1, num, sType0, q0, logic1, sType1, q1,
										logic2, sType2, q2,username);
							}
						}
						con.close();																													
							%>
							<table width='100%'>
								<tr align="center" bgcolor="#c0e4fa">
									<th width='40px'>序号</th>
									<th width='600px'>需求名称</th>
									<th>发布时间</th>
								</tr>
								<%
												int i = 0;
												for (Requirement require : requirelist) {
												i = i + 1;
												String bg = null;
												if (i % 2 == 1) {
													bg = "#ffffff";
								%>

								<tr align="left" bgcolor="<%=bg%>">
									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowRequireDetail.jsp?requid=<%=require.getRequId()%>&tag=<%=tag %>','refresh');return false;"><%=require.getRequName()%></a></td>
									<td align="center"><%=require.getFillTime()%></td>
									<%
										requid = require.getRequId();
									%>
								</tr>
								<%
									} else {
																	bg = "#F0F0F0";
								%>

								<tr align="left" bgcolor="<%=bg%>">

									<td align="center"><%=i%></td>
									<td><a id="href1" href=""
										onclick="createRequest('ShowRequireDetail.jsp?requid=<%=require.getRequId()%>&tag=<%=tag %>','refresh');return false;"><%=require.getRequName()%></a></td>
									<td align="center"><%=require.getFillTime()%></td>
									<%
										requid = require.getRequId();
									%>
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
										href="qttjfx.jsp?pageno=<%if((pageno1+1)<1) out.print(1);else out.print(pageno1-1);%>&tag=1">上一页</a>&nbsp;&nbsp;<a
										href="qttjfx.jsp?pageno=<%if((pageno1+1)>pageCount1) out.print(pageCount1);else out.print(pageno1+1);%>&tag=1">下一页</a>
								</div>
								<form name="form1" method="post" action="qttjfx.jsp?tag=<%= tag %>">
									<div align="right">
										<a href="qttjfx.jsp?pageno=1&tag=4">首页</a>&nbsp;&nbsp;<a
											href="qttjfx.jsp?pageno=<%=pageCount1%>&tag=4">尾页</a> 跳转到 <input
											type="text" size="1" style="width: 20px; height: 15px;"
											name="pageno" id="jumpPageNo"></input>页&nbsp;&nbsp;<a href="#?pageno=<%=pageCount1%>&tag=4"
											onclick="form1submit()">跳转</a>
									</div>
								</form>
							</div>

							<!-- 删除结束-->
						</div>	 
						 <%
							 }
						 if(tag.equals("2")){
						%>
						<%
													int pageno =0;
													int pagesize =0;
													 
													String size=request.getParameter("pagesize");
													if(size!=null){
														pagesize = Integer.parseInt(size);
													}
													if(pagesize<=0){
														pagesize = 15;
														}
													String no=request.getParameter("pageno");
													if(no!=null){
														pageno = Integer.parseInt(no);
													}
													if(pageno<=0){
														 pageno = 1;
														}
													
													int pass=0;
													String reqpass=request.getParameter("reqpass");
													if(reqpass!=null){
														pass=Integer.parseInt(reqpass);
													} 
						%>
						 <div
						style="background: #ffffff;color: red; color: red; width: 865px; margin-top: 3px; margin-left: 4px"
						align="center">请输入查询条件:</div>
						<div
							style="background-color: #ffffff; position: relative; margin-top: 6px; margin-left: 10px; border: #ffffff 2px solid">
							<input type="hidden" value="<%=pageno%>" id="pageno"> 
							<input	type="hidden" value="<%=pagesize%>" id="pagesize"> 
							<input type="hidden" value="<%=pass%>" id="reqpass">
							<input type="hidden" name="tag" value=<%=tag %>>
							
							<div style="position: relative; min-height: 490px;">
								<fieldset>
									<div
										style="background-color: #ffffff; position: relative; margin-top: 3px; margin-bottom:-15px;margin-left: 90px; border: #ffffff 2px solid">
<!-- 										<span style="margin-left: 29px"></span>
 -->										
										<select class="i-text" name="search" id="search">
											<option value="RequName">需求名称</option>
											<option value="FillTime">填报时间</option>
										</select> <input class="demo2_class1" size="50" maxlength="80"
											name="find" id="find" type="text"> <input id="select"
											style="height: 22px; vertical-align: middle;" type="image"
											src="../images/qd1.gif">
									</div>
								</fieldset>

								<br>
								<div >
									
									<div id="xdsh" style="height:800px;"></div>
								</div>
							</div>
						</div>
						<%
							}
						 if(tag.equals("3")){ %>
										<form action="/dqwr/OrgaServlet1" method="post" onsubmit="return checkReqSubmit()">
											<br>
											<table border="1" align="center" bgcolor="#FFFFFF">
												<tr>
													<td><font color="red">(*必填)</font></td>
												</tr>
												<tr>

													<td>&nbsp;<label style="color: red;">*</label>&nbsp;机构代码
													</td>
													<td><input type="text" name="orgaid" id="orgaid"
														onchange="TestOrgaidIsEx()"><label name="orgaidlabel"
														id="orgaidlabel"></label></td>
												</tr>
												<tr>
													<td>&nbsp;<label style="color: red;">*</label>&nbsp;单位名称
													</td>
													<td><input type="text" name="organame" id="organame" />&nbsp;&nbsp;归口&nbsp&nbsp&nbsp<input
														type="text" name="orgaparentid" /></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;所属行业</td>
													<td><input type="text" name="industryid" /></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;单位法人</td>
													<td><input type="text" name="legalperson" />&nbsp&nbsp联系人&nbsp&nbsp&nbsp&nbsp<input
														type="text" name="contacts" /></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;联系电话</td>
													<td>固话：<input type="text" name="tel" />&nbsp&nbsp&nbsp&nbsp手机&nbsp<input
														type="text" name="cel" /></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;地址</td>
													<td><input type="text" name="address" />&nbsp&nbsp邮箱&nbsp&nbsp&nbsp&nbsp<input
														type="text" name="email" /></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;网址</td>
													<td><input type="text" name="web" /></td>
												</tr>
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
													<td>&nbsp;&nbsp;&nbsp;单位简介</td>
													<td><textarea cols="80" rows="8" name="introduction"
															placeholder="(包括：机构成立时间、规模、研究力量、现有设备、主要产品等)"></textarea></td>
												</tr>
												<tr>
												<tr>
													<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术需求名称
													</td>
													<td><input type="text" name="requname" id="requname"
														style="width: 70%"></td>
												</tr>
												<td>&nbsp;<label style="color: red;">*</label>&nbsp;技术领域
												</td>
												<td><input type="checkbox" name="fieldid" id="fieldid"
													value="新能源技术">新能源技术 <input type="checkbox" name="fieldid"
													id="fieldid" value="大气污染治理技术">大气污染治理技术 <input
													type="checkbox" name="fieldid" id="fieldid" value="污水处理技术">污水处理技术</br>
													<input type="checkbox" name="fieldid" id="fieldid" value="固废处理技术">固废处理技术
													<input type="checkbox" name="fieldid" id="fieldid" value="污染场地修复技术">污染场地修复技术
													<input type="checkbox" name="fieldid" id="fieldid" value="建筑节能技术">建筑节能技术</br>
													<input type="checkbox" name="fieldid" id="fieldid" value="工业节能技术">工业节能技术
													<input type="checkbox" name="fieldid" id="fieldid" value="余热利用技术">余热利用技术
													<input type="checkbox" name="fieldid" id="fieldid" value="其他">其他，请注明(可多选)<input
													type="text" name="otherfield" style="width: 117px;"></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;技术应用行业</td>
													<td><textarea cols="80" rows="8" name="industryid1"></textarea>
													</td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;技术需求概述</td>
													<td><textarea cols="80" rows="8" name="requoverview"
															placeholder="(包括：要解决的重大问题和预期经济社会效益)"></textarea></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;关键字（1-5个）</td>
													<td><input type="text" name="keyword"
														style="height: 44px; width: 468px"></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;需求技术拟应用情况</td>
													<td><textarea cols="80" rows="8" name="application"
															placeholder="(包括：要解决的重大技术问题和预期经济社会效益)"></textarea></td>
												</tr>
												<tr>
												<td>&nbsp;<label style="color: red;">*</label>&nbsp;合作方式
												</td>
												<td><input type="radio" name="cooperationid" id="cooperationid"
													value="技术引进">技术引进 <input type="radio" name="cooperationid"
													id="cooperationid" value="委托研发">委托研发 <input type="radio"
													name="cooperationid" id="cooperationid" value="合作研发">合作研发 <input
													type="radio" name="cooperationid" id="cooperationid" value="其他">其他，请注明
													<input type="text" name="othercooperation"></td>
												</tr>
												<tr>
													<td>&nbsp;&nbsp;&nbsp;填报时间</td>
													<td><input type="text" name="filltime" style="width: 215px;"
														onclick="new Calendar().show(this);"></td>
												</tr>
												 <tr style="display:none">
													<td>&nbsp;&nbsp;&nbsp;用户昵称</td>				
													<td><input type="text" name="username" value="<%=wbuser.getUsername()%>"></td>
												</tr>												 
											</table>
											<br>
											<p align="center">
												<input type="submit" id="btnSubmit" value="提交"
													style="height: 40px; width: 65px; background-color: #408080;"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
													<input	type="reset" value="取消"
													style="height: 40px; width: 65px; background-color: #408080;">
											</p>
										</form>
										<%  }%>
									</div>															   
							<%   }%>  
				</td>
			<%} 
			  else{ %> 
			  <tr bgcolor="#FEFEFE">
				<td colspan="2" border="0" valign="top" bgcolor="#ffffff">
					<div id="body" style="border-color: #000">
						<!-- OA树开始-->
						<div
							style="background: #3FA0F1; height: 30px; width: 170px; margin-top: 5px; margin-left: 2px"
							align="center">
							<font color="#ffffff" style="top: 4px; position: relative;">菜单</font>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px;"
							align="left" id="huoqu">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;" id="fabu"><a href=""
								class="TeDingStyle"
								>我要发布</a>
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
								href="<%=path%>/qt/qttjfx.jsp?tag=1" class="TeDingStyle">我已发布</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;"><a
								href="<%=path%>/qt/qttjfx.jsp?tag=1">已征集</a>
						</div>
						<div
							style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
							align="left">
							<img style="margin-left: 15px;" src="images/tubiao.jpg"
								width="12px" height="12px;">
							<!--  <a href=""
								class="TeDingStyle"
								onclick="createRequest('xdsh.jsp?reqpass=5','refresh');return false;">已退回</a>  -->
							<a href="<%=path%>/qt/qttjfx.jsp?tag=2&reqpass=5">已退回</a>
						</div>
						<br> <br> <br> <br> <br>
					</div> <font></font>
				</td>
			  
			  <td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<div
						style="background: #ffffff; height: 30px; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center"></div>
 					    <div align="center" style="background:#ffffff;height:30px;width:865px;margin-top:3px;margin-left:10px"align="left">&nbsp;&nbsp;</div>
	    
					<div style="height: 600px; width: 855px; margin-left: 10px"
						id="show">
						<!-- 删除开始-->
                  <p align="center"><font size="5" color="red" >只有注册用户才能访问</font></p>

						<!-- 删除结束-->

					</div> <br /> <!-- 内容 -->
				</td>
			</tr>			
			  <%}%> 
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