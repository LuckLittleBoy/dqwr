<%@ page language="java" import="com.dqwr.topic.entity.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
public static String HtmlEncode(String str){
	 str=str.replace(">","&gt;");
	 str=str.replace("<","&lt;");
	 char ch;
	 ch=(char)32;
	 str=str.replace(String.valueOf(ch),"&nbsp;");
	 ch=(char)34;
	 str=str.replace(String.valueOf(ch),"&quot;");
	 ch=(char)39;
	 str=str.replace(String.valueOf(ch),"&#39;");
	 ch=(char)13;

	 ch=(char)10;
	 str=str.replace(String.valueOf(ch),"<br>");
	 ch=(char)9;
	 str=str.replace(String.valueOf(ch),"	");
	 return str; 
	 } 
public static String EncodeHtml(String str)
{
str=str.replace("&gt;",">");
str=str.replace("&lt;","<");
char ch;
ch=(char)32;
str=str.replace("&nbsp;",String.valueOf(ch));
ch=(char)34;
str=str.replace("&quot;",String.valueOf(ch));
ch=(char)39;
str=str.replace("&#39;",String.valueOf(ch));
ch=(char)13;
str=str.replace("\"",String.valueOf(ch));
ch=(char)10;
str=str.replace("<br>",String.valueOf(ch));
ch=(char)9;
str=str.replace("	",String.valueOf(ch));
return str;
}

%>
<%

String topicid=request.getParameter("topicid");
request.setCharacterEncoding("UTF-8");
String htmlData = (String)session.getAttribute("content1") != null ? (String)session.getAttribute("content1") : "";

request.getSession().setAttribute("content1", htmlData); 
htmlData = HtmlEncode(htmlData);

%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.css" />
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/kindeditor.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/ws/kindeditor-4.1.7/plugins/code/prettify.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ws/js/upload1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Calendar.js"></script>
<% String result = (String) request.getAttribute("result");%>
<script type="text/javascript">
<%if(result!=null){ %>
	alert('<%=result %>');
<%}
%> 
</script>
<script type="text/javascript">
 function check(){
	 var creator=document.getElementById("creator");
	 var title=document.getElementById("title");
	 var time=document.getElementById("time");
	 var content=document.getElementById("content1");
	 if(creator.value==""){
		alert('发布人不能为空');
		creator.focus();
		return false;
	 }else{
		 if(title.value==""){
			alert('标题不能为空'); 
			title.focus();
			return false;
		 }else{
			 if(time.value==""){
				 alert('发布时间不能为空');
				 time.focus();
				 return false;
			 }else{
				 if(content.value==""){
					 alert('内容不能为空');
					 content.focus();
					 return false;
				 }
			 }
		 }
	 }
	 return true;
 }
</script>
	<style type="text/css">
	body{font:14px/1.5  宋体,宋体, \5b8b\4f53, sans-serif;}
	ul { margin:0; padding:0; list-style:none; }
	a { margin-left:5px; color:#07F; text-decoration:none; }
	a:hover { text-decoration:underline; }
	input { border:1px solid #ccc; margin:2px; }
	
    </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA">
<div style="background-color: #ffffff; position: relative;margin-top: 5px;margin-left: 10px;border: #ffffff 2px solid" >
<div style="position: relative;min-height: 490px;" >
	<div style="background: #C0E4FA;position: relative;" align="center">专题新闻发布</div>
	<div style="margin: 5px 10px 0px 300px;">		    
    <br/>
	<form id="example" name="example" method="post" action="/dqwr/PublishTopicNews">
	<br>
	<input type="hidden" name="topicid" value=<%=topicid %>>
	发布人：<input type="text" id="creator" name="creator" style="width:640px;"></br>
	主题：&nbsp;&nbsp;<input type="text" id="title" name="title" style="width:640px;" height="30px">
	<br>
	发布时间：&nbsp;<input  id="time" name="time" type="text" onclick="new Calendar().show(this);"  readonly="readonly">
	<br>
	   <table>
	   <tr>内容：</tr>
	   <tr>
		<textarea  id="content1" name="content1" cols="100" rows="1000" style="width:700px;height:330px;visibility:hidden;"><%=htmlData %></textarea>
		</tr>
		</table>
		<br/>
		<input type="submit"  value="发布" onclick="return check()">
		<input type="hidden" id="test">
	</form>
	</div>
</div>
</div>
</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>