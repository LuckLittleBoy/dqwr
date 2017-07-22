<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="com.dqwr.technology.dao.impl.*"
	import="java.text.SimpleDateFormat"
	import="com.dqwr.technology.entity.Technology" pageEncoding="UTF-8"
%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function form1submit() {

		document.form1.submit();
	}
</script>
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
.test img{
float:right;
}
br{
clear:both;
}
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
					YH wbuser= (YH) session.getAttribute("wbuser");
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
							<a href="#" id="zx" style="color: white">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
						<div id="body">
							<!-- OA树开始-->
							<div
								style="background: #3FA0F1; height: 30px; width: 170px; margin-top: 5px; margin-left: 2px"
								align="center">
								<font color="#ffffff" style="top: 4px; position: relative;">文献资源</font>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px;"
								align="left">
								<!-- 最后记得改网址哦<%=path%>/qt/images/wxzy.html -->
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://vip.heinfo.gov.cn/productor/pro_zk.shtml">维普中文科技期刊</a>
							</div>
<%-- 							<%=path%>/qt/images/wxzy.html
 --%>							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://vip.heinfo.gov.cn/productor/pro_news.shtml">维普科技经济新闻</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://ccd1.cqvip.com/">维普文献引证追踪系统</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://csi1.cqvip.com/default.aspx">维普科学指标分析系统</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://ccd1.cqvip.com/hcd/HcdDefault.aspx">维普高被引析出文献</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://wfdata.heinfo.gov.cn/C/Periodical.aspx">万方学术期刊论文</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://wfdata.heinfo.gov.cn/C/Thesis.aspx">万方博硕学位论文</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://wfdata.heinfo.gov.cn/C/Conference.aspx">万方学术会议论文</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://wfdata.heinfo.gov.cn/C/Patent.aspx">万方学术会议论文</a>
							</div>
							<div
								style="background: #c0e4fa; height: 30px; width: 170px; margin-top: 2px; margin-left: 2px"
								align="left">
								<img style="margin-left: 15px;" src="images/tubiao.jpg"
									width="12px" height="12px;"><a
									href="http://wfdata.heinfo.gov.cn/C/Patent.aspx">万方中外专利全文</a>
							</div>

						</div>
						<font></font>
				</td>

				<td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<div
						style="background: #ffffff; height: 30px; width: 865px; margin-top: 5px; margin-left: 10px"
						align="center"></div>
 					    <div align="center" style="background:#ffffff;height:30px;width:865px;margin-top:3px;margin-left:10px"align="left">&nbsp;&nbsp;</div>
	    
					<div  class="test" style="height: 600px; width: 855px; margin-left: 10px"
						 id="div_bottom_right_inner">
						<!-- 删除开始-->
			  <table id="tab_img" style="margin-top:-110px;margin-left:-40px">
				<tr>
				<td> <a href="http://www.cqvip.com/"><img style="margin-left:3px;align:left;height:150px; width:200px;" src="images/weipu.png">
				      </a></td>
				<td> <a href="http://www.wanfangdata.com.cn/"><img style="margin-left:3px;align:left;height: 150px; width:200px;" src="images/wanfang.png"	></a></td>
			    <td>  <a href="http://www.cnki.net/"><img style="margin-left:3px;align:left;height: 150px; width:200px;" src="images/zhiwang.png"	 ></a></td>
				   <tr>
						 
				</table> 
				
					</div> <br /> <!-- 内容 -->
				</td>
			</tr>
						  <!-- 链接部分 -->
			
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
			location.replace('index.jsp');
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