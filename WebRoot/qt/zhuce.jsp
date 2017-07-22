<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="com.dqwr.technology.dao.impl.*"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.technology.entity.Technology" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js">
	
</script>
<script type="text/javascript">
	function form1submit() {

		document.form1.submit();
	}
</script>
<script language="JavaScript" src="js/yz.js"></script>
<script language="JavaScript" src="js/area.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/index.js"></script>
<script language="JavaScript" src="js/zhuce2.js"></script>
<%
	//YH wbuser = (YH)session.getAttribute("wbuser");
%>
<script language="JavaScript" src="js/qtcx.js"></script>
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
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String type = (String) request.getAttribute("type");
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
						<a href="<%=path %>/qt/index.jsp">首&nbsp;&nbsp;页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/zcfl.jsp">文献资源</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx.jsp?Type=0&Scope=2" >工作动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx.jsp?Type=1&Scope=0">行业动态</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qttjfx.jsp?tag=1">技术需求</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx1.jsp?tag=1">成熟技术</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtcx2.jsp?look=1">创新要素</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
							href="<%=path %>/qt/qtzthd.jsp" style='text-decoration: none;'>专题活动</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							<a
							href="<%=path %>/qt/lxwm.jsp">联系我们</a>
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
				 
				<td   height="25"  colspan="30" background="images/index_03.jpg"  class="STYLE2"><div
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
			<!--  <tr>
      <td colspan="26" background="images/index_03.jpg"><span class="STYLE2">&nbsp;&nbsp;&nbsp;&nbsp;游客您好，今天是2015年5月1日，21:05 ，想浏览更多内容或提交信息请先登录。</span></td>
	    <td>
		    <img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1" height="25" alt=""></td>
	  </tr> -->
			<tr>
				 <td colspan="26"><img src="images/index_04.jpg" width="1047"
					height="3" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="3" alt=""></td>
			</tr>

			<tr bgcolor="#FEFEFE">
				<td colspan="2" border="0" valign="top" bgcolor="#ffffff">
					
						<div id="body">
							<!-- OA树开始-->
							 <tr>  
     
	    <td colspan="4" valign="top"><table width="1044" height="606" border="0" cellpadding="0" cellspacing="0">
           
          <tr>
            <td height="550" background="images/2temp_13.jpg">&nbsp;</td>
            <td class="center" valign="top" bgcolor="#FFFFFF">
            <div style="width: 100%;padding-top: 20px; " align="center"><strong><font>欢迎您注册为河北省大气污染防治技术成果支撑管理与应用服务系统用户</font></strong></div>
            	<div  style="margin-top: 20px;">
					<font size="4"></font>
<!-- 					<form action="../zhuce" method="post"  name="form1" onSubmit="return checkform1();">
 -->					<table border="0" style="padding-left: 250px;" bgcolor="#E5ECFF" height="100%"  width="100%"  >
						<tr><td colspan="4"><font color="#63A1C6">填写说明：红色*为必填的注册信息，建议你填写更多详细信息，以便获得更多资源信息服务</font></td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
						<tr><td  width="30%"></td><td align="left"><font color="red">*</font>用户名</td><td align="left" width="23%"><input type="text" name="username" id="username"><td id="user2" align="left">建议您使用常用的电子邮箱作为用户名</td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>用户密码</td><td align="left" width="23%"><input type="password" name="pwd" id="pwd"><td id="pwd2" align="left">不能少于6个字符不能多于20</td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>确认密码</td><td align="left" width="23%"><input type="password" name="pwd" id="rspwd"><td id="rspwd2"></td></tr>
						<tr><td  width="15%"></td><td align="left">姓名</td><td align="left" width="23%"><input type="text" name="name" id="name"></td><td align="left">请填写真实姓名，以便与您取得联系</td></tr>
						<tr><td  width="15%"></td><td align="left">性别</td><td align="left" width="23%"><input type="radio" value="男" checked="checked" name="sex"/>男 <input type="radio" value="女"  name="sex"/>女</td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>国家/省市</td><td align="left" width="23%">
						<select id="s_province" name="s_province"></select>  
    					<select id="s_city" name="s_city" ></select></td><td>
						<script type="text/javascript">_init_area();</script>
						    <div id="show"></div></td></tr>
						<tr><td  width="15%"></td><td align="left" ><font color="red">*</font>工作单位</td><td align="left" width="23%"><input type="text" name="gzdw" id="gzdw"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>专业方向</td><td align="left" width="23%"><input type="text" name="zyfx" id="zyfx"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>所在行业</td><td align="left" width="23%"><input type="text" name="szhy" id="szhy"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left">教育程度</td><td align="left" width="23%"><input type="text" name="jycd" id="jycd"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left">职称</td><td align="left" width="23%"><input type="text" id="zc" name="zc"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left">通讯地址</td><td align="left" width="23%"><input type="text" name="txdz" id="txdz"></td><td align="left">请您填写详细，以便与您取得联系</td></tr>
						<tr><td  width="15%"></td><td align="left">邮政编码</td><td align="left" width="23%"><input type="text" name="yzbm" id="yzbm"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>手机</td><td align="left" width="23%"><input type="text" name="sj" id="sj"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left">固定电话</td><td align="left" width="23%"><input type="text" name="gddh" id="gddh"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>邮箱</td><td align="left" width="23%"><input type="text" name="yx" id="yx"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left"><font color="red">*</font>QQ</td><td align="left" width="23%"><input type="text" name="qq" id="qq"></td><td></td></tr>
						<tr><td  width="15%"></td><td align="left">MSN</td><td align="left" width="23%"><input type="text" name="msn" id="msn"></td><td></td></tr>
						<tr><td  width="15%"></td>
			         	<td align="left">验证码</td>
			         	<td align="left" width="23%"><input type="text" size="8" name="randcode" id="randcode"></td>
			         	<td align="left"><img src="images/randCode.jsp" id='shuaxin' width="50" height="25">
			         	</tr>
						
						<!-- <tr><td><font color="red">*</font>用户昵称</td><td><input type="text" name="yhnc" id="yhnc"><td id="yhnc2"><font color="red">不能用数字开头</font></td></tr>
						<tr><td><font color="red">&nbsp;</font>用户邮箱</td><td><input type="text" name="yhyx" id="yhyx"><td id="yhyx2"><font color="red"></font></td></tr>
						 -->
						 <tr><td  width="15%"></td><td align="center" width="9%" ><input type="button" id="zctj"  value="注册"  style="width: 65px; height: 27px;font-size:16px;"></td>
						 <td align="center" width="16%"><input type="reset" style="width: 65px; height: 27px;font-size:16px;"/></td></tr>
					</table>
					<!-- </form> -->
				</div>
           </td>
           <td height="550" background="images/2temp_13.jpg">&nbsp;</td>
          <!--   <td background="images/2temp_15.jpg">&nbsp;</td> -->
          </tr>
        <!--   <tr>
            <td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>
            <td height="14" background="images/2temp_18.jpg"></td>
            <td><img src="images/2temp_19.jpg"  width="17" height="14"></td>
          </tr> -->
          <!-- <tr></tr> -->
        </table></td>
	  </tr>

						</div>
						<font></font>
				</td>

				<td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<!-- <div
						style="background: #ffffff; height: 30px; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center"></div>
 					    <div align="center" style="background:#ffffff;height:30px;width:865px;margin-top:3px;margin-left:10px"align="left">&nbsp;&nbsp;</div>
	    
					<div style="height: 600px; width: 855px; margin-left: 10px"
						id="show">
						删除开始

						删除结束

					</div>  --><br /> <!-- 内容 -->
				</td>
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
$(document).ready(function () {
	$("#zx").click(function(){
		alert("注销成功");
		jQuery.post("../qtzx",
				function(response){
			location.replace('denglu.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
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