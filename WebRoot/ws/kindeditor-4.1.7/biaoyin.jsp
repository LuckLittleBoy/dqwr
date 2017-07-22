<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.model.*,java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/time.js"></script>
	<script type="text/javascript" src="js/biaoyin1.js"></script>
	<script type="text/javascript" src="js/jquery-levelSelect-ajax"></script>
	<script type="text/javascript" src="js/jquery.suggest.js"></script> 
	<script type="text/javascript" src="js/jquery.suggest2.js"></script> 
	<script type="text/javascript" src="js/jquery.suggest3.js"></script> 
	<script type="text/javascript" src="js/jquery.dimensions.js"></script> 
	<script type="text/javascript" src="js/aircity.js"></script> 
	<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
	table { border-collapse:collapse; border-spacing:0; }
	td { margin:0; padding:10px; border:1px solid #ccc; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
</style>
	<link rel="stylesheet" type="text/css" href="css/biaoyin.css" />
<%
request.setCharacterEncoding("UTF-8");

String htmlData =  request.getParameter("content1");
System.out.println(htmlData);
if(htmlData!=null){
	request.getSession().setAttribute("content1", htmlData);
}
String zcmc = request.getParameter("zcmc");
String zcwh = request.getParameter("zcwh");
if(zcmc==null){
	zcmc="";
}
if(zcwh==null){
	zcwh="";
}
%>
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">


<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >

	<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">标引</div>
	<form action = "/kjzc/zcluru" id="markform" name="markform" method="post" onsubmit="return checkAllTextValid(this)">
	
	<table>

	<tr>
	<td>
	<div id = "text"  style="overflow-y:auto;overflow-x:hidden; width:579px">
	 <%=htmlData %> </div>
	 </td>
	</tr>

	<tr>
	<td>
	
	<div id="tabContainer">
        <ul>
            <li id="tab1"><a href="#" class="on" onclick="switchTab('tab1','con1');this.blur();return false;">
              	  基本信息</a></li>
            <li id="tab2"><a href="#" onclick="switchTab('tab2','con2');this.blur(); return false;">
               	 政策状态</a></li>
            <li id="tab3"><a href="#" onclick="switchTab('tab3','con3');this.blur();return false;">
                	关键字主题词</a></li>
                    
        </ul>
        <div style="clear: both">
        </div>
        <div id="con1">

        	<br>
			政策名称：<input  style="width:160px;"  type="text" size="20" name="zcmc" id="zcmc" value="<%=zcmc %>">
			<input type="button" id="mcjc" class="mcjc" value="检查">
			&nbsp;&nbsp;&nbsp;&nbsp;
        	序号文号：<input  style="width:160px;" value="<%=zcwh %>" type="text" size="20" id="zcwh" name="zcwh">
			<input type="button" id="whjc" class="whjc" value="检查"><br>
			
			政策分类：<input style="width:160px;" id="zcfl"  onKeyDown="if(event.keyCode==13) return false;">
			<input type="hidden" value="" id="zcflhidden" name="zcfl" /> 			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			颁布形式：<input style="width:160px;" id="bbxs" onKeyDown="if(event.keyCode==13) return false;">
			<input type="hidden" value="" id="bbxshidden" name="bbxs" />
			<br>			
			施行范围：<input type="text"  style="width:160px;" id="sxfw"  onKeyDown="if(event.keyCode==13) return false;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        	
			制定机关：<input  style="width:160px;" type="text" size="20" id="zdjg" onKeyDown="if(event.keyCode==13) return false;">
			<br>
			<input type="hidden" value="" style="width:160px;" id="sxfwhidden" name="sxfw" />
			<input type="hidden" value="" style="width:160px;" id="zdjghidden" name="zdjg" />
			
			调整领域：<input type="text" style="width:160px" style="width:163px;" id="tzly" onKeyDown="if(event.keyCode==13) return false;"><br>
			<input type="hidden" value="" id="tzlyhidden" name="tzly">
        </div>
        <div id="con2" style="display: none">
		上位政策：<input  style="width:160px;" type="text" size="20"  id="swzc" onKeyDown="if(event.keyCode==13) return false;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		前趋政策：<input  style="width:160px;" type="text" size="20"  id="qqzc" onKeyDown="if(event.keyCode==13) return false;">
		<br>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" value="" style="width:160px;" id="swzchidden" name="swzc" /> 
		
		<input type="checkbox" name="swtag" value="1" checked="checked">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" value=""  style="width:160px;" id="qqzchidden" name="qqzc" onKeyDown="if(event.keyCode==13) return false;"/> 
		<input type="checkbox" name="qqtag" value="1" checked="checked"><br>
		公布日期：<input  style="width:160px;" name="gbrq" type="text" id="control_date" size="20"
                        maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
		施行日期：<input  style="width:160px;" name="sxrq" type="text" id="control_date" size="20"
                        maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" /><br>
		时效状态：<select  style="width:163px;" id="sxzt" name="sxzt" onchange="changesx() " onKeyDown="if(event.keyCode==13) return false;">
			<option value="1">有效</option>
			<option value="0">失效</option>
		</select>
		<input type="checkbox" name="sxtag" value="1" checked="checked">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		废止日期：<input  style="width:160px;" disabled value="失效时可填" id="fzrq" name="fzrq" type="text" id="control_date" size="20"
                        maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" onKeyDown="if(event.keyCode==13) return false;"/>&nbsp;&nbsp;<br><br>
		    
		</div>
        <div id="con3" style="display: none">
 		主题词：<input style="width:79px;" type="text" size="8" id="ztc1" name = "ztc1" onKeyDown="if(event.keyCode==13) return false;">
		<input style="width:79px;" type="text" size="8" id="ztc2" name = "ztc2" onKeyDown="if(event.keyCode==13) return false;">
		<input style="width:79px;" type="text" size="8" id="ztc3" name = "ztc3" onKeyDown="if(event.keyCode==13) return false;">
		<input style="width:79px;" type="text" id="ztc4" size="8" name = "ztc4" onKeyDown="if(event.keyCode==13) return false;">
		<input style="width:79px;" type="text" size="8" id="ztc5" name = "ztc5" onKeyDown="if(event.keyCode==13) return false;"><br>
		关键字：<input type="text" style="width:79px;" size="8" id="gjz1" name = "gjz1" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz2" name = "gjz2" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz3" name = "gjz3" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz4" name = "gjz4" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz5" name = "gjz5" onKeyDown="if(event.keyCode==13) return false;"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" style="width:79px;" size="8" id="gjz6" name = "gjz6" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz7" name = "gjz7" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz8" name = "gjz8" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz9" name = "gjz9" onKeyDown="if(event.keyCode==13) return false;">
		<input type="text" style="width:79px;" size="8" id="gjz10" name = "gjz10" onKeyDown="if(event.keyCode==13) return false;">
    </div>
        <div id="con4" style="display: none">
		关键字：<input type="text" style="width:79px;" size="8" id="gjz1" name = "gjz1">
		<input type="text" style="width:79px;" size="8" id="gjz2" name = "gjz2"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" style="width:79px;" size="8" id="gjz3" name = "gjz3">
		<input type="text" style="width:79px;" size="8" id="gjz4" name = "gjz4"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" style="width:79px;" size="8" id="gjz5" name = "gjz5">
		<input type="text" style="width:79px;" size="8" id="gjz6" name = "gjz6"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" style="width:79px;" size="8" id="gjz7" name = "gjz7">
		<input type="text" style="width:79px;" size="8" id="gjz8" name = "gjz8"><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" style="width:79px;" size="8" id="gjz9" name = "gjz9">
		<input type="text" style="width:79px;" size="8" id="gjz10" name = "gjz10">
    </div>
	<table width="550" id="table"><tr><td align="center">
	<input type="hidden" name="shzt" id="shzt">
	<input type="image"  src="../images/tjsh.gif"  onclick="show_tijiao()">
	<input type="image"  src="../images/bcwj.gif"  >
	<!-- <input type="button" name="tijiao" value="提交审查" onclick="show_tijiao()">
	<input type="submit" value="保存文件" name="tijiao"> -->
	</td>
	</tr>
	</table>
	</div>
	</td>
	</tr>
	
	
	</table>
	</form>
	
	
	<div id="BgDiv"></div>
	<div id="DialogDiv" style="display:none">
		<h2>检测结果<a href="#" id="btnClose">关闭</a></h2>
	    <div class="form">
	    </div>
	</div>
<div id="box">
<div class="ac_results" id="suggest">&nbsp;</div>
<div class="ac_results" id="suggest2">&nbsp;</div>
<div class="ac_results" id="suggest3">&nbsp;</div>
<div class="ac_results" id="suggest4">&nbsp;</div>
<div class="ac_results" id="suggest5">&nbsp;</div>
<div class="ac_results" id="suggest6">&nbsp;</div>
<div class="ac_results" id="suggest7">&nbsp;</div>
</div>

</div>
</div>
</body>
</html>