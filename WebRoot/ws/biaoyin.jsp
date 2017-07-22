<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.dqwr.model.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/biaoyin.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/jquery.suggest.js"></script>
<script type="text/javascript" src="js/jquery.suggest2.js"></script>
<script type="text/javascript" src="js/jquery.suggest3.js"></script>
<script type="text/javascript" src="js/jquery-levelSelect-ajax.js"></script>
<script type="text/javascript" src="js/jquery-levelSelect-ajax2.js"></script>
<script type="text/javascript" src="js/jquery-levelSelect-ajax3.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/aircity.js"></script>
<style type="text/css">
body {
	font: 14px/1.5 宋体, 宋体, \5b8b\4f53, sans-serif;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	margin-left: 5px;
	color: #07F;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

input {
	border: 1px solid #ccc;
	margin: 2px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/biaoyin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/themes/default/default.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.css" />
<script charset="utf-8"
	src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8"
	src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ws/js/upload1.js"></script>
<%!public static String HtmlEncode(String str) {
		str = str.replace(">", "&gt;");
		str = str.replace("<", "&lt;");
		char ch;
		ch = (char) 32;
		str = str.replace(String.valueOf(ch), "&nbsp;");
		ch = (char) 34;
		str = str.replace(String.valueOf(ch), "&quot;");
		ch = (char) 39;
		str = str.replace(String.valueOf(ch), "&#39;");
		ch = (char) 13;

		ch = (char) 10;
		str = str.replace(String.valueOf(ch), "<br>");
		ch = (char) 9;
		str = str.replace(String.valueOf(ch), "	");
		return str;
	}

	public static String EncodeHtml(String str) {
		str = str.replace("&gt;", ">");
		str = str.replace("&lt;", "<");
		char ch;
		ch = (char) 32;
		str = str.replace("&nbsp;", String.valueOf(ch));
		ch = (char) 34;
		str = str.replace("&quot;", String.valueOf(ch));
		ch = (char) 39;
		str = str.replace("&#39;", String.valueOf(ch));
		ch = (char) 13;
		str = str.replace("\"", String.valueOf(ch));
		ch = (char) 10;
		str = str.replace("<br>", String.valueOf(ch));
		ch = (char) 9;
		str = str.replace("	", String.valueOf(ch));
		return str;
	}%>
<%
	String tag = request.getParameter("tag");

	if (tag.equals("1")) {
		request.getSession().setAttribute("content1", "");
		tag = "0";
	}

	request.setCharacterEncoding("UTF-8");
	String htmlData = (String) session.getAttribute("content1") != null ? (String) session
			.getAttribute("content1") : "";

	request.getSession().setAttribute("content1", htmlData);
	htmlData = HtmlEncode(htmlData);
%>
<title>Insert title here</title>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	background="#B1D8EA" bgcolor="#B1D8EA">

	<input type="hidden" name="zcid" id="zcid" value="">
	<div
		style="background-color: #ffffff; position: relative; margin-top: 5px; margin-left: 10px; border: #ffffff 2px solid">
		<div style="position: relative; min-height: 490px;">
			<div style="background: #C0E4FA; position: relative;" align="center">标引</div>

			<table style="margin-left: 38px;">

				<tr>
					<td>
						<div style="margin: 5px 10px 0px 100px;">
							<br />
							<!-- <form id="example" name="example" method="post"
								action="../../biaoyin.jsp" onsubmit="checkAllTextValid(this)"
								target="manFrame"> -->
							<textarea name="content1" id="content1" cols="100" rows="1000"
								style="width: 750px; height: 330px; visibility: hidden;"><%=htmlData%></textarea>
							<!-- </form> -->
						</div>
					</td>
				</tr>
				<tr>
					<td style="left: 1000px;">

						<div id="tabContainer">
							<ul>
								<li id="tab1"><a href="#" class="on"
									onclick="switchTab('tab1','con1');this.blur();return false;">
										基本信息</a></li>
								<li id="tab2"><a href="#"
									onclick="switchTab('tab2','con2');this.blur(); return false;">
										政策状态</a></li>
								<li id="tab3"><a href="#"
									onclick="switchTab('tab3','con3');this.blur();return false;">
										关键字主题词</a></li>
							</ul>
							<div style="clear: both"></div>
							<div id="con1">
								<br> 政策名称：<input style="width: 300px;" type="text"
									size="20" name="zcmc" id="zcmc" value=""><font
									color="red">*</font>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 序号文号：<input
									style="width: 300px;" value="" type="text" size="20" id="zcwh"
									name="zcwh"><font color="red">*</font> <br> 政策分类：<input
									style="width: 300px;" id="zcfl"
									onKeyDown="if(event.keyCode==13) return false;"><font
									color="red">*</font> <input type="hidden" value=""
									id="zcflhidden" name="zcfl" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 颁布形式：<input
									style="width: 300px;" id="bbxs"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="hidden" value="" id="bbxshidden" name="bbxs" /> <br>
								施行范围：<input type="text" style="width: 300px;" id="sxfw"  readonly="readonly"
									onKeyDown="if(event.keyCode==13) return false;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								制定机关：<input style="width: 300px;" type="text" size="20"  readonly="readonly"
									id="zdjg" onKeyDown="if(event.keyCode==13) return false;">
								<input type="hidden" value="" style="width: 300px;"
									id="sxfwhidden" name="sxfw" /> <input type="hidden" value=""
									style="width: 300px;" id="zdjghidden" name="zdjg" /><br>

								所属专题：<input type="text" style="width: 300px"
									style="width:163px;" id="tzly"
									onKeyDown="if(event.keyCode==13) return false;"><br>
								<input type="hidden" value="" id="tzlyhidden" name="tzly">

							</div>
							<div id="con2" style="display: none">

								公布日期：<input style="width: 160px;" name="gbrq" type="text"
									id="gbrq" size="20" maxlength="10"
									onclick="new Calendar().show(this);" readonly="readonly"
									onKeyDown="if(event.keyCode==13) return false;" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								施行日期：<input style="width: 160px;" name="sxrq" type="text"
									id="sxrq" size="20" maxlength="10"
									onclick="new Calendar().show(this);" readonly="readonly" /><br>
								时效状态：<select style="width: 163px;" id="sxzt" name="sxzt"
									onchange="changesx() "
									onKeyDown="if(event.keyCode==13) return false;">
									<option value="1">有效</option>
									<option value="0">失效</option>
								</select> <input type="checkbox" name="sxtag" id="sxtag" value="1"
									checked="checked">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 废止日期：<input
									style="width: 160px;" disabled value="失效时可填" id="fzrq"
									name="fzrq" type="text" id="control_date" size="20"
									maxlength="10" onclick="new Calendar().show(this);"
									readonly="readonly"
									onKeyDown="if(event.keyCode==13) return false;" />&nbsp;&nbsp;

								<br> 上位政策：
								<textarea style="width: 463px; vertical-align: top;" id="swzc"
									onKeyDown="if(event.keyCode==13) return false;"></textarea>
								<input type="checkbox" name="swtag" id="swtag" value="1"
									checked="checked"> <br> 前趋政策：
								<textarea style="width: 463px; vertical-align: top;" id="qqzc"
									onKeyDown="if(event.keyCode==13) return false;"></textarea>
								<input type="checkbox" name="qqtag" id="qqtag" value="1"
									checked="checked"> <input type="hidden" value=""
									style="width: 160px;" id="swzchidden" name="swzc" /> <input
									type="hidden" value="" style="width: 160px;" id="qqzchidden"
									name="qqzc" onKeyDown="if(event.keyCode==13) return false;" />
								<br>

							</div>
							<div id="con3" style="display: none">
								主题词：<input style="width: 79px;" type="text" size="8"
									id="ztc1hidden" onKeyDown="if(event.keyCode==13) return false;">
								<input style="width: 79px;" type="text" size="8" id="ztc2hidden"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									style="width: 79px;" type="text" size="8" id="ztc3hidden"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									style="width: 79px;" type="text" id="ztc4hidden" size="8"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									style="width: 79px;" type="text" size="8" id="ztc5hidden"
									onKeyDown="if(event.keyCode==13) return false;"><br>
								<input type="hidden" value="" id="ztc1" name="ztc1"> <input
									type="hidden" value="" id="ztc2" name="ztc2"> <input
									type="hidden" value="" id="ztc3" name="ztc3"> <input
									type="hidden" value="" id="ztc4" name="ztc4"> <input
									type="hidden" value="" id="ztc5" name="ztc5"> 关键字：<input
									type="text" style="width: 79px;" size="8" id="gjz1" name="gjz1"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz2" name="gjz2"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz3" name="gjz3"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz4" name="gjz4"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz5" name="gjz5"
									onKeyDown="if(event.keyCode==13) return false;"><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="width: 79px;" size="8" id="gjz6" name="gjz6"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz7" name="gjz7"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz8" name="gjz8"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz9" name="gjz9"
									onKeyDown="if(event.keyCode==13) return false;"> <input
									type="text" style="width: 79px;" size="8" id="gjz10"
									name="gjz10" onKeyDown="if(event.keyCode==13) return false;">

							</div>
							<div id="con4" style="display: none">
								关键字：<input type="text" style="width: 79px;" size="8" id="gjz1"
									name="gjz1"> <input type="text" style="width: 79px;"
									size="8" id="gjz2" name="gjz2"><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="width: 79px;" size="8" id="gjz3" name="gjz3"> <input
									type="text" style="width: 79px;" size="8" id="gjz4" name="gjz4"><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="width: 79px;" size="8" id="gjz5" name="gjz5"> <input
									type="text" style="width: 79px;" size="8" id="gjz6" name="gjz6"><br>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="width: 79px;" size="8" id="gjz7" name="gjz7"> <input
									type="text" style="width: 79px;" size="8" id="gjz8" name="gjz8"><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									style="width: 79px;" size="8" id="gjz9" name="gjz9"> <input
									type="text" style="width: 79px;" size="8" id="gjz10"
									name="gjz10">
							</div>
							<table width="550" id="table">
								<tr>
									<td align="center"><input type="image" name="shzt" id=""
										value="提交审查" src="../images/tjsh.gif"
										onclick="show_tijiao('提交审查')"> <input type="image"
										src="../images/bcwj.gif" onclick="show_tijiao('保存文件')">
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>


			</table>


			<div id="BgDiv"></div>
			<div id="DialogDiv" style="display: none">
				<h2>
					政策有重复<a href="#" id="btnClose">关闭</a>
				</h2>
				<div class="form"></div>
			</div>
			<div id="box">
				<div class="ac_results" id="suggest">&nbsp;</div>
				<div class="ac_results" id="suggest2">&nbsp;</div>
				<div class="ac_results" id="suggest3">&nbsp;</div>
				<div class="ac_results" id="suggest4">&nbsp;</div>
				<div class="ac_results" id="suggest5">&nbsp;</div>
				<div class="ac_results" id="suggest6">&nbsp;</div>
				<div class="ac_results" id="suggest7">&nbsp;</div>
				<div class="ac_results" id="suggest8">&nbsp;</div>
				<div class="ac_results" id="suggest9">&nbsp;</div>
				<div class="ac_results" id="suggest10">&nbsp;</div>
				<div class="ac_results" id="suggest11">&nbsp;</div>
				<div class="ac_results" id="suggest12">&nbsp;</div>
			</div>

		</div>
	</div>
</body>
</html>