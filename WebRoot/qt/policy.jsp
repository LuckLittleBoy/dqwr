<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>河北省科学技术情报研究院科技政策服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="../js/Calendar.js"></script>
<script type="text/javascript" src="js/policy.js"></script>
<script language="JavaScript" src="js/index.js">
</script>
<script>
function display(thisa){
	var str=thisa.substr(0,4);
	
	document.getElementById(str).style.display = "block";
	}
function display1(thisa){
	var str=thisa.substr(0,4);
	document.getElementById(str).style.display = "none";

}
function display2(thisa){
	var str=thisa.substr(0,6);
	
	document.getElementById(str).style.display = "block";
	}
function display3(thisa){
	var str=thisa.substr(0,6);
	document.getElementById(str).style.display = "none";

}
function display4(thisa){
	var str=thisa.substr(0,2);
	
	document.getElementById(str).style.display = "block";
	}
function display5(thisa){
	var str=thisa.substr(0,2);
	document.getElementById(str).style.display = "none";

}
</script>

<style type="text/css">
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 5%; 
            left: 15%; 
            width: 70%; 
            height: 70%; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
  
</style>

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
.STYLE22 {
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
<% YH wbuser = (YH) session.getAttribute("wbuser"); %>
</head>
<body>

<div align="center">
  <!-- Save for Web Slices (河北省科学技术情报研究院科技政策服务平台.psd) -->
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
      <td height="38" colspan="3" background="images/index_0400.jpg"><span id="d" class="STYLE2"> 您的位置：首页->政策分析->族谱分析 </span></td>
	    <td height="38" background="images/index_0400.jpg" class="STYLE2"><div align="right"><div id="nowtime" style="float: right;"></div>
	    <%if(wbuser!=null){%>
	     <div style="float: right;">欢迎：<%=wbuser.getUsername() %>&nbsp;&nbsp;&nbsp;<a href="#" id="zx" style="color: blue">注销</a>&nbsp;&nbsp;</div>
	     <%} %>
	    </div></td>
    </tr>
    
    <tr>
      <td colspan="2" border="0"  valign="top">
       <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="41" background="images/temp_09.jpg"><div align="center"><span class="STYLE5"><img align="Bottom" src="images/Developer_Icons_014.png" width="32" height="32" style="vertical-align: middle;" >&nbsp;政策分析</span></div></td>
        </tr>
        <tr>
          <td height="150" background="images/temp_11.jpg">
				<ul style="list-style: none;" class="leftul">
				
				
				<li><img style="margin-left:-10px; " src="images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qttjfx.jsp" id='gjlf'>统计分析</a></li>
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
      
      </td>
	    <td colspan="2" valign="top"><table width="785" height="606" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="21" height="41"><img src="images/2temp_10.jpg" width="21" height="41"></td>
            <td width="748" background="images/2temp_11.jpg" ><font color="#FFFFFF"><img src="images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">族谱分析</span></font>&nbsp;</td>
            <td width="16"><img src="images/2temp_12.jpg" width="17" height="41"></td>
          </tr>
          <tr>
            <td height="550" background="images/2temp_13.jpg">&nbsp;</td>
            <td class="center" valign="top" bgcolor="#FFFFFF">
            <%if(wbuser!=null&&wbuser.getYJSID().equals("1")){ %>
			<!-- 内容 -->
			<div style="position: relative;min-height: 490px; " >
	
		<div>请输入想要查询的政策信息<br/><br/>
			<div align="center">
				
					<strong  >政策文号:</strong>
					<input type="text" name="policyId" id="policyId"/>
					
					或
					<strong  >政策名称:</strong><input type="text" name="name" id="name"/><br/><br/>
						
					<strong  >日期条件:</strong>
					<select class="i-text" name="timeSearch" id="timeSearch">
						<option value="publishtime">公布日期</option>
						<option selected="selected" value="applytime">施行日期</option>
						<option value="breaktime">废止日期</option>
					</select>:<input class="demo2_class1" maxlength="15" name="startT" id="startT" type="text" onclick="new Calendar().show(this);" readonly="readonly">-<input class="demo2_class2" maxlength="15" name="endT" id="endT" type="text" onclick="new Calendar().show(this);" readonly="readonly"><br/><br/>
				
				<input type="button" value="确定"  onclick="policySubmit();">
				<input type="button" value="清除" onclick="location.reload();">
				<!-- <input name="button" type="button" value="提交" id="submit" onclick="policySubmit();"/>
				<input name="button" type="button" value="清除" id="submit" onclick="location.reload();"/>
			 	-->
			 </div>
			<div>
				<table id="policyTable" width="700" height="57" border="0" cellpadding="0" cellspacing="0" style="font-size:12px;">
	    		</table>
			</div>
		</div >
		
		<table border="0">
		<tr height="150">
		
		<td width="150px" align="center">
		<div id="tab11" align="center" onmouseover="display(this.id)" onmouseout="display1(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab1" align="center" style="display:none" ></div>
		
		<td width="150px" align="center">
		<div id="tab22" align="center" onmouseover="display(this.id)" onmouseout="display1(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab2" align="center" style="display:none"></div>
		
		<td width="150px" align="center">
		<div id="tab33" align="center" onmouseover="display(this.id)" onmouseout="display1(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab3" align="center" style="display:none"></div>
		
		<td width="150px" align="center">
		<div id="tab44" align="center" onmouseover="display(this.id)" onmouseout="display1(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab4" align="center"  style="display:none"></div>
		
		<td width="150px" align="center">
		<div id="tab55" align="center" onmouseover="display(this.id)" onmouseout="display1(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab5" align="center" style="display:none"></div>
		
		</tr>
		
		<tr height="150">
		<td>
		<td colspan="3" align="center">
		<center><div id="cxzc" align="center" onmouseover="display4(this.id)" onmouseout="display5(this.id)" style="cursor:pointer;width:300px;background:url(../images/policy/2.png) no-repeat;visibility:hidden;line-height:80px;text-align:center;height:65px;"></div>
				<div id="cx" align="center"  style="display:none"></div>
		
		</center>
		<td>
		</tr>
		<tr height="150">
		<td align="center" width="150px">
		<div id="tab1111" align="center" onmouseover="display2(this.id)" onmouseout="display3(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab111" align="center" style="display:none"></div>
		
		<td align="center" width="150px">
		<div id="tab2222" align="center" onmouseover="display2(this.id)" onmouseout="display3(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab222" align="center" style="display:none"></div>
		
		<td align="center" width="150px">
		<div id="tab3333" align="center" onmouseover="display2(this.id)" onmouseout="display3(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab333" align="center" style="display:none"></div>
		
		<td align="center" width="150px">
		<div id="tab4444" align="center" onmouseover="display2(this.id)" onmouseout="display3(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab444" align="center" style="display:none"></div>
		
		<td align="center" width="150px">
		<div id="tab5555" align="center" onmouseover="display2(this.id)" onmouseout="display3(this.id)" style="cursor:pointer;width:130px; background:url(../images/policy/1.png) no-repeat;visibility:hidden;line-height:65px;text-align:center;height:85px;margin-left:"+margin_left+"px;margin-top:50px;"></div>
		<div id="tab555" align="center" style="display:none"></div>
		
		</tr>
		</table>
	
		
		<div id="tab0" align="left"></div>
		<div id="family" align="center"></div>
		<div style="clear:both;" align="center"></div>
		<div id="child" align="center"></div>
		<div id="showDiv" style="border:1px solid #FF3030;background:#FFFACD;color:#EE4000;display:none;position:absolute;width:100px;height:auto;"></div>
        <div id="light" class="white_content">政策详细信息：<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">点这里关闭本窗口</a>
        </div> 
        <div id="fade" class="black_overlay"></div> 
		
	</div>
			<!-- 内容 -->
			<%}else{ %>
            <font size="3" color="red">只有注册用户才能访问</font>
            <%} %>
			
           </td>
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
<map name="Map"><area shape="rect" coords="21,1,117,37" href="#"><area shape="rect" coords="127,2,227,37" href="#"><area shape="rect" coords="23,49,143,75" href="#"><area shape="rect" coords="152,45,231,82" href="#"></map></body>
</html>