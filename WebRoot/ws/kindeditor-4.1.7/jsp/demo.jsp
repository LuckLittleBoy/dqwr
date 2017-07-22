<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!

public static String HtmlEncode(String str){
	 str=str.replace(">","&gt;");
	 str=str.replace("<","&lt;");
	 char ch;
	 ch=(char)32;
	 str=str.replace(String.valueOf(ch),"&nbsp;");//valueof 将char型的ch转化为字符串型
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

String tag = request.getParameter("tag");

if(tag.equals("1")){
	request.getSession().setAttribute("content1", ""); 
	tag="0";
}

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
	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh_CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	
	<script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../js/upload1.js"></script>
	<script>
		
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
	<div style="background: #C0E4FA;position: relative;" align="center">录入信息</div>
		<div style="margin: 5px 10px 0px 100px;">		    
		     <div  id="fileuploaddiv"  style=" margin:10px 0px 10px 80px  ;width:800px;background-color:#ffffff;display: none; "><br/>
		     <!-- 承接页面跳转  -->
		     <font size="-1" color="blue">选择文件可自动完成部分录入信息,支持doc、docx、wps、pdf格式文件<br/></font><br/>
			<iframe  name="upload" str="#" style="display: none;"></iframe>
			<form action="../../../FileUpLoad" name="uploadform" enctype="multipart/form-data" method="post" target="upload">
		             <span id="query_type" >请选择文件:</span> <input type="file" name="uploadfile">
		             <input style="height: 22px;vertical-align: middle;" type="image" id="sc" src="../../../images/sc.gif" >
		
					<input style="height: 22px;vertical-align: middle;" type="image"  src="../../../images/qd.gif" onclick="getuploadpregress();return false;">
		     </form>
		     <div id="uploadmsg"><br></div>	
		     
	     </div>
	     <div id="fujiandiv" style=" margin:10px 0px 10px 80px  ;width:800px;background-color:#ffffff;display: none;">
			<form action="../../../FJUpLoad" enctype="multipart/form-data" method="post" target="upload">
		    <div>
		        <table style="width: 50%" cellpadding="0" cellspacing="0" border="0">
		            <tr>
		             <td>上传附件：</td>
		            </tr>
		            <tr>
		             <td style="border-bottom:dotted 1px #dcdcdc">
		              <p id="MyFile"><input type="file" name="uploadfile" id="File1" runat="server" size="50"/></p>
		             </td>
		            </tr>
		            <tr>
		             <td>
		              <input type="button" value="增加文件" onclick="addFile()"/>
		              <input type="submit" value="上传" id="sc" />
		              <input type="button" onclick="kescfj()" value="确定">
		             </td>
		            </tr>
		        </table>
		    </div>
		    </form>
    </div>
    <br/>
	<form id="example" name="example" method="post" action="../../biaoyin.jsp" onsubmit="checkAllTextValid(this)" target="manFrame">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	政策名称：<input  style="width:160px;"  type="text" size="20" id="zcmc" name="zcmc">&nbsp;&nbsp;&nbsp;&nbsp;
	序号或文号：<input  style="width:160px;"  type="text" size="20" id="zcwh" name="zcwh">&nbsp;&nbsp;&nbsp;&nbsp;
	 <img alt="" style="vertical-align: middle;" width="40px" src="../../../images/tq.jpg"onclick='gettitle();return false;' />
	 <br>
	<br>
		<textarea name="content1" id="content1" cols="100" rows="1000" style="width:700px;height:330px;visibility:hidden;"><%=htmlData %></textarea>
		<br />
		<input type="image"  src="../../../images/zcby.gif" >
		<input type="hidden" id="test">
		<input type="image"  src="../../../images/wjdr.gif" onclick="fileuploaddiv_isShow();return false;">
		<input type="image" src="../../../images/fjsc.gif" onclick="fujianuploaddiv_isShow();return false;"/>
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