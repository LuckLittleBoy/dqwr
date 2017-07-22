<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*,com.dqwr.model.*"
	import="com.dqwr.technology.dao.impl.*" import="java.sql.ResultSet"
	import="com.dqwr.dao.*" import="java.sql.Connection"
	import="com.dqwr.technology.dao.impl.*"
	import="java.text.SimpleDateFormat"
	 import="com.dqwr.requirement.dao.impl.*"
	import="java.sql.ResultSet" import="com.dqwr.dao.*"
	import="java.sql.Connection"
	import="com.dqwr.technology.entity.Technology" 
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>河北省大气污染防治技术成果支撑管理与应用服务系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <link href="css/style.css" type="text/css" rel="stylesheet" />
 --><script language="JavaScript" src="js/jquery-1.9.1.min.js">
 
	
</script>
<script language="JavaScript" src="js/zhuce.js"></script>
<script language="JavaScript" src="js/index.js"></script>
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

/* body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/indexbg.jpg);
	background-repeat: repeat-x;
	background-color: #F3F3F3;;
} */
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/indexbg.jpg);
	background-repeat: repeat-x;
	background-color: #E9F1F4;
	font: 14px/1.5 Tahoma, Helvetica, Arial, sans-serif;
}
.STYLE1 {
	font-size: 13px;
	color: #000033;
	font-weight: bold;
}

.STYLE2 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE3 {
	font-size: 12px;
	color: #205490;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
     
    font-style: normal;
     
    font-variant: normal;
    
}
 
    
td {
	line-height: 16px;
	 
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

li {
	line-height: 25px;
	list-style:
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
				<td><img src="qt/images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="193" alt=""></td>
			</tr>
			<tr>
				<td colspan="26" background="images/index_02.gif"><div
						align="center" class="STYLE1">
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

		 					String requid = request.getParameter("requid");
		 					String pagenp = request.getParameter("pageno");
		 					ResultSet rs1, rs2;
		 					DataBaseDao db = new DataBaseDao();
		 					Connection conn = db.connection();
		 					RequireDaoImpl requireimpl = new RequireDaoImpl();
		 					OrgaDaoImpl orgaimpl = new OrgaDaoImpl();
		 					rs1 = requireimpl.SelectRequireById(conn, Integer.parseInt(requid));

		 					while (rs1.next()) {
		 						rs2 = orgaimpl.SelectOrgaById(conn, rs1.getString(2));
		 						rs2.next();
		 				%>
				<tr>
				 
				<td   height="25" colspan="26" background="images/index_03.jpg"  class="STYLE2"><div
						align="center">
<!-- 						<div id="nowtime"  ></div>
 -->					
 						<div style="float: left;">
						<a href="qt/qttjfx.jsp?tag=2&reqpass=5" style="color: white">&nbsp;&nbsp;&nbsp;&nbsp;返回</a>
						</div>	
 						<%
							if (wbuser != null) {
						%>
						<div style="float: left;colspan=15" >
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wbuser.getUsername()%>&nbsp;您好，今天是<%=dateNowStr %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						<div align="right" >
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
			<!-- <tr>
				 <td colspan="26"><img src="qt/images/index_04.jpg" width="1047"
					height="3" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="1"
					height="3" alt=""></td>
			</tr> -->

			<tr bgcolor="#FEFEFE">
				<!-- <td colspan="2" border="0" valign="top" bgcolor="#ffffff">
					
						<div id="body">							OA树开始
						</div>
						<font></font>
				</td> -->

				<td colspan="2" valign="top" style="margin-left: 4px">
					<!-- 内容 -->
					<!-- <div
						style=" height: 30px; width: 865px; margin-top: 0px; margin-left: 10px"
						align="center"></div>
 					    <div align="center" style="background:#ffffff;height:30px;width:865px;margin-top:3px;margin-left:10px"align="left">&nbsp;&nbsp;</div>
	     -->
					<div align="center" style=" width: 855px;margin-left: 92px"
						id="show">
						<!-- 删除开始-->
						<div style="background-color: #ffffff; position: relative;margin-top: 1px;margin-left: 15px;border: #ffffff 2px solid" >
<%
   if(rs1.getString(14)!=null){
%>
<br>
  <font color="red">形式审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=rs1.getString(14) %></textarea><br>
  <br>
<%
   }
   if(rs1.getString(16)!=null){
%>
  <font color="red">技术审查退回原因</font><br>
  <br>
  <textarea cols="45" rows="7"><%=rs1.getString(16) %></textarea><br>
  <br>
<%  
   }
%>
</div>

  <table align="center" border="1" align="center" bgcolor="#FFFFFF">
   <tr>
     <td>机构代码</td>
     <td><input type="text" name="orgaid"  value=<%=rs2.getString(1)%>></td>
   </tr>
    <tr>
      <td>单位名称</td>
      <td><input type="text" name="organame"  style="width:300px;" value=<%=rs2.getString(2)%>>&nbsp&nbsp归口&nbsp&nbsp&nbsp<input type="text" name="orgaparentid"  value=<%=rs2.getString(3)%>>
      </td>
     </tr>
     <tr>
      <td>所属行业</td>
      <td><input type="text" name="industryid"  value=<%=rs2.getString(4)%>></td>
     </tr>
     <tr>
      <td>单位法人</td>
      <td><input type="text" name="legalperson"  value=<%=rs2.getString(5)%>>&nbsp&nbsp联系人&nbsp&nbsp&nbsp&nbsp<input type="text" name="contacts"  value=<%=rs2.getString(6)%>></td>
     </tr>
     <tr>
      <td>联系电话</td>
      <td>固话：<input type="text" name="tel"  value=<%=rs2.getString(7)%>>&nbsp&nbsp&nbsp&nbsp手机&nbsp<input type="text" name="cel"  value=<%=rs2.getString(8)%>></td>
     </tr>
     <tr>
      <td>地址</td>
      <td><input type="text" name="address"  style="width:300px;" value=<%=rs2.getString(9)%>>&nbsp;&nbsp;邮箱&nbsp;&nbsp;<input type="text" name="email"  value=<%=rs2.getString(10)%>></td>
     </tr>
     <tr>
      <td>网址</td>
      <td><input type="text" name="web"  value=<%=rs2.getString(11)%>></td>
     </tr>
     <tr>
     <td>单位性质</td>
     <%
       byte[] nature=rs2.getBytes(12);
       int flag=0;
       String name=null;
       for(int i=0;i<nature.length;i++)
       {
    	   if(nature[i]==1){
    		   flag=i;
    	   } 
       }
       switch(flag){
       case 0:
    	   name="企业";
    	   break;
       case 1:
    	   name="高等院校";
    	   break;
       case 2:
    	   name="研究机构";
    	   break;
       case 3:
    	   name=rs2.getString(13);
    	   break;
       }
     %>
     <td><%=name%></td>
     </tr>
      <tr>
     <td>单位简介</td>
     <td>
		<textarea cols="80" rows="8" name="introduction" ><%=rs2.getString(14)%></textarea>
	</td>
     </tr>    
      <tr>
       <tr>
      <td>技术需求名称</td> 
      <td><input type="text" name="requname"  style="width:600px;" value=<%=rs1.getString(3)%>></td>
     </tr>
     <tr>
     <td>技术领域</td>
     <% 
      String field="";
      String[] fields=rs1.getString(4).split(";");
      for(int i=0;i<fields.length;i++){
    	 if(fields[i].equals("其他")){
    		 field+=rs1.getString(5)+";";
    	 }else{
    		 if(i==fields.length-1){
    			 field+=fields[i];
    		 }else{
    			field+=fields[i]+";"; 
    		 }
    	 } 
      }
      %>
      <td><%=field%></td>
     </tr>
     <tr>
     <td>技术应用行业</td>
     <td>
		<textarea cols="80" rows="8" name="industryid" ><%=rs1.getString(6)%></textarea>
	</td>
     </tr>
       <tr>
     <td>技术需求概述</td>
     <td>
		<textarea cols="80" rows="8" name="requoverview" ><%=rs1.getString(7)%></textarea>
	</td>
     </tr>     
     <tr>
       <td>关键字（1-5个）</td>
       <td><input type="text" name="keyword" style="height: 44px; width: 468px" value=<%=rs1.getString(8)%>></td>
     </tr>
      <tr>
     <td>需求技术拟应用情况</td>
     <td>
		<textarea cols="80" rows="8" name="application"><%=rs1.getString(9)%></textarea>
	</td>
     </tr>
     <tr> 
     <td>合作方式</td>
     <%
       byte[] coop=rs1.getBytes(10);
       int flag1=0;
       String name1=null;
       for(int j=0;j<coop.length;j++)
       {
    	   if(coop[j]==1){
    		   flag1=j;
    	   } 
       }
       
       switch(flag1){
       case 0:
    	   name1="技术引进";
    	   break;
       case 1:
    	   name1="委托研发";
    	   break;
       case 2:
    	   name1="合作研发";
    	   break;
       case 3:
    	   name1=rs1.getString(11);
    	   break;
       }
     %> 
     <td><%=name1 %></td>
     </tr>
	<tr>
	   <td>填报时间</td>
	   <td><input type="text" name="filltime" style="width: 215px;" value=<%=rs1.getString(12)%>></td>
	</tr>             
  </table>
  <% 
			   }
  %>	

						<!-- 删除结束-->

					</div> <br /> <!-- 内容 -->
					</div>
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
			location.replace('dqwr/qt/index.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
		location.replace("zhuce.jsp");
	})
});
</script>
</script>
	<map name="Map">
		<area shape="rect" coords="21,1,117,37" href="#">
		<area shape="rect" coords="127,2,227,37" href="#">
		<area shape="rect" coords="23,49,143,75" href="#">
		<area shape="rect" coords="152,45,231,82" href="#">
	</map>
</body>
</html>