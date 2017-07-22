<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% YH wbuser = (YH) session.getAttribute("wbuser"); %>
<title>Insert title here</title>
<style type="text/css">
.STYLE22{
	color: #fffff;font-size:20px;font-weight:bold;
}
.tag ul{list-style:none}
.tag li{float:left;margin-left: 50px;margin-bottom: 10px;}
.left li{margin-top: 10px;}
.contact li{margin-top:10px;}
.zc {font-size:13px}
.gray{color:black;}
.ac_results {background:#fff;border:1px solid #7f9db9;position:absolute;z-index:10000;display:none;}
.ac_results ul{margin:0;padding:0;list-style:none;}
.ac_results li a{white-space:nowrap;text-decoration:none;display:block;color:#05a;padding:1px 3px;}
.ac_results li{border:1px solid #fff;}
.ac_over,.ac_results li a:hover {background:#c8e3fc;}
.ac_results li a span{float:right;}
.ac_result_tip{border-bottom:1px dashed #666;padding:3px;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/jquery-1.4.2.js">
</script>
<script language="JavaScript" src="js/qtqwjs.js"></script>
<script language="JavaScript" src="js/time.js"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/activeadd2.js"></script>
<script type="text/javascript" src="js/levelSelect-ajax.js"></script>
</head>

<body onload="getoldhistorymsg()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">	
 <%

%>

<table border="1" style="margin-left: 10%;margin-top: 20px;" width="1100px">
	<tr height="200px" ><td colspan="3">logo</td></tr>
	<tr ><td colspan="3">
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
	</td></tr>
	<tr height="500px">
	<td class="left" width="19%" align="left" valign="top">
	<div style="margin-top: 20px">
		<font size="5">检索方式</font>
		<ul style="list-style: none;">
		<li><a href="#" id='gjlf'>快速检索</a></li>
		<li><a href="#">分类检索</a></li>
		<li><a href="qtzhjs.jsp">综合检索</a></li>
		<li><a href="qtqwjs.jsp">全文检索</a></li>
		<li>关键词检索</li>
		</ul>
		<font size="5">用户使用说明</font>
		
	</div>
	
	</td>
	<td class="center" valign="top">
	<div  id='center'>
    
    <div align="center"  id="msgDiv" class="msg-div"  style="display: none;">信息提示</div>
<div style="margin: 0px 0px 0px 0px;background-color: white;height: 98%;min-height: 550px;">
<div style="background-color: #ffffff;">
<div >
	<fieldset class="fieldset_style"  >
		<font color="#FF0000" size="3px">输入您要检索的内容：</font><br/>
		<br/><br/>
		<div align="center">
			<textarea id="str_many_query" style="resize:none;color:#0099FF;width:540px; height: 120px; font-size: 20px" ></textarea>
			<div >
			<br/>
				<img src="../images/bt_query.jpg"  onclick="querymsg(1)" />
				<img src="../images/jgzjs.gif"  onclick="querymsg(2)" />
			</div>
		</div>
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

	<div align="center" id="oldsoso" style=" position:fixed;border:#43A3D4 solid 1px;top:15px;left:770px;width: 280px;">
		我的检索历史<br/><hr/>
		<div  align="left" id="oldsoresult" style="margin-left: 10px;line-height: 20px;"></div>
		<button class="btn btn-buynow" onclick="lookHistory()">查看历史检索</button>
	</div>
	<div align="center" id="soso" style=" position:fixed;border:#43A3D4 solid 1px;top:270px;left:770px;width: 280px;display: none;">
		新的检索历史<br/><hr/>
		<div id="sostr"></div>		
		<hr/>
		<div  align="left" id="soresult" style="margin-left: 10px;line-height: 20px;"></div>
		<button class="btn btn-buynow" onclick="addHistory()">确认</button>
	</div>
</div>
</div>
<script type="text/javascript">
function changetextvalue(obj){
	$("str_query").value=obj.innerHTML;
}
function $(id){
	return document.getElementById(id);
}

</script>
    </div>	
	</td>
	
	
	
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
</body>

</html>