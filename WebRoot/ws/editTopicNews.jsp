<%@ page language="java" import="com.dqwr.topic.entity.*"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

//YH yh=(YH)request.getSession().getAttribute("user");
request.setCharacterEncoding("UTF-8");
TopicNews topicnews=(TopicNews)request.getAttribute("topicnews");
String pageno=request.getParameter("pageno");
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
<div style="position: relative;min-height: 490px; " >
	<div style="background: #C0E4FA;position: relative;" align="center">专题活动修改</div>
		<div style="margin: 5px 10px 0px 100px;">		    
    <br/>
	<form id="example" name="example" method="post" action="${pageContext.request.contextPath}/edittopicnews" onsubmit="checkAllTextValid(this)" target="manFrame">
	<input type="hidden" name="pageno" style="width:620px;" height="30px" value=<%=pageno %>><br>
	标题：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" style="width:620px;" height="30px" value=<%=topicnews.getTitle() %>>
	<br>
	<input type="hidden" name="topicnewsid" value=<%=topicnews.getId() %>>
	发布人：&nbsp;&nbsp;&nbsp;<input type="text" name="creator" style="width:620px;" value=<%=topicnews.getPublisher() %>><br>
	发布时间：&nbsp;<input  name="publictime" type="text" onclick="new Calendar().show(this);" value=<%=topicnews.getTime() %>>
	<br>
	   <table>
	   <tr>内容：</tr>
	   <tr>
		<textarea name="content1" id="content1" cols="100" rows="1000" style="width:700px;height:330px;visibility:hidden;"><%=htmlData %><%=topicnews.getContent() %></textarea>
		</tr>
		<br>
		<input type="submit"  value="修改">
		<input type="hidden" id="test">
	</table>
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