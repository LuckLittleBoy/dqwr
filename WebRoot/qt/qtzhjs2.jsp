<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*,com.satp.entity.*, java.util.ArrayList"
	import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>河北省科学技术情报研究院科技政策服务平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="qt/js/jquery.js"></script>
<script language="JavaScript" src="qt/js/jquery-1.4.2.js">
</script>
<% YH wbuser = (YH) session.getAttribute("wbuser"); %>
<script language="JavaScript" src="qt/js/qtzhjs.js"></script>
<script language="JavaScript" src="qt/js/time.js"></script>
<script  type="text/javascript" src="qt/js/fenye.js"></script>
<script type="text/javascript" src="qt/js/levelSelect-ajax2.js"></script>
<link href="qt/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="qt/js/activeadd2.js"></script>
<SCRIPT>
$(document).ready(function () {
	$("#zx").click(function(){
		alert("注销成功");
		jQuery.post("/qtzx",
				function(response){
			location.replace('denglu.jsp');
		});
		
	});
	$("#zcbtn").click(function(){
		location.replace("zhuce.jsp");
	})
});
function resultReach(id){
	var result=document.getElementById("result");
	var res=document.getElementById("res");
	var Find=document.getElementById("ermao1").value;
    var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);      
    var a=containSpecial.test(Find);
    if(a==true){
    	alert("输入存在特殊字符，请检查");
    }else{
	if(id==2)
	{
		result.value="2";
		res.value="1";
	}
	else if(id==1)
	{
		result.value="1";
		res.value="1";
	}
	form1.submit();
}
}
$(function(){
	$("#test").click(function(){
		$.openLayer({
			maxItems : 5,
			pid : "0",
			returnText : "restxts",
			returnValue : "resvals",
			span_width : {d1:120,d2:150,d3:150},
			index : 1
		});
	});
	$("#test2").click(function(){
		$.openLayer({
			maxItems : 5,
			pid : "1",
			returnText : "restxts2",
			returnValue : "resvals2",
			span_width : {d1:120,d2:150,d3:150},
			index : 2
		});
	});
});
</SCRIPT>
 <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String type =(String)request.getAttribute("type");
String keyword =(String)request.getAttribute("keyword");

int pageno =0;
int pagesize =0;
int pageCount=1;
String size=(String)request.getAttribute("pagesize");
if(size!=null){
	pagesize = Integer.parseInt(size);
}

if(pagesize<=0){
	pagesize = 15;
	}

if(request.getAttribute("pageno")!=null){
	pageno=(Integer)request.getAttribute("pageno");
	if(pageno<=0){
		 pageno = 1;
		}
}
if(request.getAttribute("pageCount")!=null){
	pageCount=(Integer)request.getAttribute("pageCount");
	if (pageno>pageCount){
		pageno=1;
	}
}

%>
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
.zc {font-size:13px}
.center table { border-collapse:collapse; border-spacing:0; }
.center	td { margin:0; padding:10px; border:1px solid #ccc; }
.center	th{
		border-color: #666666;
		background-color: #dedede;
	}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(qt/images/bg.jpg);
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
        <img src="qt/images/index_01.jpg" width="1046" height="132"></td>
	  </tr>
    <tr>
      <td height="42" colspan="4" background="qt/images/index_0300.jpg">
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
      <td height="38" colspan="3" background="images/index_0400.jpg"><span id="d" class="STYLE2">您的位置：首页->政策查询->综合检索结果</span></td>
	    <td height="38" background="images/index_0400.jpg" class="STYLE2"><div align="right"><div id="nowtime" style="float: right;"></div>
	    <%if(wbuser!=null){%>
	     <div style="float: right;">欢迎：<%=wbuser.getUsername() %>&nbsp;&nbsp;&nbsp;<a href="#" id="zx" style="color: blue">注销</a>&nbsp;&nbsp;</div>
	     <%} %>
	    </div></td>
    </tr>
    <tr bgcolor="#FEFEFE">
      <td colspan="2" border="0"  valign="top">
      <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="41" background="qt/images/temp_09.jpg"><div align="center"><span class="STYLE5"><img src="qt/images/Developer_Icons_014.png" style="vertical-align: middle;" width="32" height="32">&nbsp;检索方式</span></div></td>
        </tr>
        <tr>
          <td height="162" background="qt/images/temp_11.jpg">
          <ul style="list-style: none;" class="leftul">
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qtTypeServlet">分类浏览</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/qtcx.jsp" id='gjlf'>快速检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/qtzhjs.jsp">综合检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/qtqwjs.jsp">全文检索</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/rekeys.jsp">关键词检索</a></li>
				
				</ul>
          
			
          &nbsp;</td>
          </tr>
        <tr>
          <td height="27" background="qt/images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table>
      <table width="259"  border="0" cellpadding="0" cellspacing="0" >
        <tr>
        	<td height="41" background="qt/images/temp_09.jpg"><div align="center"><span class="STYLE5"><img align="Bottom" src="qt/images/Developer_Icons_014.png" width="32" height="32" style="vertical-align: middle;" >&nbsp;功能介绍</span></div></td>
        </tr>
        <tr>
          <td height="162" background="qt/images/temp_11.jpg">
          
				<ul style="list-style: none;" class="leftul">
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/c2.jsp">分类浏览功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/c1.jsp" id='gjlf'>快速检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/c3.jsp">综合检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/c4.jsp">全文检索功能</a></li>
				<li class="line"></li>
				<li><img style="margin-left:-10px; " src="qt/images/bluedian.png" width="10px" height="10px;" >&nbsp;&nbsp;<a href="qt/c5.jsp">关键词检索功能</a></li>
				</ul>
		</td>
          </tr>
        <tr>
          <td height="27" background="qt/images/temp_13.jpg">&nbsp;</td>
        </tr>
      </table>     
	    <td colspan="2" valign="top">
	   
	    <table width="785" height="606" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="21" height="41"><img src="qt/images/2temp_10.jpg" width="21" height="41"></td>
			<td width="748" background="qt/images/2temp_11.jpg" ><font color="#FFFFFF"><img src="qt/images/Developer_Icons_064.png" style="vertical-align: middle;" width="32" height="32"><span class="STYLE22">综合检索</span></font><span class="STYLE22">&nbsp;</span></td>
            <td width="16"><img src="qt/images/2temp_12.jpg" width="17" height="41"></td>
          </tr>
          <tr>
            <td height="550" background="qt/images/2temp_13.jpg">&nbsp;</td>
            <td class="center" id="centerright" valign="top" bgcolor="#FFFFFF">
			     <%if(wbuser!=null){ %>
			    <!-- 内容 -->
			    
	
		    <%
			ArrayList<Policy> policytaglist = (ArrayList<Policy>)request.getAttribute("policytaglist"); //结果集
				int i=0;
			if(policytaglist!=null){
				
			
				
			%>
    
    
    <fieldset>
	<div style="background-color: #ffffff; position: relative;margin-top:8px;border: #ffffff 2px solid" >
		<input type="hidden" value="<%=pageno %>" id="pageno" name="pageno">
		<input type="hidden" value="<%=pagesize %>" id="pagesize" name="pagesize">
		<input type="hidden" value="<%=type %>" id="type" name="type" class="types">
		<div style="position: relative;min-height: 490px; " >		
		<!-- 内容 -->		
			<table border="0" bgcolor="#EFEFEF"  width="100%" class="news" >
			<tr><th>政策</th><th>实施日期</th></tr>
			<%
				for(Policy policy : policytaglist){ 
					i=i+1;
					if(i%2==1){
			 %>
						<tr style="background: #A8D3F3">
						<td width="70%" style="margin-left: 30px;">
						<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="qt/zccxzclook.do?pno=<%=policy.getPno() %>"><%=policy.getPname() %></a></div></td>
		
						<%if(policy.getApplytime()!=null){ %>
							
								<td align="center"><%=policy.getApplytime() %></td>
						<%}else{ %>
							
								<td >&nbsp;</td>
						<%} %>
								</tr>
					
			<%}else if(i%2==0){ %>
						
						<tr >
						<td width="70%" style="margin-left: 30px;">
						<div  style="width:420px;  text-overflow:ellipsis;   white-space:nowrap; overflow:hidden;"><a href="qt/zccxzclook.do?pno=<%=policy.getPno() %>"><%=policy.getPname() %></a></div></td>
		
							<%if(policy.getApplytime()!=null){ %>
							
								<td align="center"><%=policy.getApplytime() %></td>
						<%}else{ %>
							
								<td >&nbsp;</td>
						<%} %>
								</tr>
					
					
				<%
				}
				
		}
		%>
					</table>
					
		<!-- 内容 -->
		
		

		
			<div style="background: #C0E4FA;position: relative;width: 98%;"  >
		<div style="background: #C0E4FA;position:absolute;" align="left"> 共有 <%=i %> 条最新记录，当前页第<%=pageno %>/<%=pageCount %>页 &nbsp;&nbsp; 
		<%if(pageno>1){ %>
		<a href="qtzhfy?pageno=<%if((pageno+1)<1) out.print(1);else out.print(pageno-1); %>&pageCount=<%=pageCount%>">上一页</a>
		 <%} %>&nbsp;&nbsp;
		  <%if(pageno<pageCount){ %>
		 <a href="qtzhfy?pageno=<%if((pageno+1)>pageCount) out.print(pageCount);else out.print(pageno+1); %>&pageCount=<%=pageCount%>">下一页</a>
		 <%} %></div>
		<div align="right">
		<%if(pageno>1){ %>
		<a href="qtzhfy?pageno=1&&pageCount=<%=pageCount%>">首页</a><%} %>&nbsp;&nbsp;
		<%if(pageno<pageCount){ %><a href="qtzhfy?pageno=<%=pageCount%>&pageCount=<%=pageCount%>">尾页</a><%} %>
		  跳转到
		 <input type="text" size="1"  class="pageno" style="width: 20px;height: 15px;" name="pageno"></input>页&nbsp;&nbsp;<a href="#" onclick="goes()">跳转</a></div>
		</div>
		
		</div>
	</div>
	</fieldset>
	<%} %>
    
		
			    
		
		
		<%}else{ %>
	<font size="3" color="red">查询功能注册以后才能使用</font>
	<%} %>
			    
			    
			    <!-- 内容 -->
            <td background="qt/images/2temp_15.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td height="14"><img src="qt/images/2temp_17.jpg" width="21" height="14"></td>
            <td height="14" background="qt/images/2temp_18.jpg"></td>
            <td><img src="qt/images/2temp_19.jpg" width="17" height="14"></td>
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
      <td height="29" colspan="4" background="qt/images/index_0900.jpg" class="STYLE1"><div align="center">联系我们&nbsp;&nbsp;|&nbsp;&nbsp;设为首页&nbsp;&nbsp;|&nbsp;&nbsp;加入收藏&nbsp;&nbsp;|&nbsp;&nbsp;免责声明</div></td>
	  </tr>
    <tr>
      <td>
        <img src="qt/images/index_10.jpg" width="1" height="5" alt=""></td>
	   <td colspan="4" rowspan="2" background="qt/images/index_11.jpg"><div align="center" class="STYLE3">
	 	版权所有 @ 河北省科学技术情报研究院科技政策服务平台
		<br>
		地址: 河北省石家庄市青园街233号 邮编：050021 
		</div>
	      </td>
	  </tr>
    <tr>
      <td>
        <img src="qt/images/index_12.jpg" width="1" height="94" alt=""></td>
	  </tr>
  </table>
  <!-- End Save for Web Slices -->
</div>
<map name="Map"><area shape="rect" coords="21,1,117,37" href="#"><area shape="rect" coords="127,2,227,37" href="#"><area shape="rect" coords="23,49,143,75" href="#"><area shape="rect" coords="152,45,231,82" href="#"></map></body>
</html>