<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.satp.entity.*"
    import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>河北省科学技术情报研究院科技政策服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>
<script language="JavaScript" src="js/zcfl2.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<% YH wbuser = (YH) session.getAttribute("wbuser"); %>
<style type="text/css">

<!--
.center {font-size:12px;}
.news tr{height: 30px}
.news td,th{

background:expression((this.parentNode.rowIndex)%2==0?"#3DB7CC":"#B3F4FF");

}
.news a{color: #000000;}

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
      <td height="38" colspan="3" background="images/index_0400.jpg"><span id="d" class="STYLE2">您的位置：首页->政策分析->政策原文</span></td>
	    <td height="38" background="images/index_0400.jpg" class="STYLE2"><div align="right"><div id="nowtime" style="float: right;"></div>
	    <%if(wbuser!=null){%>
	     <div style="float: right;">欢迎：<%=wbuser.getUsername() %>&nbsp;&nbsp;&nbsp;<a href="#" id="zx" style="color: blue">注销</a>&nbsp;&nbsp;</div>
	     <%} %>
	    </div></td>
    </tr>
    
    <tr bgcolor="#FEFEFE">
      <td colspan="2" border="0"  valign="top">
      <!-- 模板 -->
 <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
        <td height="41" background="images/temp_09.jpg"><div align="center"><span class="STYLE5"><img align="Bottom" src="images/Developer_Icons_014.png" width="32" height="32" style="vertical-align: middle;" >&nbsp;政策分析</span></div></td>
        </tr>
        <tr>
          <td height="150" background="images/temp_11.jpg">
				<ul style="list-style: none;" class="leftul">
				
				
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="#" id='gjlf'>统计分析</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="policy.jsp">族谱分析</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="policy2.jsp">时效分析</a></li>
				
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
          <td height="150" background="images/temp_11.jpg">
				<ul style="list-style: none;" class="leftul">
				
				
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="f1.jsp" id='gjlf'>统计分析功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="f2.jsp">族谱分析功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="f3.jsp">时效分析功能</a></li>
				
				</ul>
	
          &nbsp;</td>
          </tr>
        <tr>
          <td height="27" background="images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table>			
      <input type="hidden" name="" id="tiaozhuan">
      <input type="hidden" name="type" id="type"> 
      <input type="hidden" name="lb" id="lb"> 
      <input type="hidden" name="pageno" id="pageno">
      <input type="hidden" name="pageCount" id="pageCount"> 
      
      
      </td>
     
	    <td colspan="2" valign="top" id="centerright">
	    <table width="785" height="606" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>
            <td width="748" background="images/2temp_11.jpg">&nbsp;</td>
            <td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>
          </tr>
          <tr>
            <td height="550" background="images/2temp_13.jpg">&nbsp;</td>
            <td class="center"  valign="top" bgcolor="#FFFFFF">
			  <div style="margin: 10px 10px 5px 10px;background-color: white;height: 98%;min-height: 550px;" align="center"> 
		 	   <table width='96%' >
				<%
					Policy policytag=(Policy)request.getAttribute("policyList"); //结果集
					System.out.println();
					%>
					
					<tr align="left" >
					<th style="font-style: normal;font-weight: normal;font-family: inherit;">
					<%=policytag.getPolciycontent() %>
					</th>
					</tr >
				</table>
				</div>
            <!-- <table width="200" border="0" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td colspan="2"><img src="images/denglu_01.jpg" width="248" height="52"></td>
                </tr>
              <tr>
                <td width="73"><img src="images/denglu_02.jpg" width="73" height="99"></td>
                <td width="175" background="images/denglu_03.jpg"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2" align="left" valign="bottom"><INPUT NAME="LoginName" TYPE="text" CLASS="STYLE1" STYLE="width:150px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>
        <tr>
          <td height="32" colspan="2" align="left" valign="bottom"><INPUT NAME="LoginName" TYPE="text" CLASS="STYLE1" STYLE="width:150px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          </tr>
        <tr>
          <td width="50%" height="29" align="left" valign="bottom"><INPUT NAME="LoginName" TYPE="text" CLASS="STYLE1" STYLE="width:85px; height:17px; border:#336699 1px solid" tabindex="1" MAXLENGTH="26"></td>
          <td width="50%" align="left" valign="bottom">1234abc</td>
        </tr>
      </table></td>
              </tr>
              <tr>
                <td colspan="2"><img src="images/denglu_04.jpg" width="248" height="113" border="0" usemap="#Map"></td>
                </tr>
            </table> --></td>
            <td background="images/2temp_15.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td height="14"><img src="images/2temp_17.jpg" width="21" height="14"></td>
            <td height="14" background="images/2temp_18.jpg"></td>
            <td><img src="images/2temp_19.jpg" width="17" height="14"></td>
          </tr>
        </table></td>
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
      	<option  value="http://www.most.gov.cn/dqwr/gjdqwr/">国家科技政策</option> 
      	<option  value="http://www.chinalaw.gov.cn/article/fgkd/xfg/">国务院法制办公室</option> 
      	<option  value="http://www.sninfo.gov.cn:8083/initSnZcfgTwoPageList.do?method=initSnZcfgTwoPageList">陕西省科技信息网</option> 
      	<option  value="http://www.51policy.cn/">江苏省科技政策服务网</option> 
      	<option  value="http://zc.k8008.com/">科易网科技政策服务中心</option> 
      	<option  value="http://www.kjzj.org.cn/">中关村科技服务平台</option> 
      	<option  value="http://www.dqwrfg.com/html/sort/sort3/index.html">贵州省科技政策法规服务平台</option>  
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
      <td height="29" colspan="4" background="${pageContext.request.contextPath}/qt/images/index_0900.jpg" class="STYLE1"><div align="center"><a style="color: #FFFFFF" href="${pageContext.request.contextPath}/qt/lxwm.jsp">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;设为首页&nbsp;&nbsp;|&nbsp;&nbsp;加入收藏&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qt/mzsm.jsp" style="color:#ffffff">免责声明</a></div></td>
	  </tr>
    <tr>
	     <td colspan="4" rowspan="2" background="${pageContext.request.contextPath}/qt/images/index_11.jpg"><div align="center" class="STYLE3">
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
$(document).ready(function () {
	$("#zx").click(function(){
		alert("注销成功");
		jQuery.post("qtzx",
				function(response){
			location.replace('denglu.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
		location.replace("zhuce.jsp");
	})
});
</script>
<map name="Map"><area shape="rect" coords="21,1,117,37" href="#"><area shape="rect" coords="127,2,227,37" href="#"><area shape="rect" coords="23,49,143,75" href="#"><area shape="rect" coords="152,45,231,82" href="#"></map></body>
</html>